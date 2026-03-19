import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:{{project_name.snakeCase()}}/app/app.dart';
import 'package:{{project_name.snakeCase()}}/app/app_bloc_observer.dart';
import 'package:{{project_name.snakeCase()}}/core/config/app_config.dart';
import 'package:{{project_name.snakeCase()}}/core/injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/repositories/crashlytics_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> bootstrap({required String environment}) async => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        await configureDependencies(environment);
        await Firebase.initializeApp(
          options: getIt<IAppConfig>().getFirebaseOptions(),
        );

        final crashlyticsRepository = getIt.get<CrashlyticsRepository>();

        FlutterError.onError = (details) {
          final exception = details.exception;
          final stackTrace = details.stack;
          crashlyticsRepository.trackFatal(
            exception: exception,
            stackTrace: stackTrace,
          );
        };

        PlatformDispatcher.instance.onError = (exception, stackTrace) {
          crashlyticsRepository.trackFatal(
            exception: exception,
            stackTrace: stackTrace,
          );
          return true;
        };

        Bloc.observer = AppBlocObserver(
          crashlyticsRepository: crashlyticsRepository,
          appConfig: getIt<IAppConfig>(),
        );
        runApp(const App());
      },
      (error, stackTrace) {
        log(error.toString());
        getIt
            .get<CrashlyticsRepository>()
            .trackFatal(exception: error, stackTrace: stackTrace);
      },
    );
