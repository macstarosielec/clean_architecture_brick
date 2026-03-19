import 'package:{{project_name.snakeCase()}}/core/config/app_config.dart';
import 'package:{{project_name.snakeCase()}}/core/extensions/build_context_x.dart';
import 'package:{{project_name.snakeCase()}}/core/injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/core/routes/route_observer.dart';
import 'package:{{project_name.snakeCase()}}/core/routes/router.dart';
import 'package:{{project_name.snakeCase()}}/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => AppView();
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: getIt<IAppConfig>().appName ?? '{{project_name.titleCase()}}',
        theme: {{project_name.pascalCase()}}Theme.light,
        darkTheme: {{project_name.pascalCase()}}Theme.dark,
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            AppRouteObserver(),
          ],
        ),
      );
}
