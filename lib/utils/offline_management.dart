import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class OfflineManagement extends StatelessWidget {

  final Widget? child;

  const OfflineManagement({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
        connectivityBuilder: (context, connectivity, child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                  height: 24.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    color: connected ? const Color(0xFF00EE44) : const Color(0xFFEE4400),
                    child: Center(
                      child: Text(connected ? 'Online' : 'Offline'),
                    ),
                  ))
            ],
          );
        },
        child: child);
  }
}
