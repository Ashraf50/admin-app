import 'package:admin_app/core/constant/app_colors.dart';
import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_app_bar.dart';
import 'package:admin_app/core/widget/custom_button.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:admin_app/core/widget/custom_text_field.dart';
import 'package:admin_app/features/add_record/presentation/view_model/cubit/all_record_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class CreateNewRecord extends StatefulWidget {
  const CreateNewRecord({super.key});

  @override
  State<CreateNewRecord> createState() => _CreateNewRecordState();
}

class _CreateNewRecordState extends State<CreateNewRecord> {
  final TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    final name = nameController.text.trim();
    if (name.isEmpty) {
      SmartDialog.showToast("Please enter a name");
      return;
    }
    SmartDialog.showLoading(msg: 'Creating...');
    final result = await context.read<AllRecordCubit>().createRecord(name);
    SmartDialog.dismiss();
    if (result) {
      SmartDialog.showToast("Record created successfully");
      Navigator.pop(context);
    } else {
      SmartDialog.showToast("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: "Create New"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text("Record Name", style: AppStyles.textStyle18bold),
            CustomTextfield(
              hintText: "Record Name",
              controller: nameController,
            ),
            CustomButton(
              title: "Submit",
              onTap: _handleSubmit,
              color: nameController.text.isEmpty
                  ? AppColors.inActiveBlue
                  : AppColors.activeBlue,
            ),
          ],
        ),
      ),
    );
  }
}
