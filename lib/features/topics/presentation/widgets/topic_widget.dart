import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/core/widgets/custom_container.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: CustomContainer(
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
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.8)),
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
