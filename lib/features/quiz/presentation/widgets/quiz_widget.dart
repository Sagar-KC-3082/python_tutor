import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/core/widgets/custom_container.dart';
import 'package:python_basics/features/quiz/presentation/quiz_screen.dart';
import '../../../homescreen/infrastructure/entities/chapter_response.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/26/2024, Wednesday

class QuizWidget extends ConsumerStatefulWidget {
  final QuizResponse quizResponse;
  final int index;

  const QuizWidget({
    required this.quizResponse,
    required this.index,
    super.key,
  });

  @override
  ConsumerState<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends ConsumerState<QuizWidget> {
  int? _selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Text(
            widget.quizResponse.question,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.8)),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.quizResponse.optionList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _selectedOptionIndex = index;
                    });
                    _saveDataInProvider(index);
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Text(
                        widget.quizResponse.optionList[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: _isOptionSelected(index)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ));
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _saveDataInProvider(int index) {
    List<int?> tempList = ref.read(userSelectedOptionsList.notifier).state;
    tempList[widget.index] = index;
    ref.read(userSelectedOptionsList.notifier).state = tempList;
  }

  bool _isOptionSelected(int index) {
    return index == _selectedOptionIndex;
  }
}
