import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'About Me'),
              Tab(text: 'Kelas'),
              Tab(text: 'Edit Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AboutMeTab(),
            KelasTab(),
            EditProfileTab(),
          ],
        ),
      ),
    );
  }
}

class AboutMeTab extends StatelessWidget {
  const AboutMeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Profile Photo and Name
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            'Dandy Candra Pratama',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Mahasiswa Teknik Informatika',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 24),

          // Student Info Cards
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi Pribadi',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow('NIM', '123456789'),
                  _buildInfoRow('Email', 'dandy.pratama@univ.ac.id'),
                  _buildInfoRow('Telepon', '+62 812-3456-7890'),
                  _buildInfoRow('Alamat', 'Jl. Sudirman No. 123, Jakarta'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi Akademik',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow('Fakultas', 'Teknik'),
                  _buildInfoRow('Program Studi', 'Teknik Informatika'),
                  _buildInfoRow('Semester', '6'),
                  _buildInfoRow('IPK', '3.75'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

class KelasTab extends StatelessWidget {
  const KelasTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> enrolledCourses = [
      {'name': 'Matematika Dasar', 'code': 'MATH101', 'lecturer': 'Dr. Ahmad'},
      {'name': 'Fisika Modern', 'code': 'PHYS201', 'lecturer': 'Prof. Siti'},
      {'name': 'Bahasa Inggris', 'code': 'ENG102', 'lecturer': 'Ms. Maria'},
      {'name': 'Kimia Organik', 'code': 'CHEM301', 'lecturer': 'Dr. Budi'},
      {'name': 'Pemrograman Mobile', 'code': 'CS401', 'lecturer': 'Mr. John'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: enrolledCourses.length,
      itemBuilder: (context, index) {
        final course = enrolledCourses[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              child: Text(
                course['code']![0],
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(course['name']!),
            subtitle: Text('Dosen: ${course['lecturer']}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Navigasi ke detail ${course['name']}')),
              );
            },
          ),
        );
      },
    );
  }
}

class EditProfileTab extends StatelessWidget {
  const EditProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Fitur edit profile akan diimplementasikan dengan form input untuk mengubah informasi pribadi.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigasi ke halaman edit profile')),
              );
            },
            child: const Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}
