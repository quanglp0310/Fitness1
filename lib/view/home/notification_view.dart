import 'package:flutter/material.dart';
import '../../common/colo_extension.dart';
import '../../common_widget/notification_row.dart';

/// Widget hiển thị danh sách thông báo
class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  // ==================== DATA ====================
  /// Danh sách dữ liệu thông báo
  /// Mỗi item chứa: image (hình ảnh), title (tiêu đề), time (thời gian)
  List notificationArr = [
    {
      "image": "assets/img/Workout1.png",
      "title": "Hey, it's time for lunch", // Thông báo ăn trưa
      "time": "About 1 minutes ago", // 1 phút trước
    },
    {
      "image": "assets/img/Workout2.png",
      "title": "Don't miss your lowerbody workout", // Nhắc nhở tập luyện
      "time": "About 3 hours ago", // 3 giờ trước
    },
    {
      "image": "assets/img/Workout3.png",
      "title": "Hey, let's add some meals for your b", // Thêm bữa ăn
      "time": "About 3 hours ago",
    },
    {
      "image": "assets/img/Workout1.png",
      "title": "Congratulations, You have finished A..", // Chúc mừng hoàn thành
      "time": "29 May", // Ngày cụ thể
    },
    {
      "image": "assets/img/Workout2.png",
      "title": "Hey, it's time for lunch",
      "time": "8 April",
    },
    {
      "image": "assets/img/Workout3.png",
      "title": "Ups, You have missed your Lowerbo...", // Bỏ lỡ bài tập
      "time": "8 April",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white, // Nền trắng
        centerTitle: true, // Căn giữa tiêu đề
        elevation: 0, // Không có bóng đổ
        // Nút Back (Leading)
        leading: InkWell(
          onTap: () {
            Navigator.pop(context); // Quay lại màn hình trước
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TColor.lightGray, // Nền xám nhạt
              borderRadius: BorderRadius.circular(10), // Bo góc
            ),
            child: Image.asset(
              "assets/img/black_btn.png", // Icon mũi tên quay lại
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),

        // Tiêu đề
        title: Text(
          "Notification",
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700, // Font đậm
          ),
        ),

        // Nút More (Actions)
        actions: [
          InkWell(
            onTap: () {
              // TODO: Xử lý khi nhấn nút more (menu, settings, etc.)
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
                "assets/img/more_btn.png", // Icon 3 chấm hoặc menu
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),

      // ==================== BODY ====================
      backgroundColor: TColor.white,
      body: ListView.separated(
        // Padding cho toàn bộ danh sách
        padding: const EdgeInsets.symmetric(
          vertical: 15, // Padding trên/dưới
          horizontal: 25, // Padding trái/phải
        ),

        // Hàm tạo từng item trong danh sách
        itemBuilder: (context, index) {
          // Lấy dữ liệu thông báo tại vị trí index
          var nObj = notificationArr[index] as Map? ?? {};

          // Trả về widget NotificationRow với dữ liệu
          return NotificationRow(nObj: nObj);
        },

        // Hàm tạo separator (đường phân cách) giữa các item
        separatorBuilder: (context, index) {
          return Divider(
            color: TColor.gray.withOpacity(0.5), // Màu xám trong suốt 50%
            height: 1, // Chiều cao 1px
          );
        },

        // Tổng số item trong danh sách
        itemCount: notificationArr.length,
      ),
    );
  }
}
