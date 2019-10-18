
-----------------삭제------------------
--접속유저의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- DEPT Table Create SQL
CREATE TABLE DEPT
(
    DEPT_NUM     INT              NOT NULL, 
    DEPT_NAME    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT DEPT_PK PRIMARY KEY (DEPT_NUM)
)
/

COMMENT ON TABLE DEPT IS '부서'
/

COMMENT ON COLUMN DEPT.DEPT_NUM IS '부서번호PS'
/

COMMENT ON COLUMN DEPT.DEPT_NAME IS '부서이름'
/


-- DEPT Table Create SQL
CREATE TABLE GRADE
(
    GRADE_NUM     INT              NOT NULL, 
    GRADE_NAME    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT GRADE_PK PRIMARY KEY (GRADE_NUM)
)
/

COMMENT ON TABLE GRADE IS '직급'
/

COMMENT ON COLUMN GRADE.GRADE_NUM IS '직급번호PS'
/

COMMENT ON COLUMN GRADE.GRADE_NAME IS '직급'
/


-- DEPT Table Create SQL
CREATE TABLE EMPLOYEE
(
    EMP_NUM        VARCHAR2(50)     NOT NULL, 
    EMP_PWD        VARCHAR2(200)    NOT NULL, 
    EMP_NAME       VARCHAR2(20)     NOT NULL, 
    EMP_EMAIL      VARCHAR2(100)    NULL, 
    EMP_GENDER     VARCHAR2(10)     NULL, 
    EMP_BIRTH      DATE             NULL, 
    EMP_PHONE      VARCHAR2(20)     NULL, 
    EMP_ADDRESS    VARCHAR2(500)    NULL, 
    GRADE_NUM      INT              NOT NULL, 
    DEFT_NUM       INT              NOT NULL, 
    EMP_SALARY     INT              NOT NULL, 
    ENROLL_DATE    DATE             NOT NULL, 
    RESIGN_DATE    DATE             DEFAULT NULL NULL, 
    EMP_STATUS     VARCHAR2(20)     DEFAULT 'Y' NOT NULL, 
    EMP_ACCOUNT    VARCHAR2(100)    NULL, 
    EMP_BANK       VARCHAR2(100)    NULL, 
    CONSTRAINT EMPLOYEE_PK PRIMARY KEY (EMP_NUM)
)
/

COMMENT ON TABLE EMPLOYEE IS '직원'
/

COMMENT ON COLUMN EMPLOYEE.EMP_NUM IS '사원번호PST'
/

COMMENT ON COLUMN EMPLOYEE.EMP_PWD IS '비밀번호'
/

COMMENT ON COLUMN EMPLOYEE.EMP_NAME IS '이름'
/

COMMENT ON COLUMN EMPLOYEE.EMP_EMAIL IS '이메일'
/

COMMENT ON COLUMN EMPLOYEE.EMP_GENDER IS '성별'
/

COMMENT ON COLUMN EMPLOYEE.EMP_BIRTH IS '생년월일'
/

COMMENT ON COLUMN EMPLOYEE.EMP_PHONE IS '전화번호'
/

COMMENT ON COLUMN EMPLOYEE.EMP_ADDRESS IS '주소'
/

COMMENT ON COLUMN EMPLOYEE.GRADE_NUM IS '직급번호F'
/

COMMENT ON COLUMN EMPLOYEE.DEFT_NUM IS '부서번호F'
/

COMMENT ON COLUMN EMPLOYEE.EMP_SALARY IS '연봉'
/

COMMENT ON COLUMN EMPLOYEE.ENROLL_DATE IS '입사일'
/

COMMENT ON COLUMN EMPLOYEE.RESIGN_DATE IS '퇴사일'
/

COMMENT ON COLUMN EMPLOYEE.EMP_STATUS IS '상태YN'
/

COMMENT ON COLUMN EMPLOYEE.EMP_ACCOUNT IS '급여수령계좌'
/

COMMENT ON COLUMN EMPLOYEE.EMP_BANK IS '급여수령은행'
/

ALTER TABLE EMPLOYEE
    ADD CONSTRAINT FK_EMPLOYEE_GRADE_NUM_GRADE_GR FOREIGN KEY (GRADE_NUM)
        REFERENCES GRADE (GRADE_NUM)
/

ALTER TABLE EMPLOYEE
    ADD CONSTRAINT FK_EMPLOYEE_DEFT_NUM_DEPT_DEPT FOREIGN KEY (DEFT_NUM)
        REFERENCES DEPT (DEPT_NUM)
/

ALTER TABLE EMPLOYEE
    ADD CONSTRAINT UC_EMP_EMAIL UNIQUE (EMP_EMAIL)
/

ALTER TABLE EMPLOYEE
    ADD CONSTRAINT UC_EMP_ACCOUNT UNIQUE (EMP_ACCOUNT)
/


-- DEPT Table Create SQL
CREATE TABLE CONFIRM
(
    CONFIRM_NUM      VARCHAR2(50)    NOT NULL, 
    CONFIRM_EMP1     VARCHAR2(50)    NOT NULL, 
    CONFIRM_EMP2     VARCHAR2(50)    NULL, 
    CONFIRM_EMP3     VARCHAR2(50)    NULL, 
    CONFIRM_EMP4     VARCHAR2(50)    NULL, 
    CONFIRM_DATE1    DATE            NOT NULL, 
    CONFIRM_DATE2    DATE            NULL, 
    CONFIRM_DATE3    DATE            NULL, 
    CONFIRM_DATE4    DATE            NULL, 
    CONSTRAINT CONFIRM_PK PRIMARY KEY (CONFIRM_NUM)
)
/

COMMENT ON TABLE CONFIRM IS '결제'
/

COMMENT ON COLUMN CONFIRM.CONFIRM_NUM IS '결제번호PST'
/

COMMENT ON COLUMN CONFIRM.CONFIRM_EMP1 IS '결제1F'
/

COMMENT ON COLUMN CONFIRM.CONFIRM_EMP2 IS '결제2F'
/

COMMENT ON COLUMN CONFIRM.CONFIRM_EMP3 IS '결제3F'
/

COMMENT ON COLUMN CONFIRM.CONFIRM_EMP4 IS '결제4F'
/

COMMENT ON COLUMN CONFIRM.CONFIRM_DATE1 IS '결제1일시'
/

COMMENT ON COLUMN CONFIRM.CONFIRM_DATE2 IS '결제2일시'
/

COMMENT ON COLUMN CONFIRM.CONFIRM_DATE3 IS '결제3일시'
/

