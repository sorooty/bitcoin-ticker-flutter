import 'package:flutter/material.dart';
import '../models/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_ticker/controllers/networking.dart';
import 'dart:io'
    show Platform; // for OS / platform / device checking tools in this project
// import 'dart:io' as Platform;
// import 'dart:io' hide Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    exchangeRate = Service.getExchangeRate('BTC', 'USD');
  }

  String selectedCurrency = 'USD';
  ApiService Service = ApiService();
  late Future<Exchangerate> exchangeRate;

  // Function to chose the right Picker according to the user's device / phone brand (iOS or Android) :
  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else if (Platform.isAndroid) {
      return androidDropdown();
    } else {
      return androidDropdown();
    }
  } // Not working when using web : by default let's use the iOS Picker for this time.

  // Function to get the Android dropdpdown button / picker style
  DropdownButton androidDropdown() {
    // First Part of the method : gathering the currencies from the list into the DDMI format
    List<DropdownMenuItem<String>> myDropdownItems = [];
    // -> List<DropdownMenuItem<String>> to specify more precisely the type of the items that are inside of the menu (since they're all the same type).
    for (String currency in currenciesList) {
      var newitem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      myDropdownItems.add(newitem);
    }

    // Second Part : We use our new menu item formatted list to get all currencies as options inside our dropdown menu.
    var dDbutton = DropdownButton(
      value: selectedCurrency,
      items: myDropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
        });
        print(value);
      },
    );
    return dDbutton;
  }

  // Function to get the iOS buttonPicker.
  CupertinoPicker iOSPicker() {
    // Returns a list of widgets
    List<Widget> PickerItems = [];
    for (String currency in currenciesList) {
      Widget PickerItem = Text(currency);
      PickerItems.add(PickerItem);
    }

    var thePicker = CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (null),
        children: PickerItems);

    return thePicker;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          '🤑 Coin Ticker',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $exchangeRate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: iOSPicker()),
        ],
      ),
    );
  }
}
