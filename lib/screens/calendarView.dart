import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    CalendarController bookController = CalendarController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book a slot'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: SizedBox(
            child: SfCalendar(
          controller: bookController,
          view: CalendarView.week,
          todayHighlightColor: Colors.purple,
          cellBorderColor: Colors.purple,
          // initialDisplayDate: DateTime(hashCode),
          showNavigationArrow: true,
          showDatePickerButton: true,
          showCurrentTimeIndicator: true,
        )));
  }
}
