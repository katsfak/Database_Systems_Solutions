/*1. The craft trading website is setting up a database to record sellers and their products. This 
requires recording the following information: 
For each seller, their name, contact email, and postal address. For each product, its name, price, and 
number available. Which product is from which seller. A unique id number for each product. 
Draw an entity-relationship (ER) diagram that represents this information. Make sure to capture the 
constraints on the relationships involved, and designate appropriate primary keys for the entities.*/
-- ER Diagram Description (Textual Representation)

-- Entities:
-- Seller (SellerID [PK], Name, Email, Address)
-- Product (ProductID [PK], Name, Price, QuantityAvailable, SellerID [FK])

-- Relationships:
-- Seller "has" Product: One-to-Many (One seller can have many products, each product belongs to one seller)

-- Constraints:
-- SellerID is the primary key for Seller.
-- ProductID is the primary key for Product.
-- SellerID in Product is a foreign key referencing Seller(SellerID).

-- Diagram (ASCII Art):

-- +----------------+           +-----------------------------+
-- |   Seller       |           |         Product             |
-- +----------------+           +-----------------------------+
-- | SellerID (PK)  |<-------+  | ProductID (PK)              |
-- | Name           |        |  | Name                        |
-- | Email          |        +--| Price                       |
-- | Address        |           | QuantityAvailable           |
-- +----------------+           | SellerID (FK) -------------+
--                             +-----------------------------+

-- PK = Primary Key, FK = Foreign Key
/*Write a cursor about that*/
-- 2. Write a PL/SQL block that uses a cursor to retrieve and display the names and prices of all
-- products from the database. The block should also handle any exceptions that may occur during
-- the retrieval process.
SET SERVEROUTPUT ON;
DECLARE
    CURSOR product_cursor IS
        SELECT Name, Price FROM Product;
    
    v_name Product.Name%TYPE;
    v_price Product.Price%TYPE;
BEGIN
    OPEN product_cursor;
    
    LOOP
        FETCH product_cursor INTO v_name, v_price;
        EXIT WHEN product_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Product Name: ' || v_name || ', Price: ' || v_price);
    END LOOP;
    
    CLOSE product_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        IF product_cursor%ISOPEN THEN
            CLOSE product_cursor;
        END IF;
END;
/
