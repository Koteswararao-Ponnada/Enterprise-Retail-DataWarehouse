# Table Relationships

## Customers → Orders

Relationship : One-to-Many (1:M)

One customer can place many orders.
Each order belongs to only one customer.

------------------------------------------------

## Orders → OrderDetails

Relationship : One-to-Many (1:M)

One order can contain multiple products.

------------------------------------------------

## Products → OrderDetails

Relationship : One-to-Many (1:M)

One product can appear in many order details.

------------------------------------------------

## Categories → Products

Relationship : One-to-Many (1:M)

One category contains many products.

------------------------------------------------

## Suppliers → Products

Relationship : One-to-Many (1:M)

One supplier supplies many products.

------------------------------------------------

## Warehouses → Inventory

Relationship : One-to-Many (1:M)

One warehouse stores many inventory items.

------------------------------------------------

## Products → Inventory

Relationship : One-to-Many (1:M)

One product can exist in multiple warehouses.

------------------------------------------------

## Inventory → InventoryTransactions

Relationship : One-to-Many (1:M)

Each inventory item has many inventory transactions.

------------------------------------------------

## Orders → Payments

Relationship : One-to-One (1:1)

Each order has one payment.

------------------------------------------------

## Orders → Shipments

Relationship : One-to-One (1:1)

Each order has one shipment.

------------------------------------------------

## Orders → Returns

Relationship : One-to-Many (1:M)

One order may have one or more return records.

------------------------------------------------

## Employees → Orders

Relationship : One-to-Many (1:M)

One employee processes many orders.

------------------------------------------------

## Regions → Cities

Relationship : One-to-Many (1:M)

One region contains many cities.

------------------------------------------------

## Cities → Customers

Relationship : One-to-Many (1:M)

One city has many customers.

------------------------------------------------

## Promotions → Products

Relationship : Many-to-Many (M:N)

One promotion can apply to many products.
One product can belong to many promotions.

(A bridge table will be created later.)