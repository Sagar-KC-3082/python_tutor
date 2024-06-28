import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/core/widgets/custom_container.dart';

import '../../../core/constants/color_constants.dart';
import '../infrastructure/entities/response/quiz_model.dart';
import 'final_quiz_screen.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/4/2024, Tuesday

class AnswerScreen extends ConsumerWidget {
  const AnswerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.read(fetchQuizProvider.notifier).quizList;
    return Scaffold(
      backgroundColor: ColorConstant.scaffoldColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        centerTitle: true,
        title: const Text(
          'Your Answers',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: quizList.length,
              itemBuilder: (context, index) {
                return CustomContainer(
                  margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question ${index + 1}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        quizList[index].question,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: quizList[index].optionList.length,
                        itemBuilder: (context, innerIndex) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.white),
                              color: _isOptionRight(innerIndex, quizList, index)
                                  ? Colors.green
                                  : _isOptionWrong(innerIndex, quizList, index)
                                      ? Colors.red
                                      : Colors.black,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    quizList[index].optionList[innerIndex],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                _isOptionRight(innerIndex, quizList, index)
                                    ? const Icon(
                                        Icons.check,
                                        size: 18,
                                        color: Colors.white,
                                      )
                                    : _isOptionWrong(
                                            innerIndex, quizList, index)
                                        ? const Icon(
                                            Icons.close,
                                            size: 18,
                                            color: Colors.white,
                                          )
                                        : const SizedBox(),
                                const SizedBox(width: 12),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }

  bool _isOptionRight(int innerIndex, List<QuizModel> quizList, int index) {
    return innerIndex == quizList[index].correctOptionIndex;
  }

  bool _isOptionWrong(int innerIndex, List<QuizModel> quizList, int index) {
    return innerIndex == quizList[index].userSelectedIndex &&
        quizList[index].userSelectedIndex != quizList[index].correctOptionIndex;
  }

  bool _isAnswerRight(List<QuizModel> quizList, int index) {
    return quizList[index].userSelectedIndex ==
        quizList[index].correctOptionIndex;
  }
}
