@echo off
:: ==============================================================================
# Windows 10 Temporary Security Bypass (All-in-One .BAT Launcher)
:: ==============================================================================

:: 1. Автоматический запрос прав администратора (UAC Elevation)
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :AdminTasks
) else (
    echo Requesting administrative privileges...
    goto :Elevate
)

:Elevate
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %*", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /b

:AdminTasks
:: Смена кодировки консоли на UTF-8 для корректного отображения русского текста
chcp 65001 > nul
title Windows 10 Temporary Security Bypass

echo ==================================================
echo ОТКЛЮЧЕНИЕ ЗАЩИТЫ WINDOWS / DISABLING SECURITY...
echo ==================================================

:: 2. Отключение встроенного Брандмауэра Windows (Firewall)
echo [*] Отключение Брандмауэра (Windows Firewall)...
powershell -Command "Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False"

:: 3. Отключение Microsoft Defender SmartScreen
echo [*] Отключение SmartScreen...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'SmartScreenEnabled' -Value 'Off'"
powershell -Command "if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -Name 'System' -Force | Out-Null }; Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableSmartScreen' -Value 0"

echo.
echo [✔] Защита временно отключена!
echo Оставьте это окно ОТКРЫТЫМ. После завершения ваших задач нажмите любую клавишу.
echo ==================================================
echo.

:: 4. Жесткая пауза — окно не закроется, пока пользователь сам не нажмет клавишу
pause

echo.
echo ==================================================
echo ВКЛЮЧЕНИЕ ЗАЩИТЫ ОБРАТНО / RE-ENABLING SECURITY...
echo ==================================================

:: 5. Восстановление настроек Брандмауэра
echo [*] Включение Брандмауэра обратно...
powershell -Command "Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled True"

:: 6. Восстановление настроек SmartScreen
echo [*] Включение SmartScreen обратно...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'SmartScreenEnabled' -Value 'RequireAdmin'"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableSmartScreen' -Value 1"

echo.
echo [✔] Безопасность системы полностью восстановлена!
echo Теперь это окно можно закрыть.
echo.
timeout /t 5
