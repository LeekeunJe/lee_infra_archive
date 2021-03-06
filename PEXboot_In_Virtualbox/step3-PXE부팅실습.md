# PXE 부팅 실습

PXE 부팅 및 kickstart 자동화를 테스트한다.

## 테스트용 VM 작성

메모리는 2GB이상으로 해준다.
(1GB로 했더니, 용량이 부족해서 실패했다...)

### 네트워크 설정
`step1-사전준비`에서 설명한 것 처럼,<br>
DHCP를 사용하지 않는 Ether Adapter를 지정하여 호스트 전용 네트워크를 선택한다.<br>
어댑터 종류를 `Pcnet-FAST III`로 선택하는 것도 잊지 않는다.<br>
또한 패키지 등을 다운로드 받기 위한 NAT 네트워크도 추가해준다.

### 부팅순서 설정
PXE 부팅의 경우, 일반 VM 설치 준비와 달리 iso 이미지를 인식해서 부팅하는 것이 아닌 네트워크로 부팅한다.<br>
때문에 VM의 부팅 순서를 변경해준다.

<img width="800" alt="부팅1" src="https://user-images.githubusercontent.com/19552819/100620150-6e482c00-3361-11eb-8ea9-01b97cc8fb68.png">

## 부팅
위와 같이 설정하여 VM을 시작하면 아래와 같이 PXE 부팅이 시작된다.

<img width="800" alt="테스트부팅1" src="https://user-images.githubusercontent.com/19552819/100620157-6ee0c280-3361-11eb-96a8-f8172629af1c.JPG">

이후 조금 더 기다리면, 아래와 같이 메뉴 화면이 나오고 PXE 환경 준비때 준비해둔 pxe boot menu가 나온다.

<img width="800" alt="테스트부팅2" src="https://user-images.githubusercontent.com/19552819/100620158-6f795900-3361-11eb-86ea-85a47d292c8a.JPG">

이 단계를 지나면, OS 이미지가 로드되고, OS 설정 화면이 나온다.<br>
<img width="800" alt="테스트부팅3" src="https://user-images.githubusercontent.com/19552819/100620159-6f795900-3361-11eb-9444-b22157e80418.JPG">

모든 설정은 kickstart에 정의해둔 내용으로 자동으로 설정되어 설치가 진행된다.
