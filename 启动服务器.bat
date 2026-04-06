@echo off
echo 正在启动本地服务器...
echo 请在浏览器打开: http://localhost:8080
echo 关闭此窗口即停止服务器
echo.
cd /d "%~dp0"
python -m http.server 8080
pause
