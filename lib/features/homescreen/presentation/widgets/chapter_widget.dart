import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/core/extensions/build_context_extension.dart';
import 'package:python_basics/core/local_repository/local_repository.dart';
import 'package:python_basics/core/widgets/custom_container.dart';
import 'package:python_basics/features/homescreen/infrastructure/entities/chapter_response.dart';
import 'package:python_basics/features/topics/presentation/topics_screen.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

class ChapterWidget extends ConsumerStatefulWidget {
  const ChapterWidget({
    required this.chapterResponse,
    required this.chapterIndex,
    required this.userChapterIndex,
    super.key,
  });

  final ChapterResponse chapterResponse;
  final int chapterIndex;
  final int userChapterIndex;

  @override
  ConsumerState<ChapterWidget> createState() => _ChapterWidgetState();
}

class _ChapterWidgetState extends ConsumerState<ChapterWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.chapterIndex > widget.userChapterIndex) {
          context.showSnackBar('Complete the previous chapter to continue');
        } else {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return TopicsScreen(
              topicsList: widget.chapterResponse.topicsList,
              quizList: widget.chapterResponse.quizList,
              chapterName: widget.chapterResponse.title,
              index: widget.chapterIndex,
            );
          }));
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: CustomContainer(
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${widget.chapterIndex + 1} : ${widget.chapterResponse.title}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              widget.chapterIndex > widget.userChapterIndex
                  ? Icons.lock
                  : Icons.check_circle,
              size: 20,
              color: widget.chapterIndex > widget.userChapterIndex
                  ? Colors.black
                  : Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
