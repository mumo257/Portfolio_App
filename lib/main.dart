import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Festus Mumo\'s Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Arial',
      ),
      home: const Center(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Function to launch URLs
  void _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Festus Mumo\'s Portfolio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/1312850689/vector/matrix-background-binary-code-texture-falling-green-numbers-data-visualization-concept.jpg?s=612x612&w=0&k=20&c=l1xAzPJUjbROnui5McM-_vbDswAg5OoSzwJuFpdj3WE='    ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Festus Mumo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const Text(
                'Professional Software Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'My name is Festus Mumo. I am a student current persuing ICT and also programming in dart, python and web development.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _launchURL('https://github.com/mumo257?tab=repositories');
                },
                // ignore: sort_child_properties_last
                child: const Text('View Projects'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const SkillsSection(),
              const SizedBox(height: 32),
              ContactButtons(_launchURL),
              const SizedBox(height: 32),
              const ExperienceSection(),
              const SizedBox(height: 32),
              const EducationSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Skills',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        // Add your skills as chips or any other format
        Wrap(
          spacing: 8,
          children: [
            Chip(label: Text('Flutter')),
            Chip(label: Text('Dart')),
            Chip(label: Text('Web Development')),
            Chip(label: Text('Enterprenuer')),
            // Add more skills as needed
          ],
        ),
      ],
    );
  }
}

class ContactButtons extends StatelessWidget {
  final Function(String) launchURL;

   const ContactButtons(this.launchURL, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            launchURL('mailto:festusmumo06@gmail.com');
          },
          icon: const Icon(Icons.email),
          label: const Text('Email Me'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {
            launchURL('tel:+0795389975');('tel:+0704186191');
          },
          icon: const Icon(Icons.phone),
          label: const Text('Call Me'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {
            launchURL('https://discord.com/channels/@me');
          },
          icon: const Icon(Icons.people),
          label: const Text('Connect on Discord'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Beneficiary at Compassion Kenya and a student at Power Learn Project.',
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 16),
        Text(
          'Am currently speciallizing in dart and also i have intrests in web development and python.',
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Diploma in Information Communication and Technology - Michuki Technical Training Institute.',
          textAlign: TextAlign.start,
        ),
        Text(
          'Fullstack Software Development - Power Learn Project.',
          textAlign: TextAlign.start,
        ),
        Text(
          'Web Developer - Power Learn Project.',
          textAlign: TextAlign.start,
        ),
        Text(
          'Enterprenure - Power Learn Project.',
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}