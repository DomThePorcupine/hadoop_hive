SELECT pd.year, AVG(fd.arrdelay) aa 
FROM flight_data fd 
JOIN plane_data pd ON (fd.tailnum = pd.tailnum) WHERE arrdelay > 0 AND pd.year != 0 
GROUP BY pd.year 
SORT BY aa DESC;
