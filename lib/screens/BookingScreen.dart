import 'package:flutter/material.dart';
import 'package:sport_test/screens/calendarView.dart';

import 'dart:math' as math;

@immutable
class BookingScreen extends StatelessWidget {
  static const _actionTitles = [
    'Book a gym session',
    'Book a gym class',
    'Book a Swimming session',
    'Book a climbing session',
  ];

  const BookingScreen({super.key});

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const BookingCalendarView())),
              child: const Text('Accept'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map> activities =
        List.generate(4, (index) => {"id": index, "name": "Activity $index"})
            .toList();

    final List activityImages = [
      'lib/assets/images/gym_dumbbell.png',
      'lib/assets/images/classes_2.png',
      'lib/assets/images/swimming.png',
      'lib/assets/images/rock_climbing.png',
    ];

    final List activityTitles = [
      'Gym Session',
      'Gym classes',
      'Swimming',
      'Climbing'
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: const Text('Bookings'),
        ),
        body: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: activities.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          const BookingCalendarView())); // call click event
                },
                child: Card(
                  color: Colors.purple,
                  shadowColor: Colors.purpleAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        activityImages[index],
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        activityTitles[index],
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Colors.purple,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Colors.white,
      ),
    );
  }
}
