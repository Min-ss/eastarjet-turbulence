@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   난기류 지도 - GitHub 자동 업로드
echo ============================================
echo.

git add -A

git diff --cached --quiet
if %errorlevel%==0 (
  echo 변경된 내용이 없습니다. 업로드할 것이 없어요.
  echo.
  pause
  exit /b 0
)

for /f "tokens=1-5 delims=/: " %%a in ("%date% %time%") do set STAMP=%%a-%%b-%%c %%d:%%e
git commit -m "사이트 갱신 %STAMP%"
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
