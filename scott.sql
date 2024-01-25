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

--like 연산자와 와일드 카드(_, %)
-- 사원이름이 s로 시작하는 사원을 조회
-- _: 문자하나
-- % : 무한대의 문자 개수 의미
SELECT
	*
FROM
	EMP e 
WHERE ENAME  LIKE 'S%'  ;

--사원이름이 두번째 글자가 L인 사원

SELECT
	*
FROM
	EMP e 
WHERE ENAME  LIKE '_L%'  ;

-- 사원 이름에 am 이라고 하는 문자가 포함 된 사원의 이름
SELECT
	*
FROM
	EMP e 
WHERE ENAME  LIKE '%AM%';

-- 사원 이름에 am 이라고 하는 문자가 포함 안된 사원의 이름
SELECT
	*
FROM
	EMP e 
WHERE ENAME  NOT LIKE '%AM%';
--
SELECT
	*
FROM
	EMP e ;
-- nule 값이 존재하지 x

--커미션이 nule 인 사원
--null 비교는 : is 
SELECT
	*
FROM
	EMP e 
WHERE  COMM  IS NULL ;
-- MGR 이 null 인 사원 조회
SELECT
	*
FROM
	EMP e 
WHERE  MGR  IS NULL ;
-- MGR 이 null 이 아닌 사원 조회
SELECT
	*
FROM
	EMP e 
WHERE  MGR  IS NOT  NULL ;

-- 집합 연산자
-- 교집합 : INTERSECT
-- 합집합 : UNION, UNION ALL
-- 차집합 : MINUS

--부서 번호가 10번 OR 20번인 사원을 조회하고자함

--질의 블록은 부정확한 수의 결과 열을 가지고 있습니다.
-- 집합 연산자는 UNION 을 사용할 때 출력 열 개수 , 타입 동일
SELECT
	EMPNO , ENAME , DEPTNO 
FROM
	EMP e 
WHERE  DEPTNO   = 10
UNION 
SELECT
	EMPNO , ENAME , DEPTNO 
FROM
	EMP e 
WHERE  DEPTNO   = 20;


SELECT
	EMPNO , ENAME , DEPTNO , SAL 
FROM
	EMP e 
WHERE  DEPTNO   = 10
UNION 
SELECT
	SAL ,JOB  , DEPTNO, SAL    
FROM
	EMP e 
WHERE  DEPTNO   = 20;
--UNION ALL : 중복된 결과 값 제거 안함
SELECT
	EMPNO , ENAME , SAL ,DEPTNO 
FROM
	EMP e 
WHERE  DEPTNO   = 10
UNION ALL 
SELECT
	EMPNO , JOB  , SAL ,DEPTNO 
FROM
	EMP e 
WHERE  DEPTNO   = 10;

-- 차집합
SELECT
	EMPNO , ENAME , SAL ,DEPTNO 
FROM
	EMP e 
MINUS  
SELECT
	EMPNO , ENAME  , SAL ,DEPTNO 
FROM
	EMP e 
WHERE  DEPTNO   = 10;

-- 교집합
SELECT
	EMPNO , ENAME , SAL ,DEPTNO 
FROM
	EMP e 
INTERSECT
SELECT
	EMPNO , ENAME  , SAL ,DEPTNO 
FROM
	EMP e 
WHERE  DEPTNO   = 10;


-- ORACLE FUNTION (내장형 함수[오라클 제공])
-- 함수는 사용하는 DBM 에 따라 다르게 제공
-- 1. 문자(열) 함수
-- 대소문자 변경  

-- upper(문자열): 괄호 안 문자를 모두 대문자로 변환	
-- LOWER(문자열): 괄호 안 문자를 모두 소문자로 변환
-- INITCAP(문자열) : 괄호 안 문자의 첫 글자를 대문자로 변환후 외 소문자
SELECT
	ENAME , UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)  
FROM
	EMP e ;

SELECT
	*  
FROM
	EMP e 
