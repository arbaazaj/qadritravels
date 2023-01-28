import 'package:flutter/material.dart';
import 'package:qadritravels/themes/colors.dart';

class CustomDateSelector extends StatelessWidget {
  final bool? isSelected;
  final String? currentDay;
  final int? currentDate;
  final GestureTapCallback? onTap;

  const CustomDateSelector({Key? key, this.isSelected, this.currentDay, this.currentDate, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, top: 4.0),
      child: SizedBox(
        height: 150,
        width: 110.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: onTap,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: isSelected == true ? radicalRed : bermudaGray,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        currentDay!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      Text(
                        '$currentDate',
                        style: const TextStyle(color: Colors.white, fontSize: 42.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
