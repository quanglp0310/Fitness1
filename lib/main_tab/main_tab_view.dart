import 'package:flutter/material.dart';
import 'package:fitness2/common/colo_extension.dart';
import 'package:fitness2/common_widget/tab_button.dart';
import 'package:fitness2/view/home/home_view.dart';
import 'package:fitness2/view/home/notification_view.dart';
import 'package:fitness2/view/home/activity_tracker_view.dart';
import 'package:fitness2/view/profile/profile_view.dart';

/// Màn hình placeholder cho Activity Tracker
class ActivityView extends StatelessWidget {
  const ActivityView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: const Center(child: Text("Activity Tracker Screen")),
    );
  }
}

/// Màn hình chính với các tab và nút giữa
class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0; // Tab hiện tại đang chọn
  final PageStorageBucket pageBucket =
      PageStorageBucket(); // Lưu trạng thái trang
  Widget currentTab = const HomeView(); // Màn hình hiện tại

  /// Hàm đổi tab khi người dùng nhấn vào icon
  void changeTab(int index, Widget tab) {
    setState(() {
      selectTab = index;
      currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,

      // Hiển thị nội dung của tab hiện tại
      body: PageStorage(bucket: pageBucket, child: currentTab),

      // Nút tròn Floating Action Button ở giữa thanh tab
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          // Nhấn nút giữa -> mở CameraView
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

      // Thanh tab dưới (Bottom Navigation)
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            color: TColor.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, -2), // Đổ bóng lên trên
              ),
            ],
          ),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Tab Home
              TabButton(
                icon: "assets/img/home_tab.png",
                selectIcon: "assets/img/home_tab_select.png",
                isActive: selectTab == 0,
                onTap: () => changeTab(0, const HomeView()),
              ),
              // Tab Activity (thực tế gọi NotificationView)
              TabButton(
                icon: "assets/img/activity_tab.png",
                selectIcon: "assets/img/activity_tab_select.png",
                isActive: selectTab == 1,
                onTap: () => changeTab(1, const NotificationView()),
              ),
              const SizedBox(width: 40), // Chừa chỗ cho nút FAB ở giữa
              // Tab Camera (thực tế gọi ActivityTrackerView)
              TabButton(
                icon: "assets/img/camera_tab.png",
                selectIcon: "assets/img/camera_tab_select.png",
                isActive: selectTab == 2,
                onTap: () => changeTab(2, const ActivityTrackerView()),
              ),
              // Tab Profile
              TabButton(
                icon: "assets/img/profile_tab.png",
                selectIcon: "assets/img/profile_tab_select.png",
                isActive: selectTab == 3,
                onTap: () => changeTab(3, const ProfileView()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
