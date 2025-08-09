import 'package:flutter/material.dart';
import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/setting_row.dart';
import '../../common_widget/title_subtitle_cell.dart';

/// Widget hiển thị màn hình Profile/Hồ sơ người dùng
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // ==================== STATE VARIABLES ====================
  /// Trạng thái bật/tắt thông báo pop-up
  bool positive = false;

  /// Danh sách các mục trong phần Account
  List accountArr = [
    {
      "image": "assets/img/p_personal.png",
      "name": "Personal Data", // Dữ liệu cá nhân
      "tag": "1",
    },
    {
      "image": "assets/img/p_achi.png",
      "name": "Achievement", // Thành tích
      "tag": "2",
    },
    {
      "image": "assets/img/p_activity.png",
      "name": "Activity History", // Lịch sử hoạt động
      "tag": "3",
    },
    {
      "image": "assets/img/p_workout.png",
      "name": "Workout Progress", // Tiến độ tập luyện
      "tag": "4",
    },
  ];

  /// Danh sách các mục trong phần Other
  List otherArr = [
    {
      "image": "assets/img/p_contact.png",
      "name": "Contact Us", // Liên hệ
      "tag": "5",
    },
    {
      "image": "assets/img/p_privacy.png",
      "name": "Privacy Policy", // Chính sách bảo mật
      "tag": "6",
    },
    {
      "image": "assets/img/p_setting.png",
      "name": "Setting", // Cài đặt
      "tag": "7",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==================== APP BAR ====================
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0, // Không có bóng đổ
        leadingWidth: 0, // Không có nút back
        title: Text(
          "Profile",
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        // Nút More
        actions: [
          InkWell(
            onTap: () {
              // TODO: Xử lý menu more
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),

      // ==================== BODY ====================
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ==================== USER INFO SECTION ====================
              Row(
                children: [
                  // Avatar người dùng
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/img/u2.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),

                  // Thông tin người dùng
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Stefani Wong",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Lose a Fat Program", // Chương trình giảm mỡ
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      ],
                    ),
                  ),

                  // Nút Edit
                  SizedBox(
                    width: 70,
                    height: 25,
                    child: RoundButton(
                      title: "Edit",
                      type: RoundButtonType.bgGradient,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      onPressed: () {
                        // TODO: Chuyển đến màn hình chỉnh sửa profile
                        // Navigator.push(context, MaterialPageRoute(...));
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // ==================== STATS SECTION ====================
              // Hiển thị chiều cao, cân nặng, tuổi
              const Row(
                children: [
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "180cm",
                      subtitle: "Height", // Chiều cao
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "65kg",
                      subtitle: "Weight", // Cân nặng
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "22yo",
                      subtitle: "Age", // Tuổi
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // ==================== ACCOUNT SECTION ====================
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Danh sách các mục Account
                    ListView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Không scroll riêng
                      shrinkWrap: true, // Chỉ chiếm không gian cần thiết
                      itemCount: accountArr.length,
                      itemBuilder: (context, index) {
                        var iObj = accountArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: iObj["image"].toString(),
                          title: iObj["name"].toString(),
                          onPressed: () {
                            // TODO: Xử lý khi nhấn vào từng mục
                            // Có thể dùng iObj["tag"] để phân biệt
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ==================== NOTIFICATION SECTION ====================
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notification",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Custom Toggle switch cho Pop-up Notification
                    SizedBox(
                      height: 30,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Icon thông báo
                          Image.asset(
                            "assets/img/p_notification.png",
                            height: 15,
                            width: 15,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 15),

                          // Text "Pop-up Notification"
                          Expanded(
                            child: Text(
                              "Pop-up Notification",
                              style: TextStyle(
                                color: TColor.black,
                                fontSize: 12,
                              ),
                            ),
                          ),

                          // Custom Toggle Switch (thay thế AnimatedToggleSwitch)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                positive = !positive;
                              });
                            },
                            child: Container(
                              width: 50, // Chiều rộng của toggle
                              height: 30, // Chiều cao của toggle
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: TColor.secondaryG,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  AnimatedAlign(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear,
                                    alignment: positive
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Container(
                                      width: 26.0, // Kích thước của nút tròn
                                      height: 26.0,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: TColor.white,
                                        borderRadius: BorderRadius.circular(
                                          50.0,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black38,
                                            spreadRadius: 0.05,
                                            blurRadius: 1.1,
                                            offset: Offset(0.0, 0.8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ==================== OTHER SECTION ====================
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Other",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Danh sách các mục Other
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: otherArr.length,
                      itemBuilder: (context, index) {
                        var iObj = otherArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: iObj["image"].toString(),
                          title: iObj["name"].toString(),
                          onPressed: () {
                            // TODO: Xử lý khi nhấn vào từng mục
                            // Contact Us, Privacy Policy, Setting
                          },
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
