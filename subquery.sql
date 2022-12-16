/*

	서브쿼리(하위쿼리)
    select 안에서 select 하는 방법

*/

/*

	문제: 서울대를 다니는 학생을 찾으세요.

*/

select
	*
from
	student_mst
where
	 school_id = 1; /* 1번이 서울대라고 알고있을때의 쿼리 */
     
select
	*
from
	student_mst sm
	left outer join school_mst scm on(scm.school_id = sm.school_id)
where
	scm.school_name like '서울대%'; /* 기존에 배운 방식을 활용한 정답 서브쿼리보다 join을 사용하는게 더 좋다 서브쿼리는 시간소요가 너무 길어서 웬만하면 사용X join 권장! */
    
select
	*
from
	student_mst
where
	school_id in (select
					school_id
				from
					school_mst
				where 
					school_name like '서울대%'
                or  school_name like '부산대%'); /* 서브쿼리를 활용한 해답 2개 이상의 값을 내주고싶을땐 = 대신 in */
                
select
	*
from
	student_mst
where
	school_id in(1,2); /* 1과 2의 값을 가지고 있다면 출력 */
    
select
	*,
    (select school_name from school_mst scm where scm.school_id = stm.school_id) as 번호
from
	student_mst stm;

set profilling = 1;
show profiles; /* 실행하는데 소요되는 시간을 알려준다 */

select
	count(*) as 총인원
from
	student_mst; /* 데이터의 전체 개수를 알려주는 함수 count() */

select
	*,
    (select
		count(*)
	from
		student_mst) as 총인원
from
	student_mst; 
    
select
	*
from
	student_mst sm
    left outer join (select count(*) as 총인원 from student_mst) sc on(1 = 1); /* 위와 동일한 결과를 내는 다른 식 */
    
show profiles;

/* 한 컬럼에는 데이터가 하나만 들어가야한다! */
