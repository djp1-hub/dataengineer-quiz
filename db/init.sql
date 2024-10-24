-- Создание таблицы с вопросами
CREATE TABLE quiz_questions (
    id SERIAL PRIMARY KEY,
    question TEXT NOT NULL,
    rating TEXT NOT NULL
);

-- Создание таблицы с ответами
CREATE TABLE quiz_answers (
    id SERIAL PRIMARY KEY,
    question_id INTEGER NOT NULL REFERENCES quiz_questions(id),
    answer_text TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL
);


-- Создание таблицы для хранения результатов пользователей
CREATE TABLE quiz_results (
    id SERIAL PRIMARY KEY,
    user_name TEXT NOT NULL,
    user_surname TEXT NOT NULL,
    question_id INTEGER NOT NULL REFERENCES quiz_questions(id),
    user_answer TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    score INTEGER NOT NULL
);

-- Вставка вопросов
INSERT INTO quiz_questions (question, rating)
VALUES
('Какие стратегии используются для обработки медленно меняющихся измерений (SCD) в хранилище данных?', 'За каждый по 1 баллу'),
('Какой тип индексов в PostgreSQL подходит для ускорения полнотекстового поиска?', '2');

-- Вставка ответов для первого вопроса
INSERT INTO quiz_answers (question_id, answer_text, is_correct)
VALUES
(1, 'Тип 1 Перезапись', FALSE),
(1, 'Тип 2 Добавление новой строки', TRUE),
(1, 'Тип 3 Добавление нового столбца', TRUE),
(1, 'Тип 4 Использование таблицы истории', TRUE),
(1, 'Тип 6 Гибрид (типы 1 + 2 + 3)', TRUE),
(1, 'Все из них', TRUE);

-- Вставка ответов для второго вопроса
INSERT INTO quiz_answers (question_id, answer_text, is_correct)
VALUES
(2, '1. B-tree', FALSE),
(2, '2. Hash', FALSE),
(2, '3. GIN', TRUE),
(2, '4. GiST', FALSE);