COMMENT ON COLUMN CONFIRM.CONFIRM_DATE4 IS '결제4일시'
/

ALTER TABLE CONFIRM
    ADD CONSTRAINT FK_CONFIRM_CONFIRM_EMP1_EMPLOY FOREIGN KEY (CONFIRM_EMP1)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE CONFIRM
    ADD CONSTRAINT FK_CONFIRM_CONFIRM_EMP2_EMPLOY FOREIGN KEY (CONFIRM_EMP2)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE CONFIRM
    ADD CONSTRAINT FK_CONFIRM_CONFIRM_EMP3_EMPLOY FOREIGN KEY (CONFIRM_EMP3)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE CONFIRM
    ADD CONSTRAINT FK_CONFIRM_CONFIRM_EMP4_EMPLOY FOREIGN KEY (CONFIRM_EMP4)
        REFERENCES EMPLOYEE (EMP_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE APPROVAL
(
    APPROVAL_NUM     VARCHAR2(50)    NOT NULL, 
    APPROVAL_DATE    VARCHAR2(20)    NOT NULL, 
    DOC_NUM          VARCHAR2(20)    NOT NULL, 
    CONSTRAINT APPROVAL_PK PRIMARY KEY (APPROVAL_NUM)
)
/

COMMENT ON TABLE APPROVAL IS '승인번호'
/

COMMENT ON COLUMN APPROVAL.APPROVAL_NUM IS '승인번호PST'
/

COMMENT ON COLUMN APPROVAL.APPROVAL_DATE IS '승인일시'
/

COMMENT ON COLUMN APPROVAL.DOC_NUM IS '문서번호'
/


-- DEPT Table Create SQL
CREATE TABLE PARTNER
(
    PARTNER_NUM        VARCHAR2(50)      NOT NULL, 
    PARTNER_NAME       VARCHAR2(200)     NOT NULL, 
    PARTNER_PHONE      VARCHAR2(200)     NULL, 
    PARTNER_FAX        VARCHAR2(200)     NULL, 
    PARTNER_ADDRESS    VARCHAR2(1000)    NULL, 
    BUSSINESS_NUM      VARCHAR2(100)     NOT NULL, 
    PARTNER_EMP        VARCHAR2(200)     NULL, 
    CONSTRAINT PARTNER_PK PRIMARY KEY (PARTNER_NUM)
)
/

COMMENT ON TABLE PARTNER IS '거래처'
/

COMMENT ON COLUMN PARTNER.PARTNER_NUM IS '거래처번호PST'
/

COMMENT ON COLUMN PARTNER.PARTNER_NAME IS '거래처이름'
/

COMMENT ON COLUMN PARTNER.PARTNER_PHONE IS '거래처대표번호'
/

COMMENT ON COLUMN PARTNER.PARTNER_FAX IS '거래처팩스'
/

COMMENT ON COLUMN PARTNER.PARTNER_ADDRESS IS '거래처주소'
/

COMMENT ON COLUMN PARTNER.BUSSINESS_NUM IS '거래처사업자번호'
/

COMMENT ON COLUMN PARTNER.PARTNER_EMP IS '거래처담당자'
/


-- DEPT Table Create SQL
CREATE TABLE ACCOUNT
(
    ACCOUNT_NUM        VARCHAR2(50)     NOT NULL, 
    ACCOUNT_NAME       VARCHAR2(100)    NOT NULL, 
    ACCOUNT_DESCRIP    VARCHAR2(20)     NOT NULL, 
    ACCOUNT_ALI        VARCHAR2(20)     NOT NULL, 
    CONSTRAINT ACCOUNT_PK PRIMARY KEY (ACCOUNT_NUM)
)
/

COMMENT ON TABLE ACCOUNT IS '계정과목'
/

COMMENT ON COLUMN ACCOUNT.ACCOUNT_NUM IS '과목번호PST'
/

COMMENT ON COLUMN ACCOUNT.ACCOUNT_NAME IS '과목이름'
/

COMMENT ON COLUMN ACCOUNT.ACCOUNT_DESCRIP IS '계정내용'
/

COMMENT ON COLUMN ACCOUNT.ACCOUNT_ALI IS '자산부채자본ALE'
/

ALTER TABLE ACCOUNT
    ADD CONSTRAINT UC_ACCOUNT_NAME UNIQUE (ACCOUNT_NAME)
/


-- DEPT Table Create SQL
CREATE TABLE DOC_HOLIDAY
(
    HOLI_NUM         VARCHAR2(50)    NOT NULL, 
    DEPT_NUM         INT             NOT NULL, 
    EMP_NUM          VARCHAR2(50)    NOT NULL, 
    HOLI_TYPE        VARCHAR2(20)    NOT NULL, 
    HOLI_APPLY       DATE            NOT NULL, 
    HOLIDAY_START    DATE            NOT NULL, 
    HOLIDAY_END      DATE            NOT NULL, 
    APPROVAL_NUM     VARCHAR2(50)    NULL, 
    CONFIRM_NUM      VARCHAR2(50)    NULL, 
    CONSTRAINT DOC_HOLIDAY_PK PRIMARY KEY (HOLI_NUM)
)
/

COMMENT ON TABLE DOC_HOLIDAY IS '문서_휴가/외출'
/

COMMENT ON COLUMN DOC_HOLIDAY.HOLI_NUM IS '휴가신청번호PST'
/

COMMENT ON COLUMN DOC_HOLIDAY.DEPT_NUM IS '휴가신청부서F'
/

COMMENT ON COLUMN DOC_HOLIDAY.EMP_NUM IS '신청인F'
/

COMMENT ON COLUMN DOC_HOLIDAY.HOLI_TYPE IS '휴가타입APF'
/

COMMENT ON COLUMN DOC_HOLIDAY.HOLI_APPLY IS '휴가신청일시'
/

COMMENT ON COLUMN DOC_HOLIDAY.HOLIDAY_START IS '휴가시작일'
/

COMMENT ON COLUMN DOC_HOLIDAY.HOLIDAY_END IS '휴가종료일'
/

COMMENT ON COLUMN DOC_HOLIDAY.APPROVAL_NUM IS '승인번호F'
/

COMMENT ON COLUMN DOC_HOLIDAY.CONFIRM_NUM IS '결제번호F'
/

ALTER TABLE DOC_HOLIDAY
    ADD CONSTRAINT FK_DOC_HOLIDAY_DEPT_NUM_DEPT_D FOREIGN KEY (DEPT_NUM)
        REFERENCES DEPT (DEPT_NUM)
/

ALTER TABLE DOC_HOLIDAY
    ADD CONSTRAINT FK_DOC_HOLIDAY_EMP_NUM_EMPLOYE FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE DOC_HOLIDAY
    ADD CONSTRAINT FK_DOC_HOLIDAY_CONFIRM_NUM_CON FOREIGN KEY (CONFIRM_NUM)
        REFERENCES CONFIRM (CONFIRM_NUM)
/

ALTER TABLE DOC_HOLIDAY
    ADD CONSTRAINT FK_DOC_HOLIDAY_APPROVAL_NUM_AP FOREIGN KEY (APPROVAL_NUM)
        REFERENCES APPROVAL (APPROVAL_NUM)
/

ALTER TABLE DOC_HOLIDAY
    ADD CONSTRAINT UC_APPROVAL_NUM UNIQUE (APPROVAL_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE PAYMENT
(
    PAY_NUM        VARCHAR2(50)     NOT NULL, 
    PAY_PRICE      INT              NOT NULL, 
    PAY_AMOUNT     INT              NOT NULL, 
    PARTNER_NUM    VARCHAR2(50)     NOT NULL, 
    PAY_DATE       DATE             NOT NULL, 
    PAY_METHOD     VARCHAR2(50)     NOT NULL, 
    PAY_BANK       VARCHAR2(100)    NULL, 
    CONSTRAINT PAYMENT_PK PRIMARY KEY (PAY_NUM)
)
/

COMMENT ON TABLE PAYMENT IS '결제관리'
/

COMMENT ON COLUMN PAYMENT.PAY_NUM IS '결제번호PST'
/

COMMENT ON COLUMN PAYMENT.PAY_PRICE IS '결제금액'
/

COMMENT ON COLUMN PAYMENT.PAY_AMOUNT IS '수량'
/

COMMENT ON COLUMN PAYMENT.PARTNER_NUM IS '거래처번호F'
/

COMMENT ON COLUMN PAYMENT.PAY_DATE IS '결제일'
/

COMMENT ON COLUMN PAYMENT.PAY_METHOD IS '결제방식'
/

COMMENT ON COLUMN PAYMENT.PAY_BANK IS '결제은행'
/

ALTER TABLE PAYMENT
    ADD CONSTRAINT FK_PAYMENT_PARTNER_NUM_PARTNER FOREIGN KEY (PARTNER_NUM)
        REFERENCES PARTNER (PARTNER_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE DOC_DRAFT
(
    DRAFT_NUM         VARCHAR2(50)      NOT NULL, 
    DEPT_NUM          INT               NOT NULL, 
    EMP_NUM           VARCHAR2(50)      NOT NULL, 
    DRAFT_TITLE       VARCHAR2(200)     NOT NULL, 
    DRAFT_CONTENT     VARCHAR2(2000)    NULL, 
    DRAFT_DATE        DATE              NOT NULL, 
    PRESERV_YAER      INT               NOT NULL, 
    EXPIRATE_DATE     DATE              NOT NULL, 
    DRAFT_STATUS      VARCHAR2(20)      DEFAULT 'Y' NOT NULL, 
    DRAFT_COMPLETE    DATE              NULL, 
    APPROVAL_NUM      VARCHAR2(50)      NULL, 
    CONFIRM_NUM       VARCHAR2(50)      NOT NULL, 
    CONSTRAINT DOC_DRAFT_PK PRIMARY KEY (DRAFT_NUM)
)
/

COMMENT ON TABLE DOC_DRAFT IS '문서_기안서'
/

COMMENT ON COLUMN DOC_DRAFT.DRAFT_NUM IS '기안서번호PST'
/

COMMENT ON COLUMN DOC_DRAFT.DEPT_NUM IS '기안부서F'
/

COMMENT ON COLUMN DOC_DRAFT.EMP_NUM IS '기안자F'
/

COMMENT ON COLUMN DOC_DRAFT.DRAFT_TITLE IS '기안제목'
/

COMMENT ON COLUMN DOC_DRAFT.DRAFT_CONTENT IS '기안내용'
/

COMMENT ON COLUMN DOC_DRAFT.DRAFT_DATE IS '기안일시'
/

COMMENT ON COLUMN DOC_DRAFT.PRESERV_YAER IS '보존연한'
/

COMMENT ON COLUMN DOC_DRAFT.EXPIRATE_DATE IS '보존만료일'
/

COMMENT ON COLUMN DOC_DRAFT.DRAFT_STATUS IS '상태YN'
/

COMMENT ON COLUMN DOC_DRAFT.DRAFT_COMPLETE IS '완료일시'
/

COMMENT ON COLUMN DOC_DRAFT.APPROVAL_NUM IS '승인번호F'
/

COMMENT ON COLUMN DOC_DRAFT.CONFIRM_NUM IS '결제번호F'
/

ALTER TABLE DOC_DRAFT
    ADD CONSTRAINT FK_DOC_DRAFT_DEPT_NUM_DEPT_DEP FOREIGN KEY (DEPT_NUM)
        REFERENCES DEPT (DEPT_NUM)
/

ALTER TABLE DOC_DRAFT
    ADD CONSTRAINT FK_DOC_DRAFT_EMP_NUM_EMPLOYEE_ FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE DOC_DRAFT
    ADD CONSTRAINT FK_DOC_DRAFT_CONFIRM_NUM_CONFI FOREIGN KEY (CONFIRM_NUM)
        REFERENCES CONFIRM (CONFIRM_NUM)
/

ALTER TABLE DOC_DRAFT
    ADD CONSTRAINT FK_DOC_DRAFT_APPROVAL_NUM_APPR FOREIGN KEY (APPROVAL_NUM)
        REFERENCES APPROVAL (APPROVAL_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE SCHEDULE_EMP
(
    EMP_NUM             VARCHAR2(50)     NULL, 
    DEPT_NUM            INT              NULL, 
    SCH_EMP_START       DATE             NOT NULL, 
    SCH_EMP_END         DATE             NOT NULL, 
    REGISTER_EMP_NUM    VARCHAR2(50)     NOT NULL, 
    SCH_CONTNET         VARCHAR2(500)    NULL   
)
/

COMMENT ON TABLE SCHEDULE_EMP IS '일정'
/

COMMENT ON COLUMN SCHEDULE_EMP.EMP_NUM IS '사원번호F'
/

COMMENT ON COLUMN SCHEDULE_EMP.DEPT_NUM IS '부서번호F'
/

COMMENT ON COLUMN SCHEDULE_EMP.SCH_EMP_START IS '시작일'
/

COMMENT ON COLUMN SCHEDULE_EMP.SCH_EMP_END IS '종료일'
/

COMMENT ON COLUMN SCHEDULE_EMP.REGISTER_EMP_NUM IS '등록자'
/

COMMENT ON COLUMN SCHEDULE_EMP.SCH_CONTNET IS '내용'
/

ALTER TABLE SCHEDULE_EMP
    ADD CONSTRAINT FK_SCHEDULE_EMP_EMP_NUM_EMPLOY FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE SCHEDULE_EMP
    ADD CONSTRAINT FK_SCHEDULE_EMP_DEPT_NUM_DEPT_ FOREIGN KEY (DEPT_NUM)
        REFERENCES DEPT (DEPT_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE TNA
(
    EMP_NUM       VARCHAR2(50)    NOT NULL, 
    TNA_YEAR      VARCHAR2(20)    NOT NULL, 
    TNA_SCORE     NUMBER          NOT NULL, 
    CHARGE_NUM    VARCHAR2(50)    NOT NULL, 
    CONSTRAINT TNA_PK PRIMARY KEY (EMP_NUM, TNA_YEAR)
)
/

COMMENT ON TABLE TNA IS '근태점수'
/

COMMENT ON COLUMN TNA.EMP_NUM IS '사원번호PF'
/

COMMENT ON COLUMN TNA.TNA_YEAR IS '평가년도P'
/

COMMENT ON COLUMN TNA.TNA_SCORE IS '점수'
/

COMMENT ON COLUMN TNA.CHARGE_NUM IS '책임자F'
/

ALTER TABLE TNA
    ADD CONSTRAINT FK_TNA_EMP_NUM_EMPLOYEE_EMP_NU FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE TNA
    ADD CONSTRAINT FK_TNA_CHARGE_NUM_EMPLOYEE_EMP FOREIGN KEY (CHARGE_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE NOTICE
(
    NOTICE_NUM         VARCHAR2(50)      NOT NULL, 
    NOTICE_DEPT        INT               NOT NULL, 
    NOTICE_TITLE       VARCHAR2(100)     NOT NULL, 
    NOTICE_CONTENT     VARCHAR2(2000)    NULL, 
    EMP_NUM            VARCHAR2(50)      NOT NULL, 
    NOTICE_DATE        DATE              NOT NULL, 
    NOTICE_MOTIFY      DATE              NULL, 
    NOTICE_STATUS      VARCHAR2(20)      DEFAULT 'Y' NOT NULL, 
    NOTICE_ACC_TYPE    INT               NULL, 
    CONSTRAINT NOTICE_PK PRIMARY KEY (NOTICE_NUM)
)
/

COMMENT ON TABLE NOTICE IS '공지'
/

COMMENT ON COLUMN NOTICE.NOTICE_NUM IS '공지번호PST'
/

COMMENT ON COLUMN NOTICE.NOTICE_DEPT IS '공지부서번호F'
/

COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지제목'
/

COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지내용'
/

COMMENT ON COLUMN NOTICE.EMP_NUM IS '게시자F'
/

COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '공지일시'
/

COMMENT ON COLUMN NOTICE.NOTICE_MOTIFY IS '수정일'
/

COMMENT ON COLUMN NOTICE.NOTICE_STATUS IS '공지상태YN'
/

COMMENT ON COLUMN NOTICE.NOTICE_ACC_TYPE IS '공지회계타입'
/

ALTER TABLE NOTICE
    ADD CONSTRAINT FK_NOTICE_EMP_NUM_EMPLOYEE_EMP FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE NOTICE
    ADD CONSTRAINT FK_NOTICE_NOTICE_DEPT_DEPT_DEP FOREIGN KEY (NOTICE_DEPT)
        REFERENCES DEPT (DEPT_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE EOTM
(
    EMP_NUM         VARCHAR2(50)      NOT NULL, 
    EOTM_DATE       DATE              NOT NULL, 
    EOTM_CONTNET    VARCHAR2(2000)    NULL, 
    EOTM_SCORE      INT               NOT NULL, 
    CONSTRAINT EOTM_PK PRIMARY KEY (EMP_NUM, EOTM_DATE, EOTM_CONTNET)
)
/

COMMENT ON TABLE EOTM IS 'EMPLOYEE OF THE MONTH'
/

COMMENT ON COLUMN EOTM.EMP_NUM IS '사원번호F'
/

COMMENT ON COLUMN EOTM.EOTM_DATE IS '일시'
/

COMMENT ON COLUMN EOTM.EOTM_CONTNET IS '칭찬내용'
/

COMMENT ON COLUMN EOTM.EOTM_SCORE IS '점수'
/

ALTER TABLE EOTM
    ADD CONSTRAINT FK_EOTM_EMP_NUM_EMPLOYEE_EMP_N FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE DOC_REQUEST
(
    REQUEST_NUM         VARCHAR2(50)      NOT NULL, 
    DEPT_NUM            INT               NOT NULL, 
    EMP_NUM             VARCHAR2(50)      NOT NULL, 
    REQUEST_TITLE       VARCHAR2(200)     NOT NULL, 
    REQUEST_CONTENT     VARCHAR2(2000)    NULL, 
    REQUEST_DATE        DATE              NOT NULL, 
    PRESERV_YAER        INT               NOT NULL, 
    EXPIRATE_DATE       DATE              NOT NULL, 
    REQUEST_STATUS      VARCHAR2(20)      DEFAULT 'Y' NOT NULL, 
    REQUEST_COMPLETE    DATE              NULL, 
    APPROVAL_NUM        VARCHAR2(50)      NULL, 
    CONFIRM_NUM         VARCHAR2(50)      NULL, 
    CONSTRAINT DOC_REQUEST_PK PRIMARY KEY (REQUEST_NUM)
)
/

COMMENT ON TABLE DOC_REQUEST IS '문서_품의서'
/

COMMENT ON COLUMN DOC_REQUEST.REQUEST_NUM IS '품의서번호PS'
/

COMMENT ON COLUMN DOC_REQUEST.DEPT_NUM IS '품의부서F'
/

COMMENT ON COLUMN DOC_REQUEST.EMP_NUM IS '품의자F'
/

COMMENT ON COLUMN DOC_REQUEST.REQUEST_TITLE IS '품의제목'
/

COMMENT ON COLUMN DOC_REQUEST.REQUEST_CONTENT IS '품의내용'
/

COMMENT ON COLUMN DOC_REQUEST.REQUEST_DATE IS '품의일시'
/

COMMENT ON COLUMN DOC_REQUEST.PRESERV_YAER IS '보존연한'
/

COMMENT ON COLUMN DOC_REQUEST.EXPIRATE_DATE IS '보존만료일'
/

COMMENT ON COLUMN DOC_REQUEST.REQUEST_STATUS IS '상태YN'
/

COMMENT ON COLUMN DOC_REQUEST.REQUEST_COMPLETE IS '완료일시'
/

COMMENT ON COLUMN DOC_REQUEST.APPROVAL_NUM IS '승인번호F'
/

COMMENT ON COLUMN DOC_REQUEST.CONFIRM_NUM IS '결제번호F'
/

ALTER TABLE DOC_REQUEST
    ADD CONSTRAINT FK_DOC_REQUEST_DEPT_NUM_DEPT_D FOREIGN KEY (DEPT_NUM)
        REFERENCES DEPT (DEPT_NUM)
/

ALTER TABLE DOC_REQUEST
    ADD CONSTRAINT FK_DOC_REQUEST_EMP_NUM_EMPLOYE FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE DOC_REQUEST
    ADD CONSTRAINT FK_DOC_REQUEST_CONFIRM_NUM_CON FOREIGN KEY (CONFIRM_NUM)
        REFERENCES CONFIRM (CONFIRM_NUM)
/

ALTER TABLE DOC_REQUEST
    ADD CONSTRAINT FK_DOC_REQUEST_APPROVAL_NUM_AP FOREIGN KEY (APPROVAL_NUM)
        REFERENCES APPROVAL (APPROVAL_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE DOC_EXPENSE
(
    EXPENSE_NUM         VARCHAR2(50)      NOT NULL, 
    DEPT_NUM            INT               NOT NULL, 
    EMP_NUM             VARCHAR2(50)      NOT NULL, 
    EXPENSE_TITLE       VARCHAR2(200)     NOT NULL, 
    EXPENSE_CONTENT     VARCHAR2(2000)    NULL, 
    EXPENSE_DATE        DATE              NOT NULL, 
    PARTNER_NUM         VARCHAR2(50)      NULL, 
    EXPENSE_PRICE       INT               NOT NULL, 
    PRESERV_YEAR        INT               NOT NULL, 
    EXPIRATE_DATE       DATE              NOT NULL, 
    EXPENSE_STAUS       VARCHAR2(20)      DEFAULT 'Y' NOT NULL, 
    EXPENSE_COLPLETE    DATE              NULL, 
    APPROVAL_NUM        VARCHAR2(50)      NULL, 
    CONFIRM_NUM         VARCHAR2(50)      NULL, 
    CONSTRAINT DOC_EXPENSE_PK PRIMARY KEY (EXPENSE_NUM)
)
/

COMMENT ON TABLE DOC_EXPENSE IS '문서_지출결의'
/

COMMENT ON COLUMN DOC_EXPENSE.EXPENSE_NUM IS '지출결의번호PST'
/

COMMENT ON COLUMN DOC_EXPENSE.DEPT_NUM IS '지출결의부서F'
/

COMMENT ON COLUMN DOC_EXPENSE.EMP_NUM IS '지출결의자F'
/

COMMENT ON COLUMN DOC_EXPENSE.EXPENSE_TITLE IS '지출결의제목'
/

COMMENT ON COLUMN DOC_EXPENSE.EXPENSE_CONTENT IS '지출결의내용'
/

COMMENT ON COLUMN DOC_EXPENSE.EXPENSE_DATE IS '지출결의등록일시'
/

COMMENT ON COLUMN DOC_EXPENSE.PARTNER_NUM IS '거래처번호F'
/

COMMENT ON COLUMN DOC_EXPENSE.EXPENSE_PRICE IS '거래금액'
/

COMMENT ON COLUMN DOC_EXPENSE.PRESERV_YEAR IS '보존연한'
/

COMMENT ON COLUMN DOC_EXPENSE.EXPIRATE_DATE IS '보존만료일'
/

COMMENT ON COLUMN DOC_EXPENSE.EXPENSE_STAUS IS '상태YN'
/

COMMENT ON COLUMN DOC_EXPENSE.EXPENSE_COLPLETE IS '완료일시'
/

COMMENT ON COLUMN DOC_EXPENSE.APPROVAL_NUM IS '승인번호F'
/

COMMENT ON COLUMN DOC_EXPENSE.CONFIRM_NUM IS '결제번호F'
/

ALTER TABLE DOC_EXPENSE
    ADD CONSTRAINT FK_DOC_EXPENSE_DEPT_NUM_DEPT_D FOREIGN KEY (DEPT_NUM)
        REFERENCES DEPT (DEPT_NUM)
/

ALTER TABLE DOC_EXPENSE
    ADD CONSTRAINT FK_DOC_EXPENSE_EMP_NUM_EMPLOYE FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE DOC_EXPENSE
    ADD CONSTRAINT FK_DOC_EXPENSE_PARTNER_NUM_PAR FOREIGN KEY (PARTNER_NUM)
        REFERENCES PARTNER (PARTNER_NUM)
/

ALTER TABLE DOC_EXPENSE
    ADD CONSTRAINT FK_DOC_EXPENSE_CONFIRM_NUM_CON FOREIGN KEY (CONFIRM_NUM)
        REFERENCES CONFIRM (CONFIRM_NUM)
/

ALTER TABLE DOC_EXPENSE
    ADD CONSTRAINT FK_DOC_EXPENSE_APPROVAL_NUM_AP FOREIGN KEY (APPROVAL_NUM)
        REFERENCES APPROVAL (APPROVAL_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE JOURNALIZING
(
    JOURN_NUM       INT               NOT NULL, 
    JOURN_DATE      DATE              NOT NULL, 
    DEBT            VARCHAR2(100)     NOT NULL, 
    DEBT_PRICE      INT               NOT NULL, 
    CREDIT          VARCHAR2(100)     NOT NULL, 
    CREDIT_PRICE    INT               NOT NULL, 
    JOURN_MEMO      VARCHAR2(2000)    NULL, 
    CONSTRAINT JOURNALIZING_PK PRIMARY KEY (JOURN_NUM)
)
/

COMMENT ON TABLE JOURNALIZING IS '분개장'
/

COMMENT ON COLUMN JOURNALIZING.JOURN_NUM IS '분개번호PS'
/

COMMENT ON COLUMN JOURNALIZING.JOURN_DATE IS '날짜'
/

COMMENT ON COLUMN JOURNALIZING.DEBT IS '차변'
/

COMMENT ON COLUMN JOURNALIZING.DEBT_PRICE IS '금액'
/

COMMENT ON COLUMN JOURNALIZING.CREDIT IS '대변'
/

COMMENT ON COLUMN JOURNALIZING.CREDIT_PRICE IS '금액'
/

COMMENT ON COLUMN JOURNALIZING.JOURN_MEMO IS '비고'
/

ALTER TABLE JOURNALIZING
    ADD CONSTRAINT FK_JOURNALIZING_DEBT_ACCOUNT_A FOREIGN KEY (DEBT)
        REFERENCES ACCOUNT (ACCOUNT_NAME)
/

ALTER TABLE JOURNALIZING
    ADD CONSTRAINT FK_JOURNALIZING_CREDIT_ACCOUNT FOREIGN KEY (CREDIT)
        REFERENCES ACCOUNT (ACCOUNT_NAME)
/


-- DEPT Table Create SQL
CREATE TABLE LICENSE
(
    LICENSE_MANAGE    VARCHAR2(50)     NOT NULL, 
    PRODUCT_NAME      VARCHAR2(200)    NOT NULL, 
    LICENSE_NUM       VARCHAR2(200)    NOT NULL, 
    PAY_NUM           VARCHAR2(50)     NOT NULL, 
    LICENSE_START     DATE             NOT NULL, 
    LICENSE_END       DATE             DEFAULT NULL NULL, 
    LICENSE_UPDATE    DATE             DEFAULT NULL NULL, 
    CONSTRAINT LICENSE_PK PRIMARY KEY (LICENSE_MANAGE)
)
/

COMMENT ON TABLE LICENSE IS '라이센스관리'
/

COMMENT ON COLUMN LICENSE.LICENSE_MANAGE IS '관리번호PST'
/

COMMENT ON COLUMN LICENSE.PRODUCT_NAME IS '제품명'
/

COMMENT ON COLUMN LICENSE.LICENSE_NUM IS '라이센스번호'
/

COMMENT ON COLUMN LICENSE.PAY_NUM IS '결제번호F'
/

COMMENT ON COLUMN LICENSE.LICENSE_START IS '사용시작일'
/

COMMENT ON COLUMN LICENSE.LICENSE_END IS '종료일'
/

COMMENT ON COLUMN LICENSE.LICENSE_UPDATE IS '갱신일'
/

ALTER TABLE LICENSE
    ADD CONSTRAINT FK_LICENSE_PAY_NUM_PAYMENT_PAY FOREIGN KEY (PAY_NUM)
        REFERENCES PAYMENT (PAY_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE FIXTURE
(
    FIXTURE_NUM     VARCHAR2(50)     NOT NULL, 
    FIXTURE_TYPE    VARCHAR2(100)    NOT NULL, 
    FIXTURE_NAME    VARCHAR2(500)    NOT NULL, 
    FIXTURE_BUY     DATE             NOT NULL, 
    DEPT_NUM        INT              NULL, 
    EMP_NUM         VARCHAR2(50)     NULL, 
    ENDURANCE       INT              NOT NULL, 
    CONSTRAINT FIXTURE_PK PRIMARY KEY (FIXTURE_NUM)
)
/

COMMENT ON TABLE FIXTURE IS '비품관리'
/

COMMENT ON COLUMN FIXTURE.FIXTURE_NUM IS '비품번호PS'
/

COMMENT ON COLUMN FIXTURE.FIXTURE_TYPE IS '비품종류'
/

COMMENT ON COLUMN FIXTURE.FIXTURE_NAME IS '제품명'
/

COMMENT ON COLUMN FIXTURE.FIXTURE_BUY IS '비품구매일'
/

COMMENT ON COLUMN FIXTURE.DEPT_NUM IS '사용부서F'
/

COMMENT ON COLUMN FIXTURE.EMP_NUM IS '사용자F'
/

COMMENT ON COLUMN FIXTURE.ENDURANCE IS '내구연한'
/

ALTER TABLE FIXTURE
    ADD CONSTRAINT FK_FIXTURE_DEPT_NUM_DEPT_DEPT_ FOREIGN KEY (DEPT_NUM)
        REFERENCES DEPT (DEPT_NUM)
/

ALTER TABLE FIXTURE
    ADD CONSTRAINT FK_FIXTURE_EMP_NUM_EMPLOYEE_EM FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE SALARY
(
    EMP_NUM     VARCHAR2(50)    NOT NULL, 
    SAL_YEAR    DATE            NOT NULL, 
    SALARY      INT             NOT NULL, 
    CONSTRAINT SALARY_PK PRIMARY KEY (EMP_NUM, SAL_YEAR)
)
/

COMMENT ON TABLE SALARY IS '연봉'
/

COMMENT ON COLUMN SALARY.EMP_NUM IS '사원번호F'
/

COMMENT ON COLUMN SALARY.SAL_YEAR IS '년도'
/

COMMENT ON COLUMN SALARY.SALARY IS '연봉'
/

ALTER TABLE SALARY
    ADD CONSTRAINT FK_SALARY_EMP_NUM_EMPLOYEE_EMP FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE ATTENDANCE
(
    EMP_NUM     VARCHAR2(50)    NOT NULL, 
    ATT_DATE    DATE            NOT NULL, 
    TIME_ON     DATE            NULL, 
    TIME_OFF    DATE            NULL, 
    CONSTRAINT ATTENDANCE_PK PRIMARY KEY (EMP_NUM, ATT_DATE)
)
/

COMMENT ON TABLE ATTENDANCE IS '출퇴근'
/

COMMENT ON COLUMN ATTENDANCE.EMP_NUM IS '사원번호F'
/

COMMENT ON COLUMN ATTENDANCE.ATT_DATE IS '날짜'
/

COMMENT ON COLUMN ATTENDANCE.TIME_ON IS '출근시간'
/

COMMENT ON COLUMN ATTENDANCE.TIME_OFF IS '퇴근시간'
/

ALTER TABLE ATTENDANCE
    ADD CONSTRAINT FK_ATTENDANCE_EMP_NUM_EMPLOYEE FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE HOLIDAY_COUNT
(
    EMP_NUM          VARCHAR2(50)    NOT NULL, 
    HOLIDAY_COUNT    NUMBER          NOT NULL, 
    HOLIDAY_LEFT     NUMBER          NOT NULL, 
    HOLIDAY_YEAR     DATE            NOT NULL, 
    CONSTRAINT HOLIDAY_COUNT_PK PRIMARY KEY (EMP_NUM)
)
/

COMMENT ON TABLE HOLIDAY_COUNT IS '휴가 개수 카운트'
/

COMMENT ON COLUMN HOLIDAY_COUNT.EMP_NUM IS '사원번호F'
/

COMMENT ON COLUMN HOLIDAY_COUNT.HOLIDAY_COUNT IS '총연차수'
/

COMMENT ON COLUMN HOLIDAY_COUNT.HOLIDAY_LEFT IS '남은연차'
/

COMMENT ON COLUMN HOLIDAY_COUNT.HOLIDAY_YEAR IS '년도'
/

ALTER TABLE HOLIDAY_COUNT
    ADD CONSTRAINT FK_HOLIDAY_COUNT_EMP_NUM_EMPLO FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE HOLIDAY
(
    APPROVAL_NUM     VARCHAR2(50)    NOT NULL, 
    EMP_NUMNT        VARCHAR2(50)    NOT NULL, 
    HOLIDAY_START    DATE            NOT NULL, 
    HOLIDAY_END      DATE            NOT NULL, 
    CONSTRAINT HOLIDAY_PK PRIMARY KEY (APPROVAL_NUM)
)
/

COMMENT ON TABLE HOLIDAY IS '휴가기록'
/

COMMENT ON COLUMN HOLIDAY.APPROVAL_NUM IS '승인번호F'
/

COMMENT ON COLUMN HOLIDAY.EMP_NUMNT IS '사원번호F'
/

COMMENT ON COLUMN HOLIDAY.HOLIDAY_START IS '휴가시작일'
/

COMMENT ON COLUMN HOLIDAY.HOLIDAY_END IS '휴가종료일'
/

ALTER TABLE HOLIDAY
    ADD CONSTRAINT FK_HOLIDAY_EMP_NUMNT_EMPLOYEE_ FOREIGN KEY (EMP_NUMNT)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE HOLIDAY
    ADD CONSTRAINT FK_HOLIDAY_APPROVAL_NUM_DOC_HO FOREIGN KEY (APPROVAL_NUM)
        REFERENCES DOC_HOLIDAY (APPROVAL_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE SALES
(
    SALES_NUM       VARCHAR2(50)     NOT NULL, 
    PRODUCT_NAME    VARCHAR2(100)    NOT NULL, 
    SALES_DATE      DATE             NOT NULL, 
    EMP_NUM         VARCHAR2(50)     NOT NULL, 
    SALES_AMOUNT    INT              NOT NULL, 
    PARTNER_NUM     VARCHAR2(50)     NOT NULL, 
    CONSTRAINT SALES_PK PRIMARY KEY (SALES_NUM)
)
/

COMMENT ON TABLE SALES IS 'SALES'
/

COMMENT ON COLUMN SALES.SALES_NUM IS '판매번호PST'
/

COMMENT ON COLUMN SALES.PRODUCT_NAME IS '제품명'
/

COMMENT ON COLUMN SALES.SALES_DATE IS '판매일시'
/

COMMENT ON COLUMN SALES.EMP_NUM IS '판매담당자F'
/

COMMENT ON COLUMN SALES.SALES_AMOUNT IS '판매수량'
/

COMMENT ON COLUMN SALES.PARTNER_NUM IS '거래처번호F'
/

ALTER TABLE SALES
    ADD CONSTRAINT FK_SALES_PARTNER_NUM_PARTNER_P FOREIGN KEY (PARTNER_NUM)
        REFERENCES PARTNER (PARTNER_NUM)
/

ALTER TABLE SALES
    ADD CONSTRAINT FK_SALES_EMP_NUM_EMPLOYEE_EMP_ FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/


-- DEPT Table Create SQL
CREATE TABLE ATTACHMENT
(
    ATT_NUM            VARCHAR2(50)      NOT NULL, 
    DOC_NUM            VARCHAR2(50)      NOT NULL, 
    ATT_ORIGIN_NAME    VARCHAR2(2000)    NOT NULL, 
    ATT_PATH           VARCHAR2(2000)    NOT NULL, 
    CONSTRAINT ATTACHMENT_PK PRIMARY KEY (ATT_NUM, DOC_NUM)
)
/

COMMENT ON TABLE ATTACHMENT IS '파일경로'
/

COMMENT ON COLUMN ATTACHMENT.ATT_NUM IS '파일번호PST'
/

COMMENT ON COLUMN ATTACHMENT.DOC_NUM IS '문서번호'
/

COMMENT ON COLUMN ATTACHMENT.ATT_ORIGIN_NAME IS '파일원래이름'
/

COMMENT ON COLUMN ATTACHMENT.ATT_PATH IS '파일경로'
/

ALTER TABLE ATTACHMENT
    ADD CONSTRAINT UC_ATT_PATH UNIQUE (ATT_PATH)
/


-- DEPT Table Create SQL
CREATE TABLE PROFILE
(
    EMP_NUM                VARCHAR2(50)      NOT NULL, 
    PROFILE_ORIGIN_NAME    VARCHAR2(2000)    NOT NULL, 
    PROFILE_PATH           VARCHAR2(2000)    NOT NULL, 
    CONSTRAINT PROFILE_PK PRIMARY KEY (EMP_NUM)
)
/

COMMENT ON TABLE PROFILE IS '프로필사진'
/

COMMENT ON COLUMN PROFILE.EMP_NUM IS '사원번호F'
/

COMMENT ON COLUMN PROFILE.PROFILE_ORIGIN_NAME IS '파일원래이름'
/

COMMENT ON COLUMN PROFILE.PROFILE_PATH IS '파일경로'
/

ALTER TABLE PROFILE
    ADD CONSTRAINT FK_PROFILE_EMP_NUM_EMPLOYEE_EM FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/

ALTER TABLE PROFILE
    ADD CONSTRAINT UC_PROFILE_PATH UNIQUE (PROFILE_PATH)
/


-- DEPT Table Create SQL
CREATE TABLE REFERENCE
(
    DOC_NUM    VARCHAR2(50)    NOT NULL, 
    EMP_NUM    VARCHAR2(50)    NOT NULL, 
    CONSTRAINT REFERENCE_PK PRIMARY KEY (DOC_NUM, EMP_NUM)
)
/

COMMENT ON TABLE REFERENCE IS '참조'
/

COMMENT ON COLUMN REFERENCE.DOC_NUM IS '문서번호'
/

COMMENT ON COLUMN REFERENCE.EMP_NUM IS '참조자F'
/

ALTER TABLE REFERENCE
    ADD CONSTRAINT FK_REFERENCE_EMP_NUM_EMPLOYEE_ FOREIGN KEY (EMP_NUM)
        REFERENCES EMPLOYEE (EMP_NUM)
/




--SEQ
CREATE SEQUENCE APPROVAL_NUM_SEQ;
CREATE SEQUENCE EMP_NUM_SEQ;
CREATE SEQUENCE ATT_NUM_SEQ;
CREATE SEQUENCE DEPT_NUM_SEQ;
CREATE SEQUENCE GRADE_NUM_SEQ;
CREATE SEQUENCE NOTICE_NUM_SEQ;
CREATE SEQUENCE DRAFT_NUM_SEQ;
CREATE SEQUENCE CONFIRM_NUM_SEQ;
CREATE SEQUENCE REQUEST_NUM_SEQ;
CREATE SEQUENCE EXPENSE_NUM_SEQ;
CREATE SEQUENCE HOLI_NUM_SEQ;
CREATE SEQUENCE SALES_NUM_SEQ;
CREATE SEQUENCE PARTNER_NUM_SEQ;
CREATE SEQUENCE LICENSE_MANAGE_SEQ;
CREATE SEQUENCE FIXTURE_NUM_SEQ;
CREATE SEQUENCE JOURN_NUM_SEQ;
CREATE SEQUENCE ACCOUNT_NUM_SEQ;
CREATE SEQUENCE PAY_NUM_SEQ;

--TRIGGER
--APPROVAL
CREATE OR REPLACE TRIGGER TRG_APPROVAL
BEFORE INSERT ON APPROVAL FOR EACH ROW
BEGIN
SELECT 'APPROVAL'||TO_CHAR(SYSDATE,'YYYY')||LPAD(APPROVAL_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.APPROVAL_NUM FROM DUAL;
END;
/

--EMPLOYEE
CREATE OR REPLACE TRIGGER TRG_MEM
BEFORE INSERT ON EMPLOYEE FOR EACH ROW
BEGIN
SELECT TO_CHAR(SYSDATE,'YYYY')||LPAD(EMP_NUM_SEQ.NEXTVAL,4,0) INTO :NEW.EMP_NUM FROM DUAL;
END;
/

--ATTACHMENT
CREATE OR REPLACE TRIGGER TRG_ATT
BEFORE INSERT ON ATTACHMENT FOR EACH ROW
BEGIN
SELECT 'ATT'||TO_CHAR(SYSDATE,'YYYY')||LPAD(ATT_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.ATT_NUM FROM DUAL;
END;
/

--NOTICE
CREATE OR REPLACE TRIGGER TRG_NOTICE
BEFORE INSERT ON NOTICE FOR EACH ROW
BEGIN
SELECT 'NOTICE'||TO_CHAR(SYSDATE,'YYYY')||LPAD(NOTICE_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.NOTICE_NUM FROM DUAL;
END;
/

--DRAFT
CREATE OR REPLACE TRIGGER TRG_DRAFT
BEFORE INSERT ON DOC_DRAFT FOR EACH ROW
BEGIN
SELECT 'DRAFT'||TO_CHAR(SYSDATE,'YYYY')||LPAD(EMP_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.DRAFT_NUM FROM DUAL;
END;
/

--REQUEST
CREATE OR REPLACE TRIGGER TRG_REQUEST
BEFORE INSERT ON DOC_REQUEST FOR EACH ROW
BEGIN
SELECT 'REQ'||TO_CHAR(SYSDATE,'YYYY')||LPAD(REQUEST_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.REQUEST_NUM FROM DUAL;
END;
/

--EXPENSE
CREATE OR REPLACE TRIGGER TRG_EXPENSE
BEFORE INSERT ON DOC_EXPENSE FOR EACH ROW
BEGIN
SELECT 'EXPENSE'||TO_CHAR(SYSDATE,'YYYY')||LPAD(EXPENSE_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.EXPENSE_NUM FROM DUAL;
END;
/
--HOLLYDAY
CREATE OR REPLACE TRIGGER TRG_HOLIDAY
BEFORE INSERT ON DOC_HOLIDAY FOR EACH ROW
BEGIN
SELECT 'HOLI'||TO_CHAR(SYSDATE,'YYYY')||LPAD(HOLI_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.HOLI_NUM FROM DUAL;
END;
/
--CONFIRM
CREATE OR REPLACE TRIGGER TRG_CONFIRM
BEFORE INSERT ON CONFIRM FOR EACH ROW
BEGIN
SELECT 'CONFIRM'||TO_CHAR(SYSDATE,'YYYY')||LPAD(CONFIRM_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.CONFIRM_NUM FROM DUAL;
END;
/

--SALES
CREATE OR REPLACE TRIGGER TRG_SALES
BEFORE INSERT ON SALES FOR EACH ROW
BEGIN
SELECT 'SALES'||TO_CHAR(SYSDATE,'YYYY')||LPAD(SALES_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.SALES_NUM FROM DUAL;
END;
/
--PARTNER
CREATE OR REPLACE TRIGGER TRG_PARTNER
BEFORE INSERT ON PARTNER FOR EACH ROW
BEGIN
SELECT 'PARTNER'||TO_CHAR(SYSDATE,'YYYY')||LPAD(PARTNER_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.PARTNER_NUM FROM DUAL;
END;
/
--LICENSE
CREATE OR REPLACE TRIGGER TRG_LICENSE
BEFORE INSERT ON LICENSE FOR EACH ROW
BEGIN
SELECT 'LICENSE'||TO_CHAR(SYSDATE,'YYYY')||LPAD(LICENSE_MANAGE_SEQ.NEXTVAL,6,0) INTO :NEW.LICENSE_MANAGE FROM DUAL;
END;
/
--ACCOUNT
CREATE OR REPLACE TRIGGER TRG_ACCOUNT
BEFORE INSERT ON ACCOUNT FOR EACH ROW
BEGIN
SELECT 'ACCOUNT'||TO_CHAR(SYSDATE,'YYYY')||LPAD(ACCOUNT_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.ACCOUNT_NUM FROM DUAL;
END;
/
--PAYMENT
CREATE OR REPLACE TRIGGER TRG_PAYMENT
BEFORE INSERT ON PAYMENT FOR EACH ROW
BEGIN
SELECT 'PAYMENT'||TO_CHAR(SYSDATE,'YYYY')||LPAD(PAY_NUM_SEQ.NEXTVAL,6,0) INTO :NEW.PAY_NUM FROM DUAL;
END;
/