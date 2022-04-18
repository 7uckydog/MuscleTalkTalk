--회원 테이블 1~10 관리자 11~20 일반 회원
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'admin1', '1234', 'Admin1', 'admin1@gmail.com', '관리자', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'admin2', '1234', 'Admin2', 'admin2@gmail.com', '관리자', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);
    
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'admin3', '1234', 'Admin3', 'admin3@gmail.com', '관리자', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'admin4', '1234', 'Admin4', 'admin4@gmail.com', '관리자', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'admin5', '1234', 'Admin5', 'admin5@gmail.com', '관리자', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'admin6', '1234', 'Admin6', 'admin6@gmail.com', '관리자', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'admin7', '1234', 'Admin7', 'admin7@gmail.com', '관리자', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);
    
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'admin8', '1234', 'Admin8', 'admin8@gmail.com', '관리자', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'admin9', '1234', 'Admin9', 'admin9@gmail.com', '관리자', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'admin10', '1234', 'Admin10', 'admin10@gmail.com', '관리자', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'user1', '1234', '서유빈', 'user1@gmail.com', '서유빈', '010-0000-0000', 'F', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);
    
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'user2', '1234', '민승택', 'user2@gmail.com', '민승택', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);    
    
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'user3', '1234', '이진정', 'user3@gmail.com', '이진정', '010-0000-0000', 'F', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);
    
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'user4', '1234', '박재민', 'user4@gmail.com', '박재민', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'user5', '1234', '유저5', 'user5@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);  
    
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'user6', '1234', '유저6', 'user6@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);     

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'user7', '1234', '유저7', 'user7@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);  
    
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'user8', '1234', '유저8', 'user8@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);  

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'user9', '1234', '유저9', 'user9@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);  
    
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'user10', '1234', '유저10', 'user10@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, DEFAULT, DEFAULT, DEFAULT);  
    
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'trainer1', '1234', '트레이너1', 'trainer1@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, 'T', DEFAULT, DEFAULT);  
     
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'trainer2', '1234', '트레이너2', 'trainer2@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, 'T', DEFAULT, DEFAULT);  

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'trainer3', '1234', '트레이너3', 'trainer3@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, 'T', DEFAULT, DEFAULT);  
     
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'trainer4', '1234', '트레이너4', 'trainer4@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, 'T', DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'trainer5', '1234', '트레이너5', 'trainer5@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, 'T', DEFAULT, DEFAULT);  
     
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'trainer6', '1234', '트레이너6', 'trainer6@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, 'T', DEFAULT, DEFAULT);  

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'trainer7', '1234', '트레이너7', 'trainer7@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, 'T', DEFAULT, DEFAULT);  
     
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'trainer8', '1234', '트레이너8', 'trainer8@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, 'T', DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'trainer9', '1234', '트레이너9', 'trainer9@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, 'T', DEFAULT, DEFAULT);  
     
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME, MEMBER_EMAIL, MEMBER_NAME,
    MEMBER_PHONE, MEMBER_GENDER, MEMBER_AGE, MEMBER_HEIGHT, MEMBER_WEIGHT, MEMBER_PURPOSE, MEMBER_CONCERN, MEMBER_TRAINER, MEMBER_ABSENCE, MEMBER_JOIN_DATE) VALUES(
    (SELECT nvl(max(member_no),0)+1 from tb_member), 'trainer10', '1234', '트레이너10', 'trainer10@gmail.com', '아무개', '010-0000-0000', 'M', 0, 
    0, 0, 0, 0, 'T', DEFAULT, DEFAULT);
    
--운동
--가슴
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '벤치 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '인클라인 벤치 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '딥스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '체스트 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '펙 덱 플라이', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '인클라인 덤벨 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '푸쉬업', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '머신 플라이', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '케이블 플라이', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '케이블 크로스오버', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 플라이', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 벤치 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '인클라인 덤벨 벤츠 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 벤치 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '인클라인 체스트 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '디클라인 벤치 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '클로즈그립 벤치 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '웨이티드 딥스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '버터플라이', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '풀오버', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '인클라인 덤벨 플라이', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '정지 벤치 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '디클라인 덤벨 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '벤치 프레스 5T2P', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '벤치 프레스 3T1P', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '라슨 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스포토 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스탠딩 케이블 플라이 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '시티드 케이블 플라이 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '3:2:0 벤치 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '플랫 벤치 케이블 플라이', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '1CT 클로즈그립 벤치 프레스', 'C');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '팔로프 프리스 (1min)', 'C');



