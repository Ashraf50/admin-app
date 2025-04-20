import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_text_field.dart';
import 'package:admin_app/features/add_manager/data/model/manager_model/manager_model.dart';
import 'package:admin_app/features/add_manager/presentation/view_model/cubit/add_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ManagerCard extends StatelessWidget {
  final ManagerModel manager;
  const ManagerCard({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    manager.service?.name ?? "null",
                    style: AppStyles.textStyle18black,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      Text(
                        manager.user!.name!,
                        style: AppStyles.textStyle16,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  manager.user!.email!,
                  style: AppStyles.textStyle18black,
                ),
              ),
              PopupMenuButton(
                color: Colors.white,
                icon: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'edit') {
                    _showEditDialog(context);
                  } else if (value == 'delete') {
                    _showDeleteDialog(context);
                  }
                },
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPassController = TextEditingController();
    final idController = TextEditingController();
    SmartDialog.show(
      builder: (_) => AlertDialog(
        title: const Text('Edit Manager'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextfield(
              hintText: "Record id",
              controller: idController,
            ),
            CustomTextfield(
              hintText: "name",
              controller: nameController,
            ),
            CustomTextfield(
              hintText: "email",
              controller: emailController,
            ),
            CustomTextfield(
              hintText: "password",
              controller: passwordController,
            ),
            CustomTextfield(
              hintText: "confirm password",
              controller: confirmPassController,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => SmartDialog.dismiss(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<AddManagerCubit>().editManager(
                    serviceId: idController.text,
                    managerId: manager.id!,
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    confirmPass: confirmPassController.text,
                  );
              SmartDialog.dismiss();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    SmartDialog.show(
      builder: (_) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this manager?'),
        actions: [
          TextButton(
            onPressed: () => SmartDialog.dismiss(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<AddManagerCubit>().deleteManager(manager.id!);
              SmartDialog.dismiss();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
