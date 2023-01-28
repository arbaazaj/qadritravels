import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qadritravels/screens/booking_confirm.dart';
import 'package:qadritravels/screens/confirm_booking.dart';
import 'package:qadritravels/screens/homepage.dart';
import 'package:qadritravels/screens/myaccount.dart';
import 'package:qadritravels/screens/notification_page.dart';
import 'package:qadritravels/screens/search_buses.dart';
import 'package:qadritravels/screens/seat_selection.dart';
import 'package:qadritravels/screens/start_screen.dart';

void main() => runApp(const QadriTravels());

class QadriTravels extends StatelessWidget {
  const QadriTravels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qadri Travels',
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.pink,
      ),
      getPages: [
        GetPage(name: '/home', page: () => const MyHomePage()),
        GetPage(name: '/confirmBooking', page: () => const ConfirmBooking(), transition: Transition.rightToLeft),
        GetPage(name: '/seatSelection', page: () => const SeatSelection()),
        GetPage(name: '/myaccount', page: () => MyAccount()),
        GetPage(name: '/searchBuses', page: () => const SearchBuses()),
        GetPage(name: '/startScreen', page: () => const StartScreen()),
        GetPage(name: '/notificationPage', page: () => const NotificationPage()),
        GetPage(name: '/bookingConfirm', page: () => const BookingConfirm()),
      ],
      home: const StartScreen(),
    );
  }
}
