-- 데이터베이스 생성
CREATE DATABASE healthProject CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 사용자 계정 생성 (이미 있으면 생략 가능)
CREATE USER 'wade'@'%' IDENTIFIED BY 'password';
CREATE USER 'wade'@'127.0.0.1' IDENTIFIED BY 'password';
CREATE USER 'wade'@'localhost' IDENTIFIED BY 'password';

ALTER USER 'wade'@'localhost' IDENTIFIED BY 'password';
ALTER USER 'wade'@'%' IDENTIFIED BY 'password';
ALTER USER 'wade'@'127.0.0.1' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

-- 권한 부여
GRANT ALL PRIVILEGES ON healthProject.* TO 'wade'@'%';
GRANT ALL PRIVILEGES ON healthproject.* TO 'wade'@'localhost';
FLUSH PRIVILEGES;

SHOW VARIABLES LIKE 'pid_file';

USE healthProject;

-- =========================
-- 1. 기존 테이블 제거 (순서 주의)
-- =========================
-- 자식 테이블부터 제거
DROP TABLE IF EXISTS workdiary;
DROP TABLE IF EXISTS workout;
DROP TABLE IF EXISTS workcate;
DROP TABLE IF EXISTS weight;
DROP TABLE IF EXISTS diary;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS userphoto;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS foodinfo;

-- 관리자 전용 테이블
DROP TABLE IF EXISTS adminexercise;
DROP TABLE IF EXISTS adminrecipe;
DROP TABLE IF EXISTS adminnews;
DROP TABLE IF EXISTS adminuser;


-- =========================
-- 2. 테이블 생성
-- =========================

-- 📌 유저 프로필 사진
CREATE TABLE userphoto (
    profileid INT AUTO_INCREMENT PRIMARY KEY,
    profileurl VARCHAR(500),
    originname VARCHAR(255),
    uploadname VARCHAR(255)
);

-- 📌 사용자 정보
CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    joindate DATETIME DEFAULT CURRENT_TIMESTAMP,
    goal VARCHAR(100),
    goalsuccess TINYINT(1) DEFAULT 0,
    height INT,
    age INT,
    gender VARCHAR(10),
    activity VARCHAR(50),
    photoid INT,
    successdate DATE,
    CONSTRAINT fk_users_photo FOREIGN KEY (photoid)
        REFERENCES userphoto(profileid)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);



-- 📌 사용자 체중 기록
CREATE TABLE weight (
    weightid INT AUTO_INCREMENT PRIMARY KEY,
    weight DECIMAL(5,2) NOT NULL,
    weightdate DATE DEFAULT (CURRENT_DATE),
    email VARCHAR(255) NOT NULL,
    CONSTRAINT fk_weight_user FOREIGN KEY (email)
        REFERENCES users(email)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (email, weightdate)
);



-- 📌 사진 (Photos)
CREATE TABLE photos (
    photoid INT AUTO_INCREMENT PRIMARY KEY,
    photourl VARCHAR(500),
    originname VARCHAR(255),
    uploadname VARCHAR(255)
);



