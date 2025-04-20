import 'package:admin_app/core/widget/custom_app_bar.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:admin_app/features/all_tickets/presentation/view/widget/all_tickets_list_view.dart';
import 'package:admin_app/features/all_tickets/presentation/view/widget/sort_dialog.dart';
import 'package:flutter/material.dart';

class AllTicketsViewBody extends StatelessWidget {
  const AllTicketsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: "",
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const SortDialog(),
            );
          },
          icon: const Icon(Icons.sort_outlined),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: const [
            AllTicketsListView(),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
