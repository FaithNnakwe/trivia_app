// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = '9'; // General Knowledge
  String selectedDifficulty = 'easy';
  String selectedType = 'multiple';

  final Map<String, String> categories = {
    'General Knowledge': '9',
    'Science': '17',
    'Sports': '21',
    'Entertainment': '11',
  };

  final List<String> difficulties = ['easy', 'medium', 'hard'];
  final Map<String, String> questionTypes = {
    'Multiple Choice': 'multiple',
    'True / False': 'boolean'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Configure Quiz'), backgroundColor: Colors.deepPurple,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories.entries
                  .map((entry) => DropdownMenuItem(
                        value: entry.value,
                        child: Text(entry.key),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Select Category'),
            ),
            DropdownButtonFormField<String>(
              value: selectedDifficulty,
              items: difficulties
                  .map((level) => DropdownMenuItem(
                        value: level,
                        child: Text(level[0].toUpperCase() + level.substring(1)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedDifficulty = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Select Difficulty'),
            ),
            DropdownButtonFormField<String>(
              value: selectedType,
              items: questionTypes.entries
                  .map((entry) => DropdownMenuItem(
                        value: entry.value,
                        child: Text(entry.key),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Select Question Type'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(
                      category: selectedCategory,
                      difficulty: selectedDifficulty,
                      type: selectedType,
                    ),
                  ),
                );
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
