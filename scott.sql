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
	

--서브 쿼리
--괄호로 묶어서 사용 
--메인쿼리의 비교 대상과 같은 자료형과 같은 개수로 지정
--SQL 문 안에 내부에서 SELECT 문을 사용

-- jones 사원의 급여보다 높은 급여를 받는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	SAL >(
	SELECT
		SAL
	FROM
		EMP e
	WHERE
		ENAME = 'JONES');
	
--	ALLEN 이 받는 COMM 보다 많이 받는 사람
SELECT
	*
FROM
	EMP e
WHERE
	COMM  >(
	SELECT
		COMM
	FROM
		EMP e
	WHERE
		ENAME = 'ALLEN');

	--	WARD 보다 빠른 입사자
	
	SELECT
	*
FROM
	EMP e
WHERE
	HIREDATE  <(
	SELECT
		HIREDATE 
	FROM
		EMP e
	WHERE
		ENAME = 'WARD');
		
--	20번 부서에 속한 사원중  전체 사원의 평균 급여보다 높은 급여를 받는사원
SELECT
	E.EMPNO ,
	E.ENAME ,
	E.JOB ,
	E.SAL ,
	E.DEPTNO ,
	D.DNAME
FROM
	EMP e
JOIN DEPT d ON
	E.DEPTNO = D.DEPTNO
	AND E.DEPTNO = 20
	WHERE
	E.SAL >(
	SELECT
		AVG (SAL)
	FROM
		EMP e);
	
--단일행 서브쿼리 : 서브쿼리 실행 결과가 단 하나의 행으로 나오는 서브쿼리
--	사용 가능한 연산자: < ,>, <=, >= , !=, <>, ^= 

--단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
-- 서브쿼리 여러개의 결과값을 리턴하는데 단일행 서브쿼리에 다중행 서브쿼리에사용하는 연산자가 사용된경우
SELECT 
	*
FROM
	EMP e
WHERE
	SAL >= (
	SELECT
		MAX(SAL)
	FROM
		EMP
	GROUP BY
		DEPTNO )
-- 다중행 서브쿼리 : 서브쿼리 실행 결과가 여러개의 행으로 나오는 서브쿼리
--사용 가능한 연산자: 
-- IN , ANY(SOME):메인 쿼리의조건식을 만족하는 서브쿼리가 하나이상
-- ALL(메인쿼리의 조건식을 서브쿼리의 결과 모두 만족)
-- EXISTS(서브 쿼리의 결과가 존재하면)
	
-- IN 과 ANY 둘다 동일 한 효과
SELECT 
	*
FROM  
	EMP e
WHERE
	SAL in (
	SELECT
		MAX(SAL)
	FROM
		EMP
	GROUP BY
		DEPTNO )
-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 조회	
		
SELECT 
	*
FROM  
	EMP e
WHERE
	SAL < ANY (
	SELECT
		SAL
	FROM
		EMP
	WHERE
		DEPTNO = 30);
		
SELECT 
	*
FROM  
	EMP e
WHERE
	SAL < ALL (
	SELECT
		SAL
	FROM
		EMP
	WHERE
		DEPTNO = 30);

	
SELECT 
	*
FROM  
	EMP e
WHERE
	EXISTS  (
	SELECT
		DNAME
	FROM
		DEPT 
	WHERE
		DEPTNO = 20);
		
--실습 1		
SELECT 
	e.JOB ,
	e.EMPNO,
	e.ename,
	e.sal, 
	d.deptno,
	d.dname	
FROM  
	EMP e
JOIN DEPT d ON
	E.DEPTNO = D.DEPTNO
	WHERE
	E.job IN (
	SELECT
		job
	FROM
		EMP e
	WHERE ename = 'ALLEN');
--실습 2	
SELECT
	DISTINCT 
	e.EMPNO,
	e.ename, 
	d.dname ,
	e.HIREDATE ,
	d.LOC ,
	e.SAL ,
	s.grade
FROM  
	EMP e
JOIN DEPT d ON
	E.DEPTNO = D.DEPTNO
JOIN SALGRADE s ON
	e.SAL BETWEEN s.LOSAL AND s.HISAL
