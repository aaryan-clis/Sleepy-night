import 'package:flutter/material.dart';

class SleepInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Information'),
        backgroundColor: Colors.lightBlueAccent, // Heavenly color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SectionCard(
              title: 'How to Sleep Properly at Night:',
              color: const Color.fromARGB(255, 58, 70, 136), // Calm and deep color
              items: [
                'Maintain a Consistent Sleep Schedule: Go to bed and wake up at the same time every day, even on weekends.',
                'Create a Relaxing Bedtime Routine: Establish calming activities before bedtime, such as reading or listening to soothing music.',
                'Make Your Sleep Environment Comfortable: Ensure your bedroom is cool, dark, and quiet. Invest in a comfortable mattress and pillows.',
                'Limit Exposure to Screens Before Bed: Avoid screens (phones, tablets, computers) at least an hour before bedtime as the blue light can interfere with melatonin production.',
              ],
            ),
            SectionCard(
              title: 'What to Eat Before Going to Bed:',
              color: const Color.fromARGB(255,58,70,136), // Calm and deep color
              items: [
                'Cherries: Cherries contain melatonin, a hormone that regulates sleep-wake cycles.',
                'Bananas: Bananas contain tryptophan and magnesium, which promote relaxation.',
                'Almonds: Almonds are a good source of magnesium and may help in improving sleep quality.',
              ],
            ),
            SectionCard(
              title: 'Tips for Better Sleep:',
              color: const Color.fromARGB(255,58,70,136), // Calm and deep color
              items: [
                'Practice Deep Breathing: Engage in deep breathing exercises to calm your mind and relax your body before bedtime.',
                'Limit Caffeine and Nicotine: Avoid consuming caffeine and nicotine, especially in the evening, as they can interfere with sleep.',
                'Stay Active During the Day: Regular physical activity can promote better sleep. Aim for at least 30 minutes of exercise most days.',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final Color color;
  final List<String> items;

  SectionCard({required this.title, required this.color, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text on colored background
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map((item) => StyledText(
                        text: item,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 238, 241, 41), // White text on colored background
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  StyledText(
      {required this.text,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
