
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_text_toggle_app/cubits/text_cubit.dart';
import 'package:simple_text_toggle_app/cubits/text_state.dart';
import 'package:flutter/material.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = TextCubit();
		});

		tearDown(() {
			textCubit.close();
		});

		test('initial state is TextState with text "Cat" and clock icon', () {
			expect(textCubit.state, TextState('Cat', Icons.access_time));
		});

		blocTest<TextCubit, TextState>(
			'emits TextState with text "Dog" and person icon when toggleText is called from initial state',
			build: () => textCubit,
			act: (cubit) => cubit.toggleText(),
			expect: () => [TextState('Dog', Icons.person)],
		);

		blocTest<TextCubit, TextState>(
			'emits TextState with text "Cat" and clock icon when toggleText is called after changing to "Dog"',
			build: () => textCubit,
			act: (cubit) {
				cubit..toggleText()..toggleText();
			},
			expect: () => [TextState('Dog', Icons.person), TextState('Cat', Icons.access_time)],
		);

		blocTest<TextCubit, TextState>(
			'emits correct states in sequence when toggleText is called multiple times',
			build: () => textCubit,
			act: (cubit) {
				cubit..toggleText()..toggleText()..toggleText();
			},
			expect: () => [
				TextState('Dog', Icons.person),
				TextState('Cat', Icons.access_time),
				TextState('Dog', Icons.person),
			],
		);
	});
}
