import 'package:flutter/material.dart';
import 'package:python_basics/features/homescreen/infrastructure/entities/topic_response.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/26/2024, Wednesday

class QuizWidget extends StatelessWidget {
  final QuizResponse quizResponse;

  const QuizWidget({
    required this.quizResponse,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
    );
  }
}
