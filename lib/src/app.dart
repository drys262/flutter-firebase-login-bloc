import 'package:firebase_login_bloc/src/blocs/authentication_bloc/bloc.dart';
import 'package:firebase_login_bloc/src/screens/home_screen.dart';
import 'package:firebase_login_bloc/src/screens/splash_screen.dart';
import 'package:firebase_login_bloc/src/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (BuildContext context, AuthenticationState state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Authenticated) {
            return HomeScreen(
              name: state.displayName,
            );
          }
          return Container();
        },
      ),
    );
  }
}
