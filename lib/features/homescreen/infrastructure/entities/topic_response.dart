/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/25/2024, Tuesday

class TopicResponse {
  final String title;
  final List<TopicIndividualSection> contentList;

  TopicResponse({
    required this.title,
    required this.contentList,
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


