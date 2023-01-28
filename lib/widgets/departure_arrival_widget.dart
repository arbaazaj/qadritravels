import 'package:flutter/material.dart';
import 'package:qadritravels/themes/colors.dart';


class DepartureArrivalWidget extends StatelessWidget {
  const DepartureArrivalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: 'Departure\n',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
              !.copyWith(
                color: Colors.amber.shade200,
              ),
              children: [
                TextSpan(
                    text: '09:00 AM',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                    !.copyWith(
                        color: Colors.grey.shade300)),
              ]),
        ),
        const Icon(
          Icons.arrow_forward,
          color: kobi,
        ),
        RichText(
          text: TextSpan(
              text: 'Arrival\n',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
              !.copyWith(
                color: Colors.amber.shade200,
              ),
              children: [
                TextSpan(
                  text: '11:20 AM',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                  !.copyWith(
                      color: Colors.grey.shade300),
                ),
              ]),
        ),
      ],
    );
  }
}
