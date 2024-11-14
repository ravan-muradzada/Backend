-- Sual 1:
-- eger iscinin 20 faiz artmis maaasi iscinin evvelki maasindan 2000 azn boyukdurse
-- o zaman iscinin tam adi, maasi ve maas ferqini gosterin
select first_name || ' ' || last_name as tam_ad, salary as maas, salary*1.2 as sonraki_maas, salary*0.2 as ferq
from hr.employees
where salary*1.2-salary>2000

-- Sual 2:
--hefte sonu ise baslayan iscilerin adini soyadini maasini, tecrube ilini, ise baslama vaxtini gosterin:
select first_name, last_name, salary, round(((sysdate-hire_date)/365),2) as tecrube_ili, hire_date, to_char(hire_date,'dy') as gun
from hr.employees
where lower(to_char(hire_date,'dy')) in ('sun','sat')

-- Sual 3:
--tam adinin uzunlugu 11 e beraber olan ve employee idsi tek reqem
--olan iscilerin, tam adini, tecrube ayini, maasini gosterin:
select first_name || ' ' || last_name as tam_ad, trunc(months_between(sysdate,hire_date)) as tecrube_ayi, salary
from hr.employees
where length(first_name || ' ' || last_name)=12
and mod(employee_id,2)=1

-- Sual 4:
--80-ci departamentin max ve min maasini ve onlar arasindaki ferqi gosterin
--ancaq minimum ve maksimum maas arasindaki ferq 7000 den cox olan iscilerin melumatlari gosterilsin:
select min(salary) as min, max(salary) as max, max(salary)-min(salary) as ferq
from hr.employees
where department_id=80 

-- Sual 5:
-- her job_idnin max minimum ve ortalama maasini gosterin
select job_id, max(salary), min(salary), avg(salary)
from hr.employees
group by job_id
order by 1

-- Sual 6:
-- job idsi ( it_prog, pu_man, fi_account) olan ve
-- ise baslama vaxti ayin 1 ci rubune tesaduf eden iscilerin maasini 500
-- ise balama vaxti ayin 2 ci rubune tesaduf eden iscilerin maasini ise 600 artirin:
select job_id, to_char(hire_date,'mm') as ise_baslama_ayi, salary, 
CASE WHEN lower(job_id) in ('it_prog','pu_man','fi_account') 
and to_char(hire_date,'mm') in (9,10,11,12,1,2) THEN salary+500
ELSE salary+600 END as result
from hr.employees

-- Sual 7:
--Adi E ile baslayan butun adlari ə ilə gosterin:
select first_name, replace(lower(first_name),'e','ə') 
from hr.employees
where lower(first_name) like 'e%'

-- Sual 8:
--nece departament oldugunu tapin ve eger her hansisa bir departamentin adi yoxdursa
--hemin bos sutuna melumat yoxdur yazilsin:
select count(*), nvl(department_name, 'melumat yoxdur') as result
from hr.departments
group by nvl(department_name, 'melumat yoxdur')
    
-- Sual 9:
-- nece departament oldugunu tapin ve bu defe departament idsi olmayan sutuna 0 qeyd edin:
select count(*), nvl(department_name, 0) as result
from hr.departments
group by nvl(department_name, 0)

-- Sual 10:
--employee_id si cut olan iscilerin adini soyadini ise baslama vaxtini ve tecrube ilini gosterin
select employee_id, first_name, last_name, hire_date, round(((sysdate-hire_date)/365),2) as tecrube_ili
from hr.employees
where mod(employee_id,2)=0