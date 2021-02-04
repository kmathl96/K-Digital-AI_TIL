# Eclipse-Git 연동

## Git repository 연결

1. 이클립스 좌측 상단에서 해당 버튼(Open Perspective) 클릭
   ![image-20210131233328196](img\image-20210131233328196.png)

2. Git 선택
   ![image-20210131233628382](img\image-20210131233628382.png)

3. 해당하는 것 선택

   ![image-20210131233832571](img\image-20210131233832571.png)

   1. Add an existing local Git repository : 기존 저장소에 추가
   2. Clone a Git repository : 기존 저장소를 복제
   3. Create a new local Git repository : 새 저장소 생성

4. 지금 나는 Git 저장소를 안 만들어놨으므로 새 저장소를 생성
   ![image-20210201000303928](img\image-20210201000303928.png)

5. Git 폴더가 만들어지고 연동이 됨
   ![image-20210201000708860](img\image-20210201000708860.png)

6. 난 해당 Git에 올릴 문서들(TIL 등)이 있으므로 로컬 폴더에 Docs 폴더를 만들어 넣고  푸시했더니 이클립스에도 반영돼있음
   ![image-20210201000744031](img\image-20210201000744031.png)

7. 이전 워크스페이스에 있던 파일들을 옮겨옴

   - 옮겨진 게 확인은 되는데, 실행이 안 됨
     - unable to find an ant file to run
     - 원래 하던대로 빌드가 안 되고 ant 빌드가 실행됨.. 이유는 모르겠다... :cry:
   - Git 연결해놓은 Perspective 창에서 실행하지 말고 해당 Git 저장소의 파일들을 워크스페이스로 가져와서 실행해보기로 한다...



## Import Git

> 워크스페이스로 Git 저장소의 프로젝트를 가져오기

1. File-Import
   ![image-20210201004110326](img\image-20210201004110326.png)

2. 나는 존재하는 Git 저장소를 사용할 것이기 때문에 해당 Git 저장소 선택
   ![image-20210201004340368](img\image-20210201004340368.png)
   ![image-20210201004414440](img\image-20210201004414440.png)

3. workspace에서 작업할 것이기 때문에 Working Tree의 workspace 선택
   ![image-20210201004542946](img\image-20210201004542946.png)

   - 기존 워크스페이스의 파일들을 Git 폴더에 복붙하고 안 지워서.. 같은 이름의 파일이 있다고 워크스페이스에 추가가 안 됨 :sweat:
     ![image-20210201004950405](img\image-20210201004950405.png)

4. 기존 워크스페이스 파일들을 지우고.. Import projects...
   ![image-20210201005651662](img\image-20210201005651662.png)

5. 해당하는 Git 폴더 선택하면 아까와 같은 창이 나오고 어떤 프로젝트를 추가할지 선택할 수 있게 됨![image-20210201005900846](img\image-20210201005900846.png)
   ![image-20210201010036235](img\image-20210201010036235.png)

6. 제대로 추가 되었고, 실행도 잘 됨! :clap:

   ![image-20210201010329642](img\image-20210201010329642.png)
