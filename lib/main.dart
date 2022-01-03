import 'package:among_us_jump/blocs/character/character_cubit.dart';
import 'package:among_us_jump/blocs/game/game_cubit.dart';
import 'package:among_us_jump/routes/app_router.gr.dart';
import 'package:among_us_jump/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GameCubit()
        ),
        BlocProvider(create: (context) => CharacterCubit(
            duration: context.read<GameCubit>().state.duration
        ))
      ],
      child: MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        theme: appTheme,
      ),
    );
  }
}