extension StringExtension on String {
  String capitalize() {
    var splitStr = this.toLowerCase().split(' ');
    return splitStr.map((String item) {
      return "${item[0].toUpperCase()}${item.substring(1)}";
    }).join(' ');
  }
}
