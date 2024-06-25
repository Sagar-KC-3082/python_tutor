/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

class TopicResponse {
  final int id;
  final String title;
  final List<TopicIndividualSection> contentList;
  final List<QuizResponse> quizList;

  TopicResponse({
    required this.id,
    required this.title,
    required this.contentList,
    required this.quizList,
  });
}

class TopicIndividualSection {
  final String title;
  final String? description;
  final String? imageUrl;

  TopicIndividualSection({
    required this.title,
    this.description,
    this.imageUrl,
  });
}

class QuizResponse {

}
