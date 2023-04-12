import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:youtube/helper/json_helper.dart';
import 'package:youtube/models/video_data/video_data.dart';
import 'package:youtube/shared/constants.dart';
import 'package:youtube/shared/providers.dart';
import 'package:youtube/views/widgets/video_inview_widget.dart';

class VideoList extends ConsumerStatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  ConsumerState<VideoList> createState() => _VideoListState();
}

class _VideoListState extends ConsumerState<VideoList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        fetchMoreVideos();
      }
    });
  }

  fetchMoreVideos() {
    List<VideoData> videoList = ref.read(allVideosListProvider.notifier).state;
    List<VideoData> loadedList =
        ref.read(loadedVideosListProvider.notifier).state;
    int start = loadedList.length;
    int end = loadedList.length + 8;
    if (end > 60) {
      end = 60;
    }
    ref.read(loadedVideosListProvider.notifier).state =
        loadedList + (videoList.sublist(start, end));
    logger.d(
        "#loadedList after loadmore# ${ref.read(loadedVideosListProvider.notifier).state.length}");
  }

  void _onStartScroll(ScrollMetrics metrics) {
    ref.read(isNotScrollingStateProvider.notifier).state = false;
  }

  void _onEndScroll(ScrollMetrics metrics) {
    Future.delayed(const Duration(milliseconds: 100), () {
      ref.read(isNotScrollingStateProvider.notifier).state = true;
      ref.read(videoPlayingIndex.notifier).state =
          ref.read(isInViewStateProvider.notifier).state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VideoData>>(
      future: JsonService.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Consumer(
            builder: (context, ref, _) {
              ref.read(allVideosListProvider.notifier).state = snapshot.data!;
              ref.read(loadedVideosListProvider.notifier).state =
                  snapshot.data!.sublist(0, 8);

              return Consumer(
                builder: (context, ref, _) {
                  List<VideoData> loadedList =
                      ref.watch(loadedVideosListProvider);
                  logger.d("#loadedList# ${loadedList.length}");

                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollStartNotification) {
                        _onStartScroll(scrollNotification.metrics);
                      } else if (scrollNotification is ScrollEndNotification) {
                        _onEndScroll(scrollNotification.metrics);
                      }
                      return true;
                    },
                    child: InViewNotifierList(
                      physics: const BouncingScrollPhysics(),
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      initialInViewIds: const ['0'],
                      isInViewPortCondition: (double deltaTop,
                          double deltaBottom, double vpHeight) {
                        return (deltaTop < (0.3 * vpHeight) + 12 &&
                            deltaBottom > (0.3 * vpHeight) - 12);
                      },
                      itemCount: loadedList.length,
                      builder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: VideoInViewWidget(
                              loadedList: loadedList, index: index, ref: ref),
                        );
                      },
                    ),
                  );
                },
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