WHERE ENAME = UPPER('clark') ;	 

-- 2)문자열 길이 : LENGTH
-- LENGTHB (문자열): 문자열의 사용된 바이트 수 변환 

SELECT  ENAME , LENGTH(ENAME), LENGTHB(ENAME)
FROM EMP e ;
-- DUAL(TABLE): 함수 결과를 보고싶지만 테이블이 없는경우 사용 (임시 테이블)
SELECT  LENGTH('한글')
FROM DUAL ;
-- 한글의 문자 하나당 3BYTE 사용
SELECT  LENGTHB('한글')
FROM DUAL ;

-- 직체 이름이 6글자 이름 이상인  사원 조회
SELECT
	*  
FROM
	EMP e 
WHERE LENGTH (JOB) >=6 ;	 


--3) 문자열 일부 추출 : SUBSTR(문자열 데이터, 시작위치, 추출길이)
--						SUBSTR(문자열 데이터, 시작위치) : 시작 위치에서 마지막까지 추출
--						SUBSTR(문자열 데이터, -시작위치, 추출길이) : 역순으로 시작부터 마지막까지 추출
SELECT
	JOB , SUBSTR(JOB, 3, 2), SUBSTR(JOB, 1 , 2 ), SUBSTR(JOB, 5 )  
FROM
	EMP e  ; 
SELECT
	JOB , SUBSTR(JOB, -3, 2), SUBSTR(JOB, -1 , 2 ), SUBSTR(JOB, -5 )  
FROM
	EMP e  ; 

--4) INSTR(문자열데이터, 위치를 찾으려는 문자, 시작위치 ,시작위치에서 몇번째 위치)
-- 문자열 데이터 안에서 특정 문자 위치 찾기

SELECT
	INSTR('HELLO, ORACLE', 'L' )AS INSTR_1 ,
	INSTR('HELLO, ORACLE', 'L', 5 )AS INSTR_2,
	INSTR('HELLO, ORACLE', 'L', 2, 2 )AS INSTR_3
FROM
	DUAL ; 


-- 사원 이름에 S가들어 있는 사원
SELECT
	*  
FROM
	EMP e 
WHERE INSTR(ENAME , 'S') > 0  ;

-- 5)REPLACE: 특정 문자를 다른 문자로 대체
--			ERPLACE(문자열데이터, 찾는문자 , 변경할 문자)

SELECT  '010-1234-5678' AS REPLACE_BEFORE,
		REPLACE('010-1234-5678', '-', '') AS REPLACE_1,
		REPLACE('010-1234-5678', '-' ) AS REPLACE_2,
		REPLACE('010-1234-5678', '-', ' ') AS REPLACE_3
FROM DUAL;

--6) CONCAT(문자열 데이터1, 문자열 데이터 2) : 두 문자열 데이터를 합하는 함수
SELECT  CONCAT(EMPNO, ENAME), CONCAT(EMPNO, ENAME,JOB)  
FROM EMP e 
WHERE  ENAME = 'SMITH';


-- 7369: SMITH0
SELECT  CONCAT(EMPNO, CONCAT(' : ', ENAME)) 
FROM EMP e 
WHERE  ENAME = 'SMITH';


SELECT  EMPNO ||' : ' || ENAME 
FROM EMP e 
WHERE  ENAME = 'SMITH';

--7) TRIM(삭제옵션(선택), 삭제할 문자)	: 공백 제거 해주는 함수
-- 'SMITH' = "SMITH " 다른 문자열

SELECT '[' || ' __Oracle__ ' || ']' AS trim_bfore ,
		'[' || TRIM(' __Oracle__ ') || ']' AS trim_after
		FROM	dual;
		
SELECT '[' || '__Oracle__' || ']' AS trim_bfore ,
		'[' || TRIM(LEADING '_' FROM  '__Oracle__') || ']' AS trim_leading
FROM dual ;

