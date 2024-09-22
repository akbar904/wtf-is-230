
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_text_toggle_app/cubits/text_cubit.dart';
import 'package:simple_text_toggle_app/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Simple Text Toggle App"),
			),
			body: Center(
				child: BlocBuilder<TextCubit, TextState>(
					builder: (context, state) {
						return GestureDetector(
							onTap: () => context.read<TextCubit>().toggleText(),
							child: TextWidget(
								text: state.text,
								icon: state.icon,
							),
						);
					},
				),
			),
		);
	}
}
