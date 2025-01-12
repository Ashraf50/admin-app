import 'package:admin_app/features/add_manager/presentation/view/widget/add_new_manager.dart';
import 'package:admin_app/features/add_record/presentation/view/widget/create_new_record.dart';
import 'package:admin_app/features/all_tickets/presentation/view/widget/create_new_ticket_view.dart';
import 'package:admin_app/features/home/presentation/view/home_view.dart';
import 'package:admin_app/features/home/presentation/view/widget/edit_profile_view.dart';
import 'package:go_router/go_router.dart';
import '../all_tickets/presentation/view/widget/ticket_details_view.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
          path: '/home',
          builder: (context, state) {
            int pageIndex = state.extra is int ? state.extra as int : 0;
            return HomeView(selectedIndex: pageIndex);
          }),
      GoRoute(
        path: '/ticket_details',
        builder: (context, state) => const TicketsDetailsView(),
      ),
      GoRoute(
        path: '/edit_profile',
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: '/create_ticket',
        builder: (context, state) => const CreateNewTicketView(),
      ),
      GoRoute(
        path: '/create_record',
        builder: (context, state) => const CreateNewRecord(),
      ),
      GoRoute(
        path: '/add_new_manager',
        builder: (context, state) => const AddNewManager(),
      )
    ],
  );
}
