// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: "ELEC1001",
    name: "LG 1.5 Ton Inverter AC",
    category: "Electronics",
    price: 42000,
    brand: "LG",
    specifications: {
      voltage: "230V",
      power_consumption: "1450W",
      inverter: true
    },
    warranty: {
      product: "1 year",
      compressor: "10 years"
    },
    ratings: [4.5, 4.6, 4.4],
    available: true
  },
  {
    product_id: "CLOT2001",
    name: "Women's Ethnic Kurti",
    category: "Clothing",
    price: 1500,
    brand: "Biba",
    sizes: ["S", "M", "L", "XL"],
    fabric: "Rayon",
    colors: ["Red", "Green", "Blue"],
    care_instructions: {
      wash: "Machine wash",
      iron: "Low heat"
    },
    ratings: [4.2, 4.1, 4.3]
  },
  {
    product_id: "GROC3001",
    name: "Aashirvaad Whole Wheat Atta 10kg",
    category: "Groceries",
    price: 550,
    brand: "Aashirvaad",
    expiry_date: new Date("2024-11-20"),
    nutrition: {
      calories_per_100g: 340,
      protein: "11g",
      fiber: "10g"
    },
    storage_instructions: "Store in a cool, dry place",
    warehouse_locations: ["Chennai", "Bangalore", "Hyderabad"]
  }
]);

// OP2: find() — retrieve Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add discount_percent to a specific product
db.products.updateOne(
  { product_id: "ELEC1001" },
  { $set: { discount_percent: 15 } }
);

// OP5: createIndex() — index on category field
db.products.createIndex({ category: 1 });