SELECT '[' || '__Oracle__' || ']' AS trim_bfore ,
		'[' || TRIM(LEADING '_' FROM  '__Oracle__') || ']' AS trim_leading,
		'[' || TRIM(TRAILING '_' FROM  '__Oracle__') || ']' AS trim_TRAILing,
		'[' || TRIM(BOTH '_' FROM  '__Oracle__') || ']' AS trim_BOTH
FROM dual ;


SELECT '[' || ' __Oracle__ ' || ']' AS trim_bfore ,
		'[' || TRIM(' __Oracle__ ') || ']' AS trim_after,
		'[' || LTRIM(' __Oracle__ ') || ']' AS Ltrim_after,
		'[' || RTRIM(' __Oracle__ ') || ']' AS Rtrim_after
		FROM	dual;
		
	
--2. 숫자함수 : 숫자데이터에 적용하는 함수
-- 반올림 ROUND(숫자, 반올림위치 )
	
SELECT  ROUND(1234.5678) AS ROUND,
		ROUND(1234.5678, 0) AS ROUND1,
		ROUND(1234.5678, 1) AS ROUND2,
		ROUND(1234.5678, 2) AS ROUND3,
		ROUND(1234.5678, -1) AS ROUND4,
		ROUND(1234.5678, -2) AS ROUND5
FROM DUAL ;
-- 올림 CEIL(),FLOOR(숫자)
-- CEIL() : 지정한 숫자보다 큰 정수중 가장 작은 정수 반환
-- FLOOR(): 지정한 숫자보다 작은것중 가장 큰 정수 반환 
	SELECT CEIL(3.14), FLOOR(3.14) , CEIL(-3.14), FLOOR(-3.14) 
	FROM DUAL;
-- 버림 TRUNC(숫자 , 버릴위치)
SELECT TRUNC(1234.5678) AS TRUNC,
		TRUNC(1234.5678, 0) AS TRUNC1,
		TRUNC(1234.5678, 1) AS TRUNC2,
		TRUNC(1234.5678, 2) AS TRUNC3,
		TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
		TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL ;
-- 나머지 값 MOD()
SELECT 11/5, MOD(11,5)
FROM DUAL;


-- 3. 날짜함수
-- 23-01-24 OR 23/12/13

-- 오늘 날짜
SELECT  SYSDATE , CURRENT_DATE , CURRENT_TIMESTAMP 
FROM DUAL ;
-- 날짜데이터 +- 숫자 = 날짜데이터 보다 숫자 만큼 이후 OR 이전 날짜 
SELECT  SYSDATE , SYSDATE +1 , SYSDATE -1
FROM DUAL ;
--ADD_MONTH (): 몇개월 이후의 날짜 구하기
SELECT  SYSDATE , ADD_MONTHS(SYSDATE, 3) 
FROM DUAL ;

-- 입사 30주년이 되는 날짜 구하기
SELECT EMPNO , ENAME , ADD_MONTHS(HIREDATE, 360) 
FROM EMP e ;

--MONTH_BETWEEN(날짜, 날짜): 두 날짜간의 개월 수 차이 구하기 
--고용일과 오늘 날짜 차이 구하기
SELECT EMPNO , ENAME , SYSDATE  ,
MONTHS_BETWEEN(HIREDATE, SYSDATE)AS MONTH1 ,
MONTHS_BETWEEN(SYSDATE , HIREDATE)AS MONTH2,
TRUNC(MONTHS_BETWEEN(SYSDATE , HIREDATE)) 
FROM EMP e ;

-- NEXT_DAY(날짜, 요일) : 특정 날짜 기준으로 돌아오는 요일의 날짜 출력
-- LAST_DAY (날짜): 특정 날짜가 속한 달의 마지막 날짜

SELECT SYSDATE  ,NEXT_DAY(SYSDATE,'월요일'), LAST_DAY(SYSDATE)  
FROM DUAL;

-- 데이터 타입(자료형)
--NUMBER(숫자, 자릿수) ,VARCHAR2(문자), DATE(날짜/시간)
-- 데이터의 자료형 변환 EX) 날짜 -> 문자/ 문자 -> 숫자

