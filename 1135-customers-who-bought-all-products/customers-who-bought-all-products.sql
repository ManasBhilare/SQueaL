WITH ProductCount AS (
    SELECT COUNT(*) AS total_products FROM Product
)

SELECT c.customer_id
FROM Customer c
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT total_products FROM ProductCount);

#ManasBhilare