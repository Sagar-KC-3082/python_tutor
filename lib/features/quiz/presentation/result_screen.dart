import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/features/quiz/presentation/answer_screen.dart';
import 'package:python_basics/features/quiz/presentation/final_quiz_screen.dart';

import '../../../core/constants/color_constants.dart';
import 'candidate_name_sheet.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/4/2024, Tuesday

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({super.key});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  int? _totalRightAnswerCount;

  @override
  void initState() {
    _calculateTotalRightAnswers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: ColorConstant.scaffoldColor,
        appBar: AppBar(
          backgroundColor: ColorConstant.primaryColor,
          centerTitle: true,
          title: const Text(
            'Result',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    "You got ${_totalRightAnswerCount ?? ''} out of ${ref.read(fetchQuizProvider.notifier).quizList.length} ",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                _totalRightAnswerCount == null
                    ? const SizedBox()
                    : Center(
                        child: Text(
                          "${_calculatePercentage().toStringAsFixed(2)} % ",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 16,
                ),
                _totalRightAnswerCount == null
                    ? const SizedBox()
                    : Center(
                        child: Text(
                          _calculatePercentage() >= 80
                              ? "Congratulations on passing the quiz! Click on the Download Certificate button to download your certificate."
                              : "You are making progress but couldn't get a certificate because you need to score at-least 80%",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 90,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black87,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: const Center(
                      child: Text(
                        'Try again',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const AnswerScreen();
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black87,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: const Center(
                      child: Text(
                        'Check Answers',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                _calculatePercentage() >= 80
                    ? InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              isDismissible: true,
                              enableDrag: true,
                              context: context,
                              builder: (context) {
                                return const CandidateNameSheet();
                              });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black87,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: const Center(
                            child: Text(
                              'Download Certificate',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                SizedBox(height: _calculatePercentage() >= 80 ? 12 : 0),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black87,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: const Center(
                      child: Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            )),
      ),
    );
  }

  double _calculatePercentage() => ((_totalRightAnswerCount! /
          ref.read(fetchQuizProvider.notifier).quizList.length) *
      100);

  void _calculateTotalRightAnswers() {
    _totalRightAnswerCount = 0;
    for (var e in ref.read(fetchQuizProvider.notifier).quizList) {
      if (e.userSelectedIndex == e.correctOptionIndex) {
        _totalRightAnswerCount = _totalRightAnswerCount! + 1;
      }
    }
  }
}
