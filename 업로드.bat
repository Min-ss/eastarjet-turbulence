@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   난기류 지도 - GitHub 자동 업로드
echo ============================================
echo.

REM [안전장치] 추적 파일이 외부 요인(보안 에이전트 등)으로 사라졌으면 먼저 복구.
REM   → 사라진 파일을 '삭제'로 잘못 업로드하는 사고 방지. (수정한 파일은 건드리지 않음)
for /f "delims=" %%f in ('git ls-files --deleted') do git checkout -- "%%f"

git add -A

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
