-- 3.1 Vind alle films met het woord "liefde" in de titel, en sorteer ze op speelduur.

select 
primarytitle,
originaltitle
from movies
where primarytitle like '%liefde%' and originaltitle like '%liefde%'
order by runtimeminutes

-- 3.2 Gisteren is op 103-jarige leeftijd Kirk Douglas overleden. Vind alle acteurs met de achternaam 'Douglas'. 
-- Sorteer de acteur met achternaam 'Douglas' gebaseerd op de leeftijd van deze acteurs van oud naar jong.

select 
primaryname,
primaryprofession,
birthyear 
from names
where primaryname like '%Douglas' and primaryprofession like '%actor%'
order by birthyear asc

-- 3.3 Noem alle films met zowel Adam Sandler and Drew Barrymore.
select 
    tconst,
    primarytitle
from
    movies
where 
    movies.tconst in (
    select principals.tconst
    from principals
    where
        principals.nconst in (
            select names.nconst
            from names
            where primaryname in ('Adam Sandler', 'Drew Barrymore')
        )
	group by tconst
	having count(1) > 1
)

-- 3.4 Zoek de actrice met de langste naam.
select *
from names 
where primaryprofession like '%actress%'
order by length(primaryname) desc
limit 1

-- 3.5 Zoek de acteur met de meeste tijd tussen zijn eerste en laatste film.
