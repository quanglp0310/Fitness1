import 'package:fitness2/common/colo_extension.dart';
import 'package:fitness2/common_widget/round_button.dart';
import 'package:fitness2/common_widget/round_textfield.dart';
import 'package:fitness2/view/login/what_your_goal_view.dart';
import 'package:flutter/material.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  TextEditingController txtDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: media.width * 0.07),
              Image.asset(
                "assets/img/complete_profile.png",
                width: media.width,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: media.width * 0.05),
              Text(
                "Let’s complete your profile",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "It will help us to know more about you!",
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
              SizedBox(height: media.width * 0.05),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: TColor.lightGray,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Image.asset(
                                "assets/img/gender.png",
                                width: 18,
                                height: 18,
                                fit: BoxFit.contain,
                                color: TColor.gray,
                              ),
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                items: ["Male", "Female"]
                                    .map(
                                      (name) => DropdownMenuItem(
                                        value: name,
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                            color: TColor.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {},
                                isExpanded: true,
                                hint: Text(
                                  "Choose Gender",
                                  style: TextStyle(
                                    color: TColor.gray,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                    SizedBox(height: media.width * 0.04),
                    RoundTextfield(
                      hintText: 'Date of Birth',
                      icon: 'assets/img/date.png',
                    ),
                    SizedBox(height: media.width * 0.04),
                    Row(
                      children: [
                        Expanded(
                          child: RoundTextfield(
                            controller: txtDate,
                            hintText: 'Your Weight',
                            icon: 'assets/img/weight.png',
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 45,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: TColor.secondaryG),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "KG",
                            style: TextStyle(color: TColor.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: media.width * 0.04),
                    Row(
                      children: [
                        Expanded(
                          child: RoundTextfield(
                            controller: txtDate,
                            hintText: 'Your Height',
                            icon: 'assets/img/hight.png',
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 45,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: TColor.secondaryG),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "CM",
                            style: TextStyle(color: TColor.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: media.width * 0.04),
                    RoundButton(
                      title: "Next >",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WhatYourGoalView(),
                          ),
                        );
                      },
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
