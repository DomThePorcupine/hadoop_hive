SELECT airport, COUNT(*) AS total
FROM
(
  SELECT dest as airport
  FROM flight_data
  UNION ALL
  SELECT origin as airport
  FROM flight_data
) d
GROUP BY airport
ORDER BY total DESC;
