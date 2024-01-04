import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class UtilsServices{
  priceToCurrency(double price){
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt-BR');
    return numberFormat.format(price);
  }


  String formatDateTime(DateTime dateTime){
   initializeDateFormatting();
   DateFormat dateFormat = DateFormat.yMd('pt-BR').add_Hm();
   return dateFormat.format(dateTime);
  }

  void showToast({required String message, bool isError = false,}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: isError? Colors.white: Colors.black,
      fontSize: 14,
    );
  }
}