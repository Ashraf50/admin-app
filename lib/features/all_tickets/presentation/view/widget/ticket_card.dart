import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/features/all_tickets/presentation/view/widget/status_button.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final String serviceName;
  final String userName;
  final int status;
  const TicketCard({
    super.key,
    required this.serviceName,
    required this.userName,
    required this.status,
  });

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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      serviceName,
                      style: AppStyles.textStyle18black,
                      softWrap: true,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      Text(
                        userName,
                        style: AppStyles.textStyle16,
                      ),
                    ],
                  ),
                ],
              ),
              StatusButton(
                status: status,
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
