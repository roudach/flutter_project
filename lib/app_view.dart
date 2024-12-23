import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/authentification_bloc/authentification_bloc.dart';
import 'package:flutter_project/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_project/screens/auth/views/welcome_screen.dart';
import 'package:flutter_project/screens/home/views/home_screen.dart';

void main() {
  runApp(const MyAppView());
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Services de Santé',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
      home: BlocBuilder<AuthentificationBloc, AuthentificationState>(
        builder: (context, state) {
          if (state.status == AuthentificationStatus.authentificated) {
            return BlocProvider(
              create: (context) => SignInBloc(
                userRepository: context.read<AuthentificationBloc>().userRepository
              ),
              child: const HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
