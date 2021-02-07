import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  String title, body, recordsType, domainName, status;
  Widget widget;

  CardWidget({this.title, this.body, this.recordsType, this.domainName, this.status, this.widget});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade200,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        //border: Border.all(color: Colors.black),
      ),
      child: ExpansionTile(
        onExpansionChanged: (changed){
          setState(() {
            status = changed;
          });


        },
          title: Text(widget.title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
          subtitle: Text(widget.body, maxLines: (!status) ? 3 : null),
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.done),
                        Text(widget.status)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.pending_actions),
                        Text(widget.recordsType)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.list_outlined),
                        Text(widget.domainName)
                      ],
                    ),

                  ],
                ),
                widget,
               /*    Row(
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
                        widget.recordsType,
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
                        widget.domainName,
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
                        widget.status,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Theme.of(context).accentColor),
                      ),
                    )
                  ],
                ),*/

              ],
            ),

          )
        ],
      ),
    );
  }
}
