
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_text_toggle_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_text_toggle_app/cubits/text_cubit.dart';
import 'package:simple_text_toggle_app/widgets/text_widget.dart';

// Mock classes
class MockTextCubit extends Mock implements TextCubit {}
class MockTextState extends Mock implements TextState {}

void main() {
	group('HomeScreen', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
			when(() => textCubit.state).thenReturn(TextState('Cat', Icons.access_time));
		});

		testWidgets('displays initial text and icon correctly', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => textCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('toggles text and icon on tap', (WidgetTester tester) async {
			whenListen(
				textCubit,
				Stream.fromIterable([TextState('Dog', Icons.person)]),
				initialState: TextState('Cat', Icons.access_time),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => textCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byType(TextWidget));
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
