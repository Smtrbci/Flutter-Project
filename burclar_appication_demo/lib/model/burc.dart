class Burc {
  final String _burcAdi;
  final String _burcTarihi;
  final String _burcDetayi;
  final String _burcKucukResim;
  final String _burcBuyukResim;

  Burc(this._burcAdi, this._burcTarihi, this._burcDetayi,  this._burcKucukResim,
      this._burcBuyukResim);

  @override
  String toString() {
    return '$_burcAdi- $_burcTarihi- $_burcDetayi-   $_burcKucukResim- $_burcBuyukResim';
  }

  String get burcAdi => _burcAdi;

  String get burcBuyukResim => _burcBuyukResim;

  String get burcKucukResim => _burcKucukResim;

  String get burcDetayi => _burcDetayi;

  String get burcTarihi => _burcTarihi;
}
