
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'text_state.dart';

class TextCubit extends Cubit<TextState> {
	TextCubit() : super(TextState('Cat', Icons.access_time));

	void toggleText() {
		if (state.text == 'Cat') {
			emit(TextState('Bird', Icons.flight));
		} else {
			emit(TextState('Cat', Icons.access_time));
		}
	}
}
