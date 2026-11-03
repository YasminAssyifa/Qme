import 'package:flutter/material.dart';
import 'package:qme/widgets/app_scaffold.dart';

import '../models/quiz_data.dart';

class ResultScreen extends StatelessWidget {
  final QuizData quiz;
  final String playerName;
  final int correctAnswers;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.playerName,
    required this.correctAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final totalQuestions = quiz.questions.length;
    final percentage = totalQuestions == 0
        ? 0.0
        : correctAnswers / totalQuestions * 100;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.02),

                  Text(
                    'Well done, $playerName!',
                    style: TextStyle(fontSize: screenWidth * 0.08),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  Text(
                    quiz.title,
                    style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  Text(
                    '${percentage.toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: screenWidth * 0.15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check_circle_outline),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            '$correctAnswers out of $totalQuestions answers correct',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: Text(
                          'Back to Home',
                          style: TextStyle(fontSize: screenWidth * 0.04),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
