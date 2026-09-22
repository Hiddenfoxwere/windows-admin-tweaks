# 🛠️ windows-10-admin-tweaks

🌐 **[English](#english-version) | [Русская версия](#русская-версия)**

---

## English Version

### 📌 About This Repository
This repository is a curated collection of system administration tweaks and visual guides focused **exclusively on Windows 10**. It serves as a testing environment for various methods of managing and disabling file download restrictions. The goal is to document how to configure built-in OS features and browser security policies using step-by-step screenshots, registry files, and commands.

Welcome to the **"Hidden Fox"** repository. All features and tweaks are actively tested on Windows 10.

> [!WARNING]
> **Disclaimer:** Please keep in mind that everything provided here is publicly available; use it at your own risk and remember to create a restore point. Disabling security functions may expose your system to threats. By proceeding, you assume full responsibility for all risks. Content is provided "as-is."

### 📂 Configuration & Visual Guides (Windows 10 Only)

markdown#### 🌐 1. Browser Download Protection
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

  > [!IMPORTANT]
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

#### 🔹 2. Registry Tweaks (.reg)
*Registry modifications tested on Windows 10.*

#### 🔹 3. Group Policy Settings (gpedit.msc)
*System-wide policy configurations.*

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


#### 🔹 2. Твики реестра (.reg)
*Модификации реестра, протестированные в среде Windows 10.*

- Здесь пока пусто -

#### 🔹 3. Групповые политики (gpedit.msc)
*Конфигурации системных политик для Windows 10 Pro / Enterprise.*

- Здесь пока пусто -
