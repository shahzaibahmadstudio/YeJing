import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yejing/cubits/connectivity/connectivity_cubit.dart';
import 'package:yejing/cubits/connectivity/connectivity_state.dart';
import 'package:yejing/utils/constants.dart';
import 'package:yejing/services/storage/hive_service.dart';
import 'package:yejing/cubits/locale/locale_cubit.dart';
import 'package:yejing/cubits/locale/locale_state.dart';
import 'package:yejing/l10n/app_localizations.dart';
import 'package:yejing/presentation/interfaces/main_interface.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'firebase_options.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await HiveService.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    providerAndroid: kDebugMode
        ? AndroidDebugProvider(
            debugToken: '6bd6079c-5cce-40d3-bec5-8fcac2f9f14e',
          )
        : AndroidPlayIntegrityProvider(),
  );
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );

  runApp(const YeJingApp());
}

class YeJingApp extends StatefulWidget {
  const YeJingApp({super.key});

  @override
  State<YeJingApp> createState() => _YeJingAppState();
}

class _YeJingAppState extends State<YeJingApp> {
  @override
  void initState() {
    super.initState();
    splashInitialization();
  }

  void splashInitialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData baseTheme = ThemeData.light();
    final TextTheme baseTextTheme = baseTheme.textTheme.copyWith(
      labelMedium: YeJingTextStyles.n12.copyWith(
        color: Colors.grey,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: YeJingTextStyles.n16.copyWith(
        color: YeJingColors.pureBlack,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: YeJingTextStyles.n14.copyWith(
        color: YeJingColors.pureBlack,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: YeJingTextStyles.n24.copyWith(
        color: YeJingColors.pureBlack,
        fontWeight: FontWeight.w900,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppLocaleCubit()),
        BlocProvider(create: (_) => ConnectivityCubit()),
      ],
      child: BlocBuilder<AppLocaleCubit, AppLocaleState>(
        builder: (context, localeState) {
          return MaterialApp(
            title: 'YeJing',
            scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            locale: localeState.language.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              ...AppLocalizations.localizationsDelegates,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              textTheme: baseTextTheme,
              colorScheme: ColorScheme.light(
                primary: YeJingColors.primaryRed,
                onPrimary: YeJingColors.pureWhite,
                surface: YeJingColors.pureWhite,
                onSurface: YeJingColors.pureBlack,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: YeJingColors.primaryRed,
                ),
              ),
              datePickerTheme: DatePickerThemeData(
                rangeSelectionBackgroundColor: YeJingColors.primaryRed
                    .withAlpha(64),
                headerBackgroundColor: YeJingColors.pureWhite,
                headerForegroundColor: YeJingColors.pureBlack,

                headerHeadlineStyle: YeJingTextStyles.n24.copyWith(
                  fontWeight: FontWeight.bold,
                  color: YeJingColors.pureBlack,
                ),
                headerHelpStyle: YeJingTextStyles.n12.copyWith(
                  fontWeight: FontWeight.w700,
                  color: YeJingColors.pureBlackWithAlpha36,
                ),
                weekdayStyle: YeJingTextStyles.n14.copyWith(
                  fontWeight: FontWeight.w700,
                  color: YeJingColors.pureBlack,
                ),
                dayStyle: YeJingTextStyles.n16.copyWith(
                  fontWeight: FontWeight.w700,
                  color: YeJingColors.pureBlack,
                ),
              ),
            ),
            home: Builder(
              builder: (innerContext) {
                return BlocListener<ConnectivityCubit, ConnectivityState>(
                  listener: (context, connectivityState) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (!innerContext.mounted) return;
                      if (connectivityState is DisconnectedState) {
                        scaffoldMessengerKey.currentState?.showSnackBar(
                          SnackBar(
                            content: Text(
                              AppLocalizations.of(innerContext)
                                  .connectivityNoInternet,
                              textAlign: TextAlign.center,
                              style: YeJingTextStyles.n14.copyWith(
                                fontSize: innerContext.sp(14),
                                fontWeight: FontWeight.w700,
                                color: YeJingColors.pureWhite,
                              ),
                            ),
                            backgroundColor: YeJingColors.primaryRed,
                            duration: const Duration(days: 365),
                            behavior: SnackBarBehavior.fixed,
                          ),
                        );
                      } else if (connectivityState is ConnectedState) {
                        scaffoldMessengerKey.currentState
                            ?.hideCurrentSnackBar();
                      }
                    });
                  },
                  child: const MainInterface(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
