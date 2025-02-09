SELECT DATE_PART('MONTH', submit_date) AS mth,
      product_id as product,
      ROUND(AVG(stars),2) as avg_stars
FROM reviews
GROUP BY mth, product
ORDER BY mth;