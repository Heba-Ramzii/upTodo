import 'package:flutter/material.dart';
import '../constants/theme/style_manager.dart';
import '../constants/theme/theme.dart';

class DateTimePicker {
   DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<DateTime?> selectDateAndTime(context) async {
     selectedDate = await showDatePicker(
          context: context,
         initialDate: DateTime.now(),
         firstDate: DateTime.now(),
         lastDate: DateTime(2100),
         confirmText: "Choose Time",
         builder: (context, child) {
           return Theme(
             data: Theme.of(context).copyWith(
               datePickerTheme:  DatePickerThemeData(
                   backgroundColor: ThemeColors.dark,
                   headerForegroundColor: ThemeColors.fontColorDark,
                   dayForegroundColor: MaterialStateProperty.all(ThemeColors.fontColorDark),
                   yearForegroundColor: MaterialStateProperty.all(ThemeColors.fontColorDark),
                   dayBackgroundColor: MaterialStateColor.resolveWith((states) =>
                                       states.contains(MaterialState.selected)
                                           ? ThemeColors.primary
                                           :ThemeColors.dark),
                   rangeSelectionBackgroundColor: ThemeColors.primary,
                   weekdayStyle: StyleManager.textStyleDark14.copyWith(
                     fontSize: 10,
                   ),
                   dayStyle: StyleManager.textStyleDark14.copyWith(
                     fontSize: 12,
                   ),
                   confirmButtonStyle: ButtonStyle(
                     foregroundColor: MaterialStateProperty.all(ThemeColors.fontColorDark),
                     backgroundColor: MaterialStateProperty.all(ThemeColors.primary),
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                         RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(4.0),
                         )
                     ),
                   )
               ),
             ),
             child: child!,
           );
         }
     );
    if (selectedDate != null) {
      selectedTime = await showTimePicker(
        initialEntryMode:TimePickerEntryMode.inputOnly,
          helpText: "Choose Time",
          confirmText: "Save",
          context: context,
        initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                timePickerTheme:  TimePickerThemeData(
                    entryModeIconColor: ThemeColors.accentPrimary,
                    helpTextStyle: StyleManager.textStyleDark16,
                    backgroundColor: ThemeColors.dark,
                    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.selected)
                        ? ThemeColors.accentPrimary
                        :ThemeColors.dark),
                    hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.selected)
                        ? ThemeColors.primary
                        : ThemeColors.borderColor),
                     confirmButtonStyle: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(ThemeColors.fontColorDark),
                      backgroundColor: MaterialStateProperty.all(ThemeColors.primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          )
                      ),
                    )
                ),
              ),
              child: child!,
            );
          }
      );
      if (selectedTime != null) {
        String? formattedTime = selectedTime?.format(context);
        print(formattedTime);
         final combinedDateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
           selectedTime!.hour,
           selectedTime!.minute,
        );
        return combinedDateTime;
      }
    }
    return null;
  }

}
