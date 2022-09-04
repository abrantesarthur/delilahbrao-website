import 'package:delilahbrao/widgets/customInput.dart';
import 'package:delilahbrao/template.dart';
import 'package:delilahbrao/utils.dart';
import 'package:delilahbrao/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsletterPage extends StatefulWidget {
  const NewsletterPage({Key? key}) : super(key: key);
  static String routeName = "/newsletter";

  @override
  _NewsletterPageState createState() => _NewsletterPageState();
}

// ignore: must_be_immutable
class _NewsletterPageState extends State<NewsletterPage> {
  late TextEditingController emailTextEditingController;
  late TextEditingController nameTextEditingController;
  late TextEditingController lastNameTextEditingController;
  late bool buttonActive;
  late double screenWidth;

  @override
  void initState() {
    super.initState();
    buttonActive = false;
    emailTextEditingController = TextEditingController();
    nameTextEditingController = TextEditingController();
    lastNameTextEditingController = TextEditingController();
    emailTextEditingController.addListener(controllersListener);
    nameTextEditingController.addListener(controllersListener);
    lastNameTextEditingController.addListener(controllersListener);
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Template(
      darkBackground: true,
      desktopView: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "SIGN UP / COLLABORATE / JUST SAY HI",
            style: TextStyle(
              // TODO: make smaller for cell phone
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          // TODO: extract into a form widget
          SizedBox(
            width: calculateFormWidth(),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomInput(
                        title: "Name *",
                        controller: nameTextEditingController,
                        width: calculateFormWidth() / 2 - 10,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z\\s]")),
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                      ),
                      CustomInput(
                        title: "Last Name *",
                        controller: lastNameTextEditingController,
                        width: calculateFormWidth() / 2 - 10,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z-\\s]")),
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
                  const SizedBox(height: 20),
                  CustomInput(
                    title: "Message",
                    height: 100,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(500),
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    textData: "Submit",
                    width: calculateFormWidth() / 2,
                    onTapCallBack: buttonActive ? () {} : () {},
                    buttonColor:
                        buttonActive ? Colors.purple[200] : Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      mobileView: Column(
        children: [
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          )
        ],
      ),
    );
  }

  void controllersListener() {
    String email = emailTextEditingController.text;
    String name = nameTextEditingController.text;
    String lastName = lastNameTextEditingController.text;
    setState(() {
      buttonActive = email.isNotEmpty &&
          email.isValid() &&
          name.isNotEmpty &&
          lastName.isNotEmpty;
    });
  }

  double calculateFormWidth() {
    return screenWidth < 800 ? 400 : 500;
  }
}
