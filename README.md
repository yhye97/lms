# LMS using Machine Learning Base Station Selection and Edge Contents Caching

머신러닝 기반 최적 기지국 선택기법과 엣지 콘텐츠 캐싱을 활용한 LMS </br>
2020-1 Capstone Design2 Project </br>

### Motivation:
LMS that provides effective mobile traffic distribution and increase contents delivery speed

### Assumptions:
* Students access LMS according to their School's Timetable
* Students access LMS near their school
* Base Stations have MEC(Mobile Edge Computing) Server

### Requirement:
* Dataset: </br>
Telecom Italia Big Data Challenge set (https://dandelion.eu/datamine/open-big-data/)  </br>
(Grid 1,2,3 == BS 1,2,3) </br>


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