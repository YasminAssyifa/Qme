
import 'package:flutter/material.dart';
import '../models/quiz_data.dart';
import '../widgets/quiz_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),

            Center(
              child: Text(
                'Qme!',
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                itemCount: quizList.length,
                itemBuilder: (context, index) {
                  final quiz = quizList[index];

                  return QuizCard(
                    quiz: quiz,
                    onTap: () {
                      // Navigate to the quiz screen later.
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
