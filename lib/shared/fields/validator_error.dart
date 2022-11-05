enum ValidationError {
  emptyAddress('Alamat tidak boleh kosong'),
  emptyName('Nama usaha tidak boleh kosong'),
  emptyUseStockName('Pengaturan manajemen stok tidak boleh Null'),
  emptyStoreCategory("Kategori usaha belum dipilih");

  final String message;

  const ValidationError(this.message);
}
