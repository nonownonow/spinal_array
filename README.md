spinal_array_ai :: 지능형 나선형 배열

[제작 과정]

1. 공간을 셋팅한다
2. 시간을 셋팅한다
3. 시간속에서 현제의 위치를 과거의 위치를 통해서 판단한다
4. 경계지역에서 충돌하면 이동방향을 바꾼다
5. 만들어진 collection을 array로 변환한다

[실행 방법]
(ex: 3*7 spinal_array 출력하기) 
coffee spinal_array.coffee 3 7

[테스트 실행]
npm test