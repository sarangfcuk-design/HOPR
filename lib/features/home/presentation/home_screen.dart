import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../widgets/category_list_test.dart';
import '../widgets/home_header.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HomeHeader(),

              SizedBox(height: 12),

              SearchBarWidget(),

              SizedBox(height: 24),

              CategoryListTest(),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}