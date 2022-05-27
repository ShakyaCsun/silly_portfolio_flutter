import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silly_portfolio/home/home.dart';
import 'package:silly_portfolio/speech_constants.dart';
import 'package:silly_portfolio/widgets/widgets.dart';

class SillyFace extends StatelessWidget {
  const SillyFace({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxShortestSide = constraints.maxHeight > constraints.maxWidth
            ? constraints.maxWidth
            : constraints.maxHeight;
        final imageWidth = maxShortestSide / 2;
        return Column(
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'images/top.png',
                  width: imageWidth,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: DraggableCard(
                onDragEnd: context.read<SpeechTextCubit>().nextSpeechText,
                duration: speechDuration,
                child: Image.asset(
                  'images/bottom.png',
                  width: imageWidth,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
