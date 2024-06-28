/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/27/2024, Thursday

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/core/extensions/build_context_extension.dart';
import 'package:python_basics/core/local_repository/base_state.dart';
import 'package:python_basics/core/local_repository/local_repository.dart';
import 'package:python_basics/core/static_data/chapter_list.dart';
import 'package:python_basics/core/widgets/custom_container.dart';
import 'package:python_basics/features/quiz/application/quiz_controller.dart';
import 'package:python_basics/features/quiz/infrastructure/entities/response/quiz_model.dart';
import 'package:python_basics/features/quiz/presentation/quit_quiz_sheet.dart';
import 'package:python_basics/features/quiz/presentation/result_screen.dart';
import 'package:python_basics/features/quiz/presentation/widgets/quiz_widget.dart';

import '../../../core/constants/color_constants.dart';
import '../../homescreen/infrastructure/entities/chapter_response.dart';
import '../../topics/presentation/topics_screen.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/26/2024, Wednesday

final fetchQuizProvider = StateNotifierProvider<QuizController, BaseState>(
  (ref) => QuizController(),
);


class FinalQuizScreen extends ConsumerStatefulWidget {
  const FinalQuizScreen({super.key});

  @override
  ConsumerState<FinalQuizScreen> createState() => _FinalQuizScreenState();
}

class _FinalQuizScreenState extends ConsumerState<FinalQuizScreen> {
  int _currentQuizIndex = 0;
  int? _selectedOptionIndex;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(fetchQuizProvider.notifier).fetchQuiz();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final quizListState = ref.watch(fetchQuizProvider);
    return WillPopScope(
      onWillPop: () async {
        await showModalBottomSheet(
            scrollControlDisabledMaxHeightRatio: 0.18,
            isScrollControlled: false,
            enableDrag: false,
            context: context,
            builder: (context) {
              return const QuitQuizSheet();
            });
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConstant.scaffoldColor,
        appBar: AppBar(
          backgroundColor: ColorConstant.primaryColor,
          centerTitle: true,
          title: const Text(
            'Quiz',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: quizListState is BaseLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : quizListState is BaseSuccess &&
                    quizListState.data is List<QuizModel>
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 48,
                        ),
                        CustomContainer(
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 14),
                          child: Text(
                            (quizListState.data
                                    as List<QuizModel>)[_currentQuizIndex]
                                .question,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        _getListView(quizListState.data),
                        const Spacer(),
                        Text(
                          'Question : ${_currentQuizIndex + 1} of ${(quizListState.data as List<QuizModel>).length} ',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  )
                : const SizedBox(),
      ),
    );
  }

  ListView _getListView(List<QuizModel> data) {
    final quizList = data[_currentQuizIndex];
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: quizList.optionList.length,
      itemBuilder: (context, index) {
        return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              setState(() {
                _selectedOptionIndex = index;
                ref.read(fetchQuizProvider.notifier).updateUserSelectedValue(
                      _currentQuizIndex,
                      _selectedOptionIndex ?? 0,
                    );
              });
              await Future.delayed(const Duration(milliseconds: 400));
              setState(() {
                _selectedOptionIndex = null;
                if (_currentQuizIndex < data.length - 1) {
                  _currentQuizIndex++;
                } else {
                  _currentQuizIndex = 0;
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ResultScreen();
                  }));
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(8),
                color: _isOptionSelected(index)
                    ? Colors.black87
                    : Colors.transparent,
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Text(
                  quizList.optionList[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color:
                        _isOptionSelected(index) ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ));
      },
    );
  }

  bool _isOptionSelected(int index) {
    return index == _selectedOptionIndex;
  }
}
