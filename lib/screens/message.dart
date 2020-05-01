import 'package:flutter/material.dart';
import 'package:kmt/styles.dart';
import 'package:kmt/widgets/feeds_header.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<Widget> messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
          color: Colors.white,
          ),
          child: Column(children: <Widget>[
            FeedsHeader('Messages'),
            searchBar(),
            Expanded(
              child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 0),
              separatorBuilder: (context, index) => Divider(color: dark,),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return messageList();
              },
            ))
          ])),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 12.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: (BorderSide.none),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(10)),
                    ),
                    contentPadding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    fillColor: soft_grey,
                    filled: true,
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25.0,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageList() {
    return Padding(
        padding: const EdgeInsets.only(
        top: 10.0, left: 18.0, right: 18.0, bottom: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/img_5.png'),
                            ),
                          )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Marie Winter',
                                style: msg_usr_name,
                              ),
                              Text.rich(
                                  TextSpan(
                                    text:
                                        'Happiness is not something ready made erer erer ererer er e r',
                                    style: TextStyle(color: dark),
                                  ),
                                  overflow: TextOverflow.ellipsis),
                              //  Text('Happiness is not something ready made erer erer ererer er e r'),
                            ]),
                      )
                    ]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('9:40PM'),
                // Container(
                //   margin: EdgeInsets.only(top: 5),
                //   width: 7,
                //   height: 7,
                //   decoration:
                //       BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                // )
              ])
            ],
          ),
    ));
  }
}
