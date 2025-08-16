SELECT Type1, count(Type1)+count(Type2) AS 'Total'
FROM pokemon
GROUP BY Type1;