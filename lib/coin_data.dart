import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const apiKey = "FE4524FF-DC0C-4F3B-ABF0-4A3BF3F1D1A6";
const url = "https://rest.coinapi.io/v1/exchangerate/BTC/AUD?apikey=";

class CoinData {
  Future getBTCData(String currency) async {
    Response response = await get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=$apiKey"));
    var currencyData = jsonDecode(response.body);
    return currencyData;
  }

  Future getETHData(String currency) async {
    Response response = await get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/ETH/$currency?apikey=$apiKey"));
    var currencyData = jsonDecode(response.body);
    return currencyData;
  }

  Future getLTCData(String currency) async {
    Response response = await get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/LTC/$currency?apikey=$apiKey"));
    var currencyData = jsonDecode(response.body);
    return currencyData;
  }
}
