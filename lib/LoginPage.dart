import 'package:flutter/material.dart';
import 'timer_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 120, 35, 148),
      hintColor: Color.fromARGB(255, 239, 242, 35),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
      ),
    ),
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 120, 35, 148),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(color: Colors.grey[700]),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: genderController,
              decoration: InputDecoration(
                labelText: 'Gender',
                labelStyle: TextStyle(color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: heightController,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                labelStyle: TextStyle(color: Colors.grey[700]),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: weightController,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                labelStyle: TextStyle(color: Colors.grey[700]),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                int age = int.tryParse(ageController.text) ?? 0;
                String gender = genderController.text;
                double height = double.tryParse(heightController.text) ?? 0.0;
                double weight = double.tryParse(weightController.text) ?? 0.0;

                if (name.isEmpty || age == 0 || gender.isEmpty || height == 0.0 || weight == 0.0) {
                  // Show an error message or prevent navigation if any field is empty.
                  print('Please fill in all fields');
                } else {
                  // Perform actions with the entered data.
                  print('Name: $name');
                  print('Age: $age');
                  print('Gender: $gender');
                  print('Height: $height cm');
                  print('Weight: $weight kg');

                  // Navigate to the ThankYouPage when the login button is pressed.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThankYouPage(name: name),
                    ),
                  );
                }
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 120, 35, 148),
                onPrimary: Color.fromARGB(255, 239, 242, 35),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  // End of login page 

  // Start of Thankyou page
  class ThankYouPage extends StatelessWidget {
  final String name;

  ThankYouPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thank You',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 120, 35, 148),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Thank you, $name, for logging in!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 58, 77, 200),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the BedtimeStoryPage when the button is pressed.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BedtimeStoryPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Text(
                    'Read Bedtime Story',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 58, 77, 200),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


  //Bed time story start 


class BedtimeStoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bedtime Story',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          BedtimeStory(
            title: 'The Enchanted Forest',
            story: 'Once upon a time, in a cozy village, there was a girl named Lily and her fluffy bunny, Fluffy. They discovered a hidden glen in the forest with a magical tree and a book. The book revealed the story of a fairy princess trapped in the tree. Lily, Fluffy, and the forest\'s flowers collected rare petals to break the enchantment. With a wish, they freed the fairy princess, and she granted the forest happiness and protection. Lily and Fluffy\'s kindness and courage made their forest a place of enchantment, and they lived happily ever after.',
          ),
          SizedBox(height: 20),
          BedtimeStory(
            title: 'The Starry Night',
            story: 'In a small village, there was a little girl named Stella who loved staring at the night sky. One night, she discovered a special star that twinkled brighter than the rest. Curious, Stella made a wish upon the star for the village to have everlasting joy. The star granted her wish, and from that night on, the village sparkled with happiness. Stella became known as the "Star Keeper," and every night, she and the villagers would gather to share stories under the magical star.',
          ),
          SizedBox(height: 20),
          BedtimeStory(
            title: 'The Magic Carousel',
            story: 'Tommy and his friends found an abandoned carousel in the heart of their town. Little did they know, it was a magic carousel that could transport them to different worlds. Each ride took them on an adventure - from soaring with dragons to dancing with fairies. They realized the power of imagination and friendship. The magic carousel became a symbol of joy, and the children cherished the enchanting journeys it offered, creating memories that lasted a lifetime.',
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the TimerPage when the button is pressed.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimerPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Set a Timer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Get ready for a peaceful night\'s sleep!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BedtimeStory extends StatelessWidget {
  final String title;
  final String story;

  BedtimeStory({required this.title, required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 233, 192, 30),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 37, 42, 108),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              story,
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