WHERE
	E.sal > ANY (
	SELECT
		avg(e.sal)
	FROM
		EMP e)
ORDER BY
		e.sal DESC, e.EMPNO ASC ;

	
-- 다중 열 서브쿼리
	
--부서별 급여 최댓값
SELECT
	*
FROM
	EMP e
WHERE
	(DEPTNO,
	SAL )
	IN(
	SELECT
		deptno,
		max(sal)
	FROM
		EMP e
	GROUP BY
		DEPTNO );
	
-- from절에 사용하는 서브쿼리(인라인 뷰)
	
SELECT E10.empno, e10.ename, e10.deptno, d.dname, d.loc 
FROM (SELECT *FROM EMP e  WHERE Deptno =10 ) E10,
	(SELECT * FROM DEPT d) d
WHERE e10.deptno = d.deptno;

-- select 절에 사용하는 서브 쿼리 (스칼라 서브쿼리)

SELECT
	EMPNO ,
	ENAME ,
	JOB ,
	sal,
	(
	SELECT
		GRADE
	FROM
		SALGRADE s
	WHERE
		E.sal BETWEEN s.losal AND s.hisal) AS salgrade
FROM
	EMP e;
	
-- DML (DATA MANIPUKATION LANGUAGE- 테이터 조작 언어)
-- SELECT(조회), INSERT(삽입), UPDATE(수정), DELETE(삭제)


-- 기존 테이블 복제해서 새로운 테이블 생성
CREATE  TABLE DEPT_TEMP AS SELECT * FROM DEPT ;

