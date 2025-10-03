-- 데이터베이스 생성
CREATE DATABASE healthProject CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 사용자 계정 생성 (이미 있으면 생략 가능)
CREATE USER 'wade'@'%' IDENTIFIED BY 'password';

-- 권한 부여
GRANT ALL PRIVILEGES ON healthProject.* TO 'wade'@'%';
FLUSH PRIVILEGES;

USE healthProject;

-- 사용자
CREATE TABLE users (
    email        VARCHAR(100) PRIMARY KEY,
    username     VARCHAR(50) NOT NULL,
    password     VARCHAR(255) NOT NULL,
    joindate     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    goal         VARCHAR(50),
    gender       VARCHAR(10),
    age          INT,
    height       DECIMAL(5,2),
    activity     VARCHAR(20),
    photoid      INT,
    CONSTRAINT fk_users_photo FOREIGN KEY (photoid) REFERENCES userphoto(profileid)
);

-- 프로필 사진
CREATE TABLE userphoto (
    profileid    INT AUTO_INCREMENT PRIMARY KEY,
    profileurl   VARCHAR(255),
    originname   VARCHAR(255),
    uploadname   VARCHAR(255)
);

-- 체중 기록
CREATE TABLE weight (
    email       VARCHAR(100),
    weight      DECIMAL(5,2) NOT NULL,
    weightdate  DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (email, weightdate),
    CONSTRAINT fk_weight_user FOREIGN KEY (email) REFERENCES users(email)
);

-- 사진
CREATE TABLE photos (
    photoid     INT AUTO_INCREMENT PRIMARY KEY,
    photourl    VARCHAR(255),
    originname  VARCHAR(255),
    uploadname  VARCHAR(255)
);

-- 음식 정보
CREATE TABLE foodinfo (
    foodname       VARCHAR(100) PRIMARY KEY,
    calories       INT,
    carbohydrates  DECIMAL(5,2),
    proteins       DECIMAL(5,2),
    fats           DECIMAL(5,2)
);

-- 일기 (식단 기록)
CREATE TABLE diary (
    datano      INT AUTO_INCREMENT PRIMARY KEY,
    diarydate   DATE NOT NULL,
    history     TEXT,
    photoid     INT,
    email       VARCHAR(100),
    foodname    VARCHAR(100),
    CONSTRAINT fk_diary_user FOREIGN KEY (email) REFERENCES users(email),
    CONSTRAINT fk_diary_photo FOREIGN KEY (photoid) REFERENCES photos(photoid),
    CONSTRAINT fk_diary_food FOREIGN KEY (foodname) REFERENCES foodinfo(foodname)
);

-- 레시피
CREATE TABLE recipe (
    recipeno    INT AUTO_INCREMENT PRIMARY KEY,
    imgurl      VARCHAR(255),
    menuname    VARCHAR(100),
    rcalorie    INT,
    ingredient  TEXT,
    cooking     TEXT
);

-- 뉴스
CREATE TABLE news (
    newsid      INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(200),
    content     TEXT,
    link        VARCHAR(255),
    regdate     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 운동 카테고리
CREATE TABLE workcate (
    workcatename VARCHAR(100) PRIMARY KEY,
    mets         DECIMAL(4,2)
);

-- 운동
CREATE TABLE workout (
    workid       INT AUTO_INCREMENT PRIMARY KEY,
    workname     VARCHAR(100),
    workcategory VARCHAR(100),
    workvideoid  VARCHAR(100),
    description  TEXT
);

-- 운동 기록 (운동 일지)
CREATE TABLE workdiary (
    workdiaryid   INT AUTO_INCREMENT PRIMARY KEY,
    workcatename  VARCHAR(100),
    email         VARCHAR(100),
    worktime      INT,
    workdiarydate DATE NOT NULL,
    CONSTRAINT fk_workdiary_user FOREIGN KEY (email) REFERENCES users(email),
    CONSTRAINT fk_workdiary_cate FOREIGN KEY (workcatename) REFERENCES workcate(workcatename)
);

CREATE TABLE admin_user (
    adminid   INT AUTO_INCREMENT PRIMARY KEY,
    email     VARCHAR(100) UNIQUE,
    password  VARCHAR(255) NOT NULL,
    role      VARCHAR(20) DEFAULT 'ADMIN'
);


