import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube/models/video_data/video_data.dart';

//* video list widget providers
final loadedVideosListProvider = StateProvider<List<VideoData>>((ref) => []);
final allVideosListProvider = StateProvider<List<VideoData>>((ref) => []);
final isInViewStateProvider = StateProvider<int>((ref) => 0);
final videoPlayingIndex = StateProvider<int>((ref) => 0);
final isNotScrollingStateProvider = StateProvider<bool>((ref) => true);
final videoPlayerControllerProvider =
    StateProvider<VideoPlayerController?>((ref) => null);
