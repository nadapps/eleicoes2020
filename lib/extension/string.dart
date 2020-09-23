extension StringExtension on String {
  String capitalize() {
    if (this.length == 0) {
      return this;
    }

    var splitStr = this.toLowerCase().split(' ');
    return splitStr.map((String item) {
      return "${item[0].toUpperCase()}${item.substring(1)}";
    }).join(' ');
  }
}
