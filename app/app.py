from flask import Flask, render_template, request, redirect, url_for
from sqlalchemy import create_engine, Table, MetaData, Column, Integer, String, Boolean, func

from sqlalchemy.orm import sessionmaker

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
    Column('score', Integer, nullable=False),
    Column('answer_date', Timestamp, nullable=False)
)
metadata.create_all(engine)

# Создаем сессию для взаимодействия с базой данных
Session = sessionmaker(bind=engine)
session = Session()


@app.route("/results", methods=["GET"])
def results():
    # Извлекаем результаты из базы данных
    results_data = session.query(results_table).all()

    # Подготовка данных для передачи в шаблон
    detailed_results = []
    for result in results_data:
        question = session.query(questions_table).filter_by(id=result.question_id).first()
        detailed_results.append({
            "name": result.user_name,
            "surname": result.user_surname,
            "question": question.question,
            "user_answer": result.user_answer,
            "is_correct": result.is_correct,
            "score": result.score,
            "answer_date": result.answer_date
        })

    return render_template("results.html", detailed_results=detailed_results)


@app.route("/", methods=["GET", "POST"])
def index():
    # if request.method == "POST":
    #     name = request.form.get("name")
    #     surname = request.form.get("surname")
    #     return redirect(url_for('quiz', name=name, surname=surname))
    return render_template("index.html")


@app.route("/quiz", methods=["GET", "POST"])
def quiz():
    #name = request.args.get("name")
    #surname = request.args.get("surname")

    if request.method == "POST":
        name = request.form.get("name")
        surname = request.form.get("surname")

        # total_score = 0
        # for question in session.query(questions_table).all():
        #     user_answer = request.form.get(f"question_{question.id}")
        #     is_correct = user_answer == question.correct_answer
        #     score = int(question.rating.split()[0]) if is_correct else 0
        #     total_score += score
        #
        #     # Сохраняем результаты в базу данных
        #     result = results_table.insert().values(
        #         user_name=name,
        #         user_surname=surname,
        #         question_id=question.id,
        #         user_answer=user_answer,
        #         is_correct=is_correct,
        #         score=score
        #     )
        #     engine.execute(result)
        #
        # return f"Спасибо, {name} {surname}. Ваш результат: {total_score} баллов"

        questions = session.query(questions_table).order_by(func.random()).all()
        return render_template("quiz.html", questions=questions, name=name, surname=surname)

    return redirect('/')

@app.route("/finish_quiz", methods=["GET", "POST"])
def finish_quiz():

    if request.method == "POST":
        name = request.form.get("name")
        surname = request.form.get("surname")

        total_score = 0
        for question in session.query(questions_table).all():
            user_answer = request.form.get(f"question_{question.id}")
            is_correct = user_answer == question.correct_answer
            score = int(question.rating.split()[0]) if is_correct else 0
            total_score += score

            # Сохраняем результаты в базу данных
            result = results_table.insert().values(
                user_name=name,
                user_surname=surname,
                question_id=question.id,
                user_answer=user_answer,
                is_correct=is_correct,
                score=score
            )
            engine.execute(result)

        return render_template("quiz_result.html", name=name, surname=surname, total_score=total_score)

    #questions = session.query(questions_table).order_by(func.random()).all()
    #return render_template("quiz.html", questions=questions, name=name, surname=surname)
    return redirect('/')


if __name__ == "__main__":
    app.run(debug=True)