-- NUMBER + 숫자문자 = 자동으로 형변환으로 계산 처리
SELECT 	 EMPNO , ENAME , EMPNO + '500'
FROM EMP e 
WHERE  ENAME = 'FORD';

--명시적으로 형변환
--TO_CHAR(날짜(숫자)데이터 , '출력되기를 원하는 문자 형태'): 숫자 ,날짜 데이터를 문자로 변환 /대부분 날짜데이터 사용
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'), SYSDATE,TO_CHAR(SYSDATE, 'YYYY/MM/DD HH/MI/SS PM') 
FROM	DUAL ;
--TO_NAUMBER(): 문자열 데이터를 지정한 형태의 숫자로 인식하여 숫자 테이터로 변환
SELECT 1300 -'1500', '1300' + 1500, 1500 - TO_NUMBER('1300') 
FROM	DUAL ;

SELECT '1300' -'1500'
FROM	DUAL ;

--9 : 숫자의 한 자릴르 의미함(빈자리를 채우지 않음)
--0 : 빈자리를 0으로 체움
SELECT TO_NUMBER('1,300', '999,999') + TO_NUMBER('1,500' ,'999,999') 
FROM	DUAL ;

SELECT TO_CHAR(SAL, '999,999.00') AS SAIL,
		TO_CHAR(SAL, '000,999,999.00') AS SAIL2
FROM EMP e 
--TO_DATE(문자, '인식될 날짜 형태'):문자 데이터를 날짜데이터로 변환

SELECT TO_DATE('2024-01-24') AS TODATE1,
		TO_DATE('20240124') AS TODATE2
FROM DUAL;

SELECT TO_DATE('2024-01-24') - TO_DATE('2023-12-31')
FROM DUAL;

--널처리 함수
-- 널 + 숫자 : NULL 
-- NULL를 다른 값으로 변환 해주는 함수  

SELECT EMPNO , ENAME , SAL ,COMM , SAL + COMM 
FROM EMP e ;
-- NVL(널인지 검사할 열이름(OR 데이터), 대체할 데이터) : NULL를 다른 값으로 변환 해주는 함수 
SELECT EMPNO , ENAME , SAL ,COMM , SAL +NVL(COMM, 0) 
FROM EMP e ;
--NVL2(널인지 검사할 열이름(데이터), NULL이 아닌경우 반환 데이터(계산식), NULL인 경우 반환 데이터(계산식))
SELECT EMPNO , ENAME , SAL ,COMM , NVL2(COMM, 'O','X') 
FROM EMP e ;
--NVL2 
-- COM 이 널이면 연봉 = SAL *12 널이 아니면  연봉 = SAL * 12 + COM	
SELECT  EMPNO , ENAME , SAL ,COMM , NVL2(COMM, SAL  * 12 + COMM, SAL * 12) AS "연봉"
FROM EMP e ;

--JOB 이 MANNAGER 라면 SAL * 1.1
--JOB 이 SALESMAN 이면 SAL * 1.05
--JOB 이 ANALIST 이면 SAL
-- 나머지 직무 SAL * 1.03

-- DECODE 함수 와 CASE
-- DECODE(검사대상, 조건1, 조건1이참일때 결과 , 조건2 , 조건1이 참일떄 결과 , ~ , 그외 결과값)
SELECT  
	ENAME ,
	EMPNO ,
	JOB , 
	SAL ,
	CASE 
		JOB WHEN 'MANAGER' THEN SAL * 1.1
		WHEN 'SALESMAN' THEN SAL * 1.05
		WHEN 'ANALYST' THEN SAL 
		ELSE SAL * 1.03
	END AS UPSAL2,
	DECODE(JOB, 'MANAGER', SAL * 1.1, 'SALESMAN', SAL * 1.05, 'ANALYST', SAL, SAL * 1.03) AS UPSAL
