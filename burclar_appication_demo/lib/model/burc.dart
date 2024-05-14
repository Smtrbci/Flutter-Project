class Burc {
  final String _burcAdi;
  final String _burcTarihi;
  final String _burcDetayi;
  final String _burcKucukResim;
  final String _burcBuyukResim;

  Burc(this._burcAdi, this._burcDetayi, this._burcTarihi, this._burcKucukResim, this._burcBuyukResim);

  @override
  String toString() {

    return '$_burcAdi - $_burcTarihi- $_burcDetayi- $_burcKucukResim- $_burcBuyukResim' ;
  }

  String get burcAdi => _burcAdi;

  String get burcBuyukResim => _burcBuyukResim;

  set burcBuyukResim(String value) {
    _burcBuyukResim = value;
  }

  String get burcKucukResim => _burcKucukResim;

  set burcKucukResim(String value) {
    _burcKucukResim = value;
  }

  String get burcDetayi => _burcDetayi;

  set burcDetayi(String value) {
    _burcDetayi = value;
  }

  String get burcTarihi => _burcTarihi;

  set burcTarihi(String value) {
    _burcTarihi = value;
  }

  set burcAdi(String value) {
    _burcAdi = value;
  }
}
