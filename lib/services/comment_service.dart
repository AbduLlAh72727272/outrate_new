// comment_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/comment_model.dart';

class CommentService {
  static const String baseUrl = 'https://outrate-apis.vercel.app/api/v2/Post/AddComment';

  Future<CommentModel?> postComment(int userId, int postId, String commentBody, String token) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'userID': userId,
        'postID': postId,
        'commentBody': commentBody,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status']) {
        return CommentModel.fromJson(data['comment']);
      } else {
        throw Exception('Failed to add comment: ${data['message']}');
      }
    } else {
      throw Exception('Failed to add comment');
    }
  }
}
