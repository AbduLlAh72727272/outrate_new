import 'package:flutter/material.dart';
import '../controllers/comment_controller.dart';
import '../services/comment_service.dart';

class CommentSectionScreen extends StatelessWidget {
  final CommentController commentController;
  final String token;
  final int userId;
  final int postId;

  CommentSectionScreen({Key? key, required this.token, required this.userId, required this.postId})
      : commentController = CommentController(commentService: CommentService()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color(0xFFEFEFF5), // Background color for the bottom sheet
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            Container(
              height: 4.0,
              width: 40.0,
              color: Colors.grey[300],
              margin: EdgeInsets.only(bottom: 16.0),
            ),
            Text(
              'Comments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with your actual comment count
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/dummy_profile_2.png'), // Replace with your actual avatar image
                    ),
                    title: Row(
                      children: [
                        Text('The artist guy'),
                        SizedBox(width: 8.0),
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color: Colors.yellow, size: 16);
                          }),
                        ),
                      ],
                    ),
                    subtitle: Text('Loved the outfit. everything is so on point'),
                  );
                },
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dummy_profile_2.png'), // Replace with your actual avatar image
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add a comment here',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (commentBody) {
                      commentController.addComment(context, userId, postId, commentBody, token);
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Handle send comment
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
