import 'package:flutter/material.dart';
import 'package:quraan_app/features/auth/presentation/views/widgets/custom_tab_bar.dart';
import 'package:quraan_app/features/home/presentation/views/widgets/quran/logo.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}
class _QuranViewState extends State<QuranView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const logo(),
              const SizedBox(height: 25),
              CustomTabBar(tabController: _tabController)
            ],
          ),
        )
      ],
    );
  }

  
}

