# Git 관리

## .gitignore

:lock: `.metadata`의 데이터가 자주 바뀌고 그 양이 많아서 Github에 올리고 싶지 않음

:key: `.gitignore` 파일 만들기

- 해당 파일/폴더를 .gitignore 텍스트 파일에 작성하여 저장
- [자동으로 .gitignore 파일 생성하기](http://gitignore.io/)
  - java, eclipse 등의 키워드를 적으면 .gitignore 내용 생성해줌
  - .gitignore 파일 만든 후 해당 내용 복붙

---

:lock: .gitignore.txt에 작성했는데도 git이 해당 파일을 관리함..:thinking: 

:key: 이클립스에서 직접 추가하기

- Window - Preferences - Team - Git - Ignored Resources
  ![image-20210204173050626](../K-Digital-AI/Docs/img/image-20210204173050626-1612427902285.png)
- 그치만 난 여전히 .metadata, .class 파일 등이 올라감​ :sob:

:key: 파일 이름 확인하기

- `.gitignore`에 확장자명(`.txt`)이 붙어있었는데 지우니까 바로 적용됨 :angry:



## Github의 파일/폴더 삭제

:lock: `.metadata`를 이미 올려놓은 상태인데 로컬 파일은 남겨두고, Github에서만 지우고 싶음

:key: git bash에서 아래 명령어 실행

```bash
git rm --cached -r (폴더명/파일명)
```

- `rm` : 로컬과 git에서 삭제
- `cached` : 로컬은 건드리지 않고 git에만 적용시킴
- `r` : 폴더 내의 모든 파일 삭제