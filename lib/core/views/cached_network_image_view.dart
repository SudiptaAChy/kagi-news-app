import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageView extends StatelessWidget {
  final String? url;
  final String? caption;
  final String? source;
  const CachedNetworkImageView(
      {required this.url, this.caption, this.source, super.key});

  @override
  Widget build(BuildContext context) {
    return (url == null)
        ? Icon(
            Icons.image_not_supported_outlined,
            color: Colors.red,
          )
        : Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: url!,
                    errorWidget: (context, url, error) => Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                  ),
                  if (source?.isNotEmpty == true)
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          source!,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                ],
              ),
              Text(
                caption ?? "",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
              ),
            ],
          );
  }
}
