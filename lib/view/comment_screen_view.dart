import 'package:flutter/material.dart';

class CommentSectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: 4.0,
            width: 40.0,
            color: Colors.grey[300],
            margin: EdgeInsets.only(bottom: 16.0),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Replace with your actual comment count
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user_avatar.png'), // Replace with your actual avatar image
                  ),
                  title: Text('The artist guy'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(Icons.star, color: Colors.yellow);
                        }),
                      ),
                      Text('Loved the outfit. everything is so on point'),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_avatar.png'), // Replace with your actual avatar image
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Add a comment here',
                    border: InputBorder.none,
                  ),
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
    );
  }
}
