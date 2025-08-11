import 'package:fitness2/common/colo_extension.dart';
import 'package:fitness2/common_widget/tab_button.dart';
import 'package:fitness2/view/home/blank_view.dart';
import 'package:fitness2/main_tab/select_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness2/view/home/home_view.dart';
import 'package:fitness2/view/photo_progress/photo_progress_view.dart';

import 'package:fitness2/view/profile/profile_view.dart';
import 'package:fitness2/view/workout_tracker/workout_tracker_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: PageStorage(bucket: pageBucket, child: currentTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.primaryG),
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 2),
              ],
            ),
            child: Icon(Icons.search, color: TColor.white, size: 35),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: TColor.white, // 🔹 Màu nền đồng nhất
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 2, // 🔹 Thay boxShadow bằng elevation cho gọn
        child: SizedBox(
          height: 50.0, // 🔹 Có thể giảm chiều cao nếu muốn
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                icon: "assets/img/home_tab.png",
                selectIcon: "assets/img/home_tab_select.png",
                isActive: selectTab == 0,
                onTap: () {
                  selectTab = 0;
                  currentTab = const HomeView();
                  setState(() {});
                },
              ),
              TabButton(
                icon: "assets/img/activity_tab.png",
                selectIcon: "assets/img/activity_tab_select.png",
                isActive: selectTab == 1,
                onTap: () {
                  selectTab = 1;
                  currentTab = const SelectView();
                  setState(() {});
                },
              ),
              const SizedBox(width: 40),
              TabButton(
                icon: "assets/img/camera_tab.png",
                selectIcon: "assets/img/camera_tab_select.png",
                isActive: selectTab == 2,
                onTap: () {
                  selectTab = 2;
                  currentTab = const PhotoProgressView();
                  setState(() {});
                },
              ),
              TabButton(
                icon: "assets/img/profile_tab.png",
                selectIcon: "assets/img/profile_tab_select.png",
                isActive: selectTab == 3,
                onTap: () {
                  selectTab = 3;
                  currentTab = const ProfileView();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
