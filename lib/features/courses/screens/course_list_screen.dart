import 'package:flutter/material.dart';
import '../../../shared/widgets/bottom_navigation_bar.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({Key? key}) : super(key: key);

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  int _selectedIndex = 1; // Kelas Saya is index 1

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/dashboard');
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/notifications');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dummy data for courses
    final List<Map<String, dynamic>> courses = [
      {'name': 'Matematika Dasar', 'code': 'MATH101', 'progress': 0.75},
      {'name': 'Fisika Modern', 'code': 'PHYS201', 'progress': 0.60},
      {'name': 'Bahasa Inggris', 'code': 'ENG102', 'progress': 0.90},
      {'name': 'Kimia Organik', 'code': 'CHEM301', 'progress': 0.45},
      {'name': 'Pemrograman Mobile', 'code': 'CS401', 'progress': 0.80},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas Saya'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return InkWell(
            onTap: () {
              // Dummy navigation to course detail
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Navigasi ke detail ${course['name']}')),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course['name'],
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Kode Kelas: ${course['code']}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Progres: ${(course['progress'] * 100).toInt()}%',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: course['progress'],
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}