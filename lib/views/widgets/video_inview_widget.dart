import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:youtube/models/video_data/video_data.dart';
import 'package:youtube/screens/video_widget.dart';
import 'package:youtube/shared/providers.dart';
import 'package:youtube/views/widgets/thumbnail_widget.dart';
import 'package:video_player/video_player.dart';

class VideoInViewWidget extends StatelessWidget {
  const VideoInViewWidget({
    Key? key,
    required this.loadedList,
    required this.index,
    required this.ref,
  }) : super(key: key);

  final List<VideoData> loadedList;
  final int index;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return InViewNotifierWidget(
      id: '$index',
      builder: (BuildContext context, bool isInView, Widget? child) {
        if (isInView) {
          ref.read(isInViewStateProvider.notifier).state = index;
        }
        return Consumer(
          builder: (context, widgetRef, _) {
            widgetRef.watch(videoPlayingIndex);
            bool shouldPlayVideo = isInView &&
                widgetRef.watch(isNotScrollingStateProvider.notifier).state &&
                widgetRef.watch(videoPlayingIndex.notifier).state == index;
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(2, 2),
                    color: Colors.grey.withOpacity(
                      0.2,
                    ),
                  )
                ],
              ),
              child: Column(
                children: [
                  shouldPlayVideo
                      ? VideoWidget(
                          play: widgetRef
                                  .watch(videoPlayingIndex.notifier)
                                  .state ==
                              index,
                          url: loadedList[index].videoUrl)
                      : ThumbnailWidget(
                          coverPicture: loadedList[index].coverPicture),
                  _buildVideoDetailsRow(title: loadedList[index].title)
                ],
              ),
            );
          },
        );
      },
    );
  }

  Container _buildVideoDetailsRow({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: "GentiumBookPlus",
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Text(
            "Activity",
            style: TextStyle(
                color: Colors.black54,
                fontFamily: "GentiumBookPlus",
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
