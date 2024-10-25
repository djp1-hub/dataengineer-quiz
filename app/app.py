from flask import Flask, render_template, request, redirect, url_for
from sqlalchemy import create_engine, Table, MetaData, Column, Integer, String, Boolean, func, distinct, select
from sqlalchemy.orm import sessionmaker
from sqlalchemy.sql import insert

app = Flask(__name__)

# Строка подключения к базе данных
DATABASE_URL = "postgresql://quiz_user:quiz_password@db:5432/quiz_db"
engine = create_engine(DATABASE_URL)
metadata = MetaData()

# Определяем таблицу с вопросами
questions_table = Table('quiz_questions', metadata, autoload_with=engine)

# Определяем таблицу для хранения результатов, если она еще не создана
results_table = Table(
    'quiz_results', metadata,
    Column('id', Integer, primary_key=True),
    Column('user_name', String, nullable=False),
    Column('user_surname', String, nullable=False),
    Column('question_id', Integer, nullable=False),
    Column('user_answer', String, nullable=False),
    Column('is_correct', Boolean, nullable=False),
    Column('score', Integer, nullable=False)
)
metadata.create_all(engine, checkfirst=True)

# Создаем сессию для взаимодействия с базой данных
Session = sessionmaker(bind=engine)
session = Session()


@app.route("/results", methods=["GET"])
def results():
    # Извлекаем результаты из базы данных
    results_data = session.execute(select(results_table)).all()

    # Подготовка данных для передачи в шаблон
    detailed_results = []
    for result in results_data:
        question = session.execute(
            select(questions_table).where(questions_table.c.id == result.question_id)
        ).first()
        detailed_results.append({
            "name": result.user_name,
            "surname": result.user_surname,
            "question": question.question,
            "user_answer": result.user_answer,
            "is_correct": result.is_correct,
            "score": result.score
        })

    return render_template("results.html", detailed_results=detailed_results)


@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        name = request.form.get("name")
        surname = request.form.get("surname")
        return redirect(url_for('quiz', name=name, surname=surname))

    return render_template("index.html")


@app.route("/quiz", methods=["GET", "POST"])
def quiz():
    name = request.args.get("name")
    surname = request.args.get("surname")

    if request.method == "POST":
        total_score = 0
        incorrect_score = 0
        for question in session.execute(select(questions_table)).all():
            user_answer = request.form.get(f"question_{question.id}")
            is_correct = user_answer == question.correct_answer
            cor_score = int(question.rating.split()[0]) if is_correct else 0
            not_cor_score = int(question.rating.split()[0]) if not is_correct else 0

            total_score += cor_score
            incorrect_score += not_cor_score

            # Сохраняем результаты в базу данных
            new_result = insert(results_table).values(
                user_name=name,
                user_surname=surname,
                question_id=question.id,
                user_answer=user_answer,
                is_correct=is_correct,
                score=cor_score
            )
            session.execute(new_result)

        session.commit()
        return f"Спасибо, {name} {surname}. Ваш результат: {total_score} баллов из {total_score + incorrect_score}."

    # Получаем два случайных вопроса для каждой уникальной темы
    subquery = (
        select(
            questions_table.c.id,
            questions_table.c.topic,
            questions_table.c.question,
            func.row_number().over(partition_by=questions_table.c.topic, order_by=func.random()).label('row_number')
        ).subquery()
    )

    # Основной запрос, выбирающий только два случайных вопроса для каждого уникального topic
    questions = session.execute(
        select(subquery).where(subquery.c.row_number <= 2)
    ).all()

    return render_template("quiz.html", questions=questions, name=name, surname=surname)


if __name__ == "__main__":
    app.run(debug=True)
