import 'package:admin_app/features/Auth/presentation/view/forget_password_view.dart';
import 'package:admin_app/features/Auth/presentation/view/sign_in_view.dart';
import 'package:admin_app/features/Auth/presentation/view/sign_up_view.dart';
import 'package:admin_app/features/add_manager/presentation/view/widget/add_new_manager.dart';
import 'package:admin_app/features/all_tickets/presentation/view/widget/create_new_ticket_view.dart';
import 'package:admin_app/features/home/presentation/view/admin_home_view.dart';
import 'package:admin_app/features/home/presentation/view/widget/edit_profile_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/add_record/presentation/view/widget/create_new_record.dart';
import '../../features/all_tickets/presentation/view/widget/ticket_details_view.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/sign_in',
    routes: [
      GoRoute(
        path: '/sign_in',
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: '/sign_Up',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: '/forget_pass',
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
          path: '/admin_home',
          builder: (context, state) {
            int pageIndex = state.extra is int ? state.extra as int : 0;
            return AdminHomeView(selectedIndex: pageIndex);
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