--등
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '랫 풀다운', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '풀업', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '시티드 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '원암 덤벨 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '시티드 케이블 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '암 풀다운', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '컨벤셔널 데드리프트', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '원암 시티드 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '루마니안 데드리프트', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '티바 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '펜들레이 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '어시스트 풀업', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '롱풀', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '클로즈그립 렛 풀다운', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '친업', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '케이블 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '풀다운', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '언더그립 풀다운', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '백 익스텐션', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스모 데드리프트', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '와이드그립 랫 풀다운', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '풀오버', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 데드리프트', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '턱걸이', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '케이블 원암 풀다운', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '렉풀', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '머신 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '인버티드 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '벤트오버 바벨 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '와이드그립 시티드 케이블 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '체스트 서포티드 덤벨 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '굿모닝', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '체스트 서포티드 덤벨 프론 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스티프레그 데드리프트', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '웨이티드 풀업', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '하이로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '벤트오버 덤벨 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '클로즈그립 풀다운', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '하이퍼 익스텐션', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '슈퍼맨', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '벨트리스 데드리프트', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '랙 친', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 프론 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '로우 로우', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '로우 머신', 'B');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '씰로우', 'B');
--하체
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스쿼트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '레그 익스텐션', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '레그 프레스', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '레그 컬', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '데드리프트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 스쿼트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '런지', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '프론트 스쿼트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '핵 스쿼트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스티프레그 데드리프트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '브이 스쿼트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '로우바 스쿼트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '카프 레이즈', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '하이바 스쿼트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '라이 레그 컬', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스모 데드리프트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 루마니안 데드리프트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스탠딩 카프 레이즈', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '시티드 레그 컬', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '파워레그프레스', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '레그컬', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '데드리프트(1인치 데피싯)', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '정지 스쿼트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '데드리프트(2초 정지)', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '시티드 카프 레이즈', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 워킹 런지', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '점프 스쿼트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스쿼트 3T1P', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '굿모닝', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스플릿 스쿼트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '렉 풀 데드리프트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스쿼트 5T2P', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '카프 프레스', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '컨벤셔널 데드리프트', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '시미스 런지', 'L');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '불가리안 스플릿 스쿼트', 'L');
--힙
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '이너 타이', 'H');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '아웃 타이', 'H');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '힙 어덕션', 'H');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '힙 쓰러스트', 'H');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덩키 킥', 'H');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '워킹 런지', 'H');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 런지', 'H');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '원 레그 데드리프트', 'H');
--어깨
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '사이드 레터럴 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '오버헤드 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '숄더 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '리버스 펙 덱 플라이', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '밀리터리 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 숄더 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '페이슬풀', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '벤트 오버 레터럴 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '프론트 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '비하인드 넥 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '아놀드 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '업라이트 로우', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '숄더 프레스 머신', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '리버스 플라이', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '시티드 덤벨 오버헤드 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 프론트 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 레터럴 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 슈러그', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '시티드 벤트오버 레터럴 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '슈러그', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스탠딩 바벨 오버헤드 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 숄더 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '스탠딩 밀리터리 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 슈러그', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '벤트오버 덤벨 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '정지 오버헤드 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '케이블 와이(Y) 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '푸쉬 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '케이블 45도 프론트 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '체스트 서포티드 덤벨 리어 델트 로우', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '체스트 서포티드 덤벨 델트 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '오버헤드 프레스 3T1P', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '시티드 벤트오버 리어 델트 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '핸드스탠드 푸쉬업', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '체스트 서포티드 덤벨 레터럴 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '벤트오버 덤벨 로우', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '러닝 덤벨 레터럴 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '오버헤드 프레스 5T2P', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '머신 숄더프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '사이드 레터럴 레이즈 머신', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '케이블 레터럴 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 프론트 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 프론트 레이즈', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '오버 헤드 프레스', 'S');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '파이크 푸쉬업', 'S');
--팔
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '케이블 푸쉬 다운', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '바벨 컬', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 컬', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '해머 컬', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '라잉 트라이셉스 익스텐션', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '이지바 컬', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '덤벨 킥백', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '프리쳐 컬', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '딥스', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '리스트 컬', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '케이블 킥백', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '인클라인 덤벨 컬', 'E');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '리버스 컬', 'E');
--복근
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '행잉 레그 레이즈', 'A');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '크런치', 'A');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '레그 레이즈', 'A');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '싯업', 'A');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '플랭크', 'A');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '로프 크런치', 'A');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '러시안 트위스트', 'A');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '사이드 플랭크', 'A');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), 'AB슬라이드', 'A');
--유산소
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '런닝머신', 'T');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '버피 테스트', 'T');
INSERT INTO TB_EXERCISE VALUES((SELECT nvl(max(exercise_no),0)+1 from tb_exercise), '사이클 머신', 'T');    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
--루틴
INSERT INTO TB_ROUTINE (ROUTINE_NO, MEMBER_NO, ROUTINE_NAME, ROUTINE_DISABLE, ROUTINE_TARGET, ROUTINE_CONTENT, ROUTINE_EXPLANATION) 
    VALUES ((SELECT nvl(max(ROUTINE_NO),0)+1 from TB_ROUTINE), 11, '서유빈루틴', DEFAULT, DEFAULT, '서유빈루틴 테스트용', NULL);
    
