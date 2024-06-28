import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../entities/response/quiz_model.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/5/2024, Wednesday

class QuizRepository {
  Future<List<QuizModel>?> fetchQuiz() async {
    try {
      final Dio dio = Dio();
      final response =
          await dio.get('https://jsonguide.technologychannel.org/quiz.json');
      if (response.statusCode == 200) {
        if (response.data is List<dynamic>) {
          final quizList = response.data as List;
          log(quizList.toString());
          final List<QuizModel> quizParsedList = [];
          for (int i = 0; i < 5; i++) {
            quizParsedList.add(
              QuizModel(
                question: quizList[i]['question'],
                optionList: quizList[i]['options'],
                correctOptionIndex: int.parse(quizList[i]['answer']) - 1,
              ),
            );
          }
          return quizParsedList;
        }
      }
    } catch (e) {
      print('Exception -->>: ${e}');
      return null;
    }
    return null;
  }
}
