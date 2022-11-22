CREATE TABLE REVIEW (
REVIEW_NUM INT AUTO_INCREMENT PRIMARY KEY,
REVIEW_STARRATE INT NOT NULL,
REVIEW_CONTENT TEXT NOT NULL,
REVIEW_DATE DATE DEFAULT NOW(),
USER_NUM INT NOT NULL,
MOVIE_NUM INT NOT NULL,
FOREIGN KEY(USER_NUM) REFERENCES USER_TBL(USER_NUM),
FOREIGN KEY(MOVIE_NUM) REFERENCES MOVIE(MOVIE_NUM)
);

-- CREATE
INSERT INTO REVIEW(REVIEW_STARRATE, REVIEW_CONTENT, USER_NUM, MOVIE_NUM)
VALUES(5, '재밌어요', 1, 2);

-- READ
SELECT * FROM REVIEW;

SELECT U.USER_ID, R.REVIEW_STARRATE, R.REVIEW_CONTENT, R.REVIEW_DATE
FROM REVIEW R
	INNER JOIN USER_TBL U
	ON R.USER_NUM=U.USER_NUM
WHERE R.MOVIE_NUM=2;

SELECT M.IMAGE, M.TITLE, R.REVIEW_NUM, R.REVIEW_STARRATE, R.REVIEW_CONTENT, R.REVIEW_DATE
FROM REVIEW R
	INNER JOIN MOVIE M
	ON R.MOVIE_NUM=M.MOVIE_NUM
WHERE R.USER_NUM=1
ORDER BY R.REVIEW_NUM DESC;

-- SEARCH
SELECT R.REVIEW_NUM, R.REVIEW_STARRATE, R.REVIEW_CONTENT, U.USER_ID, M.TITLE
	FROM REVIEW R
		INNER JOIN USER_TBL U
		ON R.USER_NUM=U.USER_NUM
		INNER JOIN MOVIE M
		ON R.MOVIE_NUM=M.MOVIE_NUM
WHERE M.TITLE LIKE '%블랙%'
ORDER BY R.REVIEW_NUM DESC;

-- UPDATE

-- DELETE
DELETE FROM REVIEW WHERE REVIEW_NUM=5;