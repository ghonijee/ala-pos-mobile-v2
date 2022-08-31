enum ValidationError {
  emptyAddress('Alamat tidak boleh kosong'),
  emptyName('Nama usaha tidak boleh kosong'),
  emptyUseStockName('Pengaturan manajemen stok tidak boleh Null');

  final String message;

  const ValidationError(this.message);
}
