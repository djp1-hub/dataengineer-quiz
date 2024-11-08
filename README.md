Here is a comprehensive description for your project based on the provided files:

---

# Data Engineer Quiz

This project is a web-based quiz application designed to test and enhance knowledge in data engineering. The application is built using Flask and SQLAlchemy, and it supports Docker for easy deployment.

## Features

1. **Quiz Functionality**: Users can take quizzes consisting of multiple-choice questions.
2. **Randomized Questions**: Questions are displayed in a random order for each quiz attempt.
3. **Result Storage**: User responses and scores are stored in a PostgreSQL database.
4. **Result Viewing**: Users can view detailed results of their quiz attempts.

## Installation

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/djp1-hub/dataengineer-quiz.git
   cd dataengineer-quiz
   ```

2. **Build and Run with Docker Compose**:
   ```sh
   docker-compose up --build
   ```

3. **Access the Application**:
   Open your browser and go to:
   ```
   http://data-engineer-quiz.ru
   ```

## Project Structure

- `app/app.py`: Main application file containing the Flask routes and database models.
- `templates/`: Directory containing HTML templates for rendering the web pages.

## Database Configuration

The application uses PostgreSQL as the database. The connection string is defined in `app/app.py`:
```
DATABASE_URL = "postgresql://quiz_user:quiz_password@db:5432/quiz_db"
```

## Routes

- `/`: Home page where users can start the quiz.
- `/quiz`: Displays the quiz questions.
- `/finish_quiz`: Endpoint to submit quiz answers and view the final score.
- `/results`: Displays detailed results of all quizzes taken.

## Dependencies

- Flask
- SQLAlchemy
- PostgreSQL

## Environment Variables

- `api_key`: API key for any external services used.
- `db_config`: Database configuration.

## License

This project is licensed under the MIT License.

---

Feel free to modify the description to better suit your needs.
