
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_text_toggle_app/models/text_model.dart';

void main() {
	group('TextModel', () {
		test('TextModel should correctly store text and icon', () {
			final text = 'Cat';
			final icon = Icons.access_time;

			final model = TextModel(text, icon);

			expect(model.text, equals(text));
			expect(model.icon, equals(icon));
		});

		test('TextModel should support equality comparison', () {
			final text = 'Cat';
			final icon = Icons.access_time;

			final model1 = TextModel(text, icon);
			final model2 = TextModel(text, icon);

			expect(model1, equals(model2));
		});
	});
}
