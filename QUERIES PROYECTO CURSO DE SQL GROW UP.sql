/*  PROYECTO FINAL SQL  
Esta base de datos es una base muy sencilla.

Trata de las transacciones de una empresa de retail

Esta conformada por 4 tablas

La primera es de los clientes que trabaja la empresa, y tiene sus datos como fecha de nacimiento, genero
codigo de cliente y codigo de ciudad.

La segunda y tercera tabla tratan de los productos que se venden
    La segunda trata los codigos y categorias de los productos
    La tercera trata de los codigos e informacion de las subcategorias.
    Estas dos se relaciionan en base a los categorias que pertenencen cada subcategoria\

Y la cuarta tabla trata de las transacciones que se han realizado, con los clientes y los productos.
Tiene la fecha en la que cada transaccion se realizo, el precio, impuesto y cantidad que se transacciono.
*/
USE Retail_case_study;


SELECT * FROM Customer;
SELECT * FROM ciudades;
SELECT * FROM prod_categoria;
SELECT * FROM prod_subcat;
SELECT * FROM Transactions;



CREATE TABLE #tempdata2(
    transaction_id bigint,
    transac_date DATE,
    anio INT
)

INSERT INTO #tempdata2
SELECT 
    transaction_id, 
    tran_date,
    YEAR(tran_date)
FROM Transactions


--QUERY 1
SELECT 
    UPPER(cat.cat_product) as categoria_productos,
    DATENAME(mm, t.tran_date) AS mes,
    YEAR(t.tran_date) AS anio,
    CONCAT(ROUND(CAST(COUNT(t.prod_cat_code) AS float)/
    (SELECT CAST(COUNT(*) AS FLOAT) FROM #tempdata2 WHERE anio = '2013')*100,3),'%') AS porcen_ventas
FROM Transactions t
INNER JOIN prod_categoria cat ON cat.prod_cat_code = t.prod_cat_code
WHERE YEAR(t.tran_date) = 2013
GROUP BY t.prod_cat_code, DATENAME(mm, t.tran_date),YEAR(t.tran_date),MONTH(t.tran_date) ,cat.cat_product
ORDER BY anio, MONTH(t.tran_date);
--Se busca obtener el porcentaje de la CANTIDAD de ventas realizadas en cada categoria, por mes en el a#o 2013




--QUERY 2
SELECT
    c.city,
    CONCAT('Q',DATEPART(QUARTER,t.tran_date)) as trimestre,
    YEAR(t.tran_date) as año,
    SUM(t.Tax) as suma_impuestos,
    ROUND(AVG(t.total_amt),3) as promedio_ingreso_ventas
FROM ciudades c
INNER JOIN customer cus ON c.city_code = cus.city_code
INNER JOIN Transactions t ON cus.customer_Id = t.cust_id
WHERE YEAR(t.tran_date) = '2013'
GROUP BY c.city, DATEPART(QUARTER, t.tran_date), YEAR(t.tran_date)
HAVING SUM(t.Tax) > 25000
ORDER BY trimestre, año;
/*Con este query se buscaba obtener el promedio de los ingresos por ventar y la suma total de los impuestos por trimestre del año 2013,
en los trimestres y ciudades en donde la suma del impuesto total superara los Bs.25000
*/