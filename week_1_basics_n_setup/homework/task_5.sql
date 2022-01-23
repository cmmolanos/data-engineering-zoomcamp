WITH filtered AS (
	SELECT

	  tx.tpep_pickup_datetime,
	  tx."PULocationID",
	  z1."Zone" as pickup_zone,
	  tx."DOLocationID",
	  z2."Zone"

	FROM public.yellow_taxi_trips tx
	JOIN public.zones z1 ON
	  tx."PULocationID" = z1."LocationID"
	JOIN public.zones z2 ON
	  tx."DOLocationID" = z2."LocationID"
	WHERE tpep_pickup_datetime::date = '2021-01-14' AND
	  tx."PULocationID" = 43
)

SELECT

  "Zone",
  COUNT("Zone") AS trips
  
FROM filtered
GROUP BY "Zone"
ORDER BY trips DESC