import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PersonCacheImage extends StatelessWidget {
  final String imageUrl;
  final double width, height;
  const PersonCacheImage(
      {Key? key,
      required this.height,
      required this.width,
      required this.imageUrl})
      : super(key: key);

  _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
        ),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl ?? '',
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return _imageWidget(
          AssetImage('assets/images/noimage.jpg'),
        );
      },
    );
  }
}