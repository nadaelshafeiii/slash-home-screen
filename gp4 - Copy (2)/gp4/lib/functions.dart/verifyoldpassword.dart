import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> verifyOldPassword(int userId, String oldPassword) async {
  // Replace the URL with your API endpoint for verifying old password
  String apiUrl = 'http://your-api-url.com/verify_password';
  
  // You may need to adjust the request headers or authentication method based on your API setup
  var response = await http.post(
    Uri.parse(apiUrl),
    body: {
      'userId': userId.toString(),
      'oldPassword': oldPassword,
    },
  );

  if (response.statusCode == 200) {
    // Assuming the API returns a JSON object with a 'success' key indicating password verification
    Map<String, dynamic> responseData = json.decode(response.body);
    bool success = responseData['success'];

    return success;
  } else {
    // Handle API error or invalid response
    throw Exception('Failed to verify old password');
  }
}
