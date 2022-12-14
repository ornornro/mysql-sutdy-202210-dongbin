/*=======<select>=======*/

select 
	id,
    `name`,
    age
from 
	`student_study_mst`
where 
	`name` like '%경%'
or  `name` like '경%';

select
	*
from
	student_study_mst
where
	age >= 25
and age < 30;

select
	*
from
	student_study_mst
where
	age between 25 and 30;
    
select
	*
from
	student_study_mst
where
	age not between 25 and 30;
    
select
	*
from
	student_study_mst
where
	not age = 25;
    
select
	*
from
	student_study_mst
where
	age is not null;