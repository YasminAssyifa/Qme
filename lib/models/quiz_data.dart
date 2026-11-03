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
        question: 'Makanan yang dianggap aneh sama orang luar?',
        options: ['Martabak', 'Sate Padang', 'Rendang', 'Ayam Pop'],
        correctAnswerIndex: 0,
      ),
      QuizQuestion(
        question: 'Berapa warna di pelangi?',
        options: ['6', '7', '8', '9'],
        correctAnswerIndex: 1,
      ),
      QuizQuestion(
        question: 'Berapa menit dalam sehari?',
        options: ['1220', '1800', '1440', '2400'],
        correctAnswerIndex: 2,
      ),
      QuizQuestion(
        question: 'Banyak planet dalam tata surya?',
        options: ['5', '6', '7', '8'],
        correctAnswerIndex: 3,
      ),
      QuizQuestion(
        question: 'Mana yang tidak akan pernah basi dibawah ini?',
        options: ['Madu', 'Susu', 'Cokelat', 'Jus'],
        correctAnswerIndex: 0,
      ),
    ],
  ),
];
