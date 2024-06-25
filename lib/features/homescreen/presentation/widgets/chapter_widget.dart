import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/features/homescreen/infrastructure/entities/chapter_response.dart';
import 'package:python_basics/features/topics/presentation/topics_screen.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

class ChapterWidget extends ConsumerStatefulWidget {
  const ChapterWidget({
    required this.chapterResponse,
    required this.index,
    super.key,
  });

  final ChapterResponse chapterResponse;
  final int index;

  @override
  ConsumerState<ChapterWidget> createState() => _ChapterWidgetState();
}

class _ChapterWidgetState extends ConsumerState<ChapterWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return TopicsScreen(
            topicsList: widget.chapterResponse.topicsList,
            chapterName: widget.chapterResponse.title,
          );
        }));
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${widget.index + 1} : ${widget.chapterResponse.title}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              widget.chapterResponse.isLocked ? Icons.lock : Icons.lock_open,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
