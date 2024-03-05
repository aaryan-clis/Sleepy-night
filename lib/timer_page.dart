import 'package:flutter/material.dart';
import 'dart:async';
import 'MiniGamesScreen.dart'; // Import mini game page
import 'SleepInformationPage.dart'; // Import info page
import 'MusicPage.dart'; // Import music page

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  // Initial timer duration set to 7 hours in seconds
  int _seconds = 25200;
  bool _isRunning = false; // Flag to track if the timer is running
  late Timer _timer; // Timer object
  TimeOfDay? _selectedTime; // Selected time for setting an alarm

  // Method to start the timer
  void startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        stopTimer();
        return;
      }
      setState(() {
        _seconds--;
      });
    });
  }

  // Method to stop the timer
  void stopTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  // Method to reset the timer
  void resetTimer() {
    if (_isRunning) {
      stopTimer();
    }
    setState(() {
      _seconds = 25200; // Reset the timer to 7 hours
    });
  }

  // Method to set an alarm based on the timer duration
  Future<void> setAlarm(BuildContext context) async {
    if (_seconds > 0) {
      final int alarmSeconds = _seconds;

      final now = DateTime.now();
      final alarmTime = now.add(Duration(seconds: alarmSeconds));

      final formattedTime =
          TimeOfDay.fromDateTime(alarmTime).format(context);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Set Alarm for $formattedTime'),
            content: Text('Do you want to set an alarm for when the timer ends?'),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Set Alarm'),
                onPressed: () {
                  print('Alarm set for $formattedTime');
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Timer Expired'),
            content: Text('The timer has already expired. You cannot set an alarm for the past.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer Page'),
        actions: [
          // Mini Games button to navigate to the MiniGamesScreen
          IconButton(
            icon: Icon(Icons.games),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MiniGamesScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 99, 31, 217), // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display the current timer value
            Text(
              'Timer: ${_seconds ~/ 3600}:${(_seconds % 3600) ~/ 60}:${_seconds % 60}',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Button to start/stop the timer
            ElevatedButton(
              onPressed: _isRunning ? stopTimer : startTimer,
              child: Text(
                _isRunning ? 'Stop Timer' : 'Start Timer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: _isRunning ? Colors.red : Colors.green, // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
            SizedBox(height: 10),
            // Button to reset the timer
            ElevatedButton(
              onPressed: resetTimer,
              child: Text(
                'Reset Timer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
            SizedBox(height: 10),
            // Button to set an alarm
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((time) {
                  if (time != null) {
                    setState(() {
                      _selectedTime = time;
                    });
                    setAlarm(context);
                  }
                });
              },
              child: Text(
                'Set Alarm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
            SizedBox(height: 10),
            // Button to navigate to the SleepInformationPage
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SleepInformationPage(),
                  ),
                );
              },
              child: Text(
                'To sleep well, you can read this ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
            SizedBox(height: 10),
            // Button to navigate to the MusicPage
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicPage(),
                  ),
                );
              },
              child: Text(
                'Go to Music Page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}