import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:admin_app/core/widget/custom_search.dart';
import 'package:admin_app/features/add_record/presentation/view/widget/department_list.dart';
import 'package:admin_app/features/add_record/presentation/view_model/cubit/all_record_cubit.dart';
import 'package:admin_app/features/all_tickets/presentation/view/widget/add_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddRecordViewBody extends StatelessWidget {
  const AddRecordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final cubit = context.read<AllRecordCubit>();
    return CustomScaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            CustomSearch(
              controller: searchController,
              hintText: "search",
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              onChange: (value) {
                if (value.isEmpty) {
                  cubit.fetchAllRecord();
                } else {
                  cubit.searchRecord(value);
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Text(
                    "10",
                    style: AppStyles.textStyle18bold,
                  ),
                ),
                AddButton(
                  title: "Create New",
                  onTap: () {
                    context.push("/create_record");
                  },
                )
              ],
            ),
            const SizedBox(height: 20),
            const DepartmentListView(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
