import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interceptors/bloc/auth/auth_bloc.dart';
import 'package:interceptors/bloc/email/email_bloc.dart';
import 'package:interceptors/bloc/home/home_bloc.dart';
import 'package:interceptors/bloc/profile/profile_bloc.dart';
import 'package:interceptors/data/repository/auth_repository.dart';
import 'package:interceptors/data/repository/email_repository.dart';
import 'package:interceptors/data/repository/home_repository.dart';
import 'package:interceptors/data/repository/profile_repository.dart';
import 'package:interceptors/data/sharedprefs/shared_preference_helper.dart';
import 'package:interceptors/presentation/auth/login/login_page.dart';
import 'package:interceptors/presentation/home/home_page.dart';
import 'package:interceptors/services/locator.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final String? token;
  final locator = getIt.get<SharedPreferenceHelper>();

  @override
  void initState() {
    super.initState();
    token = locator.getUserToken();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepository(),
        ),
        RepositoryProvider<EmailRepository>(
          create: (context) => EmailRepository(),
        ),
        RepositoryProvider<ProfileRepository>(
          create: (context) => ProfileRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              homeRepository: RepositoryProvider.of<HomeRepository>(context),
            )..add(LoadUserEvent()),
          ),
          BlocProvider<EmailBloc>(
            create: (context) => EmailBloc(
              emailRepository: RepositoryProvider.of<EmailRepository>(context),
            ),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
              profileRepository:
                  RepositoryProvider.of<ProfileRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          home: token != null ? const HomePage() : const LogInPage(),
        ),
      ),
    );
  }
}
