# 📝 Robot To-Do List Automation

โปรเจกต์ทดสอบอัตโนมัติ (Automated Testing) สำหรับเว็บไซต์ [To-Do List](https://abhigyank.github.io) พัฒนาด้วย **Robot Framework** และ **SeleniumLibrary** โดยรองรับการรันแบบ Headless Mode บน Windows

## 📋 สิ่งที่ต้องเตรียม (Prerequisites)
- **Python 3.10 ขึ้นไป**
- **Google Chrome** (ติดตั้งที่ตำแหน่งมาตรฐาน: `C:\Program Files\Google\Chrome\Application\chrome.exe`)

## 🚀 วิธีการรันด่วน (One-Step Run)

หากคุณเพิ่ง Clone โปรเจกต์มาครั้งแรก สามารถก๊อปปี้คำสั่งด้านล่างนี้ไปวางใน **PowerShell** เพื่อเตรียมระบบและรันเทสทันที:

```powershell
python -m venv venv; Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process; .\venv\Scripts\Activate.ps1; pip install -r requirements.txt; robot -d results tests/todo_test.robot
