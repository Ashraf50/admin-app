import 'package:admin_app/core/helper/api_helper.dart';
import 'package:admin_app/core/routing/app_router.dart';
import 'package:admin_app/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:admin_app/features/Auth/presentation/view_model/bloc/auth_bloc.dart';
import 'package:admin_app/features/add_manager/data/repo/manager_repo_impl.dart';
import 'package:admin_app/features/add_manager/presentation/view_model/cubit/add_manager_cubit.dart';
import 'package:admin_app/features/add_record/data/repo/record_repo_impl.dart';
import 'package:admin_app/features/add_record/presentation/view_model/cubit/all_record_cubit.dart';
import 'package:admin_app/features/all_tickets/data/repo/ticket_repo_impl.dart';
import 'package:admin_app/features/all_tickets/presentation/view_model/cubit/ticket_cubit.dart';
import 'package:admin_app/features/home/data/repo/user_repo_impl.dart';
import 'package:admin_app/features/home/presentation/view_model/cubit/user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final String token;
  const MyApp({
    super.key,
    required this.appRouter,
    required this.token,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(AuthRepoImpl(ApiHelper())),
        ),
        BlocProvider(
          create: (context) =>
              UserDataCubit(UserRepoImpl(ApiHelper()))..fetchUserData(token),
        ),
        BlocProvider(
          create: (context) =>
              AllRecordCubit(RecordRepoImpl(ApiHelper()))..fetchAllRecord(),
        ),
        BlocProvider(
          create: (context) =>
              AddManagerCubit(ManagerRepoImpl(ApiHelper()))..fetchManager(),
        ),
        BlocProvider(
          create: (context) =>
              TicketCubit(TicketRepoImpl(ApiHelper()))..fetchTickets(),
        )
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          builder: FlutterSmartDialog.init(),
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          routerConfig: appRouter.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
