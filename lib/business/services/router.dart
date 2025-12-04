import 'package:cicly/main.dart';
import 'package:cicly/views/first_visit_form_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: '/first-visit-form',
          builder: (context, state) => const FirstVisitFormView(),
        ),
      ],
    ),
  ],
);