FROM
	EMP e ;

-- COM 널일때 해당사항 없음
-- 0 일떄 수당 없음
-- >0 일당 있음
SELECT  
	ENAME,
	EMPNO,
	COMM, 
	CASE 
		WHEN COMM IS NULL THEN '0000'
		WHEN COMM = 0 THEN '수당 없음'
		WHEN COMM > 0 THEN '수당 :' || COMM
	END AS COMM_TEXT
FROM
	EMP e ;

-- 실습
SELECT  
	EMPNO ,
	ENAME,
	SAL,
	TRUNC((SAL / 21.5), 2)AS DAY_PAY,
	ROUND((SAL / 21.5 / 8), 1) AS TIME_PAY
FROM
	EMP e ;

SELECT  
	EMPNO ,
	ENAME,
	TO_CHAR(HIREDATE) ,
	 TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3), '월요일'))AS R_JOB,
	DECODE(COMM, NULL	, 'N/A', COMM ) AS COMM 
FROM
	EMP e ;

-- EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.
--직속상관의 사원 번호가 존재하지 않을 경우 : 0000
--직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
--직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
--직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
--직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
--그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력
SELECT  
	ENAME,
	EMPNO,
	TO_CHAR(MGR)AS mgr,
	CASE 
		WHEN MGR IS NULL THEN '0000'
		WHEN MGR LIKE '75%'  THEN '5555'
		WHEN MGR LIKE '76%' THEN '6666'
		WHEN MGR LIKE '77%'  THEN '7777'
		WHEN MGR LIKE '78%'  THEN '8888'
		ELSE TO_CHAR(MGR) 
	END AS CHG_MGR
FROM
	EMP e ;

SELECT  
	ENAME,
	EMPNO,
	TO_CHAR(MGR)AS MGR ,
	CASE SUBSTR(TO_CHAR(NVL(MGR, 0)), 1 ,2)
		WHEN  '0'THEN '0000'
		WHEN '75%'  THEN '5555'
		WHEN '76%' THEN '6666'
		WHEN '77%'  THEN '7777'
		WHEN  '78%'  THEN '8888'
		ELSE TO_CHAR(MGR) 
	END AS CHG_MGR
FROM
	EMP e ;

