import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silly_portfolio/home/home.dart';
import 'package:silly_portfolio/speech_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpeechTextCubit(speechTexts),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Expanded(
            child: SillyFace(),
          ),
          Expanded(
            child: Center(
              child: AnimatedSpeechText(),
            ),
          ),
        ],
      ),
    );
  }
}
