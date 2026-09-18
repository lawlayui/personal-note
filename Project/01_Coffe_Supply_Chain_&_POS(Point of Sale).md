**1. Masalah Utama**
**Masalah:** Setiap resep kopi memakan stok bahan mentah dalam takaran berbeda (misal: 1 Espresso = 18 gram Biji Kopi Arabica + 150ml Susu).

**Masalah:** Satu _brand_ warung kopi punya 5 cabang. Harga menu dan ketersediaan stok bahan di Cabang A dan Cabang B bisa berbeda.

**Masalah:** Biji kopi yang sudah di-_roast_ atau susu cair punya tanggal kedaluwarsa.

**2. Problem Space**

**2.1 Core Domain**
- Brand warung kopi memiliki harga menu tergantung cabangnya. 

**2.2 Support Domain**
- Inventory management dengan optimasi tanggal kadaluarsa FEFO (First-Expired, First-out). 

**2.3 Generic Domain**
- Payment gateway 
- Login/otoritasi 

**3. Event Stroming**

[ADMIN] -> (Menambahkan resep kopi sekaligus menu) -> [ResepKopiDitambahkan]
[PELANGGAN] -> (Memilih resep kopi atau menu) -> [ResepDipilih]
[PELANGGAN] -> (Melakukan pembayaran) -> [PaymentDiterima]
[SISTEM] -> (Mengurangi stock)  -> [StockDikurangi]

**4. Bounded Context**

- Recipe Context -> Berfokus untuk menangani pembuatan resep sekaligus menu yang digunakan pelanggan.
  - Tactical Design: 
   - MenuRoot
	- MenuRootId 
	- MenuName 
	- MenuDescription
	- MenuPrice
	- RecipeId

   - RecipeRoot
	- RecipeRoot
	- RecipeName
	- List<Material> materials
		- MaterialId
		- MaterialSKU

- Order Context
-


- Payment Context
  - Tactical Design:
   - PaymentRoot
    - PaymentId
	- AccountId
	- TotalPrice 
  
- Inventory Context 
- Account Context 
