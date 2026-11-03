import 'package:flutter/material.dart';
import 'package:qme/widgets/app_scaffold.dart';

import '../models/quiz_data.dart';
import 'questions_screen.dart';

class StartQuizScreen extends StatefulWidget {
  final QuizData quiz;

  const StartQuizScreen({super.key, required this.quiz});

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _startQuiz() {
    final playerName = _nameController.text.trim();

    if (playerName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name first.'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            QuestionsScreen(quiz: widget.quiz, playerName: playerName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = widget.quiz;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),

                    Center(
                      child: Image.asset(
                        quiz.imagePath!,
                        height: 180,
                        width: 180,
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    Text(
                      quiz.title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    Text(
                      quiz.description,
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    Row(
                      children: [
                        const Icon(Icons.help_outline),
                        const SizedBox(width: 8),
                        Text('${quiz.questions.length} Questions'),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    TextField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      onSubmitted: (_) => _startQuiz(),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _startQuiz,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Text(
                            'Start Quiz',
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
