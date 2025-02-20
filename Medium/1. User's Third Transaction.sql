WITH Ranks AS (
  SELECT *,
        DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date) as rnk
  FROM transactions
)

SELECT user_id,
      spend,
      transaction_date
FROM Ranks
WHERE rnk = 3