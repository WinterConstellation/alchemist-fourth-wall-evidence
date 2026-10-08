# 연금술사 4의 벽 시퀀스 - 창작 시점 증거 저장소

이 저장소는 작품 속 연금술사와 관련된 4의 벽 시퀀스가 특정 시점에 구체적인 형태로 존재했음을 보존하기 위한 공개 기록입니다.

## 보존 범위

- 연금술사가 자신의 현실을 `이야기로 취급되는 현상`으로 인식하는 설정
- 연금술사가 작가에게 직접 항의하는 장면
- 발악 구간에서 지문을 제거하고 대사만 이어지는 형식
- 연금술사의 `나는 살아 있는 인간`이라는 주장
- 나레이션이 그 주장을 단 한 번 기각하는 장면
- 연금술사가 마지막에는 자신의 존재 조건과 공생하는 결말

아벨, 마르엘, 편법의 작동 원리 등 이번 시퀀스와 직접 관계없는 설정은 제외했습니다.

## 파일 구성

- `canonical/alchemist-fourth-wall-sequence-v1.md`: 사람이 읽을 수 있는 정본 기획서
- `output/pdf/alchemist-fourth-wall-sequence-v1.pdf`: 고정 배포본
- `source/2026-08-10-user-messages.json`: 2026년 8월 10일 사용자 작성 원문 발췌와 서버 기록 시각
- `evidence-manifest.json`: 증거 묶음의 범위와 작성 정보
- `SHA256SUMS.txt`: 주요 파일의 SHA-256 해시
- `scripts/verify-evidence.ps1`: 해시 검증 스크립트
- `.gitattributes`: 운영체제별 줄바꿈 변환을 막아 원본 바이트를 보존

## 검증

Windows PowerShell에서 저장소 루트를 기준으로 실행합니다.

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify-evidence.ps1
```

모든 파일이 최초 커밋 당시와 동일하면 각 파일에 `OK`가 표시되고 마지막에 `검증 성공`이 출력됩니다.

## 증거 구조

`SHA256SUMS.txt`는 각 파일의 바이트 단위 동일성을 확인합니다. GitHub 커밋은 해당 파일·해시·검증 코드가 동일한 버전으로 서버에 기록된 시점을 보존합니다. 향후 내용이 추가되더라도 이 최초 증거 커밋은 수정하거나 재작성하지 않습니다.

## 권리 고지

Copyright (c) 2026 WinterConstellation. All rights reserved.

이 저장소의 공개는 열람과 창작 시점 확인을 위한 것이며, 복제·각색·배포 또는 2차적 이용을 허락하는 라이선스 부여가 아닙니다.
