
import 'package:flutter/material.dart';

class TextModel {
	final String text;
	final IconData icon;

	TextModel(this.text, this.icon);

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;

		return other is TextModel &&
			other.text == text &&
			other.icon == icon;
	}

	@override
	int get hashCode => text.hashCode ^ icon.hashCode;
}
