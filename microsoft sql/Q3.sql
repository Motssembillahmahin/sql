USE PUST

CREATE PROC price_inc @cat CHAR(20), @avgp float AS
DECLARE @av float
BEGIN
    SELECT @av = AVG(item_price) FROM Items WHERE item_category=@cat
	WHILE @av<=@avgp
	BEGIN
	    UPDATE Items SET item_price=item_price*1.1 WHERE item_category=@cat
		SELECT @av = AVG(item_price) FROM Items
	END
END
DROP PROC price_inc
EXEC price_inc 'Mechanical',20000

SELECT *FROM Items;

