import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String? selectedCurrency = 'AUD';
  late int btcValue = 0;
  late int ethValue = 0;
  late int ltcValue = 0;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getCurrencyValue(selectedCurrency!);
        });
      },
    );
  }

  void getCurrencyValue(String currency) async {
    var btc = await coinData.getBTCData(currency);
    btcValue = btc['rate'].toInt();
    var eth = await coinData.getETHData(currency);
    ethValue = eth['rate'].toInt();
    var ltc = await coinData.getLTCData(currency);
    ltcValue = ltc['rate'].toInt();
    setState(() {});
  }

  @override
  void initState() {
    getCurrencyValue("AUD");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          columnItems("BTC", selectedCurrency!, btcValue),
          columnItems("ETH", selectedCurrency!, ethValue),
          columnItems("LTC", selectedCurrency!, ltcValue),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.black87,
            child: androidDropdown(),
          ),
        ],
      ),
    );
  }
}

Widget columnItems(String crypto, String currency, int value) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
    child: Card(
      color: Colors.deepOrangeAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $crypto = $value $currency',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
