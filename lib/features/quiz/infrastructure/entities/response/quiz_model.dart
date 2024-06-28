class QuizModel {
  String question;
  List optionList;
  int correctOptionIndex;
  int? userSelectedIndex;

  QuizModel({
    required this.question,
    required this.optionList,
    required this.correctOptionIndex,
    this.userSelectedIndex,
  });

  QuizModel.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        optionList = json['options'],
        correctOptionIndex = int.parse(json['answer']);
}
