import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:qadritravels/utils/bus.dart';
import 'package:qadritravels/utils/seat_arrangement.dart';

class SeatSelection extends StatefulWidget {
  const SeatSelection({Key? key}) : super(key: key);

  @override
  SeatSelectionState createState() => SeatSelectionState();
}

class SeatSelectionState extends State<SeatSelection> {
  double seatSize = 26;
  List<Map> seatSelected = [];
  List<Map> list = [];

  ScrollController scrollController = ScrollController();

  int numOfRows = 0;
  int numOfColumns = 0;

  @override
  void initState() {
    super.initState();
    seatSelectionMethod();
  }

  void seatSelectionMethod() {
    int i = 0;
    var seats = seat['seat'];
    numOfRows = seats!.length;
    numOfColumns = seats[0].length;
    for (var seat in seats) {
      bool hasChair = false;
      int j = 1;
      for (var s in seat) {
        list.add({
          'index': list.length,
          'price': 250,
          'type': s,
          'label': '$i${j.toString()}'
        });
        if (s > 0) {
          hasChair = true;
          j++;
        }
      }
      if (hasChair) i++;
    }
    // seats.forEach((seat) {
    //   bool hasChair = false;
    //   int j = 1;
    //   seat.forEach((s) {
    //     list.add(
    //         {"index": list.length, "type": s, "label": "$i${j.toString()}"});
    //     if (s > 0) {
    //       hasChair = true;
    //       j++;
    //     }
    //   });
    //   if (hasChair) i++;
    // });
  }

  String addS(value) {
    return value > 1 ? 's' : '';
  }

  double scale = 1;
  double previousScale = 1;
  double startScale = 1;
  late double currentSize;

  Bus bus = Get.arguments;

  @override
  Widget build(BuildContext context) {
    double seatLayoutWidth = settingWidth(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: radicalRed,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: buildContainer(context, seatLayoutWidth),
    );
  }

  Container buildContainer(BuildContext context, double seatLayoutWidth) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            elevation: 4,
            color: radicalRed,
            margin: const EdgeInsets.all(0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Column(
                  children: [
                    Text(
                      bus.routeName,
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: backgroundColor,
                      ),
                    ),
                    Text(
                      '₹${bus.ticketPrice}',
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: mystic,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bus.busType,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: mystic,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
            ),
          ),
          GestureDetector(
            onScaleStart: (s) {
              setState(() {
                startScale = scale;
              });
            },
            onScaleUpdate: (scaleDetails) {
              double newScale = startScale * scaleDetails.scale;
              if (newScale >= 1) {
                setState(() {
                  scale = newScale;
                });
              }
            },
            onScaleEnd: (s) {},
            child: LayoutBuilder(
              builder: (context, constraint) => Card(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(74, 84, 89, 1)
                    : Colors.white,
                elevation: 2,
                margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: MediaQuery.of(context).size.width / 4,
                    bottom: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  child: SizedBox(
                    width: seatLayoutWidth,
                    child: SingleChildScrollView(
                      child: LayoutBuilder(
                        builder: (context, constraints) => Column(
                          children: <Widget>[
                            Container(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Palette.getContrastColor(context)
                                    .withOpacity(0.3),
                              ))),
                              child: Text(
                                'Select Seats',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    !.copyWith(
                                        fontSize: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                !.fontSize! * scale,
                                        color:
                                            Palette.getContrastColor(context),
                                        fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.couch,
                                    color: mystic,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.couch,
                                    color: radicalRed,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.couch,
                                    color: smoky,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              child: buildSeatLayout(context, constraints),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(bottom: 0, child: Container()),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => radicalRed)),
              onPressed: () {
                if (kDebugMode) {
                  print(seatSelected.length);
                }
                if (seatSelected.length < 1) {
                  if (kDebugMode) {
                    print('Seat: ${seatSelected[1]['label']}');
                  }
                } else {
                  seatSelected.forEach((seat) {
                    if (kDebugMode) {
                      print('Seats: ${seat['label']}');
                    }
                  });
                }
                Get.toNamed('confirmBooking', arguments: [seatSelected, bus]);
              },
              child: const Text('Proceed'),
            ),
          )
        ],
      ),
    );
  }

  double settingWidth(BuildContext context) {
    double width =
        ((MediaQuery.of(context).size.width - 128) / numOfColumns < seatSize
            ? seatSize * numOfColumns + 128
            : MediaQuery.of(context).size.width);

    double seatLayoutWidth = width - 26;
    currentSize = (seatLayoutWidth) / numOfColumns;
    if (scrollController == null) {
      scrollController = ScrollController(
          initialScrollOffset: (width - MediaQuery.of(context).size.width) / 2);
    }
    return seatLayoutWidth;
  }

  buildSeatLayout(BuildContext context, BoxConstraints constraints) {
    return SizedBox(
      height: currentSize * numOfRows + 24,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: numOfColumns,
        children: list.map((item) {
          int type = item['type'];
          String label = item['label'];
          bool isSelected = seatSelected.contains(item);
          return GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print('Tapped $item + $isSelected');
              }
              seatSelect(item);
            },
            child: Container(
              width: seatSize,
              height: seatSize,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(2),
              decoration: type != 0
                  ? BoxDecoration(
                      color: isSelected ? radicalRed : mystic,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: Palette.getContrastColor(context)
                              .withOpacity(0.5)),
                    )
                  : null,
              child: type == 2
                  ? Icon(
                      FontAwesomeIcons.couch,
                      color: smoky,
                      size: 12 * scale,
                    )
                  : type == 1
                      ? Text(
                          label,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 9 * scale,
                              color: !isSelected
                                  ? Palette.getContrastColor(context)
                                  : Colors.black),
                        )
                      : null,
            ),
          );
        }).toList(),
      ),
    );
  }

  buildInfoLayout(BuildContext context) {}

  void seatSelect(seat) {
    setState(() {
      int i = seatSelected.indexOf(seat);
      if (i != -1) {
        seatSelected.remove(seat);
      } else {
        seatSelected.add(seat);
      }
    });
  }
}

class Palette {
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
  }

  static Color getDividerColor(BuildContext context) {
    return Theme.of(context).disabledColor;
  }

  static Color getContrastColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.grey.shade700;
  }
}
