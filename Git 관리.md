# Git 관리

## .gitignore

:lock: `.metadata`의 데이터가 자주 바뀌고 그 양이 많아서 Github에 올리고 싶지 않음

:key: `.gitignore` 파일 만들기

- 해당 파일/폴더를 .gitignore 텍스트 파일에 작성하여 저장



## Github의 파일/폴더 삭제

:lock: `.metadata`를 이미 올려놓은 상태인데 로컬 파일은 남겨두고, Github에서만 지우고 싶음

:key: git bash에서 아래 명령어 실행

```bash
git rm --cached -r (폴더명/파일명)
```

- `rm` : 로컬과 git에서 삭제
- `cached` : 로컬은 건드리지 않고 git에만 적용시킴
- `r` : 폴더 내의 모든 파일 삭제