import 'package:flutter/material.dart';
import 'package:login_anim/pages/login_page.dart';

import '../components/my_opacity_animation.dart';
import '../components/my_transition_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyOpacityAnimation(
                    duration: 400,
                    child: const Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyOpacityAnimation(
                    duration: 600,
                    child: const Text(
                      "Welcome to IO Team team. Please complete your registration .",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              signup_form(),
              signup_button(() {}),
              MyOpacityAnimation(
                duration: 2200,
                child: Row(
                  children: const [
                    Flexible(flex: 1, child: Divider()),
                    Flexible(
                        flex: 2,
                        child: Text(" Signup with Google or Facebook")),
                    Flexible(flex: 1, child: Divider()),
                  ],
                ),
              ),
              more_signup(),
              MyOpacityAnimation(
                duration: 2400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Do you have an account? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget signup_form() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          my_text_form("Full name", Icons.person, fullname_controller,
              TextInputType.name, false, 800),
          my_text_form("Email", Icons.email, email_controller,
              TextInputType.emailAddress, false, 1000),
          my_text_form("Phone number", Icons.phone, phone_controller,
              TextInputType.phone, false, 1200),
          my_text_form("Address", Icons.location_city, address_controller,
              TextInputType.name, false, 1400),
          my_text_form("Password", Icons.password, password_controller,
              TextInputType.number, true, 1600),
        ],
      ),
    );
  }

  TextEditingController email_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController fullname_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();

  Widget my_text_form(
    String hint,
    IconData icon,
    TextEditingController controller,
    TextInputType keyboard,
    bool obscureText,
    int anim_duration,
  ) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: MyOpacityAnimation(
        duration: anim_duration,
        child: Container(
          height: myHeight * 0.08,
          width: myWidth,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: TextFormField(
              controller: controller,
              keyboardType: keyboard,
              obscureText: obscureText,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: hint,
                labelText: hint,
                hintStyle: const TextStyle(fontSize: 12.0),
                prefixIcon: Icon(icon),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget signup_button(VoidCallback ontap) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ontap,
      child: MyOpacityAnimation(
        duration: 1800,
        child: Container(
          height: myHeight * 0.07,
          width: myWidth,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Center(
            child: Text(
              "Sign up",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget more_signup() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyTransitionWidget(
            axis: Axis.horizontal,
            duration: 1800,
            offset: -80,
            child: more_signup_object("Google", "assets/google.png", () {})),
        MyTransitionWidget(
            axis: Axis.horizontal,
            duration: 1800,
            offset: 80,
            child:
                more_signup_object("Facebook", "assets/facebook.png", () {})),
      ],
    );
  }

  Widget more_signup_object(String title, String image, VoidCallback ontap) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: myHeight * 0.08,
        width: myWidth * 0.43,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 1.0,
              color: Colors.grey.withOpacity(0.5),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 20.0),
            SizedBox(width: myWidth * 0.03),
            Text(title),
          ],
        ),
      ),
    );
  }
}