-- 새로운 부서 추가
-- INSERT INTO 테이블명(열이름1 , 열이름2```)
-- VALUES(데이터, 데이터...)

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES(60,'DATABASE', 'BUSAN');

INSERT INTO DEPT_TEMP 
VALUES(70,'DATABASE', 'BUSAN');

--값의 수가 충분하지 않습니다.
INSERT INTO DEPT_TEMP 
VALUES(80,'DATABASE', );

INSERT INTO DEPT_TEMP (DEPTNO, DNAME)
VALUES(80,'DATABASE');

--이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
INSERT INTO DEPT_TEMP (DEPTNO, DNAME)
VALUES(800,'DATABASE');

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES(80,'DATABASE', NULL);


CREATE  TABLE EMP_TEMP AS SELECT * FROM EMP ;


INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB,MGR, HIREDATE, SAL, COMM,DEPTNO)
VALUES(8000, 'HONG', 'MANAGER', 7902,'2015-03-15', 1000, NULL, 50);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB,MGR, HIREDATE, SAL, COMM,DEPTNO)
VALUES(9000, 'SONG', 'MANAGER', 7782,SYSDATE, 1200, 800, 50);

-- 테이블의 구조만 복사 
CREATE  TABLE EMP_TEMP2 AS SELECT * FROM EMP WHERE 1<>1;

-- UPDATE 테이블명 SET 수정할 내용들, ,,, ;
-- UPDATE 테이블명 SET 수정할 내용들, ,,, WHERE 조건;

UPDATE
	DEPT_TEMP
SET
	LOC = 'BUSAN'; 

UPDATE
	DEPT_TEMP
SET
	LOC = 'SEOUL'
WHERE
	DEPTNO = 50; 
	
UPDATE
	DEPT_TEMP
SET
	LOC = 'SEOUL', DNAME = 'NETWORK'
WHERE
	DEPTNO = 40; 
	

--삭제
-- DELETE 테이블명 WHRE 조건
-- DELETE FROM 테이블명 WHRE 조건
-- lcok => 한 세션에서 트랜잭션 작업이 완료되지 않으면 다른 세션에서 작업을 처리할 수 없는 상태(DML - insert, update, delete)

DELETE DEPT_TEMP WHERE DEPTNO = 20;

DELETE FROM  DEPT_TEMP WHERE DEPTNO = 30;

--서브쿼리 + DELETE

CREATE  TABLE EMP_TEMP3 AS SELECT * FROM EMP ;
-- 급여등급이 3등급이고 30부서의 사원 삭제

DELETE
FROM
	EMP_TEMP3
WHERE
	EMPNO IN (
	SELECT
		EMPNO
	FROM
		EMP_TEMP3 E
	JOIN SALGRADE s ON
		E.SAL BETWEEN S.LOSAL AND S.HISAL
		AND S.GRADE = 3
		AND E.DEPTNO = 30);
		
--	서브 쿼리 + 없데이트
UPDATE
	DEPT_TEMP
SET
	(DNAME,
	LOC) = (
	SELECT
		DNAME ,
		LOC
	FROM
		DEPT
	WHERE
		DEPTNO = 40)
WHERE
	DEPTNO = 40;

-- 서브쿼리 + INSERT
INSERT
	INTO
	EMP_TEMP3 (EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
SELECT
	E1.EMPNO,
	E1.ENAME,
	E1.JOB,
	e1.MGR,
	E1.HIREDATE,
	E1.SAL,
	E1.COMM,
	E1.DEPTNO
FROM
	EMP e1
JOIN SALGRADE s ON
	E1.SAL BETWEEN S.LOSAL AND S.HISAL
	AND S.GRADE = 1;
	

CREATE  TABLE EXAM_EMP AS SELECT * FROM EMP ;
CREATE  TABLE EXAM_DEPT AS SELECT * FROM DEPT ;
CREATE  TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE ;


INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES(80,'DATABASE', NULL);

INSERT
	INTO
	EXAM_EMP(EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
VALUES(7201, 'TEST_USER1', 'MANAGER', 7788,'2016-01-02', 4500, NULL, 50);
INSERT
	INTO
	EXAM_EMP(EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
VALUES(7202, 'TEST_USER2', 'CLERK', 7201,'2016-02-21', 1800,NULL , 50);
INSERT
	INTO
	EXAM_EMP(EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
VALUES(7203, 'TEST_USER3', 'ANALYST', 7201,'2016-04-11', 3400, NULL, 60);
INSERT
	INTO
	EXAM_EMP(EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201,'2016-05-31', 2700, 300, 60);
INSERT
	INTO
	EXAM_EMP(EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
VALUES(7205, 'TEST_USER5', 'CLERK', 7201,'2016-07-20', 2600, NULL, 70);
INSERT
	INTO
	EXAM_EMP(EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
VALUES(7206, 'TEST_USER6', 'CLERK', 7201,'2016-09-08', 2600,NULL , 70);
INSERT
	INTO
	EXAM_EMP(EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
VALUES(7207, 'TEST_USER7', 'LECTURER', 7201,'2016-10-28', 2300,NULL , 80);
INSERT
	INTO
	EXAM_EMP(EMPNO,
	ENAME,
	JOB,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
VALUES(7208, 'TEST_USER8', 'STUDENT', 7201,'2018-03-09', 1200,NULL , 80);



--3
UPDATE EXAM_EMP 
SET  DEPTNO = 70 
WHERE
	SAL > (
	SELECT
		AVG(SAL)
	FROM
		EXAM_EMP 
	WHERE
		DEPTNO = 50);
COMMIT;
-- 4
UPDATE EXAM_EMP 
SET  DEPTNO = 80 ,sal =  sal + sal * 1.1  
WHERE
	HIREDATE  > (
	SELECT
		min(HIREDATE)
	FROM
		EXAM_EMP 
	WHERE
		DEPTNO = 60);
COMMIT;
--5 
DELETE
FROM
	EXAM_EMP 
WHERE
	empno IN (
	SELECT
		empno
	FROM
		EXAM_EMP e 
	JOIN EXAM_SALGRADE  s ON
		E.SAL BETWEEN S.LOSAL AND S.HISAL
		AND S.GRADE = 5);








--tansaction
-- 하나의 작업 또는 밀접하게 연관되어 있는 작업 수행을 위해 나눌수 없는 최소 작업 단위
-- 최종반영(commit) , 모두 취소(rollback)
	
-- dbeaver 설정에서 커밋 모드 변경 가능
--auto commit 상태
	
INSERT INTO DEPT_TEMP  values(55, 'NETWORK', 'SEOUL');

UPDATE  DEPT_TEMP SET LOC ='BUSAN' WHERE DEPTNO = 55;

COMMIT;
ROLLBACK;  --commit 하기전에 실행 

SELECT  *FROM DEPT_TEMP dt ;

--oracle - commit, rollback 하기 쉬운 편

--mysql - mysql workbench, 에디터(auto 커밋)

DELETE  FROM  DEPT_TEMP  WHERE deptno = 55;
UPDATE DEPT_TEMP  SET DNAME  = 'WEB' WHERE DEPTNO  = 10;


--sql 1, DDl 정의 2. DML select, insert, update, delete, 3 . DCL(권한부여)

--데이터 정의어 (DDL)
-- 테이블 정의, 사용자 정의, 권한부여 (취소)
--create

--1 테이블 생성
--create table 테이블명(
-- 필드명 필드타입(크기) 제약조건,
--);
-- 열 이름 규칙
-- 문자로 시작 30byte 이하로 작성 / 한테이블 안 열 이름 중복 불가
-- 열 이름은 문자 , 0-9, 특수문자($,#, _) 사용가능
-- sql 키워드는 열 이름으로 사용 불가(order, group, select ...등)
CREATE TABLE EMP_DDL (
	EMPNO NUMBER(4),
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	hiredate DATE,
	sal number(7,2),
	comm number(7,2),
	DEPTNO number(2)
);

SELECT  * FROM EMP_DDL ed ;

--문자
-- 1) char 2) varchar2 3) NCHAR, 4) NVARCHAR 5) CLOB 6) NCLOB 7) LONG
--char or varchar : 열의 너비가 고정값인지 가변인지
-- char(10) : 'hong' 무조건 10자리 사용
-- varchar2(10): 'hong' 입력된 글자에 따라 가변
-- nchar(10) : ' hong' 유니코드 문자열 타입 , 고정
-- nvarchar2(10): 'hong' 유니코드 문자열 , 가변
--varchar2 ,char : 한글 영문 입력시 사용하는 바이트 수가 다른ㅁ
--nvarchar, nchar : 사용하는 바이트수 통일
-- clob : 문자열 데이터를 외부 파일로 저장 , 많은 텍스트 데이터 입력시 사용 (4기가)
-- long : 2기가


--숫자
--NUMBER(전체 자릿수, 소수점 자릿수)
--BINARY_FLOAT, BINARY_DOUBLE

--날짜


--기본 열 구조만 복사 후 새 테이블 생성
CREATE  TABLE EMP_TEMP2 AS SELECT * FROM EMP WHERE 1<>1;
SELECT  * FROM EMP_DDL ed ;

--DDL : CLEATE ALTER
--2 테이블 변경
--1) 열 추가
--ALTER TABLE 테이블 명 ADD 추가할 열이음 테이터타입(10)
--EMP_DDL 새로운 컬럼 추가 hp

ALTER TABLE EMP_DDL  ADD HP varchar2(15);

--2) 열 이름변경
-- ALTER TABLE 테이블 명 RENAME COLUMN 기존 이름  to 바꿀이름
-- hp -> MOBILE
ALTER TABLE EMP_DDL  RENAME COLUMN HP  to MOBILE;
--3) 열 자료형 변경
-- ALTER TABLE 테이블명 MODIFY 열이름 테이터타입(20)
-- EMPNO NUMBER(5)
ALTER TABLE EMP_DDL  MODIFY EMPNO NUMBER(5);


--4_) 열제거
-- ALTER TABLE 테이블명 DROP COLUMN 열이름;

ALTER TABLE EMP_DDL  DROP COLUMN MOBILE;

--테이블 이름 변경
--RENAME 변경전 테이블명 to 변경할 테이블명
--EMPDDL EMP ALTER
RENAME EMP_DDL TO EMP_ALTER;
SELECT * 
FROM EMP_ALTER ea ;

--삭제 : DROP
--DROP TABLE 테이블명
DROP TABLE EMP_ALTER ;


-- VIEW : 가상테이블

--CREATE VIEW 뷰이름 AS (SELECT * FROM 원본테이블명);
-- 권한 ㅏ진 사용자만 생성할수 있음
--VIEW 를 통해 원본 수정 가능
CREATE VIEW VM_EMP20 AS (SELECT * FROM EMP WHERE DEPTNO = 20);
SELECT * FROM VM_EMP20;

--VIEW 를 통해 데이터 삽입 시 원본에도 영향을 미침
INSERT INTO VM_EMP20 
valuES(8888,'HONG', 'ANALYST', 7902, SYSDATE, 2500, NULL, 20); 
SELECT * FROM VM_EMP20;
SELECT * FROM EMP;

SELECT * FROM USER_UPDATABLE_COLUMNS  WHERE TABLE_NAME = 'VM_EMP20';

--CREATE VIEW 뷰이름 AS (SELECT * FROM 원본테이블명) WITH READ ONLY;
--view 를통해서 읽기만 가능
CREATE VIEW VM_EMP30 AS (SELECT * FROM EMP WHERE DEPTNO = 30) WITH READ ONLY;
SELECT * FROM USER_UPDATABLE_COLUMNS  WHERE TABLE_NAME = 'VM_EMP30';

/* VIEW 삭제*/
DROP VIEW VM_EMP20 ;

/*    INDEX 생성 , 삭제
 * INDEX (색인, 목차)
 * 인덱스 : 기본키 ,고유키 일 떄 자동으로 생성됨
 * CREATE INDEX 인덱스명 ON 테이블명(인덱스로 사용할 필드명)
 * 
 */

CREATE INDEX IDX_EMP_SAL ON EMP(SAL);

SELECT *	FROM USER_IND_COLUMNS;

DROP INDEX IDX_EMP_SAL;

/*시퀀스 생성/삭제
 * 오라클 만의 객체
 * 오라클 객체 ,하나씩 증가하는 값이 필요 할 때 주로 사용
 * 다른 DB의 AUTO_INCREMENT 과 동일한 작업 
 * CREATE SEQUENCE 시퀀스명 INCREMENT BY 증감값 START WITH 시작값 MAXVALUE 최대값 MINVALUE 최소값 NOCYCLE CACHE 숫자; 
 */


/* 1에서 시작 ~ 99999999999999999999999999
 * 1식 증가하면서 숫자 생성
 */
CREATE SEQUENCE DEPT_SEQ;
SELECT  *FROM USER_SEQUENCES ;
DROP SEQUENCE DEPT_SEQ;

CREATE TABLE dept_sequence AS SELECT * FROM dept WHERE 1<>1;

CREATE SEQUENCE DEPT_SEQ INCREMENT BY 10 START WITH 10 MAXVALUE 90 MINVALUE 0 nocycle cache 2;

INSERT INTO dept_sequence(deptno, dname , loc)
VALues(DEPT_SEQ.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM dept_sequence;

ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE;

--마지막으로 생성된 시퀀스 확인
SELECT DEPT_SEQ.CURRVAL FROM DUAL;




/* 제약조건
 * 테이블의 특정 열에 지정
 * 1) NOT NULL : 열에 NULL 을 허용하지 않음
 * 2) UNIQUE : 지정한 열이 유일한 값을 가저야함(NULL 은 중복 시 따지지 않음)
 * 3) PRIMERY KEY : 지정한 열이유일한 값이면서 NULL 을 허용하지 않음(테이블달 하나만 지정)
 * 4) FOREIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력
 * 5) CHECK : 설정한 조건식을 만족하는 데이터만 입력
 */


-- NOT NULL
-- 열이름 부여시(컬럼명) : USER_NAME , USER_ID 등 대부분 _ 사용 (SNAKCASE)
CREATE TABLE TBL_NOTNULL(
	LOGIN_ID VARCHAR2(20) NOT NULL,
	LOGIN_PWD VARCHAR2(20) NOT NULL,
	TEL VARCHAR2(20) 
);


INSERT INTO TBL_NOTNULL  VALUES ('TESTID1', 'TESTID1', NULL);
SELECT * FROM TBL_NOTNULL ;
DELETE TBL_NOTNULL ;
--제약조건 확인

SELECT OWNER , CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;


CREATE TABLE TBL_NOTNULL2(
	LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNM2_LOGIN_NM NOT NULL,
	LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNM2_LOGPWD_NM NOT NULL,
	TEL VARCHAR2(20) 
);

SELECT * FROM TBL_NOTNULL ;

--  생성된 테이블에 제약조건 추가

ALTER TABLE TBL_NOTNULL MODIFY(TEL  NOT NULL);

ALTER TABLE TBL_NOTNULL2 MODIFY(TEL CONSTRAINT TBLNM2_TEL_NM NOT NULL);

ALTER TABLE TBL_NOTNULL  MODIFY(TEL);
UPDATE TBL_NOTNULL  SET TEL = '010-1234-5678'
WHERE LOGIN_ID  = 'TESTID1'

-- 생성한 제약 조건 이름변경
ALTER TABLE TBL_NOTNULL2  RENAME CONSTRAINT TBLNM2_TEL_NM TO TBLNM2_TEL;

-- 생성한 제약 조건 삭제
ALTER TABLE TBL_NOTNULL2 DROP CONSTRAINT TBLNM2_TEL;

-- UNIQUE : 중복되지 않는 값

CREATE TABLE TBL_UNIQUE(
	LOGIN_ID VARCHAR2(20)  UNIQUE,
	LOGIN_PWD VARCHAR2(20)  NOT NULL,
	TEL VARCHAR2(20) 
);


-- 데이터 무결성 : 데이터 정확성 , 일관성을 보장해야 함 
--무결성 제약 조건(SCOTT.SYS_C008367)에 위배됩니다
INSERT INTO TBL_UNIQUE VALUES ('TESTID1', 'TESTID1', '010-1234-5678');

CREATE TABLE TBL_UNIQUE2(
	LOGIN_ID VARCHAR2(20) CONSTRAINT TBL_UNQ2_LG_ID UNIQUE,
	LOGIN_PWD VARCHAR2(20) CONSTRAINT TBL_UNQ2_PWD_NN  NOT NULL,
	TEL VARCHAR2(20) 
);

ALTER TABLE TBL_UNIQUE2 MODIFY(TEL UNIQUE);
ALTER TABLE TBL_UNIQUE MODIFY(TEL CONSTRAINT TBL_UNQ_TEL_UNQ UNIQUE);

ALTER TABLE TBL_UNIQUE DROP CONSTRAINT  TBL_UNQ_TEL_UNQ;

/* PRIMARY KEY (PK) : 기본키
 * 인덱스 설정 자동으로 만들어짐
 * NOT NULL + UNIQUE => 회원 아이디, 이메일 ,상품코드 , 글번호 ... 등등등 
 */

CREATE TABLE TBL_PRIMARY(
	LOGIN_ID VARCHAR2(20) PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) NOT NULL,
	TEL VARCHAR2(20) 
);

INSERT
	INTO
	TBL_PRIMARY(LOGIN_ID,
	LOGIN_PWD,
	TEL)
VALUES ('TESTID1',
'TESTPWD',
'010-1234-5678');


/* FOEIGN KEY (외래키) : 특정 테이블의 기본키로 지정한 열을 다른 테이블의 특정 열에서 참조
 * 부모키 / 자식키
 */


CREATE TABLE DEPT_FK(
	DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK  PRIMARY KEY,
	DNAME VARCHAR2(20),
	LOC VARCHAR2(20)
);

CREATE TABLE EMP_FK (
	EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK  PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	hiredate DATE,
	sal number(7,2),
	comm number(7,2),
	DEPTNO number(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO)
);
-- 부모(참조 대상 테이블 )/ 자식 (참조하는 테이블)
--무결성 제약조건(SCOTT.EMPFK_DEPTNO_FK)이 위배되었습니다- 부모 키가 없습니다
INSERT INTO EMP_FK VALUES (1000, 'HONG', 'CLERK', 7788, SYSDATE , 1200, NULL, 50);

INSERT INTO DEPT_FK VALUES (50, 'DATABASE', 'SEOUL');
--무결성 제약조건(SCOTT.EMPFK_DEPTNO_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다(참조하는 테이블의 자식 DELETE)
DELETE FROM DEPT_FK  WHERE DEPTNO = 50;


/* FOREIGN KEY
 * 1) ON DELETE CSACADE : 부모가 삭제되면 자식도 같이 삭제
 * 2) ON DELETE SET NULL : 부모가 삭제되면 자식이 참조하는 부모의 값을 NULL 변경
 */
CREATE TABLE EMP_FK2 (
	EMPNO NUMBER(4) CONSTRAINT EMPFK2_EMPNO_PK  PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	hiredate DATE,
	sal number(7,2),
	comm number(7,2),
	DEPTNO number(2) CONSTRAINT EMPFK2_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO) ON DELETE CASCADE
);



INSERT INTO EMP_FK2 VALUES (1000, 'HONG', 'CLERK', 7788, SYSDATE , 1200, NULL, 50);
-- 부모가 제거되면서 자식도 같이 제거
DELETE FROM DEPT_FK  WHERE DEPTNO = 50;
DROP TABLE EMP_FK2;
CREATE TABLE EMP_FK3 (
	EMPNO NUMBER(4) CONSTRAINT EMPFK3_EMPNO_PK  PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	hiredate DATE,
	sal number(7,2),
	comm number(7,2),
	DEPTNO number(2) CONSTRAINT EMPFK3_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO) ON DELETE SET NULL
);

INSERT INTO EMP_FK3 VALUES (1000, 'HONG', 'CLERK', 7788, SYSDATE , 1200, NULL, 50);

INSERT INTO DEPT_FK VALUES (50, 'DATABASE', 'SEOUL');

DELETE FROM DEPT_FK  WHERE DEPTNO = 50;

SELECT * FROM EMP_FK3 ef ; 

--5) CHECK : 열에 저장할 수 있는 값의 범위 혹은 패턴 정의

CREATE TABLE TBL_CHECK(
	LOGIN_ID VARCHAR2(20) PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_PWD_CK CHECK(LENGTH(LOGIN_PWD) > 3),
	TEL VARCHAR2(20) 
);
-- 체크 제약조건(SCOTT.TBLCK_PWD_CK)이 위배되었습니다
INSERT INTO TBL_CHECK tc  VALUES ('TESTID1', '123',NULL);

CREATE TABLE TBL_CHECK2(
	LOGIN_ID VARCHAR2(20) PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK2_PWD_CK CHECK(LENGTH(LOGIN_PWD) > 3),
	GRADE VARCHAR2(10) CONSTRAINT TBLCK2_GRADE_CK CHECK(GRADE IN ('SILVER', 'GOLD', 'VIP')),
	TEL VARCHAR2(20) 
);
--체크 제약조건(SCOTT.TBLCK2_GRADE_CK)이 위배되었습니다
INSERT INTO TBL_CHECK2 VALUES ('TESTID1', '1234','DIAMOND',NULL);

--DEFAULT : 기본값 주기
CREATE TABLE TBL_DEFAULT(
	LOGIN_ID VARCHAR2(20) PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
	TEL VARCHAR2(20) 
);
INSERT INTO TBL_DEFAULT VALUES ('TESTID1', '4687', NULL);
INSERT INTO TBL_DEFAULT(LOGIN_ID, TEL) VALUES ('TESTID1','010-1234-5678');



-- TEST 한빛마트

--업체
CREATE TABLE TBL_EMPLOYEMENT(
	EMPLOYEMENT_ID VARCHAR2(20) CONSTRAINT TBLEM_EMID_EM PRIMARY KEY,
	EMPLOYEMENT_NAME VARCHAR2(10) NOT NULL,
	TEL VARCHAR2(20) NOT NULL,
	LOC VARCHAR2(20)NOT NULL,
	MANAGER VARCHAR2(20) NOT NULL
);
INSERT INTO TBL_EMPLOYEMENT VALUES(1000, '오리온','010-1234-5678','대전', '홍길동' );

--제품
CREATE TABLE TBL_PRODUCT(
	PRODUCT_ID NUMBER(20)  CONSTRAINT TBLPD_ID_PD PRIMARY KEY,
	EMPLOYEMENT_ID VARCHAR2(20) CONSTRAINT TBL_PRODUCT_FK REFERENCES TBL_EMPLOYEMENT(EMPLOYEMENT_ID) ON DELETE CASCADE,
	PNAME  VARCHAR2(20) NOT NULL,
	AMOUNT  NUMBER NOT NULL,
	PRICE  NUMBER NOT NULL,
	SUPPLY_DATE  DATE NOT NULL,
	SUPPLY_AMOUNT  NUMBER NOT NULL
);

CREATE SEQUENCE PRODUCT_SEQ;


INSERT INTO TBL_PRODUCT(PRODUCT_ID ,
	EMPLOYEMENT_ID ,
	PNAME  ,
	AMOUNT  ,
	PRICE  ,
	SUPPLY_DATE  ,
	SUPPLY_AMOUNT)
	VALUES(PRODUCT_SEQ.NEXTVAL, 1000, '초코파이', 100, 5500, '2024-01-02', 500);
SELECT *FROM TBL_PRODUCT ;

--고객
CREATE TABLE TBL_CLIENT(
	LOGIN_ID VARCHAR2(20)  CONSTRAINT TBLCL_ID_CL PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) NOT NULL,
	NAME VARCHAR2(20) NOT NULL,
	AGE NUMBER(3) CHECK (AGE > 0),
	JOB VARCHAR2(15) ,
	GRADE VARCHAR2(10) DEFAULT 'SILVER' CHECK(GRADE IN ('SILVER', 'GOLD', 'VIP')),
	POINT NUMBER(8) DEFAULT 0
);
--VALUE
INSERT INTO TBL_CLIENT(LOGIN_ID,LOGIN_PWD ,NAME ,AGE, JOB, GRADE,POINT)  VALUES ('TESTID1','1234', 'HONG', 12,'학생', 'SILVER', 0);

--주문
CREATE TABLE TBL_ORDER(
	ORDER_ID NUMBER CONSTRAINT TBL_ORDER_ID_PK PRIMARY KEY,
	CLIENT_ID VARCHAR2(10) CONSTRAINT TBL_ORDER_CLIENT_FK REFERENCES TBL_CLIENT(LOGIN_ID) ON DELETE CASCADE,
	CODE_ID  NUMBER CONSTRAINT TBL_ORDER_CODE_FK REFERENCES TBL_PRODUCT(PRODUCT_ID) ON DELETE CASCADE,
	ORDER_AMOUNT NUMBER(20)NOT NULL,
	LOC VARCHAR2(20) NOT NULL,
	ORDER_DATE DATE NOT NULL
);
DROP TABLE TBL_ORDER;
--주문
CREATE SEQUENCE ORDER_SEQ;

INSERT INTO TBL_ORDER(ORDER_ID, CLIENT_ID, CODE_ID, ORDER_AMOUNT , LOC, ORDER_DATE) VALUES(ORDER_SEQ.NEXTVAL,'TESTID1',  2, 5, '대전', '2024-01-12'); 
SELECT * FROM TBL_ORDER ;
-- 게시글
CREATE TABLE TBL_POST(
	POST_CODE NUMBER(5) CONSTRAINT TBL_POST_ID_PK PRIMARY KEY,
	CLIENT_ID VARCHAR2(10)CONSTRAINT TBL_POST_CID_FK REFERENCES TBL_CLIENT(LOGIN_ID) ON DELETE CASCADE,
	TITLE VARCHAR2(30) NOT NULL,
	DETAIL VARCHAR2(100) NOT NULL,
	DATE_CREATE DATE NOT NULL
)

CREATE SEQUENCE POST_SEQ;

INSERT INTO TBL_POST VALUES(POST_SEQ.NEXTVAL, 'TESTID1', '1234', 'ASDFASDFASDFASDF', '2024-01-21');
INSERT INTO TBL_POST VALUES(POST_SEQ.NEXTVAL, 'TESTID1', '1W234', 'ASDFWWWASDFASDFASDF', '2024-01-22');

SELECT * FROM TBL_POST;


--제약조건
CREATE TABLE DEPT_FK2(
	EMPNO NUMBER(4) CONSTRAINT EMPFK2_EMPNO_PK  PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	hiredate DATE,
	sal number(7,2),
	comm number(7,2),
	DEPTNO number(2) ,
	CONSTRAINT EMPFK2_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT_FK(DEPTNO) 

) ;