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

- Account Context 
	- Account
		- Id
		- Name
		- Email
		- Role ENUM(CUSTOMER, ADMIN)
		- Status ENUM(ACTIVE, SUSPENDED, UNVERIFIED)
		- CreatedAt
		- UpdatedAt

- Recipe Context 
	- Recipe
		- Id
		- Name
		- Description 
		- List<Material> materials
			- Id
			- Quantity
			- UOM 
			- SKU

- Menu Catalog Context -> Fokusnya sebagai master data.
	- MenuItemRoot
		- Id
		- BranchId
		- RecipeId

- Branch Context  -> Fokusnya mengatur harga pada beda-beda branch dan . 
	- Branch
		- Id
		- MenuId
		- Price

- Inventory Context  -> Berfokus untuk menangani stock bahan-bahan mentah kopi dan juga mengimplementasikan algoritma FEFO (First-Expired, First-out).
	- InventoryItemRoot
		- Id -> Tetap membutuhkan id unik, SKU tidak menjamin nilai unik dan bisa lebih dari satu produk bernilai SKU yang sama dikarenakan produk yang sama.
		- SKU 
		- name
		- branchId
		- received_date (YYYY-MM-DD HH:MM:SS)
		- expired_date (YYYY-MM-DD)
		 - quantity

- Order Context -> Berfokus untuk menyediakan data sebelum payment context. 
	- Order
		- Id
		- List<OrderItem> items
			- OrderItemId 
			- quantity 
			- price 
		- total_price 
		- CreatedAt

- Payment Context -> Integrasi payment gateway dan history transaksi.
	   - PaymentRoot
	    - Id
		- AccountId
		- TotalPrice 
		- Status ENUM(PENDING, SUCCESS, FAILED, EXPIRED, REFUNED)
		- ReferenceNo 
		- CreatedAt