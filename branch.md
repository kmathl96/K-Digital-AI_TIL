### 상황 1. fast-foward

> fast-foward는 feature 브랜치 생성된 이후 master 브랜치에 변경 사항이 없는 상황

1. feature/main branch 생성 및 이동

   ```bash
   $ git checkout -b feature/main
   ```

2. 작업 완료 후 commit

   ```bash
   $ git commit -m "Complete main"
   ```


3. master 이동

   ```bash
   $ git checkout master
   ```


4. master에 병합

   ```bash
   (master) $ git merge feature/main
   ```


5. 결과 -> fast-foward (단순히 HEAD를 이동)

   ```bash
   $ git log --oneline
   ```

6. branch 삭제

   ```bash
   $ git branch -d feature/main
   ```
   
   

---

### 상황 2. merge commit

> 서로 다른 이력(commit)을 병합(merge)하는 과정에서 다른 파일이 수정되어 있는 상황
>
> git이 auto merging을 진행하고, commit이 발생된다.

1. feature/signout branch 생성 및 이동

   ```bash
   $ git checkout -b feature/about
   ```

2. 작업 완료 후 commit

   ```bash
   $ touch about.html
   $ git add .
   $ git commit -m "Complete about.html"
   
   $ git log --oneline
   1690321 (HEAD -> master) Add .gitignore
   d506107 Add README.md
   6909256 Initial commit
   ```

3. master 이동

   ```bash
   $ git checkout master
   ```

4. *master에 추가 commit 이 발생시키기!!*

   * **다른 파일을 수정 혹은 생성하세요!**

   ```bash
   $ touch hotfix.html
   $ git add .
   $ git commit -m "Hotfix!"
   
   $ git log --oneline
   486e015 (HEAD -> master) Hotfixgit add .
   1690321 Add .gitignore
   d506107 Add README.md
   6909256 Initial commit
   ```

5. master에 병합

   ```bash
   $ git merge feature/about
   ```

6. 결과 -> 자동으로 *merge commit 발생*

   * vim 편집기 화면이 나타납니다.
   
   * 자동으로 작성된 커밋 메시지를 확인하고, `esc`를 누른 후 `:wq`를 입력하여 저장 및 종료를 합니다.
      * `w` : write
      * `q` : quit
      
   * 커밋이  확인 해봅시다.
   
7. 그래프 확인하기

   ```bash
   $ git log --oneline --graph
   *   a8b6850 (HEAD -> master) Merge branch 'feature/about'
   |\
   | * e4512a8 (feature/about) Add about.html
   | * e37151a (feature/main) Complete main
   * | 486e015 Hotfixgit add .
   |/
   * 1690321 Add .gitignore
   * d506107 Add README.md
   * 6909256 Initial commit
   ```

8. branch 삭제

   ```bash
   $ git branch -d feature/about
   ```
   
   

---

### 상황 3. merge commit 충돌

> 서로 다른 이력(commit)을 병합(merge)하는 과정에서 동일 파일이 수정되어 있는 상황
>
> git이 auto merging을 하지 못하고, 해당 파일의 위치에 라벨링을 해준다.
>
> 원하는 형태의 코드로 직접 수정을 하고 merge commit을 발생 시켜야 한다.

1. feature/sub branch 생성 및 이동

   ```bash
   $ git checkout -b feature/sub
   ```

2. 작업 완료 후 commit

   ```bash
   $ touch sub.html # + README.md도 수정 및 저장
   $ git add .
   $ git commit -m "Update README.md and Add sub.html"
   $ git status # README.md가 수정되었고, sub.html이 생겼는지 확인
   ```


3. master 이동

   ```bash
   $ git checkout master
   ```


4. *master에 추가 commit 이 발생시키기!!*

   * **동일 파일을 수정 혹은 생성하세요!**

   ```bash
   # README.md 수정
   $ git add .
   $ git commit -m "Update README.md"
   ```

5. master에 병합

   ```bash
   $ git merge feature/sub
   ```


6. 결과 -> *merge conflict발생*



7. 충돌 확인 및 해결

   파일 수정 후 저장


8. merge commit 진행

    ```bash
    $ git commit
    ```

   * vim 편집기 화면이 나타납니다.
   
   * 자동으로 작성된 커밋 메시지를 확인하고, `esc`를 누른 후 `:wq`를 입력하여 저장 및 종료를 합니다.
      * `w` : write
      * `q` : quit
      
   * 커밋이  확인 해봅시다.
   
9. 그래프 확인하기

    ```bash
   $ git log --oneline --graph
   *   ffb44bc (HEAD -> master) Merge branch 'feature/sub'
   |\
   | * 49e0417 (feature/sub) Update README.md and Add sub.html
   * | 74ee1c9 Update README.md
   |/
   *   a8b6850 Merge branch 'feature/about'
   |\
   | * e4512a8 Add about.html
   | * e37151a Complete main
   * | 486e015 Hotfixgit add .
   |/
   * 1690321 Add .gitignore
   * d506107 Add README.md
   * 6909256 Initial commit
    ```


10. branch 삭제

    ```bash
    $ git branch -d feature/sub
    ```
    
    
