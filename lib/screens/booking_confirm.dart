import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qadritravels/themes/colors.dart';

class BookingConfirm extends StatelessWidget {
  const BookingConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: radicalRed,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Booking Confirmed!',
                style: TextStyle(
                    fontSize: 28.0, color: Colors.amberAccent.shade100),
              ),
              const Text(
                'Details are sent to your email kindly check.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: mystic,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(64.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.amber.shade800)),
                    onPressed: () {
                      Get.toNamed('searchBuses');
                    },
                    child: const Text(
                      'Go To Home',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
