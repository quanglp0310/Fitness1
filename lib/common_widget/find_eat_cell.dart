// Import nút bo tròn tùy chỉnh
import 'package:fitness2/common_widget/round_button.dart';
// Import thư viện Flutter cơ bản
import 'package:flutter/material.dart';

// Import màu sắc tuỳ chỉnh
import '../common/colo_extension.dart';

// Widget hiển thị 1 ô món ăn
class FindEatCell extends StatelessWidget {
  // Dữ liệu món ăn (Map chứa name, number, image)
  final Map fObj;
  // Chỉ số của ô (để đổi màu nền xen kẽ)
  final int index;

  const FindEatCell({super.key, required this.index, required this.fObj});

  @override
  Widget build(BuildContext context) {
    // Lấy kích thước màn hình
    var media = MediaQuery.of(context).size;
    // Nếu index chẵn thì là "event", dùng màu nền khác
    bool isEvent = index % 2 == 0;

    return Container(
      margin: const EdgeInsets.all(8), // khoảng cách ngoài
      width: media.width * 0.5, // chiếm 1/2 màn hình theo chiều ngang
      decoration: BoxDecoration(
        // Nền dạng gradient, đổi màu theo isEvent
        gradient: LinearGradient(
          colors: isEvent
              ? [
                  TColor.primaryColor2.withOpacity(0.5),
                  TColor.primaryColor1.withOpacity(0.5)
                ]
              : [
                  TColor.secondaryColor2.withOpacity(0.5),
                  TColor.secondaryColor1.withOpacity(0.5)
                ],
        ),
        // Bo tròn các góc, góc trên phải bo nhiều hơn
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(75),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),

      // Nội dung bên trong ô
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // canh trái
        children: [
          // Ảnh món ăn ở góc trên bên phải
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                fObj["image"].toString(), // đường dẫn ảnh
                width: media.width * 0.3,
                height: media.width * 0.25,
                fit: BoxFit.contain,
              )
            ],
          ),

          // Tên món ăn
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              fObj["name"],
              style: TextStyle(
                color: TColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Giá trị kcal hoặc thông tin phụ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              fObj["number"],
              style: TextStyle(color: TColor.gray, fontSize: 12),
            ),
          ),

          const SizedBox(height: 15), // khoảng cách trước nút

          // Nút "Select"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 90,
              height: 25,
              child: RoundButton(
                fontSize: 12,
                type: isEvent
                    ? RoundButtonType.bgGradient
                    : RoundButtonType.bgSGradient,
                title: "Select",
                onPressed: () {
                  // TODO: Thêm hành động khi bấm nút
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
