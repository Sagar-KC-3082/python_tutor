import 'package:python_basics/features/homescreen/infrastructure/entities/topic_response.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

class ChapterResponse {
  final int id;
  final String title;
  bool isLocked;
  final List<TopicResponse> topicsList;

  ChapterResponse({
    required this.id,
    required this.title,
    this.isLocked = true,
    required this.topicsList,
  });
}
