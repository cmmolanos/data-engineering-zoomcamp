SELECT

  CONCAT(COALESCE(z1."Zone", 'Unknown'), '/', COALESCE(z2."Zone", 'Unknown')) as pair,
  AVG(tx.total_amount) as avg_total_amount

FROM public.yellow_taxi_trips tx

JOIN public.zones z1 ON
  tx."PULocationID" = z1."LocationID"
JOIN public.zones z2 ON
  tx."DOLocationID" = z2."LocationID"
  
GROUP BY pair
ORDER BY avg_total_amount DESC
	
