extension extensionString on String {
  String initial() {
    return this.isNotEmpty ? this.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join().toUpperCase() : '';
  }

  String get titleProduct {
    var name = this.isNotEmpty ? this.trim().split(RegExp(' +')).take(2).join(" ") : '';
    if (name.length > 12) {
      return name.split(RegExp(' +')).take(1).join() + " ...";
    }
    return name;
  }
}
