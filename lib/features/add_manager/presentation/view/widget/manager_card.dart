import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_text_field.dart';
import 'package:admin_app/features/add_manager/data/model/manager_model/manager_model.dart';
import 'package:admin_app/features/add_manager/presentation/view_model/cubit/add_manager_cubit.dart';
import 'package:admin_app/generated/l10n.dart';
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
                    manager.service?.name ?? S.of(context).null_value,
                    style: AppStyles.textStyle16,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        manager.user!.name!,
                        style: AppStyles.textStyle18black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .6,
                        child: Text(
                          manager.user!.email!,
                          style: AppStyles.textStyle18black,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              PopupMenuButton(
                color: Colors.white,
                icon: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text(S.of(context).edit),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text(
                      S.of(context).delete,
                    ),
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
    final nameController = TextEditingController(
        text: manager.user!.name ?? S.of(context).null_value);
    final emailController = TextEditingController(
        text: manager.user!.email ?? S.of(context).null_value);
    final passwordController = TextEditingController();
    final confirmPassController = TextEditingController();
    final idController = TextEditingController(
        text: manager.service?.id.toString() ?? S.of(context).null_value);
    SmartDialog.show(
      builder: (_) => AlertDialog(
        title: Text(
          S.of(context).edit_manager,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextfield(
              hintText: S.of(context).service_id,
              controller: idController,
            ),
            CustomTextfield(
              hintText: S.of(context).name,
              controller: nameController,
            ),
            CustomTextfield(
              hintText: S.of(context).Email,
              controller: emailController,
            ),
            CustomTextfield(
              hintText: S.of(context).password,
              controller: passwordController,
            ),
            CustomTextfield(
              hintText: S.of(context).confirmPassword,
              controller: confirmPassController,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => SmartDialog.dismiss(),
            child: Text(S.of(context).cancel),
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
            child: Text(S.of(context).save),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    SmartDialog.show(
      builder: (_) => AlertDialog(
        title: Text(
          S.of(context).confirm_delete,
        ),
        content: Text(S.of(context).sure_delete_manager),
        actions: [
          TextButton(
            onPressed: () => SmartDialog.dismiss(),
            child: Text(
              S.of(context).cancel,
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<AddManagerCubit>().deleteManager(manager.id!);
              SmartDialog.dismiss();
            },
            child: Text(S.of(context).delete,
                style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
