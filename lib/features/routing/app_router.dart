import 'package:admin_app/features/home/presentation/view/home_view.dart';
import 'package:go_router/go_router.dart';

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
    ],
  );
}
