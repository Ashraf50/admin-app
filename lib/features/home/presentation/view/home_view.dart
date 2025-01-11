import 'package:admin_app/core/widget/custom_app_bar.dart';
import 'package:admin_app/features/add_manager/presentation/view/add_manager_view.dart';
import 'package:admin_app/features/add_record/presentation/view/add_record.dart';
import 'package:admin_app/features/all_tickets/presentation/view/all_tickets.dart';
import 'package:admin_app/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:admin_app/features/home/presentation/view/widget/custom_drawer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  int selectedIndex;
  HomeView({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> pages = const [
    DashboardView(),
    AllTicketsView(),
    AddManagerView(),
    AddRecordView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: [
          'Dashboard',
          'All Tickets',
          'Add Manager',
          'Add Record'
        ][widget.selectedIndex],
      ),
      drawer: CustomDrawer(
        activeIndex: widget.selectedIndex,
        onItemSelected: (index) {
          setState(() {
            widget.selectedIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: widget.selectedIndex,
        children: pages,
      ),
    );
  }
}
