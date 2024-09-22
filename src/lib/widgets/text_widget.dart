
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_text_toggle_app/cubits/text_cubit.dart';
import 'package:simple_text_toggle_app/cubits/text_state.dart';

class TextWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final textCubit = context.read<TextCubit>();

		return BlocBuilder<TextCubit, TextState>(
			builder: (context, state) {
				return GestureDetector(
					onTap: textCubit.toggleText,
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(state.text),
							SizedBox(width: 8),
							Icon(state.icon),
						],
					),
				);
			},
		);
	}
}
