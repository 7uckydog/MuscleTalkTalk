EXEC EX_PROC(1, 'TEST');

SELECT * FROM TB_PT_FILE;


DROP PROCEDURE PROC_INPUT_PT;

create or replace PROCEDURE PROC_INPUT_PT
(
    IN_TRAINER_NO IN VARCHAR2,  /* 1 */
    IN_PT_NAME IN VARCHAR2,     /* 2 */
    IN_PT_CATEGORY IN NUMBER,   /* 3 */
    IN_PT_PRICE IN NUMBER,      /* 4 */
    IN_PT_INTRODUCE IN VARCHAR2,    /* 5 */
    IN_PT_INFORMATION IN VARCHAR2,  /* 6 */
    IN_PT_TARGET_STUDENT IN VARCHAR2,   /* 7 */
    IN_PT_NOTICE IN VARCHAR2,   /* 8 */
    IN_PT_TRAINER_INFO IN VARCHAR2, /* 9 */
    IN_PT_TIME_INFO IN VARCHAR2,    /* 10 */
    IN_PT_START_DATE IN VARCHAR2,   /* 11 */
    IN_PT_END_DATE IN VARCHAR2,     /* 12 */
    IN_PT_FILE_PATH1 IN VARCHAR2,   /* 13 */
    IN_PT_FILE_PATH2 IN VARCHAR2,   /* 14 */
    IN_PT_FILE_PATH3 IN VARCHAR2,   /* 15 */
    OUT_PT_RESULT OUT NUMBER        /* 16 */    
)

IS
    TYPE TABLE_TYPE IS TABLE OF VARCHAR2(10)
        INDEX BY BINARY_INTEGER;
    ALL_DAY VARCHAR2(200);
    ARRAY_IDX NUMBER;
    ALL_DAY_INDEX NUMBER;
    ALL_DAY_DAY VARCHAR2(20);
    DATE_TABLE_DAY TABLE_TYPE;
    DATE_TABLE_START TABLE_TYPE;
    DATE_TABLE_END TABLE_TYPE;
    VAR_CURRENT_TIMESTAMP TIMESTAMP;
    VAR_END_TIMESTAMP TIMESTAMP;
    PT_NO_MAX NUMBER;
