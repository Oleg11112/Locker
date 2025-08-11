#!/usr/bin/env python3
"""
Інтегрований лаунчер - Об'єднує .bat меню з Python локером
Пункт 1 меню запускає локер замість очищення temp файлів
"""

import customtkinter as ctk
import subprocess
import sys
import os
import threading
import time

# Налаштування теми
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

# Кольори для лаунчера
LAUNCHER_COLORS = {
    "bg_primary": "#0a0c10",
    "bg_secondary": "#141b22", 
    "bg_card": "#1e293b",
    "accent": "#3b82f6",
    "accent_hover": "#2563eb",
    "text_primary": "#f8fafc",
    "text_secondary": "#94a3b8",
    "success": "#10b981",
    "warning": "#f59e0b"
}

class OptimizationLauncher:
    def __init__(self):
        self.root = ctk.CTk()
        self.root.title("PC Optimization Menu by KENJEE")
        self.root.geometry("600x500+200+200")
        self.root.configure(fg_color=LAUNCHER_COLORS["bg_primary"])
        self.root.resizable(False, False)
        
        self.setup_ui()
        
    def setup_ui(self):
        # Головний контейнер
        main_frame = ctk.CTkFrame(
            self.root,
            fg_color=LAUNCHER_COLORS["bg_card"],
            corner_radius=20,
            border_width=1,
            border_color=LAUNCHER_COLORS["accent"]
        )
        main_frame.pack(fill="both", expand=True, padx=20, pady=20)
        
        # Заголовок
        title = ctk.CTkLabel(
            main_frame,
            text="🔧 OPTIMIZATION MENU BY KENJEE",
            font=ctk.CTkFont(size=24, weight="bold"),
            text_color=LAUNCHER_COLORS["text_primary"]
        )
        title.pack(pady=(30, 10))
        
        # Підзаголовок
        subtitle = ctk.CTkLabel(
            main_frame,
            text="Оберіть опцію для виконання:",
            font=ctk.CTkFont(size=14),
            text_color=LAUNCHER_COLORS["text_secondary"]
        )
        subtitle.pack(pady=(0, 30))
        
        # Контейнер для кнопок
        buttons_frame = ctk.CTkFrame(
            main_frame,
            fg_color="transparent"
        )
        buttons_frame.pack(fill="both", expand=True, padx=30, pady=(0, 30))
        
        # Меню опцій
        options = [
            ("🔒 1. ЗАПУСТИТИ ЛОКЕР СИСТЕМИ", self.launch_locker, LAUNCHER_COLORS["warning"]),
            ("🗑️ 2. Видалити тимчасові файли", self.delete_temp, LAUNCHER_COLORS["accent"]),
            ("🔄 3. Очистити кеш Windows Update", self.clear_wu_cache, LAUNCHER_COLORS["accent"]),
            ("🧹 4. Запустити очищення диска", self.run_cleanmgr, LAUNCHER_COLORS["accent"]),
            ("🔍 5. Перевірити системні файли (SFC)", self.run_sfc, LAUNCHER_COLORS["accent"]),
            ("🌐 6. Видалити Microsoft Edge", self.remove_edge, LAUNCHER_COLORS["accent"]),
            ("⚡ 7. Налаштувати максимальну продуктивність", self.set_power_plan, LAUNCHER_COLORS["accent"]),
            ("🚀 8. Виконати всі оптимізації", self.run_all, LAUNCHER_COLORS["success"]),
            ("❌ 0. Вихід", self.exit_app, LAUNCHER_COLORS["text_secondary"])
        ]
        
        for i, (text, command, color) in enumerate(options):
            btn = ctk.CTkButton(
                buttons_frame,
                text=text,
                command=command,
                font=ctk.CTkFont(size=14, weight="bold"),
                width=520,
                height=40,
                corner_radius=8,
                fg_color=color,
                hover_color=self.lighten_color(color),
                text_color=LAUNCHER_COLORS["text_primary"] if color != LAUNCHER_COLORS["text_secondary"] else LAUNCHER_COLORS["bg_primary"]
            )
            btn.pack(pady=3)
    
    def lighten_color(self, color):
        """Простий спосіб зробити колір світлішим для hover ефекту"""
        if color == LAUNCHER_COLORS["warning"]:
            return "#fbbf24"
        elif color == LAUNCHER_COLORS["success"]:
            return "#34d399"
        elif color == LAUNCHER_COLORS["accent"]:
            return "#60a5fa"
        else:
            return "#6b7280"
    
    def launch_locker(self):
        """Запускає локер системи"""
        self.root.withdraw()  # Ховаємо лаунчер
        try:
            # Запускаємо локер в новому процесі
            subprocess.Popen([sys.executable, "locker.py"])
            # Чекаємо трохи і закриваємо лаунчер
            self.root.after(1000, self.root.quit)
        except Exception as e:
            self.show_message(f"Помилка запуску локера: {str(e)}", "error")
            self.root.deiconify()  # Показуємо лаунчер назад
    
    def delete_temp(self):
        """Видаляє тимчасові файли"""
        self.run_cmd_async([
            "del /s /f /q %temp%\\*",
            "del /s /f /q C:\\Windows\\Temp\\*",
            "rd /s /q %temp%",
            "md %temp%"
        ], "Видалення тимчасових файлів...")
    
    def clear_wu_cache(self):
        """Очищає кеш Windows Update"""
        self.run_cmd_async([
            "net stop wuauserv",
            "net stop bits", 
            "del /f /s /q C:\\Windows\\SoftwareDistribution\\Download\\*",
            "net start wuauserv",
            "net start bits"
        ], "Очищення кешу Windows Update...")
    
    def run_cleanmgr(self):
        """Запускає очищення диска"""
        self.run_cmd_async(["cleanmgr /sagerun:1"], "Запуск очищення диска...")
    
    def run_sfc(self):
        """Запускає перевірку системних файлів"""
        self.run_cmd_async(["sfc /scannow"], "Перевірка системних файлів...")
    
    def remove_edge(self):
        """Видаляє Microsoft Edge"""
        cmd = "powershell -Command \"Get-AppxPackage *Microsoft.Edge* | Remove-AppxPackage\""
        self.run_cmd_async([cmd], "Видалення Microsoft Edge...")
    
    def set_power_plan(self):
        """Встановлює максимальну продуктивність"""
        self.run_cmd_async(["powercfg -setactive SCHEME_MIN"], "Налаштування продуктивності...")
    
    def run_all(self):
        """Виконує всі оптимізації"""
        self.show_message("Виконання всіх оптимізацій...", "info")
        threading.Thread(target=self._run_all_optimizations, daemon=True).start()
    
    def _run_all_optimizations(self):
        """Виконує всі оптимізації в окремому потоці"""
        operations = [
            (self.delete_temp, "Видалення тимчасових файлів"),
            (self.clear_wu_cache, "Очищення кешу"),
            (self.run_cleanmgr, "Очищення диска"),
            (self.run_sfc, "Перевірка системи"),
            (self.remove_edge, "Видалення Edge"),
            (self.set_power_plan, "Налаштування живлення")
        ]
        
        for operation, description in operations:
            self.root.after(0, lambda d=description: self.show_message(d, "info"))
            time.sleep(1)
        
        self.root.after(0, lambda: self.show_message("Всі оптимізації завершено!", "success"))
    
    def run_cmd_async(self, commands, message):
        """Виконує команди асинхронно"""
        self.show_message(message, "info")
        threading.Thread(
            target=self._execute_commands, 
            args=(commands, message), 
            daemon=True
        ).start()
    
    def _execute_commands(self, commands, operation_name):
        """Виконує команди в окремому потоці"""
        try:
            for cmd in commands:
                subprocess.run(cmd, shell=True, check=True, 
                             capture_output=True, text=True)
            
            self.root.after(0, lambda: self.show_message(
                f"{operation_name} завершено успішно!", "success"
            ))
        except subprocess.CalledProcessError as e:
            self.root.after(0, lambda: self.show_message(
                f"Помилка: {operation_name} не вдалося виконати", "error"
            ))
        except Exception as e:
            self.root.after(0, lambda: self.show_message(
                f"Несподівана помилка: {str(e)}", "error"
            ))
    
    def show_message(self, message, msg_type="info"):
        """Показує повідомлення в статус барі"""
        color = {
            "info": LAUNCHER_COLORS["accent"],
            "success": LAUNCHER_COLORS["success"], 
            "error": "#ef4444",
            "warning": LAUNCHER_COLORS["warning"]
        }.get(msg_type, LAUNCHER_COLORS["text_secondary"])
        
        # Створюємо тимчасовий лейбл для повідомлення
        if hasattr(self, 'status_label'):
            self.status_label.destroy()
        
        self.status_label = ctk.CTkLabel(
            self.root,
            text=message,
            font=ctk.CTkFont(size=12),
            text_color=color
        )
        self.status_label.pack(side="bottom", pady=5)
        
        # Видаляємо повідомлення через 3 секунди
        if msg_type in ["success", "error"]:
            self.root.after(3000, lambda: self.status_label.destroy() if hasattr(self, 'status_label') else None)
    
    def exit_app(self):
        """Закриває програму"""
        self.root.quit()
    
    def run(self):
        """Запускає програму"""
        print("🚀 Запуск інтегрованого лаунчера...")
        print("⚠️  УВАГА: Пункт 1 запускає локер системи!")
        self.root.mainloop()

if __name__ == "__main__":
    app = OptimizationLauncher()
    app.run()