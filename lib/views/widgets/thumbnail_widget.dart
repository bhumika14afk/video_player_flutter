import 'package:flutter/material.dart';

class ThumbnailWidget extends StatelessWidget {
  const ThumbnailWidget({
    Key? key,
    required this.coverPicture,
  }) : super(key: key);

  final String coverPicture;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        child: CachedNetworkImage(
          imageUrl: coverPicture,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => Container(
            color: Colors.white,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  CachedNetworkImage(
      {required String imageUrl,
      required Container Function(dynamic context, dynamic imageProvider)
          imageBuilder,
      required Container Function(dynamic context, dynamic url) placeholder,
      required Icon Function(dynamic context, dynamic url, dynamic error)
          errorWidget}) {}
}
