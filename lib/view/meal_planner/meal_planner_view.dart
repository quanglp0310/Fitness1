import 'package:fl_chart/fl_chart.dart'; // Thư viện vẽ biểu đồ (line chart, bar chart, pie chart)
import 'package:flutter/material.dart'; // Thư viện Flutter cơ bản

// Import các file dùng chung của app
import '../../common/colo_extension.dart'; // Chứa các màu dùng chung (TColor)
import '../../common_widget/find_eat_cell.dart'; // Widget hiển thị ô chọn món ăn
import '../../common_widget/round_button.dart'; // Nút bấm tròn bo góc
import '../../common_widget/today_meal_row.dart'; // Widget hiển thị một bữa ăn trong danh sách hôm nay
import 'meal_food_details_view.dart'; // Màn hình chi tiết món ăn
import 'meal_schedule_view.dart'; // Màn hình lịch ăn uống

// Widget chính hiển thị kế hoạch bữa ăn
class MealPlannerView extends StatefulWidget {
  const MealPlannerView({super.key}); // Constructor

  @override
  State<MealPlannerView> createState() => _MealPlannerViewState(); // Tạo state
}

class _MealPlannerViewState extends State<MealPlannerView> {
  // Danh sách các món ăn trong hôm nay
  List todayMealArr = [
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/m_1.png",
      "time": "28/05/2023 07:00 AM",
    },
    {
      "name": "Lowfat Milk",
      "image": "assets/img/m_2.png",
      "time": "28/05/2023 08:00 AM",
    },
  ];

  // Danh sách các gợi ý bữa ăn
  List findEatArr = [
    {
      "name": "Breakfast",
      "image": "assets/img/m_3.png",
      "number": "120+ Foods",
    },
    {"name": "Lunch", "image": "assets/img/m_4.png", "number": "130+ Foods"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size; // Lấy kích thước màn hình

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white, // Màu nền trắng
        centerTitle: true, // Tiêu đề ở giữa
        elevation: 0, // Không có bóng
        leading: InkWell(
          // Nút quay lại
          onTap: () {
            Navigator.pop(context); // Quay lại màn trước
          },
          child: Container(
            margin: const EdgeInsets.all(8), // Khoảng cách viền
            height: 40,
            width: 40,
            alignment: Alignment.center, // Căn giữa icon
            decoration: BoxDecoration(
              color: TColor.lightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/black_btn.png", // Icon mũi tên
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Meal Planner", // Tiêu đề
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            // Nút "more"
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
                "assets/img/more_btn.png", // Icon ba chấm
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: TColor.white, // Nền trắng
      body: SingleChildScrollView(
        // Cho phép cuộn
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần biểu đồ "Meal Nutritions"
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề + dropdown chọn Weekly / Monthly
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meal Nutritions",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: TColor.primaryG),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: ["Weekly", "Monthly"]
                                .map(
                                  (name) => DropdownMenuItem(
                                    value: name,
                                    child: Text(
                                      name,
                                      style: TextStyle(
                                        color: TColor.gray,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {},
                            icon: Icon(Icons.expand_more, color: TColor.white),
                            hint: Text(
                              "Weekly",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: TColor.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: media.width * 0.05), // Khoảng cách
                  // Vùng hiển thị biểu đồ
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    height: media.width * 0.5,
                    width: double.maxFinite,
                    child: LineChart(
                      LineChartData(
                        lineTouchData: LineTouchData(
                          enabled: true, // Cho phép chạm
                          handleBuiltInTouches: false,
                          touchCallback:
                              (
                                FlTouchEvent event,
                                LineTouchResponse? response,
                              ) {},
                          mouseCursorResolver:
                              (
                                FlTouchEvent event,
                                LineTouchResponse? response,
                              ) {
                                if (response == null ||
                                    response.lineBarSpots == null) {
                                  return SystemMouseCursors.basic;
                                }
                                return SystemMouseCursors.click;
                              },
                          getTouchedSpotIndicator:
                              (
                                LineChartBarData barData,
                                List<int> spotIndexes,
                              ) {
                                return spotIndexes.map((index) {
                                  return TouchedSpotIndicatorData(
                                    FlLine(color: Colors.transparent),
                                    FlDotData(
                                      show: true,
                                      getDotPainter:
                                          (spot, percent, barData, index) =>
                                              FlDotCirclePainter(
                                                radius: 3,
                                                color: Colors.white,
                                                strokeWidth: 3,
                                                strokeColor:
                                                    TColor.secondaryColor1,
                                              ),
                                    ),
                                  );
                                }).toList();
                              },
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBorderRadius: BorderRadius.circular(20),
                            getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                              return lineBarsSpot.map((lineBarSpot) {
                                return LineTooltipItem(
                                  "${lineBarSpot.x.toInt()} mins ago",
                                  TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: TColor.secondaryColor1,
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),
                        lineBarsData: lineBarsData1, // Dữ liệu biểu đồ
                        minY: -0.5,
                        maxY: 110,
                        titlesData: FlTitlesData(
                          show: true,
                          leftTitles: AxisTitles(),
                          topTitles: AxisTitles(),
                          bottomTitles: AxisTitles(
                            sideTitles: bottomTitles, // Nhãn trục X
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: rightTitles, // Nhãn trục Y bên phải
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          drawHorizontalLine: true,
                          horizontalInterval: 25,
                          drawVerticalLine: false,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: TColor.gray.withOpacity(0.15),
                              strokeWidth: 2,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: media.width * 0.05),

                  // Phần "Daily Meal Schedule" + nút Check
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: TColor.primaryColor2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily Meal Schedule",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 25,
                          child: RoundButton(
                            title: "Check",
                            type: RoundButtonType.bgGradient,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MealScheduleView(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: media.width * 0.05),

                  // Tiêu đề "Today Meals" + Dropdown
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Meals",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: TColor.primaryG),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items:
                                [
                                      "Breakfast",
                                      "Lunch",
                                      "Dinner",
                                      "Snack",
                                      "Dessert",
                                    ]
                                    .map(
                                      (name) => DropdownMenuItem(
                                        value: name,
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                            color: TColor.gray,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {},
                            icon: Icon(Icons.expand_more, color: TColor.white),
                            hint: Text(
                              "Breakfast",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: TColor.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: media.width * 0.05),

                  // Danh sách các món ăn hôm nay
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: todayMealArr.length,
                    itemBuilder: (context, index) {
                      var mObj = todayMealArr[index] as Map? ?? {};
                      return TodayMealRow(mObj: mObj);
                    },
                  ),
                ],
              ),
            ),

            // Phần "Find Something to Eat"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Find Something to Eat",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: media.width * 0.55,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                itemCount: findEatArr.length,
                itemBuilder: (context, index) {
                  var fObj = findEatArr[index] as Map? ?? {};
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealFoodDetailsView(eObj: fObj),
                        ),
                      );
                    },
                    child: FindEatCell(fObj: fObj, index: index),
                  );
                },
              ),
            ),

            SizedBox(height: media.width * 0.05),
          ],
        ),
      ),
    );
  }

  // Dữ liệu cho biểu đồ
  List<LineChartBarData> get lineBarsData1 => [lineChartBarData1_1];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true, // Đường cong
    gradient: LinearGradient(
      colors: [TColor.primaryColor2, TColor.primaryColor1],
    ),
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: true,
      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
        radius: 3,
        color: Colors.white,
        strokeWidth: 1,
        strokeColor: TColor.primaryColor2,
      ),
    ),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 35),
      FlSpot(2, 70),
      FlSpot(3, 40),
      FlSpot(4, 80),
      FlSpot(5, 25),
      FlSpot(6, 70),
      FlSpot(7, 35),
    ],
  );

  // Tiêu đề trục Y bên phải
  SideTitles get rightTitles => SideTitles(
    getTitlesWidget: rightTitleWidgets,
    showTitles: true,
    interval: 20,
    reservedSize: 40,
  );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(
      text,
      style: TextStyle(color: TColor.gray, fontSize: 12),
      textAlign: TextAlign.center,
    );
  }

  // Tiêu đề trục X
  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(color: TColor.gray, fontSize: 12);
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
    }
    return SideTitleWidget(
      meta: meta, // Xóa hẳn dòng này đi
      space: 10,
      child: text,
    );
  }
}
