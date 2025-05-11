import 'package:admin_app/core/constant/app_images.dart';
import 'package:admin_app/core/helper/api_helper.dart';
import 'package:admin_app/features/Auth/data/repo/auth_repo.dart';
import 'package:admin_app/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:admin_app/features/home/data/model/drawer_model.dart';
import 'package:admin_app/features/home/presentation/view/widget/active_and_inactive_item.dart';
import 'package:admin_app/features/home/presentation/view/widget/admin_drawer_item_list_view.dart';
import 'package:admin_app/features/home/presentation/view/widget/user_info.dart';
import 'package:admin_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdminDrawer extends StatelessWidget {
  final int activeIndex;
  final Function(int) onItemSelected;
  const AdminDrawer({
    super.key,
    required this.activeIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      width: MediaQuery.sizeOf(context).width * .7,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: UserInfoListTile(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 8.h,
            ),
          ),
          AdminDrawerItemsListView(
            activeIndex: activeIndex,
            onItemSelected: onItemSelected,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 20.h,
                )),
                InkWell(
                  onTap: () {
                    context.go('/sign_in');
                    AuthRepo authRepo = AuthRepoImpl(ApiHelper());
                    authRepo.logout();
                  },
                  child:  InActiveDrawerItem(
                    drawerItemModel: DrawerItemModel(
                      title: S.of(context).logoutAccount,
                      image: Assets.logout,
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
