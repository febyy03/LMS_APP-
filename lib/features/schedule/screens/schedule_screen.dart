import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _ScheduleCard(
            courseName: 'Pemrograman Mobile',
            time: '08:00 - 10:00',
            status: 'Aktif',
          ),
          _ScheduleCard(
            courseName: 'Sistem Pendukung Keputusan',
            time: '10:30 - 12:00',
            status: 'Selesai',
          ),
          _ScheduleCard(
            courseName: 'Rekayasa Perangkat Lunak',
            time: '13:00 - 15:00',
            status: 'Aktif',
          ),
        ],
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  final String courseName;
  final String time;
  final String status;

  const _ScheduleCard({
    required this.courseName,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = status == 'Aktif';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          isActive ? Icons.schedule : Icons.check_circle,
          color: isActive ? Colors.orange : Colors.green,
        ),
        title: Text(courseName),
        subtitle: Text(time),
        trailing: Text(
          status,
          style: TextStyle(
            color: isActive ? Colors.orange : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
