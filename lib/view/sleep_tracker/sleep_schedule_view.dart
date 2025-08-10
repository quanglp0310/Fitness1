import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitness2/common_widget/round_button.dart';
import 'package:fitness2/common_widget/simple_animation_progress_bar.dart';
import 'package:fitness2/common_widget/today_sleep_schedule_row.dart';
import 'package:fitness2/view/sleep_tracker/sleep_add_alarm_view.dart';
import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';

class SleepScheduleView extends StatefulWidget {
  const SleepScheduleView({super.key});

  @override
  State<SleepScheduleView> createState() => _SleepScheduleViewState();
}

class _SleepScheduleViewState extends State<SleepScheduleView> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  late DateTime _selectedDateAppBBar;
  List todaySleepArr = [
    {
      "name": "Bedtime",
      "image": "assets/img/bed.png",
      "time": "01/06/2023 09:00 PM",
      "duration": "in 6hours 22minutes",
    },
    {
      "name": "Alarm",
      "image": "assets/img/alaarm.png",
      "time": "02/06/2023 05:10 AM",
      "duration": "in 14hours 30minutes",
    },
  ];
  List<int> showingTooltipOnSpots = [4];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDateAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
        title: Text(
          "Sleep Tracker",
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
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
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Container(
                    width: double.maxFinite,
                    height: media.width * 0.45,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          TColor.primaryColor1.withOpacity(0.4),
                          TColor.primaryColor2.withOpacity(0.4),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              Text(
                                "Ideal Hours for Sleep",
                                style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "8 hours 30 minutes",
                                style: TextStyle(
                                  color: TColor.primaryColor2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 110,
                                height: 35,
                                child: RoundButton(
                                  title: "Learn More",
                                  fontSize: 12,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/img/sleep_schedule.png",
                          width: media.width * 0.35,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.03),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Your Schedule",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CalendarAgenda(
                  controller: _calendarAgendaControllerAppBar,
                  appbar: false,
                  selectedDayPosition: SelectedDayPosition.center,
                  leading: IconButton(
                    icon: Image.asset(
                      "assets/img/ArrowLeft.png",
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () {},
                  ),
                  training: IconButton(
                    icon: Image.asset(
                      "assets/img/ArrowRight.png",
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () {},
                  ),
                  weekDay: WeekDay.long,
                  dayNameFontSize: 12,
                  dayNumberFontSize: 16,
                  dayBGColor: Colors.grey.withOpacity(0.15),
                  titleSpaceBetween: 15,
                  backgroundColor: Colors.transparent,
                  fullCalendarScroll: FullCalendarScroll.horizontal,
                  fullCalendarDay: WeekDay.long,
                  selectedDateColor: Colors.white,
                  dateColor: Colors.black,
                  locale: 'en',
                  padding: 10,
                  initialDate: DateTime.now(),
                  calendarEventColor: Colors.green,
                  firstDate: DateTime.now().subtract(Duration(days: 140)),
                  lastDate: DateTime.now().add(Duration(days: 60)),

                  onDateSelected: (date) {
                    setState(() {
                      _selectedDateAppBBar = date;
                    });
                  },
                  selectedDayLogo: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff9DCEFF),
                          const Color(0xff92A3FD),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todaySleepArr.length,
                  itemBuilder: (context, index) {
                    var sObj = todaySleepArr[index] as Map? ?? {};
                    return TodaySleepScheduleRow(sObj: sObj);
                  },
                ),
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        TColor.secondaryColor2.withOpacity(0.4),
                        TColor.secondaryColor1.withOpacity(0.4),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You will get 8hours 10minutes\nfor tonight",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SimpleAnimationProgressBar(
                            height: 15,
                            width: media.width - 80,
                            backgroundColor: Colors.grey.shade100,
                            foregrondColor: Colors.purple,
                            ratio: 0.96,
                            direction: Axis.horizontal,
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: const Duration(seconds: 3),
                            borderRadius: BorderRadius.circular(7.5),
                            gradientColor: LinearGradient(
                              colors: TColor.secondaryG,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          Text(
                            "96%",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: media.width * 0.05),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SleepAddAlarmView(date: _selectedDateAppBBar),
            ),
          );
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: TColor.secondaryG),
            borderRadius: BorderRadius.circular(27.5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Icon(Icons.add, size: 20, color: TColor.white),
        ),
      ),
    );
  }
}