SELECT TO_char` (REPLACE('6666' , ',', '')) FROM DUAL;

-- 다중 행 함수
-- SUM(), AVG(), COUNT(), MAX(), MIN()

--단일 그룹의 그룹 함수가 아닙니다(여러행이 나올 수 있는 칼럼을 추가한 경우)
SELECT SUM(SAL), AVG(SAL), COUNT(SAL), MAX(SAL),MIN(SAL)  ,ENAME 
FROM EMP e ;

-- 동일한 급여를 하나만 선택해서 합계
SELECT SUM(DISTINCT SAL)
FROM EMP e ;

SELECT COUNT(*)
FROM EMP e ;
--부서번호 30인 사원 출력

SELECT COUNT(*)
FROM EMP e 
WHERE DEPTNO  = 30;

--부서번호 30인 사원 중에서 급여의 최대값

SELECT MAX(SAL)
FROM EMP e 
WHERE DEPTNO  = 30;
-- 부서번호가 20인 사원의 입사일 중에서 제일 최근 입사일
SELECT MAX(TO_CHAR(HIREDATE))
FROM EMP e 
WHERE DEPTNO  = 20;

-- 부서번호가 20인 사원의 입사일 중에서 제일 오래된 입사일
SELECT MIN (TO_CHAR(HIREDATE))
FROM EMP e 
WHERE DEPTNO  = 20;

-- 부서번호가 30 인 사원중에서 SAL 의 중복값을 제거후 평균
SELECT AVG(DISTINCT SAL) AS '평균'
FROM EMP e 
WHERE DEPTNO  = 30;


-- 부서별 급여 합계
SELECT SUM( SAL) 
FROM EMP e 
WHERE DEPTNO  = 10 
UNION
SELECT SUM( SAL) 
FROM EMP e 
WHERE DEPTNO  = 20
UNION
SELECT SUM( SAL) 
FROM EMP e 
WHERE DEPTNO  = 30;

-- 결과 값을 원하는 열로 묶기 : groUP BY ¹
--SELECT 보고싶은 칼럼                              1
--FROM 테이블 명									2
--WHERE 조건들 나열									3
--GROUP BY 구룹화할 열 이름...( HAVING - OPTION )	4
--ORDER BY 정렬조건									5

-- 2 -> 3 -> 4 -> HAVING - > 1 -> 5  순서~

SELECT DEPTNO , SUM(SAL)  
FROM EMP e 
GROUP BY DEPTNO ;

-- 부서별 급여 평균
SELECT DEPTNO , TRUNC(AVG(SAL), 1)  
FROM EMP e 
GROUP BY DEPTNO ;

--부서 번호 , 직무별 급여 평균
SELECT DEPTNO ,JOB, TRUNC(AVG(SAL), 1)  
FROM EMP e 
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO ;

--부서별 직원수 구하기 (부서번호의 ㅗ오름차순)
SELECT DEPTNO , COUNT (DEPTNO)  
FROM EMP e 
GROUP BY DEPTNO 
ORDER BY DEPTNO ;
--부서별 평균 급여(부서번호의 ㅗ오름차순)
SELECT DEPTNO , ROUND(AVG( SAL), 0)  
FROM EMP e 
GROUP BY DEPTNO 
ORDER BY DEPTNO ;
--동일한 직무를 가진 사원들의 총 수 조회
SELECT JOB  , COUNT(JOB)  
FROM EMP e 
GROUP BY JOB  
ORDER BY JOB  ;

-- 부서별 직책의 평균 급여가 500 이상 사원들의 부서변호, 직책, 부서별 직책 평균 급여
-- HAVING : GROUP BY 절에 조건을 사용할 때
SELECT DEPTNO ,JOB , TRUNC(AVG(SAL)) AS avg_sal 
FROM EMP e  
GROUP BY DEPTNO ,JOB HAVING TRUNC(AVG(SAL), 1) >= 500 
ORDER BY DEPTNO ,JOB  ;

SELECT DEPTNO ,JOB , TRUNC(AVG(SAL)) AS avg_sal 
FROM EMP e  
WHERE SAL <= 3000
GROUP BY DEPTNO ,JOB HAVING TRUNC(AVG(SAL), 1) >=2000 

--같은 직무의 종사하는 사원이 3명 이상인 직무와 인원수 조회
SELECT JOB , COUNT (JOB) 
FROM EMP e  
GROUP BY JOB HAVING COUNT (JOB) >=3
ORDER BY JOB  ;

--사원들의 입사연도 기준으로 부서별 몇명 입사했는지 조회
SELECT TO_CHAR(HIREDATE, 'YYYY')AS HIRE_YEAR , DEPTNO , COUNT (*)  AS  인원수
FROM EMP e  
GROUP BY TO_CHAR(HIREDATE, 'YYYY') ,DEPTNO 
ORDER BY TO_CHAR(HIREDATE, 'YYYY') ;

--JOIN : 여러 테이블읋 하나의 테이블처럼 사용
-- 1) 내부조인(일치하는 값이 있는경우)

--EMP와 EMPT 연결

SELECT *
FROM EMP e , DEPT d 
WHERE E.DEPTNO  = D.DEPTNO ;

--열의 정의가 애매합니다(조인 할 경우 테이블에 동일한 컬럼명이 존제하는경우)
SELECT e.ename, e.sal , d.DEPTNO , d.DNAME , d.LOC 
FROM EMP e , DEPT d 
WHERE E.DEPTNO  = D.DEPTNO ;

--조인 조건을 주지않으면 오류는 없지만 나올수있는 모든 조합 출력
SELECT e.ename, e.sal , d.DEPTNO , d.DNAME , d.LOC 
FROM EMP e , DEPT d 

SELECT e.ename, e.sal , d.DEPTNO , d.DNAME , d.LOC 
FROM EMP e , DEPT d 
WHERE E.DEPTNO  = D.DEPTNO  AND e.SAL  >= 3000;


--SQL-99 표준구문(join ~on)
SELECT e.ename, e.sal , d.DEPTNO , d.DNAME , d.LOC 
FROM EMP e INNER JOIN  DEPT d  ON E.DEPTNO  = D.DEPTNO
WHERE  e.SAL  >= 3000;

--emp, salgrade
SELECT
	*
FROM
	EMP e ,
	SALGRADE s
WHERE
	e.SAL BETWEEN s.LOSAL AND s.HISAL ;

--emp ,emp 조인
SELECT
	e.empno,
	e.ename,
	e.MGR ,
	E2.ENAME AS MGR_NAME
FROM
	EMP e ,
	EMP e2
WHERE
	e.mgr = e2.EMPNO ;

--2) 외부조인
-- (1) 왼쪽 외부조인
-- (2) 오른쪽 외부조인

SELECT
	e.empno,
	e.ename,
	e.MGR ,
	E2.ENAME AS MGR_NAME
FROM
	EMP e
LEFT OUTER JOIN EMP e2 ON
	e.mgr = e2.EMPNO ;

SELECT
	e.empno,
	e.ename,
	e.MGR ,
	E2.ENAME AS MGR_NAME
FROM
	EMP e
RIGHT OUTER JOIN EMP e2 ON
	e.mgr = e2.EMPNO ;

--각 부서별 평균 급여 , 최대급여 ,최소급여, 사원수
-- 부서번호, 부서명 ,평균 급여 , 최대급여 ,최소급여, 사원수

--GROUP BY 표현식이 아닙니다. 
--Group by 옆에 오는 칼럼만 select 적에 사용 가능
SELECT
	e.DEPTNO ,
	d.DNAME ,
	Min(SAL),
	MAX(sal),
	count(*)
FROM
	EMP e
JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
GROUP BY
	e.DEPTNO,
	d.DNAME ;

-- 3개의 테이블을 조인

SELECT
	*
FROM
	EMP e
JOIN EMP e2 ON
	e.empno = e2.EMPNO
JOIN EMP e3 ON
	e2.empno = e3.EMPNO;

-- 모든 부서 정보와 사원 번호를 출력
-- 부서번호, 사원번호 순 정렬 출력
-- dept 테이블 기준 출력
-- 부서번호, 부서명, 사원번호, 사원명 ,직무 ,급여
SELECT
	d.DEPTNO ,
	d.DNAME ,
	e.EMPNO  ,
	e.ENAME,
	e.JOB ,
	e.SAL  
FROM
	EMP e
RIGHT JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
GROUP BY   
	d.DEPTNO,
	d.DNAME,
	e.EMPNO  ,
	e.ENAME,
	e.JOB ,
	e.SAL  ;
	
-- 모든 부서 정보와 사원 번호를 출력
-- 부서번호, 사원번호 순 정렬 출력
-- dept 테이블 기준 출력
-- 부서번호, 부서명, 사원번호, 사원명 ,직무 ,급여, losal, hisal, grade
SELECT
	d.DEPTNO ,
	d.DNAME ,
	e.EMPNO ,
	e.ENAME,
	e.JOB ,
	e.SAL,
	s.LOSAL ,
	s.HISAL ,
	s.GRADE
FROM
	DEPT d
LEFT JOIN EMP e ON
	e.DEPTNO = d.DEPTNO
LEFT JOIN SALGRADE s ON
	e.SAL BETWEEN s.LOSAL AND s.HISAL
GROUP BY   
	d.DEPTNO,
	d.DNAME,
	e.EMPNO ,
	e.ENAME,
	e.JOB ,
	e.SAL ,
	s.LOSAL ,
	s.HISAL ,
	s.GRADE ;