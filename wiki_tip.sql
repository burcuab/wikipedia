CREATE TABLE `burcuproject.sampletip.wiki_tip` AS (

SELECT date(datehour) as date,
case when regexp_contains(title,'.*Erkan_Baş.*') then 'Erkan_Baş'
when regexp_contains(title,'.*Sera_Kadıgil.*') then 'Sera_Kadıgil'
when regexp_contains(title,'.*Ahmet_Şık.*') then 'Ahmet_Şık'
when regexp_contains(title,'.*Barış_Atay.*') then 'Barış_Atay'
when regexp_contains(title,'.*Türkiye_İşçi_Partisi.*') then 'Türkiye_İşçi_Partisi' else '' end as title,
sum(views) as views
FROM `bigquery-public-data.wikipedia.pageviews_2022` 
WHERE wiki='tr'
and DATE(datehour) between "2023-01-01" and "2023-12-31"
and regexp_contains(title, '.*Erkan_Baş|Sera_Kadıgil|Ahmet_Şık|Barış_Atay|Türkiye_İşçi_Partisi.*')
group by 1,2

)