import 'package:flutter/material.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for courses
    final List<Map<String, String>> courses = [
      {'name': 'Mobile Programming', 'lecturer': 'Dr. John Doe'},
      {'name': 'Data Structures', 'lecturer': 'Prof. Jane Smith'},
      {'name': 'Algorithms', 'lecturer': 'Dr. Bob Johnson'},
      {'name': 'Database Systems', 'lecturer': 'Prof. Alice Brown'},
      {'name': 'Web Development', 'lecturer': 'Dr. Charlie Wilson'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Class'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(course['name']!),
              subtitle: Text('Lecturer: ${course['lecturer']}'),
              onTap: () {
                // Dummy navigation to course detail
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Navigate to ${course['name']} detail')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}