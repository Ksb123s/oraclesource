-- scott 권한부여
GRANT CONNECT, resource TO scott;
GRANT CREATE VIEW TO scott;

-- 데이터를 저장할 수 있는 저장공간과 할당
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
ALTER USER SCOTT QUOTA 10M ON USERS;

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;




/* DBA 권한을 가진 사용자만 사용자를 생성하고 권한 부여
 * SYSTEM, SYS AS SYSDBA
 * 
 * CREATE USER 아이디 IDENTIFIED BY 비밀번호;
 *  
 * 
 * 테이스 생성
 * 공통 사용자 또는 롤 이름이 부적합합니다.
 * 21c xe 요구사항
 * 
 */
CREATE USER c##test IDENTIFIED BY test;

/*create ssion 권한을 가지고 있지않음 : 로그온 거절
권한부여
SESSION , CREATE(USER,TABLE, SEQUENCE, VIEW...)
권한 그룹 => 롤
connect , RESOURCE
CONNECT (SESSION, CREATE , TABLE, CREATE VIEW.....)
RESOURCE( SEQUENCE, 프로시저, 테이블...)
권한부여 : GRANT 권한이름, ....(롤 이름) TO 사용자 아이디 ;
*/
GRANT CONNECT, resource TO c##test;

CREATE USER c##test2 IDENTIFIED BY test
DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP
QUOTA 10M ON USERS;

GRANT CONNECT, resource TO c##test2;


/*
 * revoke 취소할 권한 이름 ..... from  아이디 
 */

-- 비밀번호 변경
ALTER USER c##test2 IDENTIFIED BY TEST;