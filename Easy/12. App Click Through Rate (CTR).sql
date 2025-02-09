WITH CountEvents AS (
  SELECT app_id,
        SUM(CASE WHEN event_type = 'impression' THEN 1 END) impressions,
        SUM(CASE WHEN event_type = 'click' THEN 1 END) clicks
  FROM events
  WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
  GROUP BY app_id
)

SELECT app_id,
      ROUND((100.0 * clicks/impressions),2) as ctr
FROM CountEvents