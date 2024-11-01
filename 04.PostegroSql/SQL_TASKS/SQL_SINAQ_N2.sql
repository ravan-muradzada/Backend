-- Sual 1
-- iscilerin emp idsini, dep idsini, adini, soyadini, 
-- maasini, tecrube ilini, 
-- hazirki maasini  gosterin ve eger tecrube ili 15 e 
-- qederdirse isciye 500 azn mukafat verin, eger tecrube ili 15 den boyukdurse
-- o zaman isciye 1000 azn mukafat verin:
select employee_id, department_id, first_name, last_name, round(((sysdate-hire_date)/365),2) as tecrube_ili, salary as evvelki_maas,
CASE WHEN round(((sysdate-hire_date)/365),2)<=15 THEN salary+500
ELSE salary+1000 END as mukafat
from hr.employees
order by 5

-- Sual 2
-- butun iscilerin 25 aprel 2008-dan isden 
-- ayrildigini nezere alsaq her isci nece ay
-- ve nece il calismisdir?
select round(((to_date('25-apr-2008')-hire_date)/365),2) as toplam_is_ili, round(months_between(to_date('25-apr-2008'), hire_date),2) as toplam_is_ayi
from hr.employees

-- Sual 3
--ise basladigi tarixden ayin sonuna 9 gunden az qalan iscilerin idsini
--ise basladigi tarixi adini soyadini gosterin:
select first_name, last_name, employee_id, hire_date
from hr.employees
where last_day(hire_date)-hire_date<9

-- Sual 4
-- ise basladigi tarixde ayin son gunune 9 gunden az qalmis iscilerin id-sini, ise basladigi tarixi ve
-- ise basladigi ayin son gununu gosterin
select employee_id, hire_date, last_day(hire_date), to_char(last_day(hire_date),'day')
from hr.employees
where last_day(hire_date)-hire_date<9

-- Sual 5
--iscilerin adinin 3 herfi ile son 3 herfini _ ile birlesdirin, butun herfler boyuk sriftle yazilsin:
select UPPER(substr(first_name,1,3) || '_' || substr(first_name,-3)) as yekun_ad
from hr.employees

-- Sual 6
--- yazda ise baslayan iscilere 500 azn bonus, yayda baslayanlara 1000 azn bonus
-- qisda ise baslayan iscilere 1500 azn bonus, payizda ise baslayanlar ise oldugu kimi qalsin
select first_name, to_char(hire_date,'mm'), salary,
CASE WHEN to_char(hire_date,'mm') in (3,4,5) THEN salary+500
    WHEN to_char(hire_date,'mm') in (6,7,8) THEN salary+1000
    WHEN to_char(hire_date,'mm') in (12,1,2) THEN salary+1500
ELSE salary END as yekun_maas
from hr.employees

-- Sual 7
-- ise baslama vaxti 2007 ci il olan iscilerin adini soyadini ve ise baslama vaxtini gosterin
select first_name, last_name, hire_date
from hr.employees
where to_char(hire_date,'yyyy')=2007

-- Sual 8
--commission pct si olmayan yeni null olanlara 0 yazilsin
select commission_pct, nvl(commission_pct,0)
from hr.employees

-- Sual 9
--commission pct si olmayanlara 0 olanlara 1 yazilsin
select commission_pct, nvl2(commission_pct,1,0)
from hr.employees

-- Sual 10
-- ayin 20 si (istenilen ay ola biler) ise baslayan iscilerin melumatlarini gosterin
select *
from hr.employees
where to_char(hire_date,'dd')=20

-- Sual 11
-- 3 cu gun ise baslayan iscilerin adini soyadini ise baslama vaxtini ve heftenin gununu gosterin (wednesday)
select first_name, last_name, hire_date, to_char(hire_date,'day')
from hr.employees
where lower(to_char(hire_date,'day'))='wednesday'