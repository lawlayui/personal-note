### **1. Account Context**

- **Aggregate Root / Entity:** `Account`
- **Attributes:** `name`, `email`, `createdAt`, `updatedAt`
- **Value Objects:**
    - `AccountId`
    - `AccountRole` (Enum: `CUSTOMER`, `ADMIN`)
    - `AccountStatus` (Enum: `ACTIVE`, `SUSPENDED`, `UNVERIFIED`)

### **2. Recipe Context**

- **Aggregate Root / Entity:** `Recipe`
    
      
    
- **Entity Intern (di dalam Recipe):** `RecipeMaterial` (tiap item bahan dalam resep)
    
      
    
- **Attributes:** `name`, `description`
    
      
    
- **Value Objects:**
    
      
    - `RecipeId`
        
          
        
    - `SKU` (penunjuk bahan mentah)
        
          
        
    - `Quantity` / `Amount` (takaran)
        
          
        
    - `UOM` (Unit of Measure: _ML, GRAM, PCS_)
        
          
        

### **3. Inventory Context**

- **Aggregate Root / Entity:** `InventoryItemRoot` (mewakili 1 batch stok fisik)
    
      
    
- **Attributes:** `name`, `receivedDate`, `expiredDate`, `quantity`
    
      
    
- **Value Objects:**
    
      
    - `InventoryItemId`
        
          
        
    - `BranchId`
        
          
        
    - `SKU`
        
          
        
    - `UOM`
        
          
        

### **4. Menu Catalog Context**

- **Aggregate Root / Entity:** `MenuItemRoot`
    
      
    
- **Attributes:** `status`
    
      
    
- **Value Objects:**
    
      
    - `MenuItemId`
        
          
        
    - `BranchId`
        
          
        
    - `RecipeId`
        
          
        
    - `Price` / `Money` (gabungan `amount` & `currency`)
        
          
        
    - `MenuStatus` (Enum: `AVAILABLE`, `NOT_AVAILABLE`)
        
          
        

### **5. Branch Context**

- **Aggregate Root / Entity:** `Branch`
    
      
    
- **Attributes:** `name`
    
      
    
- **Value Objects:**
    
      
    - `BranchId`
        
          
        

### **6. Order Context**

- **Aggregate Root / Entity:** `Order`
    
      
    
- **Entity Intern (di dalam Order):** `OrderItem`
    
      
    
- **Attributes:** `createdAt`, `quantity`
    
      
    
- **Value Objects:**
    
      
    - `OrderId`
        
          
        
    - `OrderItemId`
        
          
        
    - `MenuItemId`
        
          
        
    - `Price` / `Money` (harga per item)
        
          
        
    - `TotalPrice` / `Money` (total belanjaan)
        
          
        

### **7. Payment Context**

- **Aggregate Root / Entity:** `PaymentRoot`
    
      
    
- **Attributes:** `referenceNo`, `createdAt`
    
      
    
- **Value Objects:**
    
      
    - `PaymentId`
        
          
        
    - `AccountId`
        
          
        
    - `TotalPrice` / `Money`
        
          
        
    - `PaymentStatus` (Enum: `PENDING`, `SUCCESS`, `FAILED`, `REFUNDED`)