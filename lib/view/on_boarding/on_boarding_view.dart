import 'package:fitness2/common/colo_extension.dart';
import 'package:fitness2/common_widget/on_boarding_page.dart';
import 'package:fitness2/view/login/signup_view.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0; // Lưu index của trang hiện tại
  PageController controller = PageController(); // Dùng để điều khiển PageView

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      // Lắng nghe thay đổi của PageView để cập nhật selectPage
      selectPage = controller.page?.round() ?? 0;
      setState(() {});
    });
  }

  // Danh sách các trang onboarding (dữ liệu demo)
  List pagetArr = [
    {
      "title": "Track Your Goal",
      "subtitle":
          "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      "image": "assets/img/on_1.png",
    },
    {
      "title": "Get Burn",
      "subtitle":
          "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      "image": "assets/img/on_2.png",
    },
    {
      "title": "Eat Well",
      "subtitle":
          "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      "image": "assets/img/on_3.png",
    },
    {
      "title": "Improve Sleep\nQuality",
      "subtitle":
          "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
      "image": "assets/img/on_4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Hiển thị các trang onboarding
          PageView.builder(
            controller: controller,
            itemCount: pagetArr.length,
            itemBuilder: (context, index) {
              var pObj = pagetArr[index] as Map? ?? {};
              return OnBoardingPage(pObj: pObj); // Load nội dung từng trang
            },
          ),

          // Vòng tròn điều hướng + nút "Next"
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Hiển thị tiến độ hiện tại bằng CircularProgressIndicator
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: TColor.primaryColor1,
                    value:
                        (selectPage + 1) /
                        4, // Tiến độ = trang hiện tại / tổng số
                    strokeWidth: 2,
                  ),
                ),
                // Nút điều hướng sang trang tiếp theo
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: TColor.primaryColor1,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (selectPage < 3) {
                        // Nếu chưa phải trang cuối, chuyển trang
                        selectPage = selectPage + 1;
                        controller.animateToPage(
                          selectPage,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceInOut,
                        );
                      } else {
                        // Nếu đã đến trang cuối
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpView(),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.navigate_next, color: TColor.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
