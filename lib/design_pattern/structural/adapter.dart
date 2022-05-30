import 'dart:developer';

class CucSacBaChan implements AdapterSac {
  late final ODienHaiChan oDienHaiChan;

  CucSacBaChan(this.oDienHaiChan);

  @override
  void camSac(String status) {
    oDienHaiChan.nhanAdapter(status);
  }
}

abstract class AdapterSac {
  void camSac(String status);
}

class ODienHaiChan {
  void nhanAdapter(String status) {
    log(status);
  }
}
