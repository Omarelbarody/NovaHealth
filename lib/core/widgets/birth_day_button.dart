import 'package:flutter/material.dart';

class DateOfBirthPicker extends StatefulWidget {
  @override
  _DateOfBirthPickerState createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<DateOfBirthPicker> {
  TextEditingController _dobController = TextEditingController();
  
  // Method to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(1900); // The earliest possible date
    DateTime lastDate = DateTime.now(); // The latest possible date

    // Show Date Picker and get the selected date
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null && pickedDate != initialDate) {
      setState(() {
        // Format the date into a string and update the controller
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Display as yyyy-mm-dd
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date of Birth Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // DOB Button
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    hintText: 'Select your date of birth',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your date of birth';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit the form or other actions
                print('DOB: ${_dobController.text}');
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

