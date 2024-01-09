import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class UtilsServices{

  final storage = const FlutterSecureStorage();
  // salva dodos localmente em seurança
  Future<void> saveLocalDate({required String key, required String data})async{
    await storage.write(key: key, value: data);
  }
  // recupera dado salvao localmente
  Future<String?> getLocalData({required String key})async{
    return await storage.read(key: key);
  }
  // remove dado salvo loccalmente
  Future<void> removeLocalData({required String key})async{
    await storage.delete(key: key);
  }



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