**1. INVENTORY CONTEXT**
Fokus pada pengelolaan stok bahan mentah di tingkat cabang dan penerapan algoritma FEFO (First-Expired, First-Out).

**Events:**

- **Publish:**
    
    - `InventoryDeletedEvent`
    - `InventoryQuantityAdjusted`

- **Listener:**
    
    - `MenuSelectedEvent`

**Domain Service (FEFO Orchestration):**

- **FefoStockDeductionService / InventoryAllocationService**
    
    - `allocateStockFefo(branchId, sku, requiredQty)`: Menjalankan pemotongan stok berurutan berdasarkan `expired_date` terdekat.
    - `findBatchesEligibleForDeduction(branchId, sku)`: Mengambil daftar batch `InventoryItemRoot` aktif lalu mengurutkannya secara _ascending_ berdasarkan `expired_date`.

**InventoryItemRoot (Aggregate Root):**

- `deductStock(amount)`: Memotong jumlah stok pada batch spesifik ini.
- `restoreStock(amount)`: Mengembalikan stok akibat transaksi yang dibatalkan/gagal.
- `adjustQuantity(newQty, reason)`: Mengoreksi stok fisik (misal: stok opname, bahan rusak, atau tumpah).
- `markAsExpired()`: Menandai status item jika tanggal kedaluwarsa telah lewat.
- `isExpired()`: Pengecekan kondisi apakah item sudah kedaluwarsa.
- `hasEnoughQuantity(requestedQty)`: Memeriksa ketersediaan kuantitas stok pada batch ini.

**2. RECIPE CONTEXT**
Fokus pada formulasi resep menu, takaran porsi, dan pemetaan ke SKU bahan baku.

**Events:**

- **Publish:**
    - `RecipeCreatedEvent`
    - `RecipeDeletedEvent`

- **Listener:**
    - `InventoryDeletedEvent`

**Recipe (Aggregate Root):**

- `addMaterialRequirement(sku, name, uom, qty)`: Menambahkan kebutuhan bahan baku ke dalam resep menggunakan SKU.
- `removeMaterialRequirement(sku)`: Menghapus bahan baku dari komposisi resep.
- `updateMaterialQuantity(sku, newQty)`: Memperbarui takaran/dosis bahan baku.
- `extractRequiredSkus()`: Mengambil daftar SKU beserta takaran porsinya untuk 1 porsi resep.
- `calculateBulkMaterialNeeds(orderQuantity)`: Mengalikan jumlah pesanan dengan takaran resep untuk kalkulasi total kebutuhan bahan baku.

**3. MENU CATALOG CONTEXT**
Fokus pada master data menu dan status ketersediaan di layar kasir/pelanggan.

**Events:**

- **Publish:**
    - `MenuSelectedEvent`
    - `MenuDeletedEvent`
	
- **Listener:**
    - `RecipeDeletedEvent`

**MenuItemRoot (Aggregate Root):**

- `markAsAvailable()`: Mengubah status menu menjadi `Available`.
- `markAsOutOfStock()`: Mengubah status menu menjadi `Not_Available`.
- `selectMenu(quantity)`: Menandai menu dipilih (memicu `MenuSelectedEvent`).
- `changePrice(newPrice)`: Memperbarui harga jual menu.

**Domain Service / Application Query:**

- **MenuItemAvailabilityChecker**
    
    - `evaluateAvailability(recipeId, branchId)`: Evaluasi ketersediaan menu berdasarkan status stok bahan baku terkait.
        

**4. BRANCH CONTEXT**
Fokus pada entitas cabang fisik toko.

**Events:**

- **Publish:** _(Belum ada)_
    
- **Listener:**
    
    - `MenuDeletedEvent`

**Branch (Aggregate Root):**

- `updateBranchInfo(name)`: Mengubah data profil cabang.

**5. ORDER CONTEXT**
Fokus pada penyusunan pesanan, perhitungan total belanja, dan lifecycle pesanan.

**Events:**

- **Publish:**

    - `OrderCreatedEvent`
	
- **Listener:**
	
    - `MenuSelectedEvent`

**Order (Aggregate Root):**

- `addItem(menuItemId, quantity, unitPrice)`: Menambahkan item ke dalam daftar pesanan.
- `removeItem(orderItemId)`: Menghapus item dari pesanan.
- `calculateTotalPrice()`: Menghitung ulang total harga pesanan.
- `checkout()`: Mengunci pesanan dan memicu `OrderCreatedEvent`.
- `cancelOrder(reason)`: Membatalkan pesanan.
- `markAsPaid()`: Menandai pesanan telah selesai dibayar.

**6. PAYMENT CONTEXT**
Fokus pada integrasi payment gateway dan histori transaksi pembayaran.

**Events:**

- **Publish:**
    - `PaymentSuccessEvent`
        
- **Listener:**
    - `OrderCreatedEvent`

**PaymentRoot (Aggregate Root):**

- `initiatePayment(accountId, amount)`: Membuka transaksi pembayaran baru dengan status `PENDING`.
- `markAsSuccess(referenceNo)`: Menandai transaksi berhasil dan mencatat nomor referensi.
- `markAsFailed(failureReason)`: Menandai pembayaran gagal.
- `processRefund(refundReason)`: Memproses pengembalian dana.

**Infrastructure / Integration Adapter:**

- **PaymentGatewayAdapter**

    - `sendPaymentRequest(paymentDetails)`: Menghubungkan domain internal dengan API eksternal payment gateway.

**7. ACCOUNT CONTEXT**
Fokus pada otentikasi, profil pengguna, dan hak akses.

**Events:**

- **Publish:** _(Optional - misal: AccountCreatedEvent)_
- **Listener:** _(None)_

**Account (Aggregate Root):**

- `suspendAccount(reason)`: Mengubah status akun menjadi `SUSPENDED`.
- `verifyAccount()`: Mengubah status dari `UNVERIFIED` menjadi `ACTIVE`.
- `assignRole(newRole)`: Mengubah hak akses pengguna (misal: `CUSTOMER` atau `ADMIN`).