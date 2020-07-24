class DateTimeUtils {
  String hour(DateTime date) {
    String h = "";
    if (date.hour.toString().length == 1) {
      h = "0${date.hour}";
    } else {
      h = "${date.hour}";
    }
    return h;
  }

  String minute(DateTime date) {
    String m = "";
    if (date.minute.toString().length == 1) {
      m = "0${date.minute}";
    } else {
      m = "${date.minute}";
    }
    return m;
  }
}
