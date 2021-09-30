
import 'package:flutter/material.dart';
import 'package:pmerealestate/src/Helpers/connectivity_service.dart';
import 'package:provider/provider.dart';

import 'app_empty.dart';
import 'app_loader.dart';

class CustomScaffold extends StatefulWidget {
  final PreferredSizeWidget appBar;
  final Function onRefresh;
  final body;
  final service;

  const CustomScaffold(
      {Key key, this.appBar, this.body, this.service, this.onRefresh})
      : super(key: key);
  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    return RefreshIndicator(
      onRefresh: () async {
        widget.onRefresh();
        await Future.value({});
      },
      child: Scaffold(
          appBar: widget.appBar,
          body: connectionStatus != ConnectivityStatus.Offline
              ? FutureBuilder(
                  future: widget.service,
                  builder: (context, dataSnapshot) {
                    if (dataSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: AppLoader(),
                      );
                    } else {
                      if (dataSnapshot.error != null) {
                        print(dataSnapshot.error);
                        return Center(
                          child: Text('هناك خطا يرجي اعادة المحاولة'),
                        );
                      } else {
                        return dataSnapshot.data.data == null ||
                                dataSnapshot.data.data == []
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: AppEmpty(),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.replay_outlined),
                                      onPressed: () => widget.onRefresh(),)
                                ],
                              )
                            : widget.body;
                      }
                    }
                  },
                )
              : Center(
                  child: Text('يرجآ التاكد من الاتصال بالانترنت'),
                )),
    );
  }
}
