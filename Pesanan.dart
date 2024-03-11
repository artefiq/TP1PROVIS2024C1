import 'dart:async';

class Makanan {
  String nama;
  int harga;

  Makanan(this.nama, this.harga);

  void tampilkanInfo() {
    print('Makanan: $nama, Harga: Rp. ${harga.toString()}');
  }
}

class Pesanan {
  List<Makanan> _itemMakanan = [];

  void tambahItem(Makanan makanan) {
    _itemMakanan.add(makanan);
    print('Ditambahkan ${makanan.nama} ke dalam pesanan.');
  }

  Future<int> hitungTotal() async {
    int total = 0;
    for (var item in _itemMakanan) {
      await Future.delayed(Duration(seconds: 1)); // Simulasi operasi async
      total += item.harga;
    }
    return total;
  }
}

void main() async {
  Makanan ketoprak = Makanan('Ketoprak', 10000);
  Makanan nasi_goreng = Makanan('Nasi Goreng', 15000);

  Pesanan pesananSaya = Pesanan();
  pesananSaya.tambahItem(ketoprak);
  pesananSaya.tambahItem(nasi_goreng);

  print('Menghitung total...');
  int total = await pesananSaya.hitungTotal();
  print('Total Harga: Rp. ${total.toString()}');

  print('\nDetail Pesanan:');
  for (var item in pesananSaya._itemMakanan) {
    item.tampilkanInfo();
  }
}
