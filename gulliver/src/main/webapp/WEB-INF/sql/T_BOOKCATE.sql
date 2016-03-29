--4. 책분류정보(Book category )table
DROP TABLE T_BOOKCATE CASCADE CONSTRAINTS;

--최상위 카테고리 보여주기
select BOOK_CATE_NAME , BOOK_CATE_CD
from T_BOOKCATE
where HIGH_LINK_CD IS NULL
order by BOOK_CATE_CD asc;

--재귀쿼리문(1): 선택된 카테고리의 전체 PATH 보여주기
SELECT BOOK_CATE_NAME, TREE 
FROM
(
SELECT 
BOOK_CATE_NAME , LEVEL  , BOOK_CATE_CD,
PRIOR BOOK_CATE_NAME, 
SUBSTR(SYS_CONNECT_BY_PATH (BOOK_CATE_NAME,'> '),2) AS TREE
FROM T_BOOKCATE
START WITH HIGH_LINK_CD IS NULL
CONNECT BY PRIOR BOOK_CATE_CD=HIGH_LINK_CD
)
WHERE BOOK_CATE_CD=1100;


--재귀쿼리문(2): 모든 분류의 모든 상위카테고리 보여주기

SELECT BOOK_CATE_NAME AS CATEGORY, LTRIM(SYS_CONNECT_BY_PATH(BOOK_CATE_NAME,'>'),'>') AS TREE
FROM T_BOOKCATE
START WITH HIGH_LINK_CD IS NULL
CONNECT BY PRIOR BOOK_CATE_CD=HIGH_LINK_CD;


--바로 아래 카테고리 보여주기
SELECT BOOK_CATE_NAME
FROM T_BOOKCATE
WHERE HIGH_LINK_CD is NULL
order by book_cate_cd asc;

DROP TABLE T_BOOKCATE CASCADE CONSTRAINTS;

CREATE TABLE T_BOOKCATE (
       BOOK_CATE_CD         NUMBER(10) NOT NULL,
       BOOK_CATE_NAME       VARCHAR2(50) NOT NULL,
       HIGH_LINK_CD         NUMBER(10) NULL,
       PRIMARY KEY (BOOK_CATE_CD), 
       FOREIGN KEY (HIGH_LINK_CD)
                             REFERENCES T_BOOKCATE
);

select * from t_bookcate 
order by high_link_cd asc;
;

DELETE FROM T_BOOKCATE
where BOOK_CATE_CD >=2140 and BOOK_CATE_CD <=2220 ;


INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME) 
VALUES(	1000,'국내도서');
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME) 
VALUES(	2000	,'영미도서');
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME) 
VALUES(	3000	,'일본도서');
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME) 
VALUES(	4000	,'프랑스도서');
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME) 
VALUES(	5000	,'독일도서');
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME) 
VALUES(	6000	,'스페인도서');
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME) 
VALUES(	7000	,'아시아도서');
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME) 
VALUES(	8000	,'미분류');
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME) 
VALUES(	9000	,'어린이');
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(1100,'소설',1000);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1110	,	'시/에세이',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1120	,	'인문',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1130	,	'실용서',	1000	);

INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1130	,	'가정/생활',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1140	,	'요리',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1150	,	'건강',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1160	,	'취미/스포츠',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1170	,	'경제/경영',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1180	,	'자기계발',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1190	,	'정치/사회',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1200	,	'정부간행물',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1210	,	'역사/문화',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1220	,	'종교',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1230	,	'예술/대중문화',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1240	,	'중/고등학습',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1250	,	'기술/공학',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1260	,	'외국어',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1270	,	'과학',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1280	,	'취업/수험서',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1290	,	'여행/기행',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1300	,	'컴퓨터/IT',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1310	,	'잡지',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1320	,	'사전',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1330	,	'청소년',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1340	,	'초등참고서',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1350	,	'유아',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1360	,	'아동',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1370	,	'어린이영어',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1380	,	'만화',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1390	,	'대학교재',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1400	,	'어린이전집',	1000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	1410	,	'한국소개도서',	1000	);

INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2100	,	'문학',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2110	,	'취미/실용/여행',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2120	,	'생활/요리/건강',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2130	,	'예술/건축',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2140	,	'인문/사회',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2150	,	'경제/경영',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2160	,	'과학/기술',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2170	,	'아동',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2180	,	'한국관련도서',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2190	,	'NON_BOOK',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2200	,	'UMI',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2210	,	'영어교재',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2220	,	'어린이영어',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2230	,	'대학교재',	2000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	2240	,	'중국관련도서',	2000	);

INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	2101	,	'추리문학',	2100	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	2102	,	'영화대본',	2100	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD) 
VALUES	(	2103	,	'수필',	2100	);

INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3100	,	'일서',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3110	,	'잡지',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3120	,	'엔터테인먼트',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3130	,	'만화',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3140	,	'문학',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3150	,	'라이트노벨',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3160	,	'문고(포켓북)',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3170	,	'신서(포켓북)',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3180	,	'아동',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3190	,	'실용서/예술',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3200	,	'인문/사회',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3210	,	'자연/기술과학',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3220	,	'어학/학습/사전',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3230	,	'문구/멀티/기타',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	3240	,	'중국관련도서',	3000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	4100	,	'프랑스종합',	4000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	5100	,	'독일종합',	5000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	6100	,	'스페인종합',	6000	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	7100	,	'미분류',	7000	);

INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1101	,	'한국소설',	1100	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1102	,	'영미소설',	1100	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1103	,	'일본소설',	1100	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1104	,	'중국소설',	1100	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1105	,	'청소년소설',	1100	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1106	,	'한국고전소설',	1100	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1107	,	'세계문학',	1100	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1108	,	'세계고전',	1100	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1109	,	'소설문고/시리즈',	1100	);

INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1111	,	'서정시',	1110	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1112	,	'서사시',	1110	);
INSERT INTO T_BOOKCATE (BOOK_CATE_CD, BOOK_CATE_NAME,HIGH_LINK_CD)
VALUES	(	1113	,	'역사시',	1110	);




delete from t_bookcate
where book_cate_cd=2200 ;

delete from t_bookcate
where HIGH_LINK_CD is not null

