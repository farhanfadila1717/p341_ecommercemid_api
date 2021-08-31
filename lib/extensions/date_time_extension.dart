extension DateTimeExtension on DateTime {
  String get toDmY => '${this.day}/${this.month}/${this.year}';
  String get tomY => '${this.month}/${this.year.toString().substring(2, 4)}';
}
