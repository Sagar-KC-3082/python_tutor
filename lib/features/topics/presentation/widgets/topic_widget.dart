import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../homescreen/infrastructure/entities/topic_response.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

class TopicWidget extends ConsumerWidget {
  const TopicWidget({
    required this.contentInfo,
    super.key,
  });

  final TopicIndividualSection contentInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contentInfo.title,
              style: TextStyle(
                fontSize: contentInfo.description != null ? 16 : 14,
                fontWeight: contentInfo.description != null
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            if (contentInfo.description != null)
              Text(
                contentInfo.description ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            if (contentInfo.imageUrl != null)
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: CachedNetworkImage(
                  imageUrl: contentInfo.imageUrl!,
                  height: 160,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              )
          ],
        ),
      ),
    );
  }
}
