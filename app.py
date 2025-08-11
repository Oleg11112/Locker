#!/usr/bin/env python3
"""
Flask Web Locker - Веб-версія локера з красивим інтерфейсом
УВАГА: Це веб-версія, яка не може блокувати систему як оригінальний tkinter додаток
"""

from flask import Flask, render_template, request, jsonify, redirect, url_for
import os
import time

app = Flask(__name__)
app.secret_key = 'locker_secret_key_2024'

# Конфігурація
PASSWORD = "14707"
BACKUP_PASSWORD = "unlockmepls"

# Глобальні змінні
attempt_count = 0
last_attempt = ""
is_unlocked = False

@app.route('/')
def index():
    """Головна сторінка з локером"""
    global is_unlocked
    if is_unlocked:
        return redirect(url_for('unlocked'))
    return render_template('locker.html')

@app.route('/unlock', methods=['POST'])
def unlock():
    """Обробка спроби розблокування"""
    global attempt_count, last_attempt, is_unlocked
    
    data = request.get_json()
    user_input = data.get('password', '').strip()
    
    attempt_count += 1
    last_attempt = user_input
    
    if user_input == PASSWORD:
        is_unlocked = True
        return jsonify({
            'success': True, 
            'message': 'Система успішно розблокована!',
            'redirect': '/unlocked'
        })
    elif user_input == BACKUP_PASSWORD:
        is_unlocked = True
        return jsonify({
            'success': True, 
            'message': 'Розблоковано через резервний пароль!',
            'redirect': '/unlocked'
        })
    else:
        return jsonify({
            'success': False,
            'message': 'Невірний пароль!',
            'attempt': user_input,
            'count': attempt_count
        })

@app.route('/unlocked')
def unlocked():
    """Сторінка успішного розблокування"""
    global is_unlocked
    if not is_unlocked:
        return redirect(url_for('index'))
    return render_template('unlocked.html')

@app.route('/reset')
def reset():
    """Скидання стану (для тестування)"""
    global attempt_count, last_attempt, is_unlocked
    attempt_count = 0
    last_attempt = ""
    is_unlocked = False
    return redirect(url_for('index'))

if __name__ == '__main__':
    # Створюємо папку templates якщо її немає
    if not os.path.exists('templates'):
        os.makedirs('templates')
    if not os.path.exists('static'):
        os.makedirs('static')
    
    print("🌐 Запуск Flask Web Locker...")
    print("📝 Доступні паролі:")
    print("   - 14707 (основний)")
    print("   - unlockmepls (резервний)")
    print("🔗 Відкрийте http://localhost:5000 в браузері")
    print("⚠️  УВАГА: Це веб-версія, яка не блокує систему!")
    
    app.run(debug=True, host='0.0.0.0', port=5000)