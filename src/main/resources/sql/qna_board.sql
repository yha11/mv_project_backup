DROP TABLE QNA_BOARD;

CREATE TABLE QNA_BOARD(
QNA_NUM INT AUTO_INCREMENT PRIMARY KEY,
QNA_DATE DATE DEFAULT NOW(),
QNA_STATUS VARCHAR(50) DEFAULT '미완료',
QNA_TITLE VARCHAR(200) NOT NULL,
QNA_CONTENT TEXT NOT NULL,
QNA_FILE VARCHAR(200) DEFAULT '',
QNA_ANSWER TEXT DEFAULT '미완료된 문의입니다.',
USER_NUM INT NOT NULL,
FOREIGN KEY(USER_NUM) REFERENCES USER_INFO(USER_NUM)
);

-- Create
INSERT INTO QNA_BOARD(USER_NUM, QNA_TITLE, QNA_CONTENT)
VALUES(1, '첫번째 문의', '첫번째 문의입니다.');

-- Read
-- 내 문의 목록
SELECT QNA_NUM, QNA_DATE, QNA_TITLE, QNA_STATUS
FROM QNA_BOARD
WHERE USER_NUM=1
ORDER BY QNA_NUM DESC;
-- 내 문의 상세 정보
SELECT QNA_DATE, QNA_STATUS, QNA_TITLE, QNA_CONTENT, QNA_FILE, QNA_ANSWER
FROM QNA_BOARD
WHERE USER_NUM=1 AND QNA_NUM=1;

SELECT QNA_NUM, QNA_DATE, QNA_TITLE, QNA_STATUS
FROM QNA_BOARD
ORDER BY QNA_NUM DESC;

-- Update
UPDATE QNA_BOARD
SET QNA_STATUS='완료', QNA_ANSWER='답변입니다.'
WHERE QNA_NUM=1;

-- Delete