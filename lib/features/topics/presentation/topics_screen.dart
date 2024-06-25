import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/features/topics/presentation/widgets/quiz_widget.dart';
import 'package:python_basics/features/topics/presentation/widgets/topic_widget.dart';

import '../../../core/constants/color_constants.dart';
import '../../homescreen/infrastructure/entities/topic_response.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

final chapterUserIndexProvider = StateProvider.autoDispose((ref) => 0);

class TopicsScreen extends ConsumerStatefulWidget {
  const TopicsScreen({
    required this.topicsList,
    required this.chapterName,
    super.key,
  });

  final List<TopicResponse> topicsList;
  final String chapterName;

  @override
  ConsumerState<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends ConsumerState<TopicsScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chapterIndexState = ref.watch(chapterUserIndexProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        centerTitle: true,
        title: Text(
          widget.chapterName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          _stepTrackerWidget(chapterIndexState),
          Expanded(
              child: PageView.builder(
            onPageChanged: (int? index) {
              ref.read(chapterUserIndexProvider.notifier).state = index ?? 0;
            },
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.topicsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    _contentSection(index),
                    _quizSection(index),
                  ],
                ),
              );
            },
          )),
        ],
      ),
    );
  }

  Padding _stepTrackerWidget(int chapterIndexState) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: widget.topicsList
            .map((element) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 3,
                    decoration: BoxDecoration(
                        color: element.id <= chapterIndexState
                            ? Colors.green
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Padding _contentSection(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Text(
              widget.topicsList[index].title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.topicsList[index].contentList.length,
            itemBuilder: (context, index1) {
              return TopicWidget(
                contentInfo: widget.topicsList[index].contentList[index1],
              );
            },
          )
        ],
      ),
    );
  }

  Widget _quizSection(int index) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        const SizedBox(height: 24),
        _dividerSection(),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'QUIZ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.topicsList[index].quizList.length,
          itemBuilder: (context, index1) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: QuizWidget(
                quizResponse: widget.topicsList[index].quizList[index1],
              ),
            );
          },
        )
      ],
    );
  }

  Row _dividerSection() {
    return Row(
      children: List.generate(20, (int index) {})
          .map((e) => Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 2,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                ),
              ))
          .toList(),
    );
  }
}
