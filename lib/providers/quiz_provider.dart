
import 'package:flutter/foundation.dart';
import '../models/quiz_data.dart';

class QuizProvider extends ChangeNotifier {
  QuizData? _currentQuiz;
  String _playerName = '';

  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;
  int? _selectedAnswerIndex;

  QuizData? get currentQuiz => _currentQuiz;
  String get playerName => _playerName;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get correctAnswers => _correctAnswers;
  int? get selectedAnswerIndex => _selectedAnswerIndex;

  List<QuizQuestion> get questions =>
      _currentQuiz?.questions ?? [];

  QuizQuestion? get currentQuestion {
    if (questions.isEmpty ||
        _currentQuestionIndex >= questions.length) {
      return null;
    }
    return questions[_currentQuestionIndex];
  }

  double get progress {
    if (questions.isEmpty) return 0;
    return (_currentQuestionIndex + 1) / questions.length;
  }

  double get scorePercentage {
    if (questions.isEmpty) return 0;
    return _correctAnswers / questions.length * 100;
  }

  void startQuiz(QuizData quiz, String name) {
    _currentQuiz = quiz;
    _playerName = name;
    _currentQuestionIndex = 0;
    _correctAnswers = 0;
    _selectedAnswerIndex = null;
    notifyListeners();
  }

  void selectAnswer(int index) {
    _selectedAnswerIndex = index;
    notifyListeners();
  }

  // Returns true when the quiz is finished.
  bool submitAnswer() {
    final question = currentQuestion;

    if (question == null || _selectedAnswerIndex == null) {
      return false;
    }

    if (_selectedAnswerIndex == question.correctAnswerIndex) {
      _correctAnswers++;
    }

    if (_currentQuestionIndex == questions.length - 1) {
      notifyListeners();
      return true;
    }

    _currentQuestionIndex++;
    _selectedAnswerIndex = null;

    notifyListeners();
    return false;
  }

  void resetQuiz() {
    _currentQuiz = null;
    _playerName = '';
    _currentQuestionIndex = 0;
    _correctAnswers = 0;
    _selectedAnswerIndex = null;
    notifyListeners();
  }
}
