import 'package:flutter/material.dart';
import 'package:qadritravels/screens/seat_selection.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:qadritravels/utils/bus.dart';

class SearchBuses extends StatefulWidget {
  final String from;
  final String destination;

  const SearchBuses({Key key, this.from, this.destination}) : super(key: key);

  @override
  _SearchBusesState createState() => _SearchBusesState();
}

class _SearchBusesState extends State<SearchBuses> {
  final List<Bus> buses = [
    Bus('Aligarh - Noida', 'NON-AC', 250),
    Bus('Delhi - Aligarh', 'NON-AC', 250),
    Bus('Lucknow - Delhi', 'AC', 650),
    Bus('Lucknow - Aligarh', 'AC', 450),
    Bus('Ahmedabad - Delhi', 'AC', 1500),
    Bus('Mumbai - Delhi', 'AC', 1700),
    Bus('Lucknow - Kanpur', 'AC', 350),
    Bus('Mumbai - Pune', 'AC', 210),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buses Found',
          style: TextStyle(color: smoky, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(
          color: smoky,
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView.builder(
            itemCount: buses.length,
            itemBuilder: (context, index) {
              return BusCard(
                buses: buses,
                index: index,
              );
            }),
      ),
    );
  }
}

class BusCard extends StatelessWidget {
  const BusCard({
    Key key,
    @required this.buses,
    @required this.index,
  }) : super(key: key);

  final List<Bus> buses;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 8),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
            color: backgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    buses[index].routeName,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold, color: darkAccent),
                  ),
                  Text(
                    '₹${buses[index].ticketPrice}',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold, color: radicalRed),
                  ),
                ],
              ),
              Text(
                buses[index].busType,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.grey[500]),
              ),
              Flexible(child: Divider()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'Departure\n',
                        style: Theme.of(context).textTheme.overline,
                        children: [
                          TextSpan(
                              text: '09:00 AM',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(color: kobi)),
                        ]),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: kobi,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Arrival\n',
                        style: Theme.of(context).textTheme.overline,
                        children: [
                          TextSpan(
                            text: '11:20 AM',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(color: kobi),
                          ),
                        ]),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(3.0),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => radicalRed)),
                      child: Text(
                        'Book Now',
                        style: TextStyle(color: mystic),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeatSelection()));
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
