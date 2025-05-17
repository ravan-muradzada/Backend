-- Sual 1
--iscilerin adini, maasini, emp idsini, dep idsini, dep adini, loc idsini, seherini
---gosterin, hardaki maasi 10000 den cox olsun, dep id si 90 ve 100 olsun ve loc id si 1700
--olsun.
select e.first_name, e.salary, e.employee_id, e.department_id, d.department_name, l.location_id, l.city
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
where e.salary>10000
and e.department_id in (90,100) 
and l.location_id=1700

-- Sual 2
--iscilerin adini soyadini dep idsini dep adini gosterin
---ancaq icinde (bas herfi ve son herfi de aiddir) d herfi olan adlar gosterilsin;
select e.first_name, e.last_name, e.department_id, d.department_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
where lower(first_name) like '%d%'

-- Sual 3 
--O iscilerin adini, soyadini, ilk 3 herfini(hamisi boyuk herfle), sondan 2ci herfini,
--- maaasini, tecrube gununu, tecrube ilini, department_id sini,
---dep adini, seherini gosterin ki, yalniz seheri London olsun:
select e.first_name, e.last_name, UPPER(substr(e.first_name,1,3)) as ilk_3, substr(e.first_name,-2) as son_2, e.salary, to_char(hire_date,'day') as gun, to_char(hire_date,'yyyy') as il, 
     e.department_id, d.department_name, l.city
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
where lower(l.city)='london'

-- Sual 4 
--emp idsi cut olan iscilerin maasini 100 azn
-- emp idsi tek olan iscilerin maasini ise 200 azn
--bonus elave edin
select employee_id, salary,
CASE WHEN mod(employee_id,2)=0 THEN salary+100
	ELSE salary+200 END as bonuslu_maas
from hr.employees


-- Sual 5 
--adindaki herflerin sayi cut olan adlari, hemin --iscilərin nece ay islediyini gosterin.
select first_name, length(first_name), round(months_between(sysdate, hire_date),2) as toplam_ay_sayi
from hr.employees
where mod(length(first_name),2)=0

-- Sual 6
-- iscilerin adini soyadini maasini emp idsini dep idsini dep adini location idsini sehrerini gosterin 
-- Ancaq seheri ancaq Oxford olsun
-- Maasi 6000 den yuxari olsun
-- Adi s ile baslasin 
select e.first_name, e.last_name, e.salary, e.employee_id, e.department_id, d.department_name, l.location_id, l.city
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
where lower(l.city)='oxford'
and salary>6000
and lower(first_name) like 's%'

-- Sual 7 
-- iscilerin adini soyadini dep idsini dep adini ( natural join le sadece joinle ve using join) istifade edərek gosterin
select e.first_name, e.last_name, e.department_id, d.department_name
from hr.employees e
natural join hr.departments d

select e.first_name, e.last_name, e.department_id, d.department_name
from hr.employees e
join hr.departments d
on e.department_id=d.department_id

select e.first_name, e.last_name, e.department_id, d.department_name
from hr.employees e
join hr.departments d
using (department_id)

-- Sual 8
--adi den olan iscinin adini soyadini maasini dep idsini dep adini gosterin
select e.first_name, e.last_name, e.salary, e.department_id, d.department_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
where lower(first_name)='den'