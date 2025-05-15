import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  TextEditingController dateController = TextEditingController();

  void dateTimePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      barrierDismissible: false,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple,
            colorScheme: ColorScheme.light(primary: Colors.purple),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      dateController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      notifyListeners();
    }
  }
}
