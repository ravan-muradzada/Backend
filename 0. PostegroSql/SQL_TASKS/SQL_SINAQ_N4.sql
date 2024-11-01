-- SUAL 1
-- hr.locations cedvelinden butun melumatlari goturun ve yalniz seher London olsun
-- siralama maasa gore olsun (artan ardicilliqla)
-- Way 1
select *
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
where lower(l.city)='london'
order by salary

-- Way 2
select *
from hr.locations
where lower(city)='london'
order by postal_code

-- SUAL 2
-- department cedvelinden department adlarini ve department idini gosterin
-- ancaq icinde ing olan department adlari olsun
-- siralama department_id ye gore azalan sira ile olsun
select d.department_id, d.department_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
where lower(department_name) like '%ing%'
order by 1 desc

-- SUAL 3
-- employee cedvelinden iscilerin tam adini, hire_date ini goturun
-- ancaq yalniz ise baslama vaxti 24 dekabr 2005 ci ilden sonra olan
-- iscilerin melumatlari olsun
select first_name || ' ' || last_name as tam_ad, hire_date
from hr.employees
where hire_date>'24-dec-05'
order by 2

-- SUAL 4
-- adi S ile baslayan iscilerin maasina 1000 elave edin:
select first_name, salary as maas, salary+1000 as bonuslu_maas
from hr.employees
where lower(first_name) like 's%'

-- SUAL 5
-- telefon nomresi 515 ile baslayan iscilerin adini soyadini telefon nomresini gosterin
select first_name, last_name, phone_number
from hr.employees
where phone_number like '515%'

-- SUAL 6
-- iscilerin adini, job_idsini gosterin
-- ancaq job_id si IT_PROG, ST_CLERK, SA_REP olan job_idler olmasin
select first_name, job_id
from hr.employees
where UPPER(job_id) not in ('IT_PROG','ST_CLERK','SA_REP') 
order by 2

-- SUAL 7
-- iscilerin adi ve job idsi birlesik gosterilsin ve bu sekilde meselen: 
-- Steven is AD_PRES:
select first_name || ' is ' || job_id as tam
from hr.employees

-- SUAL 8
-- Nece department oldugunu department id ile gosterin
select count(distinct department_id) as say
from hr.employees

-- SUAL 9
-- Iscilerin tam adini, maasini, heftelik maasini, illik maasini gosterin
select first_name || ' ' || last_name as tam_ad, salary as ayliq_maas, salary/4 as heftelik_maas, salary*12 as illik_maas
from hr.employees
order by 2

-- SUAL 10
-- Həm ilk hərfi, həm de son herfi a olmayan seher adlarini gosterin
-- şəhər adlarını təkrarsız şəkildə göstərin.
select distinct city
from hr.locations
where lower(substr(city,1,1))!='a' 
and lower(substr(city,-1))!='a' 