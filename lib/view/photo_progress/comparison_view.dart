import 'package:fitness2/common_widget/icon_title_next_row.dart'; // Widget dòng có icon, tiêu đề, mũi tên next
import 'package:fitness2/common_widget/round_button.dart'; // Nút bấm tùy chỉnh dạng tròn
import 'package:fitness2/view/photo_progress/result_view.dart'; // Màn hình kết quả so sánh
import 'package:flutter/material.dart';

import '../../common/colo_extension.dart'; // Bộ màu sắc tùy chỉnh

class ComparisonView extends StatefulWidget {
  const ComparisonView({super.key});

  @override
  State<ComparisonView> createState() => _ComparisonViewState();
}

class _ComparisonViewState extends State<ComparisonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white, // Nền trắng cho appbar
        centerTitle: true, // Tiêu đề căn giữa
        elevation: 0, // Không đổ bóng
        leading: InkWell(
          onTap: () {
            Navigator.pop(context); // Nút quay lại, pop màn hình hiện tại
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TColor.lightGray, // Màu nền sáng cho nút
              borderRadius: BorderRadius.circular(10),
            ), // Bo góc
            child: Image.asset(
              "assets/img/black_btn.png", // Icon nút quay lại
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Comparison", // Tiêu đề màn hình
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {}, // Nút "more" chưa xử lý
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
                "assets/img/more_btn.png", // Icon nút more
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: TColor.white, // Nền trắng cho toàn màn hình
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ), // Padding xung quanh nội dung
        child: Column(
          children: [
            IconTitleNextRow(
              icon: "assets/img/date.png", // Icon hình lịch
              title: "Select Month 1", // Tiêu đề dòng
              time: "May", // Nội dung thời gian
              onPressed: () {}, // Xử lý khi nhấn dòng này (chưa có)
              color: TColor.lightGray,
            ), // Màu nền dòng
            const SizedBox(
              height: 15, // Khoảng cách giữa 2 dòng
            ),
            IconTitleNextRow(
              icon: "assets/img/date.png",
              title: "Select Month 2",
              time: "select Month", // Chưa chọn tháng thứ 2
              onPressed: () {}, // Chưa xử lý
              color: TColor.lightGray,
            ),
            const Spacer(), // Đẩy nút xuống cuối màn hình
            RoundButton(
              title: "Compare", // Nút bấm so sánh
              onPressed: () {
                // Khi nhấn sẽ chuyển sang màn hình kết quả so sánh với 2 ngày cố định
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultView(
                      date1: DateTime(2023, 5, 1),
                      date2: DateTime(2023, 6, 1),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15, // Khoảng cách dưới nút
            ),
          ],
        ),
      ),
    );
  }
}
