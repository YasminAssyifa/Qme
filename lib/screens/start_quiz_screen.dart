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
        const SnackBar(content: Text('Please enter your name first.')),
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
                    const SizedBox(height: 32),
                    
                    Center(
                      child: Image.asset(
                        quiz.imagePath!,
                        height: 180,
                        width: 180,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      quiz.title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      quiz.description,
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        const Icon(Icons.help_outline),
                        const SizedBox(width: 8),
                        Text('${quiz.questions.length} Questions'),
                      ],
                    ),

                    const SizedBox(height: 12),

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

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _startQuiz,
                        child: const Padding(
                          padding: EdgeInsets.all(14),
                          child: Text(
                            'Start Quiz',
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
      ),
    );
  }
}
