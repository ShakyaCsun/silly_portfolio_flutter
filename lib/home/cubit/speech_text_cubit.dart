import 'dart:collection';

import 'package:bloc/bloc.dart';

class SpeechTextCubit extends Cubit<String> {
  SpeechTextCubit(List<String> speechTexts)
      : assert(speechTexts.isNotEmpty, 'List of Speech Texts cannot be empty'),
        _speechTexts = UnmodifiableListView(speechTexts),
        _numberOfSpeechTexts = speechTexts.length,
        super(speechTexts.first);

  final UnmodifiableListView<String> _speechTexts;
  final int _numberOfSpeechTexts;
  int _currentIndex = 0;

  void nextSpeechText() {
    final _nextIndex = (_currentIndex + 1) % _numberOfSpeechTexts;
    emit(_speechTexts[_nextIndex]);
    _currentIndex = _nextIndex;
  }
}
