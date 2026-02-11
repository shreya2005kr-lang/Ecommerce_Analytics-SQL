SELECT *
FROM customers
LIMIT 10;
SELECT
  country,
  COUNT(*) AS total_customers
FROM customers
GROUP BY country
ORDER BY total_customers DESC;
SELECT
  country,
  loyalty_tier,
  COUNT(*) AS total_customers
FROM customers
GROUP BY country, loyalty_tier
ORDER BY country, total_customers DESC;
SELECT
  c.country,
  ROUND(SUM(t.gross_revenue), 2) AS total_revenue
FROM customers c
JOIN transactions t
  ON c.customer_id = t.customer_id
GROUP BY c.country
ORDER BY total_revenue DESC;
SELECT
  c.loyalty_tier,
  ROUND(SUM(t.gross_revenue), 2) AS total_revenue
FROM customers c
JOIN transactions t
  ON c.customer_id = t.customer_id
GROUP BY c.loyalty_tier
ORDER BY total_revenue DESC;
SELECT
  c.country,
  ROUND(SUM(t.gross_revenue) / COUNT(t.transaction_id), 2) AS avg_order_value
FROM customers c
JOIN transactions t
  ON c.customer_id = t.customer_id
GROUP BY c.country
ORDER BY avg_order_value DESC;
SELECT
  c.customer_id,
  c.country,
  c.loyalty_tier,
  ROUND(SUM(t.gross_revenue), 2) AS total_revenue
FROM customers c
JOIN transactions t
  ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.country, c.loyalty_tier
ORDER BY total_revenue DESC
LIMIT 5;
SELECT
  c.loyalty_tier,
  ROUND(SUM(t.gross_revenue) / COUNT(DISTINCT c.customer_id), 2)
    AS avg_revenue_per_customer
FROM customers c
JOIN transactions t
  ON c.customer_id = t.customer_id
GROUP BY c.loyalty_tier
ORDER BY avg_revenue_per_customer DESC;
SELECT
  c.acquisition_channel,
  ROUND(SUM(t.gross_revenue), 2) AS total_revenue
FROM customers c
JOIN transactions t
  ON c.customer_id = t.customer_id
GROUP BY c.acquisition_channel
ORDER BY total_revenue DESC;
