import 'package:flutter/material.dart';

class Entertask extends StatefulWidget {
  const Entertask({Key? key}) : super(key: key);

  @override
  State<Entertask> createState() => _EntertaskState();
}

class _EntertaskState extends State<Entertask> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const Text("Todo"),
          ],
        ),
      ),
    );
  }
}
