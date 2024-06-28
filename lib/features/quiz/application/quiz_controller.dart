import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:python_basics/core/local_repository/base_state.dart';
import 'package:python_basics/features/quiz/infrastructure/entities/response/quiz_model.dart';

import '../infrastructure/repository/quiz_repository.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/27/2024, Thursday


class QuizController extends StateNotifier<BaseState> {
  QuizController() : super(BaseInitial());
  final QuizRepository _repository = QuizRepository();

  List<QuizModel> _quizList = [];
  List<QuizModel> get quizList => _quizList;

  Future<void> fetchQuiz() async {
    state = BaseLoading();
    final response = await _repository.fetchQuiz();
    if (response != null && response.isNotEmpty) {
      _quizList = response;
      state = BaseSuccess(data: response);
    } else {
      state = BaseSuccess(data: []);
    }
  }

  void updateUserSelectedValue(int questionIndex, int userSelectedOptionIndex) {
    print('hahah : $quizList');
    _quizList[questionIndex].userSelectedIndex = userSelectedOptionIndex;
  }
}
