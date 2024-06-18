part of 'config.dart';

class Languages {
  Map<String, dynamic> enV = {};
  Languages() {
    init();
  }
  void init() async {
    enV = jsonDecode(await rootBundle.loadString('assets/lang/en.json'));
  }

  String en(String d) {
    return enV[d] ?? "";
  }
}

var lang = Languages();
