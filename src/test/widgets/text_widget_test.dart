
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_text_toggle_app/widgets/text_widget.dart';
import 'package:simple_text_toggle_app/cubits/text_cubit.dart';

class MockTextCubit extends Mock implements TextCubit {}

void main() {
	group('TextWidget', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('displays initial text and icon', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState('Cat', Icons.access_time));

			await tester.pumpWidget(
				BlocProvider<TextCubit>.value(
					value: textCubit,
					child: MaterialApp(
						home: Scaffold(
							body: TextWidget(),
						),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays updated text and icon on tap', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState('Cat', Icons.access_time));

			await tester.pumpWidget(
				BlocProvider<TextCubit>.value(
					value: textCubit,
					child: MaterialApp(
						home: Scaffold(
							body: TextWidget(),
						),
					),
				),
			);

			final textFinder = find.text('Cat');
			expect(textFinder, findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);

			when(() => textCubit.state).thenReturn(TextState('Dog', Icons.person));
			when(() => textCubit.toggleText()).thenAnswer((_) => textCubit.emit(TextState('Dog', Icons.person)));

			await tester.tap(textFinder);
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
