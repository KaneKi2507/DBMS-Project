DELIMITER //

CREATE TRIGGER After_Order_Item_Insert
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;