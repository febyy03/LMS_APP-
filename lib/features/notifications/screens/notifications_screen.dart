import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy notifications data
    final List<Map<String, dynamic>> notifications = [
      {
        'icon': Icons.assignment,
        'title': 'Tugas Baru: Aljabar Linear',
        'time': '2 jam yang lalu',
        'color': Colors.blue,
      },
      {
        'icon': Icons.announcement,
        'title': 'Pengumuman: Jadwal Ujian Akhir Semester',
        'time': '5 jam yang lalu',
        'color': Colors.orange,
      },
      {
        'icon': Icons.grade,
        'title': 'Nilai Tugas Fisika Telah Diumumkan',
        'time': '1 hari yang lalu',
        'color': Colors.green,
      },
      {
        'icon': Icons.event,
        'title': 'Reminder: Pertemuan 3 Matematika Hari Ini',
        'time': '2 hari yang lalu',
        'color': Colors.red,
      },
      {
        'icon': Icons.forum,
        'title': 'Diskusi Baru di Forum Bahasa Inggris',
        'time': '3 hari yang lalu',
        'color': Colors.purple,
      },
      {
        'icon': Icons.assignment_turned_in,
        'title': 'Tugas Kimia Berhasil Dikumpulkan',
        'time': '4 hari yang lalu',
        'color': Colors.teal,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            elevation: 1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: notification['color'].withOpacity(0.1),
                child: Icon(
                  notification['icon'],
                  color: notification['color'],
                ),
              ),
              title: Text(
                notification['title'],
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              subtitle: Text(
                notification['time'],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Membuka ${notification['title']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}