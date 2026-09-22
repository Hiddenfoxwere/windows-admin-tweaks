🌐 # 🛠️ windows-10-admin-tweaks

🌐 **[Русская версия](#русская-версия) | [English Version](#english-version)**

---

## Русская версия

### 📌 О данном репозитории
Этот репозиторий представляет собой сборник твиков системного администрирования и визуальных руководств, ориентированных **исключительно на Windows 10**. Проект используется как тестовая среда для проверки различных методов управления и отключения ограничений на скачивание файлов. Цель — задокументировать настройку встроенных функций ОС и политик безопасности браузеров с помощью пошаговых скриншотов, файлов реестра и команд.

Добро пожаловать в репозиторий **"Hidden Fox"**. Все функции и твики тестируются строго на Windows 10.

> [!WARNING]
> **Отказ от ответственности:** Пожалуйста, помните, что все предоставленные здесь материалы находятся в открытом доступе; используйте их на свой страх и риск и не забывайте создавать точку восстановления системы. Отключение функций безопасности может подвергнуть вашу систему угрозам. Продолжая, вы принимаете на себя полную ответственность за все риски. Материалы предоставляются «как есть».

### 📂 Руководства и скриншоты (Только для Windows 10)

#### 🌐 1. Защита от скачивания в браузерах
*Пошаговые инструкции и скриншоты для отключения встроенных блокировок загрузки в популярных браузерах.*

* **Google Chrome:**

  1. Перейдите по адресу: `chrome://settings/security`
  
  2. В разделе **Безопасный просмотр** выберите пункт **Защита отключена (не рекомендуется)**.
  
  *Скриншот настройки:*
  
  <img width="685" height="385" alt="image" src="https://github.com/user-attachments/assets/0f850725-226e-41aa-b859-9b6d7039a76b" />
  
  3. Подтвердите действие во всплывающем окне, нажав кнопку **Отключить**.
     
     *Скриншот подтверждения:*
     
  <img width="510" height="237" alt="image" src="https://github.com/user-attachments/assets/ca1e7a23-23c1-44c1-8b60-44f803f4ad4a" />

  4. Если вы попытаетесь загрузить "подозрительный файл" - файл скачается во временную дирректорию и переместиться после нажатия "подтверждения" о загрузке подозрительный Файл (важное уточнение вы можете увидеть стрелочку "вправо" как на этом скриншоте, после нажатия снова на этом файле будет открыто окно о подтверждении, но не раньше).

     *Скриншот:*

  <img width="320" height="86" alt="image" src="https://github.com/user-attachments/assets/e1595ff1-ee7d-4d57-934c-f56ba44f7ae6" />

    *Скриншот после нажатия на файл в списке загрузки:*
      
  <img width="447" height="184" alt="image" src="https://github.com/user-attachments/assets/23948070-bfc0-4bc5-92d2-7836cd73d20f" />

 
* **Microsoft Edge:**

  1. Перейдите по адресу: `edge://settings/privacy/security`
     
  2. Шаги по SmartScreen в Microsoft Defender  - пропущены.

  3. Найдите пункт Защита от опасных сайтов и загрузок - переключите тумблер в положение Выкл.

  *Скриншот настройки:*

  <img width="796" height="561" alt="image" src="https://github.com/user-attachments/assets/3875c4f2-4825-410e-ab5b-dac79fcf1004" />

#### 🔹 2. Скрипт временного отключения защиты (.bat)
Пакетный файл автоматизирует процесс: самостоятельно запрашивает права администратора, отключает Брандмауэр и SmartScreen, а после нажатия любой клавиши в консоли корректно возвращает все параметры безопасности в исходное состояние.



* **Инструкция по использованию:**
  1. Создайте файл `Temporary_protection_disablement.bat` и скопируйте в него код скрипта (Или загрузите [Temporary_protection_disablement.bat](https://github.com/Hiddenfoxwere/windows-admin-tweaks/blob/WereFox-place/Temporary_protection_disablement.bat))
  2. Запустите файл двойным кликом (система сама запросит права Администратора - нужны права Админа).
  3. Выполните необходимые действия по загрузке или тестированию.
  4. Вернитесь в окно консоли и **нажмите любую кнопку**, чтобы вернуть настройки безопасности назад.
 
  <details>
<summary>🔍 Посмотреть исходный код скрипта</summary>

```batch
@echo off
net session >nul 2>&1
if %errorLevel% == 0 ( goto :AdminTasks ) else ( goto :Elevate )
:Elevate
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %*", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /b
:AdminTasks
chcp 65001 > nul
title Windows 10 Temporary Security Bypass
echo ==================================================
echo ОТКЛЮЧЕНИЕ ЗАЩИТЫ WINDOWS / DISABLING SECURITY...
echo ==================================================
echo [*] Отключение Брандмауэра (Windows Firewall)...
powershell -Command "Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False"
echo [*] Отключение SmartScreen...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'SmartScreenEnabled' -Value 'Off'"
powershell -Command "if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -Name 'System' -Force | Out-Null }; Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableSmartScreen' -Value 0"
echo.
echo [✔] Защита временно отключена!
echo Оставьте это окно ОТКРЫТЫМ. После завершения задач нажмите любую клавишу.
echo ==================================================
echo.
pause
echo.
echo ==================================================
echo ВКЛЮЧЕНИЕ ЗАЩИТЫ ОБРАТНО / RE-ENABLING SECURITY...
echo ==================================================
echo [*] Включение Брандмауэра обратно...
powershell -Command "Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled True"
echo [*] Включение SmartScreen обратно...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'SmartScreenEnabled' -Value 'RequireAdmin'"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableSmartScreen' -Value 1"
echo.
echo [✔] Безопасность системы полностью восстановлена!
timeout /t 5
```
</details>


#### 🔹 3. Твики реестра (.reg)
*Модификации реестра, протестированные в среде Windows 10.*

- Здесь пока пусто -

#### 🔹 4. Групповые политики (gpedit.msc)
*Конфигурации системных политик для Windows 10 Pro / Enterprise.*

- Здесь пока пусто -

---

## English Version

### 📌 About This Repository
This repository is a curated collection of system administration tweaks and visual guides focused **exclusively on Windows 10**. It serves as a testing environment for various methods of managing and disabling file download restrictions. The goal is to document how to configure built-in OS features and browser security policies using step-by-step screenshots, registry files, and commands.

Welcome to the **"Hidden Fox"** repository. All features and tweaks are actively tested on Windows 10.

> [!WARNING]
> **Disclaimer:** Please keep in mind that everything provided here is publicly available; use it at your own risk and remember to create a restore point. Disabling security functions may expose your system to threats. By proceeding, you assume full responsibility for all risks. Content is provided "as-is."

### 📂 Configuration & Visual Guides (Windows 10 Only)

#### 🌐 1. Browser Download Protection
*Steps and visual guides for disabling built-in browser download blocks.*

* **Google Chrome:**

  1. Navigate to: `chrome://settings/security`
  
  2. In the **Safe Browsing** section, select **No protection (not recommended)**.
     
     *Visual Guide:*
     
     <img width="987" height="447" alt="image" src="https://github.com/user-attachments/assets/6bf08f12-56fc-4e74-a39a-34ac2eda57d4" />


  4. Confirm the action in the pop-up window by clicking **Turn off**.
     
     *Confirmation:*
 
     <img width="512" height="207" alt="image" src="https://github.com/user-attachments/assets/f4cd65e3-dee4-4796-b51f-026f80aa3132" />

   * **Behavior Note:** 
    If you attempt to download a "suspicious file," it will download to a temporary directory first. The file will only be moved to your destination folder after you click "Confirm" to download the suspicious file.

    [!IMPORTANT]
    > You may see a "right arrow" icon as shown in the screenshot below. Clicking on the file in the list again will bring up the confirmation window, but not before.

    *Screenshot:*

    <img width="320" height="86" alt="image" src="https://github.com/user-attachments/assets/e1595ff1-ee7d-4d57-934c-f56ba44f7ae6" />

    *Screenshot after clicking on the file in the download list:*

    <img width="447" height="184" alt="image" src="https://github.com/user-attachments/assets/23948070-bfc0-4bc5-92d2-7836cd73d20f" />



* **Microsoft Edge:**

  1. Navigate to: `edge://settings/privacy`
  
  2. Steps for Microsoft Defender SmartScreen — *skipped*.

  3. Locate the **Microsoft Defender SmartScreen** option and toggle the switch to **Off**.
     
     *Visual Guide:*

     <img width="1241" height="414" alt="image" src="https://github.com/user-attachments/assets/77df5f34-110f-4a9c-8035-823320ad535d" />

#### 🔹 2. Temporary Security Bypass Script (.bat)
An all-in-one batch script that automatically requests admin privileges, disables Windows Firewall and SmartScreen, and securely restores all settings back to their original state once the user presses any key.

* **How to use:**
  1. Save the code into a file named `Temporary_protection_disablement.bat` (or download [Temporary_protection_disablement.bat](https://github.com/Hiddenfoxwere/windows-admin-tweaks/blob/WereFox-place/Temporary_protection_disablement.bat)).
  2. Double-click the file to execute (it will trigger a UAC prompt for admin rights - needed Admin right).
  3. Perform your file downloads or testing operations.
  4. Return to the console window and **press any key** to re-enable security features.
 
  <details>
<summary>🔍 View Script Source Code</summary>

```batch
@echo off
net session >nul 2>&1
if %errorLevel% == 0 ( goto :AdminTasks ) else ( goto :Elevate )
:Elevate
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %*", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /b
:AdminTasks
chcp 65001 > nul
title Windows 10 Temporary Security Bypass
echo ==================================================
echo ОТКЛЮЧЕНИЕ ЗАЩИТЫ WINDOWS / DISABLING SECURITY...
echo ==================================================
echo [*] Отключение Брандмауэра (Windows Firewall)...
powershell -Command "Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False"
echo [*] Отключение SmartScreen...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'SmartScreenEnabled' -Value 'Off'"
powershell -Command "if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -Name 'System' -Force | Out-Null }; Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableSmartScreen' -Value 0"
echo.
echo [✔] Защита временно отключена!
echo Оставьте это окно ОТКРЫТЫМ. После завершения задач нажмите любую клавишу.
echo ==================================================
echo.
pause
echo.
echo ==================================================
echo ВКЛЮЧЕНИЕ ЗАЩИТЫ ОБРАТНО / RE-ENABLING SECURITY...
echo ==================================================
echo [*] Включение Брандмауэра обратно...
powershell -Command "Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled True"
echo [*] Включение SmartScreen обратно...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer' -Name 'SmartScreenEnabled' -Value 'RequireAdmin'"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableSmartScreen' -Value 1"
echo.
echo [✔] Безопасность системы полностью восстановлена!
timeout /t 5
```
</details>


#### 🔹 3. Registry Tweaks (.reg)
*Registry modifications tested on Windows 10.*

#### 🔹 4. Group Policy Settings (gpedit.msc)
*System-wide policy configurations.*

---


