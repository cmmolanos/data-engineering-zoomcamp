SELECT

  count(1)

FROM public.yellow_taxi_trips
WHERE tpep_pickup_datetime::date = '2021-01-15';