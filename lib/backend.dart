import 'dart:convert';
import 'package:http/http.dart' as http;

void fetchData() async {
  try {
    final response = await http.get(Uri.parse('http://your-python-backend-url/api/data'));

    if (response.statusCode == 200) {
      // Parse the JSON data
      Map<String, dynamic> data = jsonDecode(response.body);
      print('Data from Python backend: ${data["message"]}');
    } else {
      print('Failed to load data. Error ${response.statusCode}');
    }
  } catch (e) {
    print('Exception during HTTP request: $e');
  }
}

void main() {
  fetchData();
}