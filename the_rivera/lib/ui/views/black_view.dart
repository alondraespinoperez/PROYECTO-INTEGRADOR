import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';

class BlackView extends StatelessWidget {
  const BlackView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardLayout(
      child: Center(
        child: Text(
          'Black View',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF8B5A2B),
          ),
        ),
      ),
    );
  }
}