import 'package:bloc/bloc.dart';
import 'package:firebase_login_bloc/src/app.dart';
import 'package:firebase_login_bloc/src/blocs/authentication_bloc/bloc.dart';
import 'package:firebase_login_bloc/src/simple_bloc_delegate.dart';
import 'package:firebase_login_bloc/src/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      builder: (context) => AuthenticationBloc(userRepository: userRepository)
        ..dispatch(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}
