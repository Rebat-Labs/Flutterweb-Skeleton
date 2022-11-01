
extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalize => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  String get capitalizeFirstOfEach => split(" ").map((str) => str.capitalize).join(" ");
}