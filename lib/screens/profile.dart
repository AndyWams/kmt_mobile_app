import 'package:flutter/material.dart';
import 'package:kmt/models/post-item-model.dart';
import 'package:kmt/widgets/feeds_header.dart';
import 'package:kmt/widgets/post_item_list.dart';
import '../styles.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Item> itemList;
  @override
  Widget build(BuildContext context) {
    itemList = _itemList();
    return Scaffold(
        body: Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: offWhite,
      ),
      child: Column(children: [
        FeedsHeader(
          'My Profile',
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.settings,
              color: black,
              size: 30,
            ),
          ),
        ),
        profileWrap(),
        Expanded(child: myPost()),
      ]),
    ));
  }

  Widget profileWrap() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Column(
          children: <Widget>[
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 78.0,
                    height: 78.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/img_10.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 60),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('100',
                                  style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.bold)),
                              Text('Post', style: TextStyle(color: dark))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('1.6M',
                                  style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.bold)),
                              Text('Friends', style: TextStyle(color: dark))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('1.3M',
                                  style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.bold)),
                              Text('Comments', style: TextStyle(color: dark))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Elon Mosk',
                      style: TextStyle(
                          color: black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Elonmosk@gmail.com',
                      style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on, size: 14, color: purple),
                        SizedBox(width: 5),
                        Text(
                          'Lagos ,Nigeria',
                          style: TextStyle(
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                OutlineButton(
                  splashColor: purple,
                  borderSide: BorderSide(color: purple),
                  onPressed: () {},
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: purple),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'For compliance with a legal obligation or if the processing is necessary for the purposes of our legitimate interests.',
                    style: TextStyle(color: dark),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget myPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(4.0),
          childAspectRatio: 8.0 / 9.0,
          children: itemList
              .map(
                (item) => Card(child: ItemList(item: item)),
              )
              .toList(),
        ),
      ),
    );
  }

  List<Item> _itemList() {
    return [
      Item(
        bannerUrl: 'assets/images/media_img_1.png',
      ),
      Item(
        bannerUrl: 'assets/images/media_img_2.png',
      ),
      Item(
        bannerUrl: 'assets/images/media_img_3.png',
      ),
      Item(
        bannerUrl: 'assets/images/media_img_1.png',
      ),
      Item(
        bannerUrl: 'assets/images/media_img_2.png',
      ),
      Item(
        bannerUrl: 'assets/images/media_img_3.png',
      ),
      Item(
        bannerUrl: 'assets/images/media_img_1.png',
      ),
      Item(
        bannerUrl: 'assets/images/media_img_2.png',
      ),
      Item(
        bannerUrl: 'assets/images/media_img_3.png',
      ),
    ];
  }
}
