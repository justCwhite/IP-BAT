@echo off & setlocal enabledelayedexpansion
echo. & echo ����ץȡ�������ơ���
set m=0
for /f "tokens=1* delims=," %%a in ('Getmac /v /nh /fo csv') do (
set /a m+=1
set "name!m!=%%a"
set "name=%name:~1,-1%"
)
:Select_Card
echo. & echo 1:!name1! & echo 2:!name2! & echo 3:!name3! & echo 4:!name4! & echo 5:!name5! & echo.
set /p "Select_Card=ѡ������[�������]:"
if "%Select_Card%" == "1" ( set card=!name1! )& ( cls&goto menu) else (
if "%Select_Card%" == "2" ( set card=!name2! )& ( cls&goto menu ) else (
if "%Select_Card%" == "3" ( set card=!name3! )& ( cls&goto menu ) else (
if "%Select_Card%" == "4" ( set card=!name4! )& ( cls&goto menu ) else (
if "%Select_Card%" == "5" ( set card=!name5! )& ( cls&goto menu ) else ( exit )))))
:menu
echo. & echo ѡ������:%card%
echo [1] DHCP      [2] ���ĳɾ�̬����IP     [3]�����Զ���IP��   ������˳�&echo.
set /p yn=�����س�:
if /i "%yn%"=="1" goto dhcp
if /i "%yn%"=="2" goto static
if /i "%yn%"=="3" cls&goto diy
echo pause&exit
:dhcp
netsh interface ip set address name=%card% source=dhcp
cls&goto menu
:static
netsh interface ipv4 add address %card% 192.168.0.100 255.0.0.0
netsh interface ipv4 add address %card% 192.168.1.100 255.0.0.0
netsh interface ipv4 add address %card% 192.168.88.100 255.0.0.0
netsh interface ipv4 add address %card% 192.168.168.100 255.0.0.0
netsh interface ipv4 add address %card% 172.16.0.100 255.0.0.0
netsh interface ipv4 add address %card% 192.168.1.88 255.0.0.0
cls&goto menu
:diy
echo ����IP��ַ��q�������˵�&echo.
set /p ip=�����س�:
if /i "%ip%"=="q" cls&goto menu
echo
netsh interface ipv4 add address %card% "%ip%" 255.0.0.0
cls&goto diy
