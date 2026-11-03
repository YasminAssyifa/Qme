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
                  const SizedBox(height: 12),

                  Text(
                    'Well done, $playerName!',
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    quiz.title,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  Text(
                    '${percentage.toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check_circle_outline),
                          const SizedBox(width: 12),
                          Text(
                            '$correctAnswers out of $totalQuestions answers correct',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(14),
                        child: Text(
                          'Back to Home',
                          style: TextStyle(fontSize: 16),
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
