import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:youtube/models/video_data/video_data.dart';
import 'package:youtube/shared/constants.dart';

class JsonService {
  static Future<List<VideoData>> getData() async {
    try {
      final String response = await rootBundle.loadString(kJsonDataPath);

      List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(jsonDecode(response.toString()));

      var allVideosData = result.map((jsonVideosData) {
        VideoData videoData = VideoData.fromJson(
          jsonVideosData,
        );

        return videoData;
      }).toList();
      return allVideosData;
    } catch (e) {
      logger.d("Error in Json Data: $e");
      return [];
    }
  }
}
