import 'package:auto_route/auto_route.dart';
import 'package:todo_mlpcare_app/routes/app_routes.gr.dart';

// import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeView.page,
          path: '/HomeView',
          initial: true,
        ),
        AutoRoute(
          page: UpdateTextView.page,
          path: '/UpdateTextView',
        )
      ];
}
