import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UtilsServices{
  priceToCurrency(double price){
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt-BR');
    return numberFormat.format(price);
  }


  String DateFormatTime(DateTime dateTime){
   initializeDateFormatting();
   DateFormat dateFormat = DateFormat.yMd('pt-BR').add_Hm();
   return dateFormat.format(dateTime);
  }
}