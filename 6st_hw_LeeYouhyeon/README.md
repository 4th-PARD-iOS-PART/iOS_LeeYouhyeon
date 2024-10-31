# iOS_LeeYouhyeon


## HW6
### 서버로부터 API연결

#### 1-1. viewController 화면
<img src="https://github.com/user-attachments/assets/78c36115-e661-4e68-a8ef-c656f26bf3fd" width="300"/>

- 앱을 실행했을 때 가장 먼저 보이는 화면입니다.
- 서버로부터 web, iOS, server의 유저 데이터를 가져옵니다.


#### 2. DetailModalController 화면
<img src="https://github.com/user-attachments/assets/b92f344e-3440-400e-8ebd-e5d8ae31fadf" width="300"/>

- 테이블뷰로 나열된 데이터 중 특정 셀을 클릭했을 때 나오는 모달입니다.
- 선택한 데이터의 이름, 나이, 파트를 보여줍니다.

#### 3-1. ModalAddViewController 화면
<img src="https://github.com/user-attachments/assets/ecdd15a9-2245-48a4-a4ff-d172b56827cc" width="300"/>

- viewController에서 추가 버튼을 눌렀을 경우 나타나는 모달입니다. 
- 이름과 나이, 파트를 입력한 추가하기를 누를 경우 서버에 해당 데이터가 전송됩니다.
- 이름, 나이, 파트를 제대로 입력하지 않으면 "입력 데이터가 올바르지 않습니다"라는 알람이 뜹니다.

#### 3-2. viewController 화면
<img src="https://github.com/user-attachments/assets/dacfc053-15bc-451d-a32e-41b3b53fd219" width="300"/>

- ModalAddViewController화면에서 추가하기를 누를 경우 나타나는 화면입니다.
- Notification을 통해 ModalAddViewController에서 서버로 데이터 post시 viewController에 변경된 데이터를 업데이트합니다. 
