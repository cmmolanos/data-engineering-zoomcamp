SELECT

  tpep_pickup_datetime::date as pickup_date,
  MAX(tip_amount) as max_tip_amount

FROM public.yellow_taxi_trips

GROUP BY pickup_date
ORDER BY max_tip_amount DESC;