-- Sual 1
-- maasi 9000 -den cox olan butun iscilerin id-sini, maasini ve tam adini 
-- gosterin(concat ile)
-- siralama first_name in son herfine gore olsun
select first_name, substr(first_name,-1) as son_herf, employee_id, salary, concat(concat(first_name,' '),last_name) as tam_ad
from hr.employees
where salary>9000
order by lower(substr(first_name,-1))

-- Sual 2
-- ise baslama tarixi 25 sentyabr 2005 ci ilden sonra olan iscilerin
-- adini, soyadini, ise baslama tarixini gosterin, siralama hire_date gore olsun;
select first_name, last_name, hire_date
from hr.employees
where hire_date>'25-sep-05'
order by 3

-- Sual 3
-- 90-ci dep-de calisan butun iscilerin adini,soyadini, id-sini, ise basladigi tarixi, tecrube ilini ve maasini gosterin
select first_name, last_name, department_id, hire_date, round(((sysdate-hire_date)/365),2) as tecrube_ili, salary
from hr.employees
where department_id=90

-- Sual 4
-- icinde e, i, o herfi olan adlari, hemin adlarin uzunluqlarini, 
-- ilk 3 herfini gosterin
select first_name, length(first_name) as len, substr(first_name,1,3) as ilk_3_herf
from hr.employees
where first_name like '%e%'
and first_name like '%i%'
and first_name like '%o%'

-- Sual 5
-- tam adinin uzunlugu 12-den boyuk olan, maasi 5000-9000 intervalinda olan iscilerin melumatlarini
-- first_name gore coxdan aza siralanmis gosterin. Eger first_name-ler eyinidirse siralama maasa gore az-dan coxa olsun
select first_name || ' ' || last_name as tam_ad, salary
from hr.employees
where length(first_name || last_name)>12
and salary between 5000 and 9000
order by first_name desc, salary asc

-- Sual 6
-- employee id si 103 olan isciden daha cox maas alan iscileri gosterin
select first_name, salary
from hr.employees
where salary>(select salary
from hr.employees
where employee_id=103)
order by 2

-- Sual 7
-- yerlesdiyi seher S ile baslayan seherlerin ortalama maasini gosterin. 
-- Ancaq ortalama maasi 5000-den cox olanlar ve 
-- siralama maasa gore azalan sirada olsun
-- Way 1
select l.city, trunc(avg(e.salary)) as ortalama_maas
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
where lower(l.city) like 's%'
group by l.city
having avg(e.salary)>5000
order by 2 desc

-- Way 2
select *
from (select l.city, trunc(avg(salary)) as ortalama_maas
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
where lower(l.city) like 's%'
group by l.city
order by 2 desc)
where ortalama_maas>5000
    
-- Sual 8
-- 100-cu dep-de calisan butun iscilerin id-sini, 
-- ise basladigi tarixi, tecrube ilini(yuvarlaqlasdirilmis formada) ve maasini gosterin;
select department_id, hire_date, round(((sysdate-hire_date)/365),2) as tecrube_ili, salary
from hr.employees
where department_id=100

-- Sual 9 
-- icinde e, i, o herfi olan adlari, hemin adlarin uzunluqlarini, ilk 3 herfini gosterin
select first_name, length(first_name) as len, substr(first_name,1,3) as ilk_3_herf
from hr.employees
where first_name like '%e%'
and first_name like '%i%'
and first_name like '%o%'

-- Sual 10
-- 2003-cu ilde ise baslayan iscilerin adini, 
-- soyadini, ise baslama ilini gosterin:
select first_name, last_name, to_char(hire_date,'yyyy') as ise_baslama_ili
from hr.employees
where to_char(hire_date,'yyyy')=2003