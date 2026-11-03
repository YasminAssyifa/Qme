
import 'package:flutter/material.dart';
import 'package:qme/widgets/app_scaffold.dart';
import '../models/quiz_data.dart';
import 'result_screen.dart';

class QuestionsScreen extends StatefulWidget {
  final QuizData quiz;
  final String playerName;

  const QuestionsScreen({
    super.key,
    required this.quiz,
    required this.playerName,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int? selectedAnswerIndex;

  List<QuizQuestion> get questions => widget.quiz.questions;

  void _submitAnswer() {
    if (selectedAnswerIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an answer.'),
        ),
      );
      return;
    }

    if (selectedAnswerIndex ==
        questions[currentQuestionIndex].correctAnswerIndex) {
      correctAnswers++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            quiz: widget.quiz,
            playerName: widget.playerName,
            correctAnswers: correctAnswers,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: const Center(
          child: Text('This quiz has no questions yet.'),
        ),
      );
    }

    final question = questions[currentQuestionIndex];
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${currentQuestionIndex + 1}',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              Text(
                question.question,
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              Expanded(
                child: ListView.builder(
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    final isSelected =
                        selectedAnswerIndex == index;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            selectedAnswerIndex = index;
                          });
                        },
                        title: Text(question.options[index]),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle)
                            : null,
                        selected: isSelected,
                        selectedTileColor: Theme.of(context)
                            .colorScheme
                            .primaryContainer,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitAnswer,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      currentQuestionIndex == questions.length - 1
                          ? 'Finish Quiz'
                          : 'Next Question',
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
