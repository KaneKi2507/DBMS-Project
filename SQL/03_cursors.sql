DELIMITER //

CREATE PROCEDURE Update_Low_Stock_Prices()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE p_id INT;
    DECLARE p_stock INT;
    
    DECLARE cur_products CURSOR FOR 
        SELECT product_id, stock_quantity FROM Products WHERE stock_quantity < 50;
        
    -- Error handler to stop the loop when we run out of rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur_products;
    
    read_loop: LOOP
        FETCH cur_products INTO p_id, p_stock;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Update logic: Increase price by 5%
        UPDATE Products 
        SET price = price * 1.05 
        WHERE product_id = p_id;
        
    END LOOP;
    
    CLOSE cur_products;
END //

DELIMITER ;

