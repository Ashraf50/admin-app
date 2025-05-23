import 'package:admin_app/core/constant/app_images.dart';
import 'package:admin_app/features/home/data/model/drawer_model.dart';
import 'package:admin_app/features/home/presentation/view/widget/drawer_item.dart';
import 'package:admin_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminDrawerItemsListView extends StatelessWidget {
  final int activeIndex;
  final Function(int) onItemSelected;
  const AdminDrawerItemsListView({
    super.key,
    required this.activeIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<DrawerItemModel> items = [
      DrawerItemModel(
        title: S.of(context).dashboard,
        image: Assets.dashboard,
      ),
      DrawerItemModel(
        title: S.of(context).allTickets,
        image: Assets.ticket,
      ),
      DrawerItemModel(
        title: S.of(context).addManager,
        image: Assets.addManager,
      ),
      DrawerItemModel(
        title: S.of(context).add_service,
        image: Assets.addRecord,
      ),
      DrawerItemModel(
        title: S.of(context).setting,
        image: Assets.settings,
      ),
    ];

    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            onItemSelected(index);
            context.go("/admin_home", extra: index);
            context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: DrawerItem(
              drawerItemModel: items[index],
              isActive: activeIndex == index,
            ),
          ),
        );
      },
    );
  }
}
