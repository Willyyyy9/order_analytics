extension StringExtensions on String {
  String toFormattedNumber() {
    try {
      double value = double.parse(this);

      return value
          .toStringAsFixed(2)
          .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',');
    } catch (e) {
      return this;
    }
  }
}
