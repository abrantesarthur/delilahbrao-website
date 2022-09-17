import 'package:delilahbrao/widgets/customButton.dart';
import 'package:delilahbrao/widgets/customInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    Key? key,
    required this.formKey,
    required this.width,
    required this.nameTextEditingController,
    required this.lastNameTextEditingController,
    required this.emailTextEditingController,
    required this.onTapCallBack,
    required this.isLoading,
    this.buttonColor,
  }) : super(key: key);

  final double width;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailTextEditingController;
  final TextEditingController nameTextEditingController;
  final TextEditingController lastNameTextEditingController;
  final VoidCallback onTapCallBack;
  final Color? buttonColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInput(
                  title: "Name *",
                  controller: nameTextEditingController,
                  width: width / 2 - 10,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\\s]")),
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                ),
                CustomInput(
                  title: "Last Name *",
                  controller: lastNameTextEditingController,
                  width: width / 2 - 10,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z-\\s]")),
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomInput(
              title: "Email *",
              inputFormatters: [
                LengthLimitingTextInputFormatter(60),
                FilteringTextInputFormatter.singleLineFormatter,
              ],
              controller: emailTextEditingController,
              hintText: "example@domain.com",
            ),
            const SizedBox(height: 30),
            CustomButton(
              textData: "Submit",
              width: width / 2,
              onTapCallBack: onTapCallBack,
              buttonColor: buttonColor,
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