INSERT INTO TB_ROUTINE (ROUTINE_NO, MEMBER_NO, ROUTINE_NAME, ROUTINE_DISABLE, ROUTINE_TARGET, ROUTINE_CONTENT, ROUTINE_EXPLANATION) 
    VALUES ((SELECT nvl(max(ROUTINE_NO),0)+1 from TB_ROUTINE), 12, '민승택루틴', DEFAULT, DEFAULT, '민승택루틴 테스트용', NULL);    

INSERT INTO TB_ROUTINE (ROUTINE_NO, MEMBER_NO, ROUTINE_NAME, ROUTINE_DISABLE, ROUTINE_TARGET, ROUTINE_CONTENT, ROUTINE_EXPLANATION) 
    VALUES ((SELECT nvl(max(ROUTINE_NO),0)+1 from TB_ROUTINE), 13, '이진정루틴', DEFAULT, DEFAULT, '이진정루틴 테스트용', NULL);
    
INSERT INTO TB_ROUTINE (ROUTINE_NO, MEMBER_NO, ROUTINE_NAME, ROUTINE_DISABLE, ROUTINE_TARGET, ROUTINE_CONTENT, ROUTINE_EXPLANATION) 
    VALUES ((SELECT nvl(max(ROUTINE_NO),0)+1 from TB_ROUTINE), 14, '박재민루틴', DEFAULT, DEFAULT, '박재민루틴 테스트용', NULL);  
    





-- 개별 루틴목록
INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 1, 1, 1, 
    1, NULL, 1, 10, 50, 
    NULL, NULL, NULL, NULL, 
    1, DEFAULT);
    
INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 1, 1, 1, 
    1, NULL, 2, 10, 50, 
    NULL, NULL, NULL, NULL, 
    1, DEFAULT);
    
INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 1, 1, 1, 
    1, NULL, 3, 10, 50, 
    NULL, NULL, NULL, NULL, 
    1, DEFAULT);    

INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 14, 1, 1, 
    1, NULL, 1, 10, 50, 
    NULL, NULL, NULL, NULL, 
    2, DEFAULT);
    
INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 14, 1, 1, 
    1, NULL, 2, 10, 50, 
    NULL, NULL, NULL, NULL, 
    2, DEFAULT);
    
INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 14, 1, 1, 
    1, NULL, 3, 10, 50, 
    NULL, NULL, NULL, NULL, 
    2, DEFAULT);  

INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 1, 1, 3, 
    1, NULL, 1, 10, 50, 
    NULL, NULL, NULL, NULL, 
    1, DEFAULT);
    
INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 1, 1, 3, 
    1, NULL, 2, 10, 50, 
    NULL, NULL, NULL, NULL, 
    1, DEFAULT);
    
INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 1, 1, 3, 
    1, NULL, 3, 10, 50, 
    NULL, NULL, NULL, NULL, 
    1, DEFAULT);    

INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 14, 1, 3, 
    1, NULL, 1, 10, 50, 
    NULL, NULL, NULL, NULL, 
    2, DEFAULT);
    
INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 14, 1, 3, 
    1, NULL, 2, 10, 50, 
    NULL, NULL, NULL, NULL, 
    2, DEFAULT);
    
INSERT INTO TB_ROUTINE_EXERCISE (ROUTINE_EXERCISE_NO, EXERCISE_NO, ROUTINE_NO, ROUTINE_EXERCISE_DAY,
    ROUTINE_WEEK, ROUTINE_DAY, ROUTINE_EXERCISE_SET, ROUTINE_EXERCISE_REPEAT, ROUTINE_EXERCISE_WEIGHT, 
    ROUTINE_EXERCISE_TIME, ROUTINE_EXERCISE_DISTANCE, ROUTINE_EXERCISE_PERFORM_DAY, ROUTINE_EXERCISE_D_DAY, 
    ROUTINE_EXERCISE_SEQUENCE, ROUTINE_EXERCISE_COPY)
    VALUES ((SELECT nvl(max(ROUTINE_EXERCISE_NO),0)+1 from TB_ROUTINE_EXERCISE), 14, 1, 3, 
    1, NULL, 3, 10, 50, 
    NULL, NULL, NULL, NULL, 
    2, DEFAULT);  




INSERT INTO TB_EXERCISE_RECORD (RECORD_NO, 
    RECORD_START, RECORD_STOP, MEMBER_NO, ROUTINE_EXERCISE_NO)
    VALUES(
    (SELECT nvl(max(record_no),0)+1 from tb_exercise_record), 
    TO_DATE('20220418164000','YYYYMMDDHH24MISS'), TO_DATE('20220418165000','YYYYMMDDHH24MISS'), 11, 1
    );
    
INSERT INTO TB_EXERCISE_RECORD (RECORD_NO, 
    RECORD_START, RECORD_STOP, MEMBER_NO, ROUTINE_EXERCISE_NO)
    VALUES(
    (SELECT nvl(max(record_no),0)+1 from tb_exercise_record), 
    TO_DATE('20220418165500','YYYYMMDDHH24MISS'), TO_DATE('20220418170500','YYYYMMDDHH24MISS'), 11, 2
    );

INSERT INTO TB_EXERCISE_RECORD (RECORD_NO, 
    RECORD_START, RECORD_STOP, MEMBER_NO, ROUTINE_EXERCISE_NO)
    VALUES(
    (SELECT nvl(max(record_no),0)+1 from tb_exercise_record), 
    TO_DATE('20220418165500','YYYYMMDDHH24MISS'), TO_DATE('20220418170500','YYYYMMDDHH24MISS'), 11, 3
    );

INSERT INTO TB_EXERCISE_RECORD (RECORD_NO, 
    RECORD_START, RECORD_STOP, MEMBER_NO, ROUTINE_EXERCISE_NO)
    VALUES(
    (SELECT nvl(max(record_no),0)+1 from tb_exercise_record), 
    TO_DATE('20220418171500','YYYYMMDDHH24MISS'), TO_DATE('20220418172500','YYYYMMDDHH24MISS'), 11, 4
    );
    
INSERT INTO TB_EXERCISE_RECORD (RECORD_NO, 
    RECORD_START, RECORD_STOP, MEMBER_NO, ROUTINE_EXERCISE_NO)
    VALUES(
    (SELECT nvl(max(record_no),0)+1 from tb_exercise_record), 
    TO_DATE('20220418173500','YYYYMMDDHH24MISS'), TO_DATE('20220418174500','YYYYMMDDHH24MISS'), 11, 5
    );

INSERT INTO TB_EXERCISE_RECORD (RECORD_NO, 
    RECORD_START, RECORD_STOP, MEMBER_NO, ROUTINE_EXERCISE_NO)
    VALUES(
    (SELECT nvl(max(record_no),0)+1 from tb_exercise_record), 
    TO_DATE('20220418175500','YYYYMMDDHH24MISS'), TO_DATE('20220418180500','YYYYMMDDHH24MISS'), 11, 6
    );
    
SELECT * FROM TB_EXERCISE_RECORD;




































