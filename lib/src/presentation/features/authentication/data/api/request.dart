import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future post(String path, Map<String, dynamic> credentials) async {
  try {
    final response = await http.post(
      Uri.https(base, "$api$path"),
      body: json.encode(credentials),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Successful response

      return json.decode(response.body);
    } else {
      // Handle non-200 status code
      throw ({"error": "status", "message": "${response.statusCode}"});
    }
  } catch (error) {
    if (error is http.ClientException || error is SocketException) {
      // Handle network-related exceptions
      throw ({'error': 'network', 'message': '$error'});
    } else if (error is FormatException) {
      // Handle parsing error
      throw ({'error': 'parsing', 'message': '$error'});
    } else if (error is TimeoutException) {
      // Handle request timeout
      throw ({'error': 'timeout', 'message': 'timeout'});
    } else {
      // Handle other exceptions
      throw ({'error': 'other', 'message': '$error'});
    }
  }
}
