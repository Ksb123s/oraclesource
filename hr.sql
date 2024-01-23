--EMPLOYEES 테이블에서 전체 조회
SELECT
	*
FROM
	EMPLOYEES e ;
	
--EMPLOYEES 에서 퍼스트네임 라스트네임, 잡아이디
SELECT
	FIRST_NAME , LAST_NAME , JOB_ID 
FROM
	EMPLOYEES e ;
	
-- 사원번호가 176 인 사람의 last name과 DEaprtment 아이디 조회
SELECT
	LAST_NAME ,
	DEPARTMENT_ID ,
	EMPLOYEE_ID 
FROM
	EMPLOYEES e 
WHERE EMPLOYEE_ID  = 176
-- 연봉이 12000dltkd 되는 직원들의 LASTNAME  및 SALARY 조회

SELECT
	LAST_NAME ,
	SALARY  
FROM
	EMPLOYEES e 
WHERE SALARY >= 12000;
-- 연봉이 5000 에서 12000의 범위 외 사람들의 LASTNAME  과 SALARTY조회
SELECT
	LAST_NAME ,
	SALARY  
FROM
	EMPLOYEES e 
WHERE SALARY < 5000 or SALARY  > 12000;

--부서번호가 20 or 50 에서 근무하는 사원들의 라스트네임 , 디파트먼트 아이디
SELECT
	LAST_NAME ,
	DEPARTMENT_ID 
FROM
	EMPLOYEES e 
WHERE DEPARTMENT_ID  IN (20,50);
--부서번호가 20 or 50 에서 근무하는 사원들의 라스트네임 , 디파트먼트 아이디
SELECT
	LAST_NAME ,
	DEPARTMENT_ID 
FROM
	EMPLOYEES e 
WHERE DEPARTMENT_ID  IN (20,50) ORDER BY LAST_NAME ASC , DEPARTMENT_ID ASC ;
--커미션을 버는 모든 사원들의 라스트네임 셀러리 commision_PCT 조회
SELECT
	LAST_NAME ,
	SALARY ,
	COMMISSION_PCT 
FROM
	EMPLOYEES e 
WHERE COMMISSION_PCT  NOT IN  (0) ORDER BY LAST_NAME DESC , SALARY  DESC, COMMISSION_PCT DESC;
-- salary가 2500,3500,7000 이 아니며 job 이 SA_REP 나 ST_CLERK 사원조회
SELECT
	*
FROM
	EMPLOYEES e 
WHERE SALARY NOT IN  (2500, 3500, 7000) AND JOB_ID  IN ('SA_REP', 'ST_CLERK');

-- 2017-01-01 ~ 2017-11-31 사이에 고용된 사원들의  라스트네임 , employ id , HIRE date
SELECT
	LAST_NAME ,
	EMPLOYEE_ID ,
	HIRE_DATE 
FROM
	EMPLOYEES e 
WHERE HIRE_DATE BETWEEN  '2017-01-01' AND  '2017-12-31' ORDER  BY HIRE_DATE DESC ;

-- 부서번호가 20/50 에서 근무하고 , 연봉이 5000~12000 사이인 사원들의 LAST_NAME, SALARY
-- 셀러리 오름차순
SELECT
	LAST_NAME ,
	SALARY ,
	DEPARTMENT_ID 
FROM
	EMPLOYEES e 
WHERE DEPARTMENT_ID  IN (20,50) and SALARY  BETWEEN  5000 AND  12000 ORDER  BY SALARY  ASC  ;


SELECT
	LAST_NAME ,
	SALARY ,
	DEPARTMENT_ID 
FROM
	EMPLOYEES e 
WHERE  SALARY NOT  BETWEEN  5000 AND  12000 ORDER  BY SALARY  ASC  ;

