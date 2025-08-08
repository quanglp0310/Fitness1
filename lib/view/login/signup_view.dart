import 'package:fitness2/common/colo_extension.dart';
import 'package:fitness2/common_widget/round_button.dart';
import 'package:fitness2/common_widget/round_textfield.dart';
import 'package:fitness2/view/login/complete_profile_view.dart';
import 'package:fitness2/view/login/login_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: media.width * 0.1),
              Text(
                "Hey there",
                style: TextStyle(color: TColor.gray, fontSize: 16),
              ),
              Text(
                "Create an Account",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: media.width * 0.05),
              const RoundTextfield(
                hintText: 'Fist Name',
                icon: 'assets/img/user_text.png',
              ),
              SizedBox(height: media.width * 0.04),
              const RoundTextfield(
                hintText: 'Last Name',
                icon: 'assets/img/user_text.png',
              ),
              SizedBox(height: media.width * 0.04),
              const RoundTextfield(
                hintText: 'Email ',
                icon: 'assets/img/email.png',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: media.width * 0.04),
              RoundTextfield(
                hintText: 'Password',
                icon: 'assets/img/lock.png',
                obscureText: true,
                rightIcon: TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      "assets/img/show_password.png",
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                      color: TColor.gray,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                    icon: Icon(
                      isCheck
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank,
                      color: TColor.gray,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "By continuing you accept our Privacy Policy and\nTerm of Use",
                      style: TextStyle(color: TColor.gray, fontSize: 10),
                    ),
                  ),
                ],
              ),
              SizedBox(height: media.width * 0.4),
              RoundButton(
                title: "Register",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompleteProfileView(),
                    ),
                  );
                },
              ),
              SizedBox(height: media.width * 0.04),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: TColor.gray.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    "Or",
                    style: TextStyle(color: TColor.black, fontSize: 12),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: TColor.gray.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: media.width * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TColor.white,
                        border: Border.all(
                          width: 1,
                          color: TColor.gray.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset("assets/img/google.png"),
                    ),
                  ),
                  SizedBox(width: media.width * 0.04),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TColor.white,
                        border: Border.all(
                          width: 1,
                          color: TColor.gray.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset("assets/img/facebook.png"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: media.width * 0.04),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Chiếm đúng nội dung
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: TColor.black, fontSize: 12),
                    ),
                    SizedBox(width: media.width * 0.01),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: TColor.secondaryColor2,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