-- 📌 일기 (Diary)
CREATE TABLE diary (
    datano INT AUTO_INCREMENT PRIMARY KEY,
    diarydate DATE NOT NULL,
    history TEXT,
    photoid INT,
    email VARCHAR(255),
    foodname VARCHAR(100),
    CONSTRAINT fk_diary_photo FOREIGN KEY (photoid)
        REFERENCES photos(photoid)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT fk_diary_user FOREIGN KEY (email)
        REFERENCES users(email)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_diary_food FOREIGN KEY (foodname)
        REFERENCES foodinfo(foodname)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- 📌 뉴스
CREATE TABLE news (
    newsid INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(300),
    newsurl VARCHAR(500),
    content TEXT,
    newsdate VARCHAR(30),
    nimgurl VARCHAR(500)
);


-- 📌 레시피
CREATE TABLE recipe (
    recipeno INT AUTO_INCREMENT PRIMARY KEY,
    menuname VARCHAR(200),
    ingredient TEXT,
    imgurl VARCHAR(500),
    cooking TEXT,
    rcalorie INT,
    category VARCHAR(100)
);


-- 📌 운동 카테고리
CREATE TABLE workcate (
    catename VARCHAR(100) PRIMARY KEY,
    mets DECIMAL(5,2) NOT NULL
);


-- 📌 운동 (Workout)
CREATE TABLE workout (
    workoutid INT AUTO_INCREMENT PRIMARY KEY,
    catename VARCHAR(100),
    workoutname VARCHAR(100),
    kcal DECIMAL(6,2),
    photoid INT,
    workvideoid VARCHAR(100),
    CONSTRAINT fk_workout_catename FOREIGN KEY (catename)
        REFERENCES workcate(catename)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_workout_photo FOREIGN KEY (photoid)
        REFERENCES photos(photoid)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


-- 📌 운동 일지 (WorkDiary)
CREATE TABLE workdiary (
    workdiaryid INT AUTO_INCREMENT PRIMARY KEY,
    workcatename VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    worktime DECIMAL(5,2) NOT NULL,
    workdiarydate DATE DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_workdiary_catename FOREIGN KEY (workcatename)
        REFERENCES workcate(catename)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_workdiary_user FOREIGN KEY (email)
        REFERENCES users(email)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- 📌 음식 영양 정보
CREATE TABLE foodinfo (
    foodname VARCHAR(100) PRIMARY KEY,
    calories DECIMAL(7,2) NOT NULL,
    carbohydrates DECIMAL(7,2) NOT NULL,
    proteins DECIMAL(7,2) NOT NULL,
    fats DECIMAL(7,2) NOT NULL
);



-- =========================
-- 3. 관리자(Admin) 테이블
-- =========================

-- 📌 관리자 계정
CREATE TABLE adminuser (
    adminid      INT AUTO_INCREMENT PRIMARY KEY,
    email        VARCHAR(100),
    password     VARCHAR(255),
    regdate      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📌 관리자 레시피 관리
CREATE TABLE adminrecipe (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    recipeno     INT,
    note         TEXT,
    regdate      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_adminrecipe_recipe FOREIGN KEY (recipeno) REFERENCES recipe(recipeno)
);

-- 📌 관리자 뉴스 관리
CREATE TABLE adminnews (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    newsid       INT,
    note         TEXT,
    regdate      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_adminnews_news FOREIGN KEY (newsid) REFERENCES news(newsid)
);

-- 📌 관리자 운동 관리
CREATE TABLE adminexercise (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    workoutid    INT,
    note         TEXT,
    regdate      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_adminexercise_workout FOREIGN KEY (workoutid) REFERENCES workout(workoutid)
);


USE healthProject;

-- 1️⃣ 프로필 이미지 기본값
INSERT INTO userphoto (profileurl, originname, uploadname)
VALUES ('/uploads/profile/default.png', 'default.png', 'default.png');

-- 2️⃣ 사진 더미 (운동용/식단용)
INSERT INTO photos (photourl, originname, uploadname)
VALUES
('/uploads/workout/pushup.jpg', 'pushup.jpg', 'pushup.jpg'),
('/uploads/workout/running.jpg', 'running.jpg', 'running.jpg'),
('/uploads/diary/salad.jpg', 'salad.jpg', 'salad.jpg');

-- 3️⃣ 유저 (로그인 테스트용)
INSERT INTO users (email, username, password, goal, height, age, gender, activity, photoid)
VALUES ('as@as.as', 'Demo User', '1234', '체중 감량', 180, 29, 'M', '보통', 1);

-- 4️⃣ 몸무게 기록
INSERT INTO weight (weight, weightdate, email)
VALUES
(82.5, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 'as@as.as'),
(82.3, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'as@as.as'),
(82.1, CURDATE(), 'as@as.as');

-- 5️⃣ 운동 카테고리
INSERT INTO workcate (catename, mets)
VALUES
('걷기', 3.3),
('달리기', 7.5),
('수영', 6.0),
('요가', 2.5);

-- 6️⃣ 운동 리스트
INSERT INTO workout (catename, workoutname, kcal, photoid, workvideoid)
VALUES
('걷기', '빠르게 걷기 30분', 180.00, 1, 'yt-quick-walk'),
('달리기', '조깅 20분', 220.00, 2, 'yt-jog-20'),
('요가', '스트레칭 요가', 90.00, 1, 'yt-yoga-1');

-- 7️⃣ 운동 일지
INSERT INTO workdiary (workcatename, email, worktime, workdiarydate)
VALUES
('걷기', 'as@as.as', 0.5, CURDATE()),
('달리기', 'as@as.as', 0.3, CURDATE());

-- 8️⃣ 음식 영양정보
INSERT INTO foodinfo (foodname, calories, carbohydrates, proteins, fats)
VALUES
('닭가슴살', 165.00, 0.00, 31.00, 3.60),
('당근', 41.00, 9.58, 0.93, 0.24),
('양파', 40.00, 9.34, 1.10, 0.10),
('계란', 155.00, 1.10, 13.00, 11.00);

-- 9️⃣ 식단 일기
INSERT INTO diary (diarydate, history, email, foodname)
VALUES
(CURDATE(), '점심에 닭가슴살 샐러드', 'as@as.as', '닭가슴살'),
(CURDATE(), '아침에 계란과 당근 먹음', 'as@as.as', '계란');

-- 🔟 레시피
INSERT INTO recipe (menuname, ingredient, imgurl, cooking, rcalorie, category)
VALUES
('닭가슴살 샐러드', '닭가슴살, 양상추, 토마토, 오이, 드레싱', '/uploads/recipe/chicken-salad.jpg', '재료를 썰어 드레싱에 버무린다.', 320, '건강식'),
('야채볶음', '양파, 당근, 브로콜리, 간장, 올리브유', '/uploads/recipe/veggie-stirfry.jpg', '재료를 볶는다.', 250, '건강식');

-- 📰 뉴스
INSERT INTO news (title, newsurl, content, newsdate, nimgurl)
VALUES
('운동의 중요성', 'https://example.com/news1', '꾸준한 운동은 심혈관 건강에 도움이 됩니다.', '2025-10-01', '/uploads/news/news1.jpg'),
('단백질 섭취의 필요성', 'https://example.com/news2', '근육 회복에는 단백질이 필수입니다.', '2025-09-28', '/uploads/news/news2.jpg');


-- 로그인 테스트
SELECT * FROM users ;

-- 메인페이지용
SELECT * FROM recipe ORDER BY RAND() LIMIT 1;
SELECT * FROM workout ORDER BY RAND() LIMIT 1;
SELECT * FROM news ORDER BY RAND() LIMIT 1;

-- 다이어리 + 몸무게 차트 테스트
SELECT * FROM diary WHERE email='as@as.as';
SELECT * FROM weight WHERE email='as@as.as' ORDER BY weightdate DESC;
DESC workdiary;
ALTER TABLE workcate ADD COLUMN workcatename VARCHAR(100) GENERATED ALWAYS AS (catename) STORED;


 SELECT
        u.email AS email,
        u.username AS username,
        u.password AS password,
        u.joindate AS joindate,
        u.goal AS goal,
        u.goalsuccess AS goalsuccess,
        u.height AS height,
        u.age AS age,
        u.gender AS gender,
        u.activity AS activity,
        u.photoid AS photoid,
        u.successdate AS successdate
        FROM users u
        LEFT JOIN weight w ON u.email = w.email
        LEFT JOIN userphoto up ON u.photoid = up.profileid
        WHERE u.email = 'image@hanmail.net'
        ORDER BY w.weightdate DESC
        LIMIT 1;