# Oasis 프론트
## 기술 스택 
### -> 프론트 : flutter (앱+웹)
### -> 벡엔드 : DRF (Django rest framework)
### -> DB : DRF내에 있는 SQLite 
### -> 벡엔드 서버 : 리눅스 (우분투)

# 기능 구성
### 최소 기능

1. 로그인 및 회원가입
2. 마일리지 적립

   https://velog.io/@dochis/웹-개발자가-알아야-할-카드결제-시스템의-구조

    1. 카드 등록하기 https://velog.io/@silmxmail/아임포트-결제-구현하기
    2. 등록된 카드의 결제 내역 불러오기

       신용카드 사용 내역 조회 API https://developers.kftc.or.kr/dev/openapi/open-banking/transaction

    3. 카드 결제 내역이 갱신될 때마다 마일리지 적립
3. 마일리지 조회
4. 마일리지 사용 → 기프티콘 구매
    1. 금액권 선택 후 구매하면 마일리지 차감
    2. 구매하면 바코드 생성 https://codetroy.com/2023-11-08/13-12-57-151870-플러터를-사용한-바코드-생성-기능-구현하기/
5. 카카오 지도 API 가져와서 지도 표시 https://cording-cossk3.tistory.com/261
6. 가맹점 DB에 넣고 카카오맵 마커로 표시하기
7. 가게 검색하기
8. 리뷰 작성하기
9. 리뷰 조회하기