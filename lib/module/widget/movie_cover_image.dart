import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';

class MovieCoverImage extends StatelessWidget {
  final String imgUrl;
  final double? width;
  final double? height;

  const MovieCoverImage(this.imgUrl, {Key? key, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: SQColor.paper)),
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        placeholder: (context, url) => Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: new CircularProgressIndicator(),
          ),
        ),
        width: width,
        height: height,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fadeOutDuration: const Duration(seconds: 1),
        fadeInDuration: const Duration(seconds: 1),
      ),
    );
  }
}
