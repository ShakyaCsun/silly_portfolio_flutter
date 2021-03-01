import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silly_portfolio/home/home.dart';
import 'package:silly_portfolio/speech_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpeechTextCubit(speechTexts),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SillyFace(),
          ),
          const Expanded(
            child: Center(
              child: AnimatedSpeechText(),
            ),
          ),
        ],
      ),
    );
  }
}
