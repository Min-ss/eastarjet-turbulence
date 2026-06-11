@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   난기류 지도 - GitHub 자동 업로드
echo ============================================
echo.

git add -A

REM [안전장치] 보안 에이전트 등이 추적 파일(예: 업로드.bat)을 지운 상태에서
REM   '삭제'가 GitHub로 올라가는 사고를 막는다. 삭제가 하나라도 스테이징되면
REM   아무것도 올리지 않고 중단한다. (파일명 파싱 없이 단순·안전)
git diff --cached --diff-filter=D --quiet
if %errorlevel% NEQ 0 (
  echo [중단] 추적 파일이 사라진 상태가 감지되었습니다.
  echo        삭제를 잘못 업로드하지 않도록 업로드를 중단합니다.
  echo        Claude에게 "업로드해줘" 라고 하면 안전하게 복구·반영해 줍니다.
  git reset -q
  echo.
  pause
  exit /b 1
)

git diff --cached --quiet
if %errorlevel%==0 (
  echo 변경된 내용이 없습니다. 업로드할 것이 없어요.
  echo.
  pause
  exit /b 0
)

git commit -m "사이트 갱신 %date% %time%"
echo.
echo 업로드 중...
git push origin main

if %errorlevel%==0 (
  echo.
  echo ============================================
  echo   완료! 1~2분 뒤 사이트가 갱신됩니다.
  echo   https://min-ss.github.io/eastarjet-turbulence/
  echo ============================================
) else (
  echo.
  echo [오류] 업로드에 실패했습니다. 위 메시지를 확인하세요.
)
echo.
pause
