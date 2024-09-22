
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.walturn/lib/cubits/text_state.dart';

void main() {
	group('TextState', () {
		test('should initialize with given text and icon', () {
			final text = 'Cat';
			final icon = Icons.access_time;

			final textState = TextState(text, icon);

			expect(textState.text, equals(text));
			expect(textState.icon, equals(icon));
		});
	});
}
