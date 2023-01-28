import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:qadritravels/utils/bus.dart';
import 'package:qadritravels/widgets/departure_arrival_widget.dart';

class ConfirmBooking extends StatelessWidget {
  const ConfirmBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var seats = Get.arguments;
    List<Map> seat = seats[0];
    Bus bus = seats[1];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: radicalRed,
        elevation: 2,
        title: const Text('Confirm Booking'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.7,
                  child: Card(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    elevation: 16.0,
                    color: radicalRed,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bus.routeName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0,
                              color: cadetBlue,
                            ),
                          ),
                          Text(
                            bus.busType,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: cadetBlue,
                            ),
                          ),
                          const Divider(
                            color: backgroundColor,
                          ),
                          const DepartureArrivalWidget(),
                          const Divider(color: backgroundColor),
                          Text(
                            'Total seats: ${seat.length} | ₹${bus.ticketPrice}/ticket',
                            style: const TextStyle(
                                color: mystic,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Total Price: ₹${bus.ticketPrice * seat.length}',
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: mystic),
                          ),
                          Flexible(
                            child: ListView.builder(
                                itemCount: seats.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed('bookingConfirm');
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bolt, color: Colors.amberAccent.shade100),
                      const Text('Instant Book', style: TextStyle(fontSize: 20.0)),
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