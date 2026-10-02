
-- ============================================
-- Superstore Sales Analyse - SQL Queries
-- ============================================

-- Query 1: Profitabilität nach Kategorie
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(AVG(profit * 100.0 / sales), 2) AS avg_margin,
    COUNT(*) AS num_orders
FROM orders
GROUP BY category
ORDER BY total_profit DESC;

-- Query 2: Top 5 unprofitabelste Sub-Kategorien
SELECT 
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 5;

-- Query 3: Effekt von Rabatten auf Profit
SELECT 
    CASE WHEN discount = 1 THEN 'Mit Rabatt' ELSE 'Kein Rabatt' END AS discount_label,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(AVG(profit * 100.0 / sales), 2) AS avg_margin,
    COUNT(*) AS num_orders
FROM orders
GROUP BY discount_label;

-- Query 4: Top 5 Kunden nach Umsatz (nur profitable Kunden)
SELECT 
    customer_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(*) AS num_orders
FROM orders
GROUP BY customer_name
HAVING total_profit > 0
ORDER BY total_sales DESC
LIMIT 5;
