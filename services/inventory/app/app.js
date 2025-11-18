const express = require("express");
const app = express();
app.use(express.json());

const inventory = {
 "1": { productId: "1", stock: 50, reserved: 0 },
 "2": { productId: "2", stock: 200, reserved: 0 },
 "3": { productId: "3", stock: 150, reserved: 0 }
  };


app.get("/api/inventory/:id", (req, res) => {
const item = inventory[req.params.id];
  if (!item) return res.status(404).json({ error: "Not found" });
  res.json(item);
  });

app.post("/api/inventory/reserve", (req, res) => {
const { productId, quantity } = req.body;

  if (!inventory[productId])
  return res.status(404).json({ error: "Product not found" });

const item = inventory[productId];
   const available = item.stock - item.reserved;

   if (available < quantity)
   return res.status(400).json({ error: "Insufficient stock" });

      item.reserved += quantity;

      res.json({
        success: true,
        reserved: quantity,
        productId
      });
    });

app.get("/health", (req, res) => {
  res.json({ status: "healthy", service: "inventory" });
 });

app.listen(process.env.PORT || 8080, () => {
 console.log("Inventory service running...");
 });
