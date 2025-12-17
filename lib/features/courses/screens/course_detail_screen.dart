import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Matematika Dasar'),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas dan Kuis'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MaterialsTab(),
            AssignmentsTab(),
          ],
        ),
      ),
    );
  }
}

class MaterialsTab extends StatelessWidget {
  const MaterialsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pertemuan = [
      {
        'title': 'Pertemuan 1: Pengantar Aljabar',
        'materials': [
          {'title': 'Konsep Dasar Aljabar', 'type': 'Video', 'completed': true},
          {'title': 'Variabel dan Konstanta', 'type': 'Dokumen', 'completed': true},
          {'title': 'Operasi Dasar', 'type': 'Video', 'completed': false},
        ],
      },
      {
        'title': 'Pertemuan 2: Persamaan Linear',
        'materials': [
          {'title': 'Persamaan Linear Satu Variabel', 'type': 'Video', 'completed': true},
          {'title': 'Sistem Persamaan Linear', 'type': 'Dokumen', 'completed': false},
          {'title': 'Aplikasi dalam Kehidupan', 'type': 'Artikel', 'completed': false},
        ],
      },
      {
        'title': 'Pertemuan 3: Matriks',
        'materials': [
          {'title': 'Pengantar Matriks', 'type': 'Video', 'completed': false},
          {'title': 'Operasi Matriks', 'type': 'Dokumen', 'completed': false},
          {'title': 'Determinan', 'type': 'Video', 'completed': false},
        ],
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: pertemuan.map((p) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                p['title'],
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ...p['materials'].map<Widget>((material) {
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(
                    _getIconForType(material['type']),
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(material['title']),
                  subtitle: Text(material['type']),
                  trailing: material['completed']
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(Icons.circle_outlined, color: Colors.grey),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Membuka ${material['title']}')),
                    );
                  },
                ),
              );
            }).toList(),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'Video':
        return Icons.video_library;
      case 'Dokumen':
        return Icons.description;
      case 'Artikel':
        return Icons.article;
      default:
        return Icons.file_present;
    }
  }
}

class AssignmentsTab extends StatelessWidget {
  const AssignmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> assignments = [
      {'title': 'Tugas Aljabar Linear', 'type': 'Tugas', 'dueDate': '20 Desember 2023', 'status': 'Belum dikumpulkan'},
      {'title': 'Kuis Persamaan Kuadrat', 'type': 'Kuis', 'dueDate': '18 Desember 2023', 'status': 'Sudah dikumpulkan'},
      {'title': 'Proyek Matematika Terapan', 'type': 'Tugas', 'dueDate': '25 Desember 2023', 'status': 'Belum dikumpulkan'},
      {'title': 'Kuis Matriks', 'type': 'Kuis', 'dueDate': '22 Desember 2023', 'status': 'Sudah dikumpulkan'},
      {'title': 'Tugas Sistem Persamaan', 'type': 'Tugas', 'dueDate': '28 Desember 2023', 'status': 'Belum dikumpulkan'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: assignments.length,
      itemBuilder: (context, index) {
        final assignment = assignments[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Navigasi ke detail ${assignment['title']}')),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        assignment['type'] == 'Tugas' ? Icons.assignment : Icons.quiz,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          assignment['title'],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'Deadline: ${assignment['dueDate']}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        assignment['status'] == 'Sudah dikumpulkan' ? Icons.check_circle : Icons.error,
                        size: 16,
                        color: assignment['status'] == 'Sudah dikumpulkan' ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        assignment['status'],
                        style: TextStyle(
                          color: assignment['status'] == 'Sudah dikumpulkan' ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}