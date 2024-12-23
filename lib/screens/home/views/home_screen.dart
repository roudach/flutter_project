import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(const SignOutRequired());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover a healthier you',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Featured Programs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ProgramCard(
                          imageUrl: 'https://cdn.usegalileo.ai/stability/9b687ce4-b1da-4c54-93f8-f945e951f0eb.png',
                          title: 'Mindful Meditation',
                          duration: '10-20min',
                        ),
                        ProgramCard(
                          imageUrl: 'https://cdn.usegalileo.ai/stability/eb3bba6c-8011-4501-8e73-231cd85bccfe.png',
                          title: 'Healthy Hiking',
                          duration: '30-60min',
                        ),
                        ProgramCard(
                          imageUrl: 'https://cdn.usegalileo.ai/stability/fc2e26f3-bd7d-4293-9f0e-04a58d0d41bc.png',
                          title: 'Cooking Classes',
                          duration: '45-90min',
                        ),
                        ProgramCard(
                          imageUrl: 'https://cdn.usegalileo.ai/stability/f6438501-b7e0-45fe-8be8-00eaf15f87f8.png',
                          title: 'Reading Club',
                          duration: '30-60min',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Popular Topics',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: [
                      TopicChip(label: 'Fitness'),
                      TopicChip(label: 'Nutrition'),
                      TopicChip(label: 'Meditation'),
                      TopicChip(label: 'Sleep'),
                      TopicChip(label: 'Stress'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String duration;

  const ProgramCard({super.key, 
    required this.imageUrl,
    required this.title,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(title),
          Text(duration),
        ],
      ),
    );
  }
}

class TopicChip extends StatelessWidget {
  final String label;

  const TopicChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
    );
  }
}
