import 'package:flutter/material.dart';

enum SectionType { start, middle, end }

class MemberProgress extends StatelessWidget {
  const MemberProgress({
    Key? key,
    required this.steps,
    required this.index,
  }) : super(key: key);

  final List<String> steps;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: (() {
        List<Widget> builtParts = [];

        void buildSpace() {
          builtParts.add(
            SizedBox(
              width: 5.0,
            ),
          );
        }

        void buildSection(SectionType type, bool isGreen, String title) {
          builtParts.add(Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft:
                      Radius.circular(type == SectionType.start ? 30.0 : 0.0),
                  bottomLeft:
                      Radius.circular(type == SectionType.start ? 30.0 : 0.0),
                  bottomRight:
                      Radius.circular(type == SectionType.end ? 30.0 : 0.0),
                  topRight:
                      Radius.circular(type == SectionType.end ? 30.0 : 0.0),
                ),
                border: Border.all(
                  color: isGreen ? Colors.green : Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: isGreen ? Colors.green : Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ));
        }

        for (var i = 0; i < steps.length; i++) {
          if (i == 0) {
            buildSection(SectionType.start, i <= index, steps[i]);
            buildSpace();
          } else if (i == steps.length - 1) {
            buildSection(SectionType.end, i <= index, steps[i]);
          } else {
            buildSection(SectionType.middle, i <= index, steps[i]);
            buildSpace();
          }
        }

        return builtParts;
      })(),
    );
  }
}
