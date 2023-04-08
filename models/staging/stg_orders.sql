SELECT 
    o.orderid, 
    o.orderdate, 
    o.shipdate, 
    o.shipmode,
    o.ordersellingprice - o.ordercostprice AS orderprofit,
    o.ordercostprice,
    o.ordersellingprice,
    c.customername,
    c.segment,
    c.country,
    p.category,
    p.productname,
    p.subcategory
FROM {{ ref('raw_orders') }} AS o
LEFT JOIN {{ ref('raw_customer') }} AS c
    ON o.customerid = c.customerid
LEFT JOIN {{ ref('raw_product') }} AS p
    ON o.productid = p.productid