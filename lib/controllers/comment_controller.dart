// comment_controller.dart
import 'package:flutter/material.dart';
import '../models/comment_model.dart';
import '../services/comment_service.dart';

class CommentController {
  final CommentService commentService;

  CommentController({required this.commentService});

  Future<void> addComment(BuildContext context, int userId, int postId, String commentBody, String token) async {
    try {
      CommentModel? newComment = await commentService.postComment(userId, postId, commentBody, token);
      if (newComment != null) {
        // Handle successful comment addition, e.g., show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Comment added successfully')),
        );
        // Optionally, refresh the comment list or perform other UI updates
      }
    } catch (e) {
      // Handle errors, e.g., show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add comment: $e')),
      );
    }
  }
}
