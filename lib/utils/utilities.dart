import 'package:intl/intl.dart';

class Utilities {
 static String countDifference(String contentDate) {
    DateTime parseDate = DateTime.parse(contentDate).toLocal();
    var todayDate = DateTime.now();

    var difference = parseDate.difference(todayDate);
    
    if(difference.inDays < 365){
      var year = todayDate.difference(parseDate).inDays / 365;
      return "${year.round()} tahun yang lalu";
    }
    else if(difference.inDays < 30){
      var month = todayDate.difference(parseDate).inDays / 30;
      return "${month.round()} bulan yang lalu";
    }
    else if (difference.inDays < 0) {
      return "${todayDate.difference(parseDate).inDays.toString()} Hari yang lalu";
    } else if (difference.inHours < 0) {
      return "${todayDate.difference(parseDate).inHours.toString()} Jam yang lalu";
    }
    return "${todayDate.difference(parseDate).inMinutes.toString()} Menit yang lalu";
  }
}
