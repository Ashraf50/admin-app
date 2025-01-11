import 'package:admin_app/core/constant/app_images.dart';
import 'package:admin_app/features/home/data/model/drawer_model.dart';
import 'package:admin_app/features/home/presentation/view/widget/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerItemsListView extends StatelessWidget {
  final int activeIndex;
  final Function(int) onItemSelected;
  DrawerItemsListView({
    super.key,
    required this.activeIndex,
    required this.onItemSelected,
  });

  final List<DrawerItemModel> items = [
    const DrawerItemModel(
      title: 'Dashboard',
      image: Assets.dashboard,
    ),
    const DrawerItemModel(
      title: 'All Tickets',
      image: Assets.ticket,
    ),
    const DrawerItemModel(
      title: 'Add Manager',
      image: Assets.addManager,
    ),
    const DrawerItemModel(
      title: 'Add Record',
      image: Assets.addRecord,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            onItemSelected(index);
            context.go("/home", extra: index);
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
