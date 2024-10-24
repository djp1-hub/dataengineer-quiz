# Используем базовый образ с Python
FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы приложения
COPY . .

# Устанавливаем зависимости
RUN pip install -r requirements.txt

# Запускаем приложение
CMD ["flask", "run", "--host=0.0.0.0"]
