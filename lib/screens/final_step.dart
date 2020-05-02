import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmt/screens/home.dart';
import 'package:kmt/styles.dart';
import 'package:kmt/widgets/header_nav.dart';

class FinalStepScreen extends StatefulWidget {
  @override
  _FinalStepScreenState createState() => _FinalStepScreenState();
}

class _FinalStepScreenState extends State<FinalStepScreen> {
  bool leadingIcon = true;
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();
  List<String> _gender = ['Male', 'Female'];
  List<String> _country = ['Nigeria', 'USA'];
  List<String> _category = ['Scouts', 'Talents'];
  String _selectedGender, _selectedCountry, _selectedCategory;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date.value =
            TextEditingValue(text: (picked.toLocal()).toString().split(' ')[0]);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.white.withOpacity(0.9), BlendMode.dstATop),
                  image: AssetImage("assets/images/pattern.png"),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topRight,
                ),
              ),
              child: Column(children: <Widget>[
                HeaderBar(leadingIcon),
                welcomeText(),
                otherInfo(context),
              ])),
        ),
        bottomNavigationBar: skipLink(context));
  }

  Widget welcomeText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 30.0, 50.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Final Step',
            style: h1,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Enter details below to complete creating your account',
            style: p2,
          )
        ],
      ),
    );
  }

  Widget otherInfo(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 70.0, 25.0, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () => _selectDate(context),
            child: AbsorbPointer(
              child: TextField(
                controller: _date,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Date of Birth ',
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 18.0),
          InputDecorator(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                labelText: 'Select Gender',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  items: _gender.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  value: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  }),
            ),
          ),
          SizedBox(height: 18.0),
          InputDecorator(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                labelText: 'Select Country',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  items: _country.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  value: _selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      _selectedCountry = value;
                    });
                  }),
            ),
          ),
          SizedBox(height: 18.0),
          InputDecorator(
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                labelText: 'Talent Category',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  items: _category.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  value: _selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
            ),
          ),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeFeeds(),
                ),
                (Route<dynamic> route) => false),
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text('Complete', style: button_primary),
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget skipLink(context) {
    return BottomAppBar(
      child: Container(
        height: 61.0,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HomeFeeds(),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            color: soft_purple,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Skip for later',
                  style: span_primary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loadingState() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: dark,
      child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new CircularProgressIndicator(),
              SizedBox(height: 20),
              Text(
                "Creating Account",
                style: loaderHeaderText,
              ),
              Text(
                "Get ready for what’s in store for you",
                style: loaderSubText,
              )
            ],
          )),
    );
  }
}
