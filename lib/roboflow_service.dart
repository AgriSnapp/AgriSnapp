import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class RoboflowService {
  static const String apiKey = 'Qb2LrUrfjBdn69EN2k5X';
  static const String modelId = 'olive-tree-9hrs-q8qu6'; // CHANGE THIS
  static const String version = '1'; // CHANGE THIS

  Future<Map<String, dynamic>> detectDisease(String imagePath) async {
    try {
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      String url =
          'https://detect.roboflow.com/$modelId/$version?api_key=$apiKey';

      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: base64Image,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Detection failed: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
