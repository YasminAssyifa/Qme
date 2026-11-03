class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuizData {
  final String title;
  final String description;
  final List<QuizQuestion> questions;
  final String? imagePath;

  const QuizData({
    required this.title,
    required this.description,
    required this.questions,
    this.imagePath,
  });
}

const List<QuizData> quizList = [
  QuizData(
    title: 'Quiz Matematika',
    description: 'Test your mathematical knowledge.',
    imagePath: 'assets/images/math.jpg',
    questions: [
      QuizQuestion(
        question: 'What is 5 + 3?',
        options: ['8', '7', '6', '9'],
        correctAnswerIndex: 0,
      ),
      QuizQuestion(
        question: 'What is 4 × 6?',
        options: ['20', '24', '28', '30'],
        correctAnswerIndex: 1,
      ),
      QuizQuestion(
        question: 'What is 81 div 9?',
        options: ['2', '8', '9', '1'],
        correctAnswerIndex: 2,
      ),
      QuizQuestion(
        question: 'What is 21 + 9?',
        options: ['33', '29', '31', '30'],
        correctAnswerIndex: 3,
      ),
      QuizQuestion(
        question: 'What is 30 × 0?',
        options: ['0', '2', '8', '3'],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  QuizData(
    title: 'Fun Quiz',
    description: 'Random Fun Question, Have Fun!',
    imagePath: 'assets/images/random.jpg',
    questions: [
      QuizQuestion(
        question: 'Which planet is known as the Red Planet?',
        options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
        correctAnswerIndex: 1,
      ),
    ],
  ),
];
