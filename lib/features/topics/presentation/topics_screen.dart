import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/core/widgets/custom_container.dart';
import 'package:python_basics/features/homescreen/infrastructure/entities/chapter_response.dart';
import 'package:python_basics/features/quiz/presentation/quiz_screen.dart';
import 'package:python_basics/features/topics/presentation/widgets/topic_widget.dart';

import '../../../core/constants/color_constants.dart';
import '../../homescreen/infrastructure/entities/topic_response.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

final topicCurrentIndexProvider = StateProvider.autoDispose((ref) => 0);

class TopicsScreen extends ConsumerStatefulWidget {
  const TopicsScreen({
    required this.topicsList,
    required this.quizList,
    required this.chapterName,
    required this.index,
    super.key,
  });

  final List<TopicResponse> topicsList;
  final List<QuizResponse> quizList;
  final String chapterName;
  final int index;

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
    return Scaffold(
      backgroundColor: ColorConstant.scaffoldColor,
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
          _stepTrackerWidget(),
          const SizedBox(height: 6),
          Expanded(
              child: PageView.builder(
            onPageChanged: (int? index) {
              ref.read(topicCurrentIndexProvider.notifier).state = index ?? 0;
            },
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.topicsList.length,
            itemBuilder: (context, index) {
              return Column(
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
                  Expanded(child: _contentSection(index))
                ],
              );
            },
          )),
        ],
      ),
    );
  }

  Padding _stepTrackerWidget() {
    final topicCurrentIndexState = ref.watch(topicCurrentIndexProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: widget.topicsList
            .map((element) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 6,
                    decoration: BoxDecoration(
                        color: widget.topicsList.indexOf(element) <= topicCurrentIndexState
                            ? Colors.green.withOpacity(0.6)
                            : Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(0)),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Padding _contentSection(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.topicsList[index].contentList.length,
            itemBuilder: (context, index1) {
              return TopicWidget(
                contentInfo: widget.topicsList[index].contentList[index1],
              );
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Visibility(
                visible: index != 0,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  },
                  child: CustomContainer(
                    backgroundColor: ColorConstant.primaryColor,
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: index == widget.topicsList.length - 1,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return QuizScreen(
                          quizResponse: widget.quizList,
                          index: widget.index,
                        );
                      }));
                    },
                    child: CustomContainer(
                        backgroundColor: ColorConstant.primaryColor,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: const Center(
                            child: Text(
                          'Complete Quiz',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ))),
                  ),
                ),
              ),
              Visibility(
                visible: index < widget.topicsList.length - 1,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  },
                  child: CustomContainer(
                      backgroundColor: ColorConstant.primaryColor,
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