BEGIN
    SELECT NVL(MAX(PT_NO), 0) + 1 INTO PT_NO_MAX FROM TB_PT WHERE 1=1;
    insert all
        into tb_pt(pt_no, trainer_no, pt_name, pt_category,
        pt_price, pt_introduce, pt_information, pt_target_student,
        pt_notice, pt_trainer_info, pt_time_info)
        values (PT_NO_MAX, IN_TRAINER_NO, IN_PT_NAME, IN_PT_CATEGORY, 
        IN_PT_PRICE, IN_PT_INTRODUCE, IN_PT_INFORMATION, IN_PT_TARGET_STUDENT, 
        IN_PT_NOTICE, IN_PT_TRAINER_INFO, IN_PT_TIME_INFO)
        into tb_pt_file (pt_file_no, pt_no, pt_file) 
        values ((SELECT nvl(max(pt_file_no),0)+1 from tb_pt_file), 
        PT_NO_MAX, IN_PT_FILE_PATH1) 
        into tb_pt_file (pt_file_no, pt_no, pt_file) 
        values ((SELECT nvl(max(pt_file_no),0)+2 from tb_pt_file), 
        PT_NO_MAX, IN_PT_FILE_PATH2) 
        into tb_pt_file (pt_file_no, pt_no, pt_file) 
        values ((SELECT nvl(max(pt_file_no),0)+3 from tb_pt_file), 
        PT_NO_MAX, IN_PT_FILE_PATH3) 
    select * from dual;
    dbms_output.put_line(SQL%ROWCOUNT);
    OUT_PT_RESULT := SQL%ROWCOUNT;
    COMMIT;
    
    ALL_DAY := IN_PT_TIME_INFO;
    ARRAY_IDX := 1;
    
    
    LOOP
        ALL_DAY_INDEX := INSTR(ALL_DAY,',');
        ALL_DAY_DAY := SUBSTR(ALL_DAY, 1, ALL_DAY_INDEX - 1);
        ALL_DAY := SUBSTR(ALL_DAY, ALL_DAY_INDEX + 1, LENGTH(ALL_DAY));
        DATE_TABLE_DAY(ARRAY_IDX) := ALL_DAY_DAY;
        
        ALL_DAY_INDEX := INSTR(ALL_DAY,',');
        ALL_DAY_DAY := SUBSTR(ALL_DAY, 1, ALL_DAY_INDEX - 1);
        ALL_DAY := SUBSTR(ALL_DAY, ALL_DAY_INDEX + 1, LENGTH(ALL_DAY));
        DATE_TABLE_START(ARRAY_IDX) := ALL_DAY_DAY;
        
        IF LENGTH(DATE_TABLE_START(ARRAY_IDX)) = 4 THEN
            DATE_TABLE_START(ARRAY_IDX) := '0' || DATE_TABLE_START(ARRAY_IDX);
        END IF;
        
        ALL_DAY_INDEX := INSTR(ALL_DAY,',');
        IF ALL_DAY_INDEX = 0 THEN
            DATE_TABLE_END(ARRAY_IDX) := ALL_DAY;
        ELSE
            ALL_DAY_DAY := SUBSTR(ALL_DAY, 1, ALL_DAY_INDEX - 1);
            ALL_DAY := SUBSTR(ALL_DAY, ALL_DAY_INDEX + 1, LENGTH(ALL_DAY));
            DATE_TABLE_END(ARRAY_IDX) := ALL_DAY_DAY;
        END IF;    
        
        IF LENGTH(DATE_TABLE_END(ARRAY_IDX)) = 4 THEN
            DATE_TABLE_END(ARRAY_IDX) := '0' || DATE_TABLE_END(ARRAY_IDX);
        END IF;

        
        ALL_DAY_INDEX := INSTR(ALL_DAY,',');

        ARRAY_IDX := ARRAY_IDX + 1;
        
        
    EXIT WHEN ALL_DAY_INDEX = 0;
    END LOOP;
    
    VAR_CURRENT_TIMESTAMP := TO_TIMESTAMP(IN_PT_START_DATE || ' 00:00:00');
    VAR_END_TIMESTAMP := TO_TIMESTAMP(IN_PT_END_DATE || ' 23:00:00');
    
    WHILE(VAR_CURRENT_TIMESTAMP < VAR_END_TIMESTAMP)
    LOOP
        FOR IDX IN 1..DATE_TABLE_DAY.COUNT LOOP
            IF TO_CHAR(VAR_CURRENT_TIMESTAMP, 'DAY') = DATE_TABLE_DAY(IDX) THEN
                IF TO_CHAR(VAR_CURRENT_TIMESTAMP, 'HH25:MI') >= DATE_TABLE_START(IDX) THEN
                    IF TO_CHAR(VAR_CURRENT_TIMESTAMP, 'HH25:MI') < DATE_TABLE_END(IDX) THEN
                        INSERT INTO TB_PT_CALENDAR 
                            (PT_CALENDAR_NO, PT_NO, MEMBER_NO, PT_CALENDAR_START_TIME, PT_CALENDAR_RESERVATION_STATE) 
                            VALUES 
                            ((SELECT nvl(max(pt_calendar_no),0)+1 from tb_pt_calendar), PT_NO_MAX, NULL, 
                            VAR_CURRENT_TIMESTAMP, DEFAULT);
                        COMMIT;
                        OUT_PT_RESULT := OUT_PT_RESULT + 1;
                    END IF;
                END IF;
            END IF;        
        END LOOP;
    VAR_CURRENT_TIMESTAMP := VAR_CURRENT_TIMESTAMP + 1/24;
    END LOOP;

END PROC_INPUT_PT;    

SELECT * FROM TB_PT_FILE;



SELECT * FROM TB_PT_FILE;


DECLARE
    RRRR varchar2(10);
BEGIN

    PROC_INPUT_PT (1, 'TEST3', RRRR);

    dbms_output.put_line('TEST::' || RRRR);
END;



DROP PROCEDURE PROC_TEST;
create or replace PROCEDURE PROC_TEST
(
    IN_DAY VARCHAR2,
    IN_START_DATE TIMESTAMP,
    IN_END_DATE TIMESTAMP,
    IN_DATE_TEST VARCHAR2
)
IS  
    TYPE TABLE_TYPE IS TABLE OF VARCHAR2(10)
        INDEX BY BINARY_INTEGER;
    TEST_ALL_DAY VARCHAR2(100);
    TEST_DAY VARCHAR2(20);
    TEST_DAY_INT NUMBER;
    TEST_INDEX NUMBER;
    TEST_TIMESTAMP TIMESTAMP;
    TEST_STR VARCHAR2(30);
    SELECT_INT NUMBER;
    TEST_TABLE_DAY TABLE_TYPE;
    TEST_TABLE_START TABLE_TYPE;
    TEST_TABLE_END TABLE_TYPE;
    VAR_CURRENT_TIMESTAMP TIMESTAMP;
    ARRAY_IDX NUMBER;
    PT_NO_MAX NUMBER;
    VAR_DATE_TEST TIMESTAMP;
