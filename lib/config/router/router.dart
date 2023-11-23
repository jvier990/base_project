import 'package:base_project/presentation/widget_tree.dart';
import 'package:base_project/screens/calendar/calendar_recipes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../screens/index.dart';

final GoRouter router = GoRouter(
  initialLocation: '/widgetTree',
  routes: <RouteBase>[
    GoRoute(
      path: '/widgetTree',
      builder: (BuildContext context, GoRouterState state) {
        return const WidgetTree();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/calendar',
      builder: (BuildContext context, GoRouterState state) {
        return CalendarScreen();
      },
    ),
    GoRoute(
      path: '/recipes',
      builder: (BuildContext context, GoRouterState state) {
        return const RecipesScreen();
      },
    ),
    GoRoute(
      path: '/recipes/clendar/:date1/:date2',
      builder: (BuildContext context, GoRouterState state) {
        return CalenderRecipe(
          date1: state.pathParameters['date1']!,
          date2: state.pathParameters['date2']!,
        );
      },
    ),
    GoRoute(
      path: '/recipes/:id',
      builder: (BuildContext context, GoRouterState state) {
        return EditRecipeScreen(id: int.parse(state.pathParameters['id']!));
      },
    ),
  ],
);
