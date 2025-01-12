import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:admin_app/features/dashboard/presentation/view/widget/graph.dart';
import 'package:flutter/material.dart';
import 'custom_card.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  (MediaQuery.of(context).size.width ~/ 200).toInt(),
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return const CustomCard();
            },
          ),
          const ChartsDashboard(),
        ],
      ),
    );
  }
}
