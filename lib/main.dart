import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yejing/cubits/locale/locale_cubit.dart';
import 'package:yejing/cubits/locale/locale_state.dart';
import 'package:yejing/l10n/app_localizations.dart';
import 'package:yejing/presentation/interfaces/main_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
    return BlocProvider(
      create: (_) => AppLocaleCubit(),
      child: BlocBuilder<AppLocaleCubit, AppLocaleState>(
        builder: (context, localeState) {
          return MaterialApp(
            title: 'YeJing',
            debugShowCheckedModeBanner: false,
            locale: localeState.language.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              ...AppLocalizations.localizationsDelegates,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const MainInterface(),
          );
        },
      ),
    );
  }
}
