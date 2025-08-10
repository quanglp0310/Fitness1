// Import widget MealRecommendCell từ thư mục common_widget (dùng package import)
import 'package:fitness2/common_widget/meal_recommed_cell.dart';

// Import Flutter Material library (chứa các widget cơ bản)
import 'package:flutter/material.dart';

// Import file colo_extension.dart từ thư mục common (relative import, đi lùi 2 cấp)
import '../../common/colo_extension.dart';

// Import các widget custom khác
import '../../common_widget/meal_category_cell.dart';
import '../../common_widget/popular_meal_row.dart';
import '../../common_widget/today_meal_row.dart';

// Import màn hình FoodInfoDetailsView
import 'food_info_details_view.dart';

// Widget có trạng thái (StatefulWidget) hiển thị chi tiết nhóm món ăn
class MealFoodDetailsView extends StatefulWidget {
  // eObj: dữ liệu món ăn truyền vào
  final Map eObj;

  // Constructor nhận dữ liệu eObj (bắt buộc, required)
  const MealFoodDetailsView({super.key, required this.eObj});

  @override
  State<MealFoodDetailsView> createState() => _MealFoodDetailsViewState();
}

// State của MealFoodDetailsView
class _MealFoodDetailsViewState extends State<MealFoodDetailsView> {
  // Controller để quản lý text nhập trong ô tìm kiếm
  TextEditingController txtSearch = TextEditingController();

  // Danh sách category (thể loại món ăn)
  List categoryArr = [
    {"name": "Salad", "image": "assets/img/c_1.png"},
    {"name": "Cake", "image": "assets/img/c_2.png"},
    {"name": "Pie", "image": "assets/img/c_3.png"},
    {"name": "Smoothies", "image": "assets/img/c_4.png"},
    // Lặp lại cho đủ số lượng hiển thị
    {"name": "Salad", "image": "assets/img/c_1.png"},
    {"name": "Cake", "image": "assets/img/c_2.png"},
    {"name": "Pie", "image": "assets/img/c_3.png"},
    {"name": "Smoothies", "image": "assets/img/c_4.png"},
  ];

  // Danh sách món ăn phổ biến (popular)
  List popularArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/img/f_1.png",
      "b_image": "assets/img/pancake_1.png",
      "size": "Medium",
      "time": "30mins",
      "kcal": "230kCal",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/f_2.png",
      "b_image": "assets/img/nigiri.png",
      "size": "Medium",
      "time": "20mins",
      "kcal": "120kCal",
    },
  ];

  // Danh sách món được đề xuất (recommendation)
  List recommendArr = [
    {
      "name": "Honey Pancake",
      "image": "assets/img/rd_1.png",
      "size": "Easy",
      "time": "30mins",
      "kcal": "180kCal",
    },
    {
      "name": "Canai Bread",
      "image": "assets/img/m_4.png",
      "size": "Easy",
      "time": "20mins",
      "kcal": "230kCal",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Lấy kích thước màn hình (MediaQuery)
    var media = MediaQuery.of(context).size;

    return Scaffold(
      // Thanh AppBar trên cùng
      appBar: AppBar(
        backgroundColor: TColor.white, // Màu nền trắng
        centerTitle: true, // Tiêu đề nằm giữa
        elevation: 0, // Không đổ bóng
        // Nút quay lại (leading)
        leading: InkWell(
          onTap: () {
            Navigator.pop(context); // Quay lại màn trước
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
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        // Tiêu đề của AppBar
        title: Text(
          widget.eObj["name"].toString(), // Lấy tên từ eObj
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        // Nút more (3 chấm)
        actions: [
          InkWell(
            onTap: () {},
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
      backgroundColor: TColor.white, // Nền trang trắng
      // Nội dung chính cuộn được
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
          children: [
            // Ô tìm kiếm
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: TColor.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // TextField nhập tìm kiếm
                  Expanded(
                    child: TextField(
                      controller: txtSearch,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        prefixIcon: Image.asset(
                          "assets/img/search.png",
                          width: 25,
                          height: 25,
                        ),
                        hintText: "Search Pancake",
                      ),
                    ),
                  ),
                  // Đường kẻ ngăn cách
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 1,
                    height: 25,
                    color: TColor.gray.withOpacity(0.3),
                  ),
                  // Nút filter
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/img/Filter.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: media.width * 0.05), // Khoảng cách
            // Tiêu đề Category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            // List horizontal category
            SizedBox(
              height: 120,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                itemCount: categoryArr.length,
                itemBuilder: (context, index) {
                  var cObj = categoryArr[index] as Map? ?? {};
                  return MealCategoryCell(cObj: cObj, index: index);
                },
              ),
            ),

            SizedBox(height: media.width * 0.05),

            // Tiêu đề Recommendation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Recommendation\nfor Diet",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // List horizontal recommendation
            SizedBox(
              height: media.width * 0.6,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                itemCount: recommendArr.length,
                itemBuilder: (context, index) {
                  var fObj = recommendArr[index] as Map? ?? {};
                  return MealRecommendCell(fObj: fObj, index: index);
                },
              ),
            ),

            SizedBox(height: media.width * 0.05),

            // Tiêu đề Popular
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Popular",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // List vertical popular food
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: popularArr.length,
              itemBuilder: (context, index) {
                var fObj = popularArr[index] as Map? ?? {};
                return InkWell(
                  onTap: () {
                    // Khi click, mở màn FoodInfoDetailsView
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodInfoDetailsView(
                          dObj: fObj, // Thông tin món
                          mObj: widget.eObj, // Thông tin nhóm món
                        ),
                      ),
                    );
                  },
                  child: PopularMealRow(mObj: fObj),
                );
              },
            ),

            SizedBox(height: media.width * 0.05),
          ],
        ),
      ),
    );
  }
}
