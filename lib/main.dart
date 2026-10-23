import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MoodTrakerApp());
}

class MoodTrakerApp extends StatelessWidget {
  const MoodTrakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mood Traker App",
      theme: ThemeData(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.blue
      ),
      home: const MoodhomeScreem(),
    );
  }
}

class MoodhomeScreem extends StatefulWidget {
  const MoodhomeScreem({super.key});

  @override
  State<MoodhomeScreem> createState() => _MoodhomeScreemState();
}

class _MoodhomeScreemState extends State<MoodhomeScreem> {
  String _selectedMood = "Happy ";
  String _currentQuote = "Every day is a second chance";

  final List<String> _quote = [
    "Every day is a second chance. ✨",
    "You are capable of amazing things. 🚀",
    "Small steps every day lead to big results. 🌱",
    "Keep your face to the sunshine and you cannot see a shadow. ☀️",
    "Breathe, relax, and start again. 💙"
  ];

  final List<Map<String, String>> _moodHistory =[
    {"mood": "Motivated 🚀", "time": "May 18, 10:15 AM"},
    {"mood": "Productive 💻", "time": "May 17, 09:30 AM"},
    {"mood": "Relaxed ☕", "time": "May 16, 08:45 AM"},
  ];

  void _selectMood(String mood) {
    setState(() {
      _selectedMood = mood;

      final random = Random();
      _currentQuote = _quote[random.nextInt(_quote.length)];

      _moodHistory.insert(0, {
        "mood": mood,
        "time": "just now"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Traker And Day quote"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Day",
              style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold ),
            ),
            SizedBox(height: 4),
            Text("how are u feeling today",
              style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMoodButton("happy"),
                _buildMoodButton("okay"),
                _buildMoodButton("sad"),
                _buildMoodButton("motivated"),
              ],
            ),

            SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.teal.shade200 ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Daily Quote",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _currentQuote,
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.black87),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),
            Text("Your Mood Log",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _moodHistory.length,
              itemBuilder: (context, index) {
                final item = _moodHistory[index];
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: Icon(Icons.mood, color: Colors.teal,),
                    title: Text(item["mood"]!),
                    subtitle: Text(item["time"]!),
                  )
                );
            }
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodButton(String moodText) {
    bool isSelected = _selectedMood == moodText;
    return GestureDetector(
      onTap: () => _selectMood(moodText),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Colors.teal : Colors.grey.shade300),
        ),
        child: Text(
          moodText,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

}
