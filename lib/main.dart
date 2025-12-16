import 'package:flutter/material.dart';

import 'core/themes/app_theme.dart';

// Auth
import 'features/auth/screens/splash_screen.dart';
import 'features/auth/screens/login_screen.dart';

// Dashboard
import 'features/dashboard/screens/dashboard_screen.dart';

// Schedule
import 'features/schedule/screens/schedule_screen.dart';

// Courses
import 'features/courses/screens/course_list_screen.dart';

// Profile
import 'features/profile/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LMS App',
      theme: AppTheme.lightTheme,

      // Route awal aplikasi
      initialRoute: '/',

      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/schedule': (context) => ScheduleScreen(),
        '/courses': (context) => CourseListScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
