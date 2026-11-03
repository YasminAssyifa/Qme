import 'package:flutter/material.dart';
import 'package:qme/screens/start_quiz_screen.dart';
import 'package:qme/widgets/app_scaffold.dart';

import '../models/quiz_data.dart';
import '../widgets/quiz_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),

            Center(
              child: Text(
                'Qme!',
                style: TextStyle(
                  fontSize: screenHeight * 0.1,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  itemCount: quizList.length,
                  itemBuilder: (context, index) {
                    final quiz = quizList[index];

                    return QuizCard(
                      quiz: quiz,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StartQuizScreen(quiz: quiz),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
