CREATE TABLE MOVIE(
MOVIE_NUM INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
RANK VARCHAR(10) NOT NULL,
TITLE VARCHAR(100) NOT NULL ,
IMAGE VARCHAR(200) ,
PERCENT VARCHAR(10) ,
LINK VARCHAR(100) ,
TICKETING VARCHAR(100)
);

-- INSERT
INSERT INTO MOVIE(RANK, TITLE, IMAGE, PERCENT, LINK,TICKETING)
VALUES('1','영화 테스트 제목입니다.','영화이미지','0.1','LINKTEST','TICKETING')

-- SELECT
-- 전체 조회
SELECT RANK,TITLE,IMAGE,PERCENT,LINK,TICKETING FROM MOVIE ORDER BY RANK DESC

-- DELETE
DELETE FROM MOVIE WHERE RANK