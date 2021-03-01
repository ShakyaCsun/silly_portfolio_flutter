import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silly_portfolio/speech_constants.dart';
import 'package:silly_portfolio/home/home.dart';

class AnimatedSpeechText extends StatelessWidget {
  const AnimatedSpeechText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechTextCubit, String>(
      builder: (context, speechText) {
        return TyperAnimatedText(
          key: ValueKey(speechText),
          text: speechText,
          textStyle: Theme.of(context).textTheme.headline4,
          duration: speechDuration,
        );
      },
    );
  }
}

class TyperAnimatedText extends StatefulWidget {
  const TyperAnimatedText({
    Key? key,
    required this.text,
    this.duration = const Duration(milliseconds: 500),
    this.textStyle,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String text;
  final Duration duration;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  @override
  _TyperAnimatedTextState createState() => _TyperAnimatedTextState();
}

class _TyperAnimatedTextState extends State<TyperAnimatedText>
    with SingleTickerProviderStateMixin {
  late final Animation<int> _increasingCharacterCountAnim;
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _increasingCharacterCountAnim = StepTween(
      begin: 0,
      end: widget.text.length,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _increasingCharacterCountAnim,
      builder: (context, child) {
        final text = widget.text.substring(
          0,
          _increasingCharacterCountAnim.value,
        );
        return Text(
          text,
          style: widget.textStyle,
          textAlign: widget.textAlign,
        );
      },
    );
  }
}
