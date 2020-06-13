# LMS using Machine Learning Base Station Selection and Edge Contents Caching

머신러닝 기반 최적 기지국 선택기법과 엣지 콘텐츠 캐싱을 활용한 LMS </br>
2020-1 Capstone Design2 Project </br>

### Motivation:
LMS that provides effective mobile traffic distribution and increase contents delivery speed

### Assumptions:
* Students access LMS according to their School's Timetable
* Students access LMS near their school
* Base Stations have MEC(Mobile Edge Computing) Server

### Requirement(DataSet):
* Telecom Italia Big Data Challenge set (https://dandelion.eu/datamine/open-big-data/)  <br/>
(Grid 1,2,3 == BS 1,2,3) <br/>
* final_high_school.csv, final_ele_school.csv, final_middle_school.csv: 각 학교, 주소, 위도, 경도, 학년별 숫자수 데이터셋
* 2019_students_num.csv : 학교별 학급별 학생수, (19년 유토중등 학교별 학년별 학생수 학습수 입학 졸업 교원 직원 면적_191227)
* elementary_middle_schools_location.csv: 초중학교 위도,경도 (전국초중등학교위치표준데이터)
* elementary.csv: 초등학교 이름, 주소, 위도,경도 (전국초중등학교위치표준데이터)
* middle_school.csv: 중학교 이름, 주소, 위도,경도 (전국초중등학교위치표준데이터)
* high_school.csv: 고등학교 이름, 주소, (전국고등학교군표준데이터) 위도,경도
* high_timetable, middle_timetable, elementary_timetable.csv : 초중고등학교 시간표 (교시, 수업 진행 시간)


### Background:
* Mobile Traffic Prediction & BS Selection Algorithm: </br>
Python 3.5 </br>
Jupyter Notebook </br>
Keras </br>

* WEB:
Express Framework </br>
Back-end : Node JS </br>
Front-end: HTML/CSS/JS </br>

* AWS: </br>
![image](https://user-images.githubusercontent.com/17666783/82525977-b1814100-9b6d-11ea-81c6-36e0321daaa7.png)

EC2 instance: LMS Web Server, Controller </br>
S3: Contents Storage </br>
RDS : Database </br>
CloudFront: CDN Service </br>
Edge Location: Base Station </br>
