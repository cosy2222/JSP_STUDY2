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
    
 -- masterid  : 글의 답변에 대한 그룹핑 