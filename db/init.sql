-- Создание таблицы с вопросами
CREATE TABLE quiz_questions (
    id SERIAL PRIMARY KEY,
    question TEXT NOT NULL,
    answer_options TEXT NOT NULL,
    correct_answer TEXT NOT NULL,
    rating TEXT NOT NULL
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


-- Вставка данных в таблицу
INSERT INTO public.quiz_questions (question,answer_options,correct_answer,rating) VALUES
	 ('Какие стратегии используются для обработки медленно меняющихся измерений (SCD) в хранилище данных?','Тип 1 Перезапись,Тип 2 Добавление новой строки,Тип 3 Добавление нового столбца,Тип 4 Использование таблицы истории,Тип 6 Гибрид (типы 1 + 2 + 3)','Тип 6 Гибрид (типы 1 + 2 + 3)','6'),
	 ('Какой тип индексов в PostgreSQL подходит для ускорения полнотекстового поиска?','1. B-tree,2. Hash,3. GIN,4. GiST','3. GIN','2'),
	 ('Как можно реализовать автоматическое разделение таблиц в PostgreSQL на партиции?','1. Использовать триггеры,2. Создать внешние ключи,3. Использовать конструкцию PARTITION BY,4. Использовать функциональные индексы','3. Использовать конструкцию PARTITION BY','2'),
	 ('Какая команда используется для создания индексированного представления в MSSQL?','1. CREATE VIEW … WITH SCHEMABINDING,2. CREATE MATERIALIZED VIEW,3. CREATE INDEXED VIEW,4. CREATE VIEW … AS INDEXED','1. CREATE VIEW … WITH SCHEMABINDING','3'),
	 ('Какой метод в Pandas используется для объединения DataFrame по общим столбцам?','1. merge,2. join,3. concatenate,4. stack','1. merge','2'),
	 ('Какой модуль Python позволяет работать с параллельными вычислениями с использованием потоков?','1. asyncio,2. threading,3. multiprocessing,4. concurrent','2. threading','3'),
	 ('Какое хранилище используется в Airflow для сохранения метаданных DAG?','1. Redis,2. MySQL,3. PostgreSQL или SQLite,4. Cassandra','3. PostgreSQL или SQLite','2'),
	 ('Для чего используется команда dbt run?','1. Для проверки синтаксиса SQL-моделей,2. Для создания и обновления моделей в базе данных,3. Для удаления старых данных,4. Для мониторинга DAG','2. Для создания и обновления моделей в базе данных','2'),
	 ('Какой файл в проекте DBT определяет зависимости и источники данных?','1. project.yml,2. requirements.txt,3. profiles.yml,4. schema.yml','4. schema.yml','2'),
	 ('Какой компонент Kafka отвечает за хранение записей в топиках?','1. Producer,2. Consumer,3. Broker,4. Zookeeper','3. Broker','2');
INSERT INTO public.quiz_questions (question,answer_options,correct_answer,rating) VALUES
	 ('Что такое Partition в Apache Kafka?','1. Логический раздел в хранилище для сегментирования данных,2. Программный модуль для обработки сообщений,3. Контроллер потоков данных,4. Метод сжатия сообщений','1. Логический раздел в хранилище для сегментирования данных','2'),
	 ('Как можно создать таблицу с репликацией в ClickHouse?','1. CREATE REPLICA TABLE,2. CREATE DISTRIBUTED TABLE,3. CREATE TABLE … ENGINE = ReplicatedMergeTree,4. CREATE TABLE … WITH REPLICATION','3. CREATE TABLE … ENGINE = ReplicatedMergeTree','3'),
	 ('Как в Apache NiFi организовать гарантированную доставку данных между процессорами?','1. Использовать механизм FlowFile Provenance,2. Включить механизм "Back Pressure",3. Настроить атрибут "Maximum Retries",4. Включить журналирование данных в SQL','1. Использовать механизм FlowFile Provenance','4'),
	 ('Как в Apache NiFi организовать параллельную обработку данных?','1. Настроить несколько соединительных цепочек,2. Использовать динамическое назначение CPU,3. Задать количество задач (Concurrent Tasks) в процессоре,4. Создать новый Flow','3. Задать количество задач (Concurrent Tasks) в процессоре','4'),
	 ('Как в Airflow реализовать динамическое ветвление выполнения DAG на основе данных?','1. Использовать PythonOperator для запуска Python кода,2. Использовать BranchPythonOperator,3. Использовать SqlOperator,4. Использовать SubDagOperator','2. Использовать BranchPythonOperator','4'),
	 ('Какую роль выполняет Data Integration Service (DIS) в Informatica PowerCenter?','1. Управляет расписанием выполнения ETL-процессов,2. Выполняет трансформации данных и предоставляет API,3. Управляет хранилищем метаданных,4. Реплицирует данные между серверами','2. Выполняет трансформации данных и предоставляет API','4'),
	 ('Для чего используется Metadata Repository Service (MRS) в Informatica PowerCenter?','1. Управляет метаданными и хранением схем,2. Выполняет репликацию схем между серверами,3. Управляет безопасностью данных,4. Управляет данными репозиториев','1. Управляет метаданными и хранением схем','4'),
	 ('Как можно параметризовать поток данных в NiFi для переиспользования на разных окружениях?','1. Использовать пользовательские атрибуты процессоров,2. Использовать Parameter Context,3. Использовать Scripting Processor,4. Использовать компоненты данных для хранения переменных','2. Использовать Parameter Context','3'),
	 ('Какой способ параметризации DAG является предпочтительным в Airflow?','1. Использовать конфигурационный файл .env,2. Использовать Airflow Variables,3. Использовать переменные окружения (Environment Variables),4. Использовать hardcoded значения внутри DAG','2. Использовать Airflow Variables','3'),
	 ('Что нужно сделать, если при попытке сделать коммит в Git обнаружилось, что в удаленном репозитории уже есть новый коммит и возникли расхождения?','1. Выполнить git push --force для перезаписи удаленной ветки,2. Использовать git pull для слияния изменений с удаленного репозитория,3. Удалить локальные изменения и повторить git clone,4. Использовать команду git stash для сохранения изменений перед слиянием','2. Использовать git pull для слияния изменений с удаленного репозитория','4');
INSERT INTO public.quiz_questions (question,answer_options,correct_answer,rating) VALUES
	 ('Какой сервис используется для интеграции данных в Azure Synapse?','1. Azure Data Factory,2. Azure Logic Apps,3. Cosmos DB,4. Azure SQL Database','1. Azure Data Factory','3'),
	 ('В чем основное отличие между Synapse SQL и Spark в Azure Synapse Analytics?','1. Synapse SQL используется для обработки структурированных данных Spark — для распределенной обработки неструктурированных данных,2. Synapse SQL только для управления пользователями,3. Spark не поддерживается в Synapse,4. Synapse SQL используется для создания ML-моделей','1. Synapse SQL используется для обработки структурированных данных Spark — для распределенной обработки неструктурированных данных','4'),
	 ('Какую роль выполняют компоненты ClickHouse, ZooKeeper и ClickHouse Keeper в кластере?','1. ClickHouse — хранение данных ZooKeeper — управление репликацией и координацией узлов ClickHouse Keeper — мониторинг,2. ClickHouse — репликация данных ZooKeeper — управление кластерами ClickHouse Keeper — поддержка партиционирования,3. ClickHouse — хранение и репликация данных ZooKeeper — управление метаданными и координацией узлов ClickHouse Keeper — альтернатива ZooKeeper для координации узлов,4. ClickHouse — мониторинг данных ZooKeeper — управление метаданными ClickHouse Keeper — обработка запросов','3. ClickHouse — хранение и репликация данных ZooKeeper — управление метаданными и координацией узлов ClickHouse Keeper — альтернатива ZooKeeper для координации узлов','4'),
	 ('Что такое Service Principal в Azure?','1. Учетная запись пользователя используемая для административных задач,2. Специальный тип учетной записи используемой для приложений и служб для доступа к ресурсам,3. Роль администрирования подписок,4. Группа безопасности, связанная с ролями','2. Специальный тип учетной записи используемой для приложений и служб для доступа к ресурсам','4'),
	 ('Как правильно распределить хранение данных между PostgreSQL, Greenplum и Hadoop в зависимости от объема?','1. PostgreSQL — до 10 ТБ Greenplum — от 10 ТБ и более Hadoop — более 100 ТБ,2. PostgreSQL — до 10 ТБ Greenplum — от 10 ТБ до 100 ТБ Hadoop — от 100 ТБ и более,3. PostgreSQL — от 10 ТБ Greenplum — до 10 ТБ Hadoop — более 100 ТБ','2. PostgreSQL — до 10 ТБ Greenplum — от 10 ТБ до 100 ТБ Hadoop — от 100 ТБ и более','4'),
	 ('Какие простые способы хранения секретов и исключения их из Git вы можете использовать?','1. Использовать переменные окружения,2. Зашифровать секреты и хранить в репозитории,3. Использовать файл .env и исключить его из .gitignore,4. Хранить секреты в Airflow Variables','1. Использовать переменные окружения','4'),
	 ('Какую роль выполняют компоненты PostgreSQL, etcd и Patroni в кластере?','1. PostgreSQL — хранение данных etcd — управление конфигурациями Patroni — мониторинг,2. PostgreSQL — хранение данных etcd — управление конфигурацией и координация узлов Patroni — управление состоянием кластера и автоматический failover,3. PostgreSQL — хранение метаданных etcd — хранение данных Patroni — мониторинг,4. PostgreSQL — репликация данных etcd — управление базами Patroni — автоматическое обновление','2. PostgreSQL — хранение данных etcd — управление конфигурацией и координация узлов Patroni — управление состоянием кластера и автоматический failover','4'),
	 ('Какой тип индексирования используется в ClickHouse для ускорения поиска по столбцам?','1. Primary Key,2. Full-Text Index,3. Sparse Index,4. Data Skipping Index','3. Sparse Index','3');
