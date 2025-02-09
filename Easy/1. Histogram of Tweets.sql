WITH TweetCount AS (
  SELECT user_id,
      COUNT(tweet_id) as total_tweets
  FROM tweets
  WHERE tweet_date BETWEEN '2022-01-01' 
    AND '2022-12-31'
  GROUP BY user_id
)

SELECT total_tweets as tweet_bucket,
       COUNT(user_id) as users_num
FROM TweetCount
GROUP BY total_tweets