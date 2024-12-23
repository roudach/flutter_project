
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/app_view.dart';
import 'package:flutter_project/blocs/authentification_bloc/authentification_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatelessWidget{
  final UserRepository userRepository;
  const MyApp(this.userRepository,{super.key});
  @override
  Widget build(BuildContext context){
    return RepositoryProvider<AuthentificationBloc>(
      create: (context) => AuthentificationBloc(
        userRepository:userRepository
      ),
      child: const MyAppView(),
      );
  }
}