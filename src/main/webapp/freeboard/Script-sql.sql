create table freeboard (
    id number constraint PK_freeboard_id primary key,
    name varchar2(10) not null ,
    password varchar2(100) null,
    email varchar2(100) null,
    subject varchar2(100) not null, -- 글제목
    content varchar2(2000) not null , -- 글내용
    inputdate varchar2(100) not null, -- 작성 날짜
    masterid number default 0 , -- 질문 답변형 게시판에서 답변의 글을 그룹핑
    readcount number default 0 , -- 글조회수
    replaynum number default 0 ,
    step number default 0
    );
    
    
 -- id 컬럼 : 새로운 글이 등록될떄 기존의 id컬럼의 최대값을 가져와서 +1    <= 새글 번호의 넘버링
 
  -- 답변글을 처리하는 컬럼이 3개 필요하다 ( masterid , replaynum , step)
    
 -- masterid  : 글의 답변에 대한 그룹핑 
    		-- id 컬럼의 값이 그대로 들어간 경우 답견글이 아니다  처음글 
    
  -- replaynum : 답변글에대한 넘버링  ( 1,2,3 ....)
  -- step  :  답변글의 깊이
  		-- 0 : 처음글 ( 자신의 글 , 답변X	)
  		-- 1 : 답변글
  		-- 2 : 답변의 답변
  		-- 3 : 답변의 답변의 답변 
    
    
    -- 답변글이 존재하는 테이블을 출력 할떄 , 정렬을 잘 해서 가져와야한다
    select * from freeboard
    order by masterid desc , replaynum asc , step asc , id asc
    -- masterid 커럼에 중복됨 값이 있을경우 , replaynum 컴럼을 asc
    -- replaynum 이 중복된 값이 존재 할때 step를 asc
    -- step 이 중복된값이 존재할떄 id asc
    
    desc freeboard;
    
    
    
    
    