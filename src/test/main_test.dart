
// test/main_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_text_toggle_app/main.dart';

// Mock Cubit for testing
class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('MyApp', () {
		testWidgets('should display HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		blocTest<TextCubit, TextState>(
			'emits correct states when toggleText is called',
			build: () => textCubit,
			act: (cubit) {
				when(() => cubit.toggleText()).thenAnswer((_) {
					cubit.emit(TextState('Dog', Icons.person));
				});
				cubit.toggleText();
			},
			expect: () => [TextState('Dog', Icons.person)],
		);
	});
}
