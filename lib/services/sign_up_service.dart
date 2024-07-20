import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpService {
  Future<Map<String, dynamic>> signUp({
    required String username,
    required String email,
    required String fullName,
    required String password,
    required String bio,
    required String country,
    File? profilePic,
  }) async {
    final url = Uri.parse('https://outrate-apis.vercel.app/api/v2/Users/SignUp');
    final request = http.MultipartRequest('POST', url);

    request.fields['username'] = username;
    request.fields['email'] = email;
    request.fields['fullName'] = fullName;
    request.fields['password'] = password;
    request.fields['bio'] = bio;
    request.fields['country'] = country;

    if (profilePic != null) {
      request.files.add(
        await http.MultipartFile.fromPath('profilePic', profilePic.path),
      );
    }

    try {
      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      if (response.statusCode == 201) {
        return json.decode(responseData.body);
      } else {
        final errorData = json.decode(responseData.body);
        throw Exception(errorData['message']);
      }
    } catch (e) {
      throw Exception('Failed to sign up. Please try again.');
    }
  }
}