BEGIN
    TEST_ALL_DAY := IN_DAY;
    ARRAY_IDX := 1;

    LOOP
        dbms_output.put_line('TEST LOOP');
        TEST_INDEX := INSTR(TEST_ALL_DAY,',');
        TEST_DAY := SUBSTR(TEST_ALL_DAY, 1, TEST_INDEX - 1);
        TEST_ALL_DAY := SUBSTR(TEST_ALL_DAY, TEST_INDEX + 1, LENGTH(TEST_ALL_DAY));
        TEST_TABLE_DAY(ARRAY_IDX) := TEST_DAY;
        
        TEST_INDEX := INSTR(TEST_ALL_DAY,',');
        TEST_DAY := SUBSTR(TEST_ALL_DAY, 1, TEST_INDEX - 1);
        TEST_ALL_DAY := SUBSTR(TEST_ALL_DAY, TEST_INDEX + 1, LENGTH(TEST_ALL_DAY));
        TEST_TABLE_START(ARRAY_IDX) := TEST_DAY;
        
        IF LENGTH(TEST_TABLE_START(ARRAY_IDX)) = 4 THEN
            TEST_TABLE_START(ARRAY_IDX) := '0' || TEST_TABLE_START(ARRAY_IDX);
        END IF;
        
        TEST_INDEX := INSTR(TEST_ALL_DAY,',');
        IF TEST_INDEX = 0 THEN
            TEST_TABLE_END(ARRAY_IDX) := TEST_ALL_DAY;
        ELSE
            TEST_DAY := SUBSTR(TEST_ALL_DAY, 1, TEST_INDEX - 1);
            TEST_ALL_DAY := SUBSTR(TEST_ALL_DAY, TEST_INDEX + 1, LENGTH(TEST_ALL_DAY));
            TEST_TABLE_END(ARRAY_IDX) := TEST_DAY;
        END IF;    

        
        TEST_INDEX := INSTR(TEST_ALL_DAY,',');

        ARRAY_IDX := ARRAY_IDX + 1;
    EXIT WHEN TEST_INDEX = 0;
    END LOOP;
    
    
    

    
    TEST_TIMESTAMP := TO_TIMESTAMP('2022-05-01' || TEST_ALL_DAY ||':00', 'YYYY-MM-DD HH24:MI:SS');

    dbms_output.put_line(TEST_TABLE_DAY(1) || TEST_TABLE_START(1) || TEST_TABLE_END(1));
    VAR_CURRENT_TIMESTAMP := IN_START_DATE;
    dbms_output.put_line(VAR_CURRENT_TIMESTAMP);


    dbms_output.put_line(IN_START_DATE);
    dbms_output.put_line(IN_END_DATE);
    

    
    WHILE(VAR_CURRENT_TIMESTAMP < IN_END_DATE)
    LOOP
        FOR IDX IN 1..TEST_TABLE_DAY.COUNT LOOP
            IF TO_CHAR(VAR_CURRENT_TIMESTAMP, 'DAY') = TEST_TABLE_DAY(IDX) THEN
                IF TO_CHAR(VAR_CURRENT_TIMESTAMP, 'HH25:MI') >= TEST_TABLE_START(IDX) THEN
                    IF TO_CHAR(VAR_CURRENT_TIMESTAMP, 'HH25:MI') < TEST_TABLE_END(IDX) THEN
                        dbms_output.put_line('TEST');
                        dbms_output.put_line(TO_CHAR(VAR_CURRENT_TIMESTAMP, 'YYYY-MM-DD HH25:MI:SS'));
                        INSERT INTO TB_PT_CALENDAR 
                            (PT_CALENDAR_NO, PT_NO, MEMBER_NO, PT_CALENDAR_START_TIME, PT_CALENDAR_RESERVATION_STATE) 
                            VALUES 
                            ((SELECT nvl(max(pt_calendar_no),0)+1 from tb_pt_calendar), 1, NULL, 
                            VAR_CURRENT_TIMESTAMP, DEFAULT);

                    END IF;
                END IF;
            END IF;        
        END LOOP;
    VAR_CURRENT_TIMESTAMP := VAR_CURRENT_TIMESTAMP + 1/24;
    END LOOP;
    
    VAR_DATE_TEST := TO_TIMESTAMP(IN_DATE_TEST || ' 23:23:23');
    dbms_output.put_line(VAR_DATE_TEST);
    
END PROC_TEST;

EXEC PROC_TEST('월요일,9:00,16:00,수요일,9:00,16:00','2022-05-01 00:00:00','2022-05-10 23:00:00','2022-05-05');

SET SERVEROUTPUT ON;
SELECT * FROM TB_PT_CALENDAR ORDER BY PT_CALENDAR_NO DESC;
SELECT * FROM TB_PT;
commit;