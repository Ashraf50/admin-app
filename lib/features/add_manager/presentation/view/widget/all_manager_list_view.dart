import 'package:admin_app/features/add_manager/presentation/view_model/cubit/add_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'manager_card.dart';

class AllManageListView extends StatelessWidget {
  const AllManageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(13),
        ),
        child: BlocBuilder<AddManagerCubit, AddManagerState>(
          builder: (context, state) {
            if (state is FetchManagerSuccess) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.managers.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: ManagerCard(
                      manager: state.managers[index],
                    ),
                  );
                },
              );
            } else if (state is FetchManagerLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchManagerFailure) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
