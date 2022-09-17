import 'dart:convert';

import 'package:delilahbrao/widgets/customForm.dart';
import 'package:delilahbrao/template.dart';
import 'package:delilahbrao/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  late bool isLoading;
  late bool formSubmitted;
  late double screenWidth;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    buttonActive = false;
    isLoading = false;
    formSubmitted = false;
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
      desktopView: buildView(),
      mobileView: buildView(),
    );
  }

  Widget buildView() {
    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          formSubmitted ? "THANK YOU!" : "SIGN UP / COLLABORATE / JUST SAY HI",
          style: TextStyle(
            fontSize: calculateTitleFontSize(),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: formSubmitted ? 40 : 20),
        // TODO: extract into a form widget
        formSubmitted
            ? const Text(
                "We will be in touch.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            : CustomForm(
                formKey: formKey,
                width: calculateFormWidth(),
                nameTextEditingController: nameTextEditingController,
                lastNameTextEditingController: lastNameTextEditingController,
                emailTextEditingController: emailTextEditingController,
                onTapCallBack: buttonActive ? subscribeToNewsletter : () {},
                buttonColor: buttonActive ? Colors.purple[200] : Colors.grey,
                isLoading: isLoading,
              ),
      ],
    );
  }

  // onSubmit sends a request to mailchimp to add the user to the newsletter
  void subscribeToNewsletter() async {
    String apiServer = "us9";
    String listID = "1844e08d6f";
    // TODO: add to env file
    String apiKey = "f12567f579ab4f258e9064ed6f2fa982-us9";
    String credentials = base64Encode(utf8.encode("key:$apiKey"));

    String fname = nameTextEditingController.text;
    String lname = lastNameTextEditingController.text;
    String emailAddress = emailTextEditingController.text;

    setState(() {
      isLoading = true;
    });

    // subscribe user to newsletter
    await http.post(
        Uri.parse(
            "https://$apiServer.api.mailchimp.com/3.0/lists/$listID/members"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Basic $credentials',
          'Access-Control-Allow-Origin': '*',
        },
        body: jsonEncode({
          'email_address': emailAddress,
          'status': 'subscribed',
          'merge_fields': {'FNAME': fname, 'LNAME': lname}
        }));

    setState(() {
      isLoading = false;
      formSubmitted = true;
    });
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

  double calculateTitleFontSize() {
    return screenWidth < 500
        ? 18
        : screenWidth < 800
            ? 20
            : 25;
  }
}
