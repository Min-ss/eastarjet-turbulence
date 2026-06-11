@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   난기류 지도 - GitHub 자동 업로드
echo ============================================
echo.

git add -A

REM [안전장치] 보안 에이전트 등이 추적 파일을 지워도 '삭제'가 업로드되지 않게,
REM   스테이징된 삭제(D)는 커밋 직전 모두 취소·복구. (수정/추가 파일은 그대로 둠)
REM   → add 이후에 검사하므로 복구→재삭제 race 를 막음 (index 에 원본이 보존됨)
for /f "delims=" %%f in ('git diff --cached --name-only --diff-filter^=D') do (
  git reset -q -- "%%f"
  git checkout -- "%%f"
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
