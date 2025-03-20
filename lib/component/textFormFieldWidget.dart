import 'package:flutter/material.dart';
import 'package:nambu_admin/const/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String mainText;
  final String hintText;
  final String? Function(String?)? validator;

  const TextFormFieldWidget(
      {required this.textEditingController,
      required this.mainText,
      required this.hintText,
      required this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(mainText,
            style: TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.w600)),
        const SizedBox(height: 20.0),
        TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MAIN_YELLOW_COLOR,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
          ),
          keyboardType: TextInputType.name,
          validator: validator,
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
