-- scott

-- SELECT(데이터 조회)**
-- e : 임의 지정 별칭/ 없어도 가능
-- * : 전체 필드(컬럼)를 의미
SELECT * FROM EMP e;

-- 트정 컬럼에 해당하는 내용 보기 가능
--SELECT EMPNO, ENAME , JOB  FROM EMP e;

-- EMP 테이블
--EMPNO: 사원번호, ENAME: 이름, JOB: 직책, MGR: 매니저 번호, hireadate: 고용일, sale :급여, comm: 보너스, deptno: 부서번호

-- emt 사원번호 매니저 부서
SELECT
	EMPNO,
	MGR ,
	DEPTNO
FROM
	EMP e;

--부서 번호만 조회 단 중복 데이터 제외
SELECT DISTINCT 
	DEPTNO 
FROM
	EMP e;

-- 데이터 출력시 필드 별칭 부여
--쌍따음표는 별칭에 공백이 있는 경우 무조건 사용
--as는 생략 가능 
SELECT
	EMPNO AS 사원번호,
	MGR 메니저번호,
	DEPTNO "부서 번호"
FROM
	EMP e;

-- 연봉 계산
-- 월급 *12 = 수당
SELECT
	EMPNO AS "사원 번호" ,
	SAL  AS 수당,
	SAL  * 12 + COMM  AS "연봉"
FROM
	EMP e;

--정렬
-- order by 이후 정렬 기준  칼럼명 + DESC or ASC
-- DESC 내림, ASC 오름(dEFUALT)
SELECT
	*
FROM
	EMP e
ORDER BY	SAL  DESC;

-- EMP EMPNO, ENAME SAL 조회 단 EMP: 내림
SELECT
	EMPNO AS 사원번호,
	ENAME  이름,
	SAL "월급"
FROM
	EMP e
ORDER BY	EMPNO  DESC;

-- 정렬 조건 2개, 전체 조회 부서번호 오름, sal 내림
SELECT
	*
FROM
	EMP e
ORDER BY  DEPTNO ,SAL  DESC;

-- 조건
-- 부서번호 30 번인 사원 조회
-- 셀러리가 >1000 이상 사원 조회
-- = 같다 산술연산자 전부 가능
SELECT 
	*
FROM 
	EMP e
WHERE DEPTNO  = 30;

SELECT 
	*
FROM 
	EMP e
WHERE SAL >= 1000
ORDER BY SAL DESC ;
-- EMPNO 가 7781 사원 조회
SELECT 
	*
FROM 
	EMP e
WHERE EMPNO = 7782 ;
-- DEPTPNO 가 30번 이고 job이 salesman 
-- 데이터 는 대소문자 구분

SELECT 
	*
FROM 
	EMP e
WHERE DEPTNO  = 30  AND  JOB   = 'SALESMAN' ;

-- 사원번호가 7499 부서번호 30

SELECT 
	*
FROM 
	EMP e
WHERE DEPTNO  = 30  AND  EMPNO  = 7499 ;

-- 이거나 or
-- 부서번호가 30 이거나 직무가  SALEsMAN
SELECT 
	*
FROM 
	EMP e
WHERE DEPTNO  = 30  OR  JOB   = 'SALESMAN' ;

--  연봉이 36000 인 사원을 조회

SELECT
	*
FROM
	EMP e
WHERE  SAL  * 12 + COMM  =36000;

-- 문자 비교도 가능
SELECT
	*
FROM
	EMP e
WHERE  ENAME >='F';
-- SALE 이 3000이 아닌 사원
-- 부정문 !=, <>, ^=
SELECT
	*
FROM
	EMP e
WHERE  SAL  != 3000;

SELECT
	*
FROM
	EMP e
WHERE  SAL  <> 3000;

SELECT
	*
FROM
	EMP e
WHERE  SAL  ^= 3000;

-- job 이 메니저 거나 세일즈거나 cleark
SELECT
	*
FROM
	EMP e
WHERE  job  ='SALESMAN' OR JOB  = 'MANAGER' OR JOB = 'CLERK';
-- in
SELECT
	*
FROM
	EMP e
WHERE  job  IN ('SALESMAN','MANAGER','CLERK');

SELECT
	*
FROM
	EMP e
WHERE  job  NOT IN  ('SALESMAN','MANAGER','CLERK');

-- HIREDATE 가  1981 10 31 이후에 고용된 사원 조회
-- 날짜 데이터 산술 연산 가능 , 날짜 데이터 '' 처리
SELECT
	*
FROM
	EMP e
WHERE  HIREDATE  > '1981-10-31';

--simple BETWEEn a and b
--sale 이 2000이상 3000 이하 사원 조회

SELECT
	*
FROM
	EMP e
WHERE SAL  BETWEEN 2000 AND 3000;

SELECT
	*
FROM
	EMP e
WHERE SAL NOT BETWEEN 2000 AND 3000;
