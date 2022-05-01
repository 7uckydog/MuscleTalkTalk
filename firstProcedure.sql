EXEC EX_PROC(1, 'TEST');

SELECT * FROM TB_PT_FILE;


DROP PROCEDURE PROC_INPUT_PT;

create or replace PROCEDURE PROC_INPUT_PT
(
    IN_TRAINER_NO IN VARCHAR2,
    IN_PT_NAME IN VARCHAR2,
    IN_PT_CATEGORY IN NUMBER,
    IN_PT_PRICE IN NUMBER,
    IN_PT_INTRODUCE IN VARCHAR2,
    IN_PT_INFORMATION IN VARCHAR2,
    IN_PT_TARGET_STUDENT IN VARCHAR2,
    IN_PT_NOTICE IN VARCHAR2,
    IN_PT_TRAINER_INFO IN VARCHAR2,
    IN PT_TIME_INFO
)

IS
    
BEGIN

    insert all
        into tb_pt(pt_no, trainer_no, pt_name, pt_category,
        pt_price, pt_introduce, pt_information, pt_target_student,
        pt_notice, pt_trainer_info, pt_time_info)
        values ((SELECT nvl(max(pt_no),0)+1 from tb_pt), ?, ?, ?, 
        ?, ?, ?, ?, 
        ?, ?, ?)
        into tb_pt_file (pt_file_no, pt_no, pt_file) 
        values ((SELECT nvl(max(pt_file_no),0)+1 from tb_pt_file), 
        (SELECT nvl(max(pt_no),0)+1 from tb_pt), ?) 
        into tb_pt_file (pt_file_no, pt_no, pt_file) 
        values ((SELECT nvl(max(pt_file_no),0)+2 from tb_pt_file), 
        (SELECT nvl(max(pt_no),0)+1 from tb_pt), ?) 
        into tb_pt_file (pt_file_no, pt_no, pt_file) 
        values ((SELECT nvl(max(pt_file_no),0)+3 from tb_pt_file), 
        (SELECT nvl(max(pt_no),0)+1 from tb_pt), ?) 
    select * from dual;
    dbms_output.put_line(SQL%ROWCOUNT);
    OUTPUT_PT_RESULT := SQL%ROWCOUNT;
    COMMIT;


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
    IN_END_DATE TIMESTAMP
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

END PROC_TEST;

EXEC PROC_TEST('월요일,9:00,16:00,수요일,9:00,16:00','2022-05-01 00:00:00','2022-08-10 23:00:00');

SET SERVEROUTPUT ON;
SELECT * FROM TB_PT_CALENDAR ORDER BY PT_CALENDAR_NO DESC;