import 'package:admin_app/core/constant/app_colors.dart';
import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_app_bar.dart';
import 'package:admin_app/core/widget/custom_button.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:admin_app/core/widget/custom_toast.dart';
import 'package:admin_app/features/add_manager/presentation/view_model/cubit/add_manager_cubit.dart';
import 'package:admin_app/features/add_manager/presentation/view_model/cubit/create_manager_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/widget/custom_text_field.dart';
import '../../../../../../../core/widget/drop_down_text_field.dart';
import '../../../../add_record/data/model/record_model.dart';
import '../../../../add_record/presentation/view_model/cubit/all_record_cubit.dart';

class AddNewManager extends StatefulWidget {
  const AddNewManager({super.key});

  @override
  State<AddNewManager> createState() => _AddNewManagerState();
}

class _AddNewManagerState extends State<AddNewManager> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  bool visibility = true;
  final formKey = GlobalKey<FormState>();
  int? selectedServiceId;
  RecordModel? selectedRecord;

  @override
  void initState() {
    super.initState();
    context.read<AllRecordCubit>().fetchAllRecord();
    nameController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateManagerCubit, CreateManagerState>(
      listener: (context, state) {
        if (state is CreateManagerLoading) {
          SmartDialog.showLoading();
        } else if (state is CreateManagerFailure) {
          SmartDialog.dismiss();
          CustomToast.show(
            message: state.errMessage,
            alignment: Alignment.bottomCenter,
            backgroundColor: Colors.red,
          );
        } else if (state is CreateManagerSuccess) {
          SmartDialog.dismiss();
          context.pop(context);
          context.read<AddManagerCubit>().fetchManager();
          CustomToast.show(
            message: "Manager Created Successfully",
            alignment: Alignment.topCenter,
            backgroundColor: AppColors.toastColor,
          );
        }
      },
      child: CustomScaffold(
        appBar: const CustomAppBar(title: "Create New"),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Name",
                  style: AppStyles.textStyle18bold,
                ),
                CustomTextfield(
                  hintText: "Name",
                  controller: nameController,
                ),
                Text(
                  "Email",
                  style: AppStyles.textStyle18bold,
                ),
                CustomTextfield(
                  hintText: "Email",
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return value != null && !EmailValidator.validate(value)
                        ? " Enter a valid email"
                        : null;
                  },
                ),
                Text(
                  "Department",
                  style: AppStyles.textStyle18bold,
                ),
                BlocBuilder<AllRecordCubit, AllRecordState>(
                  builder: (context, state) {
                    if (state is FetchAllRecordsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FetchAllRecordsFailure) {
                      return Text(state.errMessage);
                    } else if (state is FetchAllRecordsSuccess) {
                      return DropdownTextField(
                        records: state.records,
                        selectedRecord: selectedRecord,
                        onChanged: (record) {
                          setState(() {
                            selectedRecord = record;
                            selectedServiceId = record.id;
                          });
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "password",
                  style: AppStyles.textStyle18bold,
                ),
                CustomTextfield(
                  hintText: "password",
                  obscureText: visibility,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: visibility
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                  ),
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length < 8) {
                      return "your password is too short";
                    } else {
                      return null;
                    }
                  },
                ),
                Text(
                  "confirm password",
                  style: AppStyles.textStyle18bold,
                ),
                CustomTextfield(
                  hintText: "Confirm password",
                  obscureText: visibility,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: visibility
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                  ),
                  controller: confirmPassController,
                ),
                CustomButton(
                  title: "Submit",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      final cubit = context.read<CreateManagerCubit>();
                      await cubit.createManager(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        confirmPass: confirmPassController.text,
                        serviceId: selectedServiceId.toString(),
                      );
                    } else {
                      CustomToast.show(message: "Check email or password");
                    }
                  },
                  color: nameController.text.isEmpty
                      ? AppColors.inActiveBlue
                      : AppColors.activeBlue,
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
