import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/core/extensions/build_context_extension.dart';
import 'package:python_basics/core/local_repository/local_repository.dart';
import 'package:python_basics/core/static_data/chapter_list.dart';
import 'package:python_basics/core/widgets/custom_container.dart';
import 'package:python_basics/features/homescreen/presentation/homescreen.dart';
import 'package:python_basics/features/quiz/presentation/widgets/quiz_widget.dart';

import '../../../core/constants/color_constants.dart';
import '../../homescreen/infrastructure/entities/chapter_response.dart';
import '../../topics/presentation/topics_screen.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/26/2024, Wednesday

final userSelectedOptionsList = StateProvider<List<int?>>((ref) => []);

class QuizScreen extends ConsumerStatefulWidget {
  final int index;
  final List<QuizResponse> quizResponse;

  const QuizScreen({
    required this.index,
    required this.quizResponse,
    super.key,
  });

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  void initState() {
    initialiseList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.scaffoldColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        centerTitle: true,
        title: const Text(
          'Quiz',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 12),
          ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.quizResponse.length,
            itemBuilder: (context, index) {
              return QuizWidget(
                quizResponse: widget.quizResponse[index],
                index: index,
              );
            },
          ),
          const SizedBox(height: 24),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              final userSelectedOptionList = ref.read(userSelectedOptionsList);
              if (userSelectedOptionList.contains(null)) {
                context.showSnackBar(
                    'Please answer all the questions to proceed to Next Chapter');
              } else {
                bool isAllCorrect = false;
                isAllCorrect =
                    _checkAnswers(userSelectedOptionList, isAllCorrect);
                if (isAllCorrect) {
                  ref.read(topicCurrentIndexProvider.notifier).state = 0;
                  _increaseUserChapterCount();
                  Navigator.popUntil(context, (route) => route.isFirst);
                  /*Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));*/
                } else {
                  context.showSnackBar(
                      'All answers must be correct to proceed to next chapter');
                }
              }
            },
            child: CustomContainer(
                backgroundColor: ColorConstant.primaryColor,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const Center(
                    child: Text(
                  'Submit Answers',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ))),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _increaseUserChapterCount() {
    if (widget.index >= ref.read(userCurrentChapterIndexProvider) &&
        widget.index <= StaticData.chapterList.length - 1) {
      LocalRepository.saveInteger(LocalRepository.userCurrentChapterIndex,
          ref.read(userCurrentChapterIndexProvider) + 1);
      ref.read(userCurrentChapterIndexProvider.notifier).state =
          ref.read(userCurrentChapterIndexProvider) + 1;
    }
  }

  bool _checkAnswers(List<int?> userSelectedOptionList, bool isAllCorrect) {
    for (int i = 0; i < userSelectedOptionList.length; i++) {
      if (userSelectedOptionList[i] !=
          widget.quizResponse[i].correctOptionIndex) {
        isAllCorrect = false;
        break;
      } else {
        isAllCorrect = true;
      }
    }
    return isAllCorrect;
  }

  void initialiseList() {
    List<int?> list = [];
    for (var element in widget.quizResponse) {
      list.add(null);
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(userSelectedOptionsList.notifier).state = list;
    });
  }
}
