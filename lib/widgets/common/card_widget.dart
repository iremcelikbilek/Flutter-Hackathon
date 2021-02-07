import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String title, body, recordsType, domainName, status;

  CardWidget({this.title, this.body, this.recordsType, this.domainName, this.status});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(title),
        subtitle: Text(body),
      children: [
        Container(
          padding: EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Kayıt Tipi",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      recordsType,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Theme.of(context).accentColor),
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Alan Adı",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      domainName,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Theme.of(context).accentColor),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Durum",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      status,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Theme.of(context).accentColor),
                    ),
                  )
                ],
              ),

            ],
          ),

        )
      ],
    );
  }
}
