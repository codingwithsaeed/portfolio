base class LangHolderModel {
  final String _en;
  final String _fa;

  const LangHolderModel({
    required String en,
    required String fa,
  })  : _en = en,
        _fa = fa;

  String get en => _en;
  String get fa => _fa;
}
