import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'my_color.dart';

class WeekDatePicker extends StatefulWidget {
  const WeekDatePicker({super.key});

  @override
  State<WeekDatePicker> createState() => _WeekDatePickerState();
}

class _WeekDatePickerState extends State<WeekDatePicker> {
  final RxInt selectedIndex = 0.obs;

  List<DateTime> getWeekDates() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getWeekDates();

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: weekDates.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final date = weekDates[index];

          return Obx(() {
            final isSelected = selectedIndex.value == index;

            return GestureDetector(
              onTap: () => selectedIndex.value = index,
              child: Container(
                width: 60,
                padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 5),
                decoration: BoxDecoration(
                  color: isSelected ? MyColor.bluesh : MyColor.lineColors,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('E').format(date),
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? MyColor.colorWhite : Colors.grey,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat('d').format(date),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? MyColor.text : MyColor.colorBlack,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
