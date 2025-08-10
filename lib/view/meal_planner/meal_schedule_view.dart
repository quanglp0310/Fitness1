import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/meal_food_schedule_row.dart';
import '../../common_widget/nutritions_row.dart';

/// Màn hình hiển thị lịch ăn uống và thông tin dinh dưỡng
class MealScheduleView extends StatefulWidget {
  const MealScheduleView({super.key});

  @override
  State<MealScheduleView> createState() => _MealScheduleViewState();
}

class _MealScheduleViewState extends State<MealScheduleView> {
  /// Controller để điều khiển CalendarAgenda
  CalendarAgendaController _calendarAgendaControllerAppBar = CalendarAgendaController();

  /// Ngày được chọn hiện tại
  late DateTime _selectedDateAppBBar;

  /// Danh sách bữa sáng
  List breakfastArr = [
    {"name": "Honey Pancake", "time": "07:00am", "image": "assets/img/honey_pan.png"},
    {"name": "Coffee", "time": "07:30am", "image": "assets/img/coffee.png"},
  ];

  /// Danh sách bữa trưa
  List lunchArr = [
    {"name": "Chicken Steak", "time": "01:00pm", "image": "assets/img/chicken.png"},
    {"name": "Milk", "time": "01:20pm", "image": "assets/img/glass-of-milk 1.png"},
  ];

  /// Danh sách bữa xế
  List snacksArr = [
    {"name": "Orange", "time": "04:30pm", "image": "assets/img/orange.png"},
    {"name": "Apple Pie", "time": "04:40pm", "image": "assets/img/apple_pie.png"},
  ];

  /// Danh sách bữa tối
  List dinnerArr = [
    {"name": "Salad", "time": "07:10pm", "image": "assets/img/salad.png"},
    {"name": "Oatmeal", "time": "08:10pm", "image": "assets/img/oatmeal.png"},
  ];

  /// Danh sách thông tin dinh dưỡng trong ngày
  List nutritionArr = [
    {"title": "Calories", "image": "assets/img/burn.png", "unit_name": "kCal", "value": "350", "max_value": "500"},
    {"title": "Proteins", "image": "assets/img/proteins.png", "unit_name": "g", "value": "300", "max_value": "1000"},
    {"title": "Fats", "image": "assets/img/egg.png", "unit_name": "g", "value": "140", "max_value": "1000"},
    {"title": "Carbo", "image": "assets/img/carbo.png", "unit_name": "g", "value": "140", "max_value": "1000"},
  ];

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now(); // Gán ngày hiện tại khi khởi tạo
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size; // Lấy kích thước màn hình

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,

        /// Nút quay lại
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: TColor.lightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("assets/img/black_btn.png", width: 15, height: 15),
          ),
        ),

        /// Tiêu đề
        title: Text(
          "Meal  Schedule",
          style: TextStyle(color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),

        /// Nút menu tùy chọn
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assets/img/more_btn.png", width: 15, height: 15),
            ),
          )
        ],
      ),

      backgroundColor: TColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Lịch hiển thị ngày
          CalendarAgenda(
            controller: _calendarAgendaControllerAppBar,
            appbar: false,
            selectedDayPosition: SelectedDayPosition.center,
            leading: IconButton(onPressed: () {}, icon: Image.asset("assets/img/ArrowLeft.png", width: 15)),
            training: IconButton(onPressed: () {}, icon: Image.asset("assets/img/ArrowRight.png", width: 15)),
            weekDay: WeekDay.short,
            dayNameFontSize: 12,
            dayNumberFontSize: 16,
            dayBGColor: Colors.grey.withOpacity(0.15),
            selectedDateColor: Colors.white,
            dateColor: Colors.black,
            locale: 'en',
            initialDate: DateTime.now(),
            calendarEventColor: TColor.primaryColor2,
            firstDate: DateTime.now().subtract(const Duration(days: 140)),
            lastDate: DateTime.now().add(const Duration(days: 60)),

            /// Khi chọn ngày
            onDateSelected: (date) {
              _selectedDateAppBBar = date;
            },

            /// Giao diện của ngày được chọn
            selectedDayLogo: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: TColor.primaryG),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),

          /// Nội dung các bữa ăn và dinh dưỡng
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Hiển thị danh sách từng bữa
                  _buildMealSection("BreakFast", breakfastArr, "230"),
                  _buildMealSection("Lunch", lunchArr, "500"),
                  _buildMealSection("Snacks", snacksArr, "140"),
                  _buildMealSection("Dinner", dinnerArr, "120"),

                  SizedBox(height: media.width * 0.05),

                  /// Tiêu đề phần dinh dưỡng
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Today Meal Nutritions",
                      style: TextStyle(color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),

                  /// Danh sách dinh dưỡng
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: nutritionArr.length,
                    itemBuilder: (context, index) {
                      var nObj = nutritionArr[index] as Map? ?? {};
                      return NutritionRow(nObj: nObj);
                    },
                  ),
                  SizedBox(height: media.width * 0.05),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Hàm build một section hiển thị bữa ăn
  Widget _buildMealSection(String title, List items, String calories) {
    return Column(
      children: [
        /// Tiêu đề bữa ăn
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700)),
              TextButton(
                onPressed: () {},
                child: Text("${items.length} Items | $calories calories", style: TextStyle(color: TColor.gray, fontSize: 12)),
              )
            ],
          ),
        ),

        /// Danh sách món ăn
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            var mObj = items[index] as Map? ?? {};
            return MealFoodScheduleRow(mObj: mObj, index: index);
          },
        ),
      ],
    );
  }
}
