import 'package:flutter/material.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cardWidth = width / 2.5;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(
            child: Text(
              'What We Offer',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Wrap(spacing: 10, runSpacing: 10, children: [
            SizedBox(
              width: cardWidth,
              child: Card(
                child: Column(
                  children: [
                    const Icon(
                      Icons.music_note,
                      grade: 10,
                      color: Colors.amber,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Speech Therapy Sessions',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      constraints: const BoxConstraints(minWidth: 200),
                      child: const Text(
                        'Personalized speech therapy sessions for children with speaking disorders. Our experienced therapists use proven techniques to improve speech clarity and communication skills.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: Card(
                child: Column(
                  children: [
                    const Icon(Icons.calculate),
                    const SizedBox(height: 10),
                    const Text(
                      'Hearing Aid Assistance',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      constraints: const BoxConstraints(minWidth: 200),
                      child: const Text(
                        'Assistance with selection, fitting, and usage of hearing aids for children with hearing disorders. We ensure the device is comfortable and effective in enhancing auditory perception.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: Card(
                child: Column(
                  children: [
                    const Icon(Icons.book),
                    const SizedBox(height: 10),
                    const Text(
                      'ADHD Support Programs',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      constraints: const BoxConstraints(minWidth: 200),
                      child: const Text(
                        'Specialized programs designed to help children with ADHD improve their focus, behavior, and social skills. Our methods are tailored to each child’s unique needs and abilities.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: Card(
                child: Column(
                  children: [
                    const Icon(Icons.landscape),
                    const SizedBox(height: 10),
                    const Text(
                      'Quran Reading Classes',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      constraints: const BoxConstraints(minWidth: 200),
                      child: const Text(
                        'Engaging Quran reading classes for children. Our experienced instructors make learning an enjoyable process, helping children understand and appreciate the holy Quran.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: Card(
                child: Column(
                  children: [
                    const Icon(Icons.format_size),
                    const SizedBox(height: 10),
                    const Text(
                      'Recreational Activities',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      constraints: const BoxConstraints(minWidth: 200),
                      child: const Text(
                        'Fun-filled recreational activities that promote physical health and social interaction. From sports to arts and crafts, we have a wide range of activities to keep children engaged and happy.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: Card(
                child: Column(
                  children: [
                    const Icon(Icons.fitness_center),
                    const SizedBox(height: 10),
                    const Text(
                      'Exploratory Learning Programs',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      constraints: const BoxConstraints(minWidth: 200),
                      child: const Text(
                        'Stimulating programs that encourage children to explore and learn about the world around them. These programs foster curiosity and creativity, enhancing the overall learning experience.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
