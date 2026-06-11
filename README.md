# 이스타항공 노선별 난기류 예보 지도

노선별 난기류(터뷸런스) 예보를 지도 위에 보여주는 단일 페이지 웹사이트입니다.
GitHub Pages로 무료 배포합니다. (대외 간행물 e-Book과 동일한 방식)

- **발행 파일**: `index.html` 한 개 (모든 코드·이미지가 내장된 자체 포함 파일)
- **저장소**: https://github.com/Min-ss/eastarjet-turbulence
- **공개 주소(Pages)**: https://min-ss.github.io/eastarjet-turbulence/

---

## 🚀 수정 후 업로드하는 법

### 1순위 — Claude에게 말하기 (권장)
`index.html` 수정 후 Claude에게 **"업로드해줘 / 올려줘 / 사이트 갱신해줘"** 라고만 하면
커밋·푸시까지 자동으로 처리되어 몇 분 안에 공개 사이트가 갱신됩니다.

### 예비 — `업로드.bat` 더블클릭
Claude 없이 직접 올리고 싶을 때 **`업로드.bat`** 을 더블클릭하면
변경분이 자동으로 커밋·푸시됩니다. (검은 창에 "완료"가 뜨면 끝, 창 닫기)

---

## ⚙️ GitHub Pages (이미 켜져 있음)

저장소 생성 시 `main / (root)` 소스로 **이미 활성화**되어 있어 추가 설정이 필요 없습니다.
(만약 다시 설정해야 한다면: 저장소 **Settings → Pages → Source: Deploy from a branch →
Branch `main` / `(root)` → Save**)

---

## 📁 폴더 안내

이 폴더에는 원본 데이터·스크립트·테스트 파일이 함께 있지만,
**실제 사이트로 발행되는 것은 `index.html` 한 파일뿐**입니다.
(나머지는 `.gitignore` 로 업로드에서 제외됩니다.)
