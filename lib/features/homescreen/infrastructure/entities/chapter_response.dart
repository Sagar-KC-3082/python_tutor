import 'package:python_basics/features/homescreen/infrastructure/entities/topic_response.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

class ChapterResponse {
  final String title;
  final List<TopicResponse> topicsList;
  final List<QuizResponse> quizList;

  ChapterResponse({
    required this.title,
    required this.topicsList,
    required this.quizList,
  });
}

class QuizResponse {
  final String question;
  final int correctOptionIndex;
  final List<String> optionList;

  QuizResponse({
    required this.question,
    required this.correctOptionIndex,
    required this.optionList,
  });
}
