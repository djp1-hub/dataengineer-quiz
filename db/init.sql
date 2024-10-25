CREATE TABLE public.quiz_questions (
    id integer NOT NULL,
    question text NOT NULL,
    answer_options text NOT NULL,
    correct_answer text NOT NULL,
    rating text NOT NULL,
    topic text
);


ALTER TABLE public.quiz_questions OWNER TO quiz_user;


CREATE SEQUENCE public.quiz_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_questions_id_seq OWNER TO quiz_user;



ALTER SEQUENCE public.quiz_questions_id_seq OWNED BY public.quiz_questions.id;


--

CREATE TABLE public.quiz_results (
    id integer NOT NULL,
    user_name text NOT NULL,
    user_surname text NOT NULL,
    question_id integer NOT NULL,
    user_answer text NOT NULL,
    is_correct boolean NOT NULL,
    score integer NOT NULL
);


ALTER TABLE public.quiz_results OWNER TO quiz_user;



CREATE SEQUENCE public.quiz_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_results_id_seq OWNER TO quiz_user;


ALTER SEQUENCE public.quiz_results_id_seq OWNED BY public.quiz_results.id;


CREATE TABLE public.quiz_topics (
    id integer NOT NULL,
    topic text
);


ALTER TABLE public.quiz_topics OWNER TO quiz_user;


ALTER TABLE public.quiz_topics ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.quiz_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY public.quiz_questions ALTER COLUMN id SET DEFAULT nextval('public.quiz_questions_id_seq'::regclass);



ALTER TABLE ONLY public.quiz_results ALTER COLUMN id SET DEFAULT nextval('public.quiz_results_id_seq'::regclass);



COPY public.quiz_questions (id, question, answer_options, correct_answer, rating, topic) FROM stdin;
4	Какая команда используется для создания индексированного представления в MSSQL?	1. CREATE VIEW … WITH SCHEMABINDING,2. CREATE MATERIALIZED VIEW,3. CREATE INDEXED VIEW,4. CREATE VIEW … AS INDEXED	1. CREATE VIEW … WITH SCHEMABINDING	3	3
17	Для чего используется Metadata Repository Service (MRS) в Informatica PowerCenter?	1. Управляет метаданными и хранением схем,2. Выполняет репликацию схем между серверами,3. Управляет безопасностью данных,4. Управляет данными репозиториев	1. Управляет метаданными и хранением схем	4	4
24	Что такое Service Principal в Azure?	1. Учетная запись пользователя используемая для административных задач,2. Специальный тип учетной записи используемой для приложений и служб для доступа к ресурсам,3. Роль администрирования подписок,4. Группа безопасности связанная с ролями	2. Специальный тип учетной записи используемой для приложений и служб для доступа к ресурсам	4	1
21	Какой сервис используется для интеграции данных в Azure Synapse?	1. Azure Data Factory,2. Azure Logic Apps,3. Cosmos DB,4. Azure SQL Database	1. Azure Data Factory	3	1
28	Какой тип индексирования используется в ClickHouse для ускорения поиска по столбцам?	1. Primary Key,2. Full-Text Index,3. Sparse Index,4. Data Skipping Index	3. Sparse Index	3	8
22	В чем основное отличие между Synapse SQL и Spark в Azure Synapse Analytics?	1. Synapse SQL используется для обработки структурированных данных Spark — для распределенной обработки неструктурированных данных,2. Synapse SQL только для управления пользователями,3. Spark не поддерживается в Synapse,4. Synapse SQL используется для создания ML-моделей	1. Synapse SQL используется для обработки структурированных данных Spark — для распределенной обработки неструктурированных данных	4	1
20	Что нужно сделать, если при попытке сделать коммит в Git обнаружилось, что в удаленном репозитории уже есть новый коммит и возникли расхождения?	1. Выполнить git push --force для перезаписи удаленной ветки,2. Использовать git pull для слияния изменений с удаленного репозитория,3. Удалить локальные изменения и повторить git clone,4. Использовать команду git stash для сохранения изменений перед слиянием	2. Использовать git pull для слияния изменений с удаленного репозитория	4	2
18	Как можно параметризовать поток данных в NiFi для переиспользования на разных окружениях?	1. Использовать пользовательские атрибуты процессоров,2. Использовать Parameter Context,3. Использовать Scripting Processor,4. Использовать компоненты данных для хранения переменных	2. Использовать Parameter Context	3	4
14	Как в Apache NiFi организовать параллельную обработку данных?	1. Настроить несколько соединительных цепочек,2. Использовать динамическое назначение CPU,3. Задать количество задач (Concurrent Tasks) в процессоре,4. Создать новый Flow	3. Задать количество задач (Concurrent Tasks) в процессоре	4	4
13	Как в Apache NiFi организовать гарантированную доставку данных между процессорами?	1. Использовать механизм FlowFile Provenance,2. Включить механизм "Back Pressure",3. Настроить атрибут "Maximum Retries",4. Включить журналирование данных в SQL	1. Использовать механизм FlowFile Provenance	4	4
1	Какие стратегии используются для обработки медленно меняющихся измерений (SCD) в хранилище данных?	1. Создание новой строки с историей изменений,2. Перемещение данных в архив,3. Использование индексов для отслеживания изменений,4. Дублирование таблиц для хранения истории,5. Сжатие данных и хранение в бинарном формате	1. Создание новой строки с историей изменений	6	5
26	Какие простые способы хранения секретов и исключения их из Git вы можете использовать?	1. Использовать переменные окружения,2. Зашифровать секреты и хранить в репозитории,3. Использовать файл .env и исключить его из .gitignore,4. Хранить секреты в Airflow Variables	1. Использовать переменные окружения	4	6
25	Как правильно распределить хранение данных между PostgreSQL, Greenplum и Hadoop в зависимости от объема?	1. PostgreSQL — до 10 ТБ Greenplum — от 10 ТБ и более Hadoop — более 100 ТБ,2. PostgreSQL — до 10 ТБ Greenplum — от 10 ТБ до 100 ТБ Hadoop — от 100 ТБ и более,3. PostgreSQL — от 10 ТБ Greenplum — до 10 ТБ Hadoop — более 100 ТБ	2. PostgreSQL — до 10 ТБ Greenplum — от 10 ТБ до 100 ТБ Hadoop — от 100 ТБ и более	4	6
27	Какую роль выполняют компоненты PostgreSQL, etcd и Patroni в кластере?	1. PostgreSQL — хранение данных etcd — управление конфигурациями Patroni — мониторинг,2. PostgreSQL — хранение данных etcd — управление конфигурацией и координация узлов Patroni — управление состоянием кластера и автоматический failover,3. PostgreSQL — хранение метаданных etcd — хранение данных Patroni — мониторинг,4. PostgreSQL — репликация данных etcd — управление базами Patroni — автоматическое обновление	2. PostgreSQL — хранение данных etcd — управление конфигурацией и координация узлов Patroni — управление состоянием кластера и автоматический failover	4	7
3	Как можно реализовать автоматическое разделение таблиц в PostgreSQL на партиции?	1. Использовать триггеры,2. Создать внешние ключи,3. Использовать конструкцию PARTITION BY,4. Использовать функциональные индексы	3. Использовать конструкцию PARTITION BY	2	7
2	Какой тип индексов в PostgreSQL подходит для ускорения полнотекстового поиска?	1. B-tree,2. Hash,3. GIN,4. GiST	3. GIN	2	7
23	Какую роль выполняют компоненты ClickHouse, ZooKeeper и ClickHouse Keeper в кластере?	1. ClickHouse — хранение данных ZooKeeper — управление репликацией и координацией узлов ClickHouse Keeper — мониторинг,2. ClickHouse — репликация данных ZooKeeper — управление кластерами ClickHouse Keeper — поддержка партиционирования,3. ClickHouse — хранение и репликация данных ZooKeeper — управление метаданными и координацией узлов ClickHouse Keeper — альтернатива ZooKeeper для координации узлов,4. ClickHouse — мониторинг данных ZooKeeper — управление метаданными ClickHouse Keeper — обработка запросов	3. ClickHouse — хранение и репликация данных ZooKeeper — управление метаданными и координацией узлов ClickHouse Keeper — альтернатива ZooKeeper для координации узлов	4	8
12	Как можно создать таблицу с репликацией в ClickHouse?	1. CREATE REPLICA TABLE,2. CREATE DISTRIBUTED TABLE,3. CREATE TABLE … ENGINE = ReplicatedMergeTree,4. CREATE TABLE … WITH REPLICATION	3. CREATE TABLE … ENGINE = ReplicatedMergeTree	3	8
9	Какой файл в проекте DBT определяет зависимости и источники данных?	1. project.yml,2. requirements.txt,3. profiles.yml,4. schema.yml	4. schema.yml	2	9
8	Для чего используется команда dbt run?	1. Для проверки синтаксиса SQL-моделей,2. Для создания и обновления моделей в базе данных,3. Для удаления старых данных,4. Для мониторинга DAG	2. Для создания и обновления моделей в базе данных	2	9
16	Какую роль выполняет Data Integration Service (DIS) в Informatica PowerCenter?	1. Управляет расписанием выполнения ETL-процессов,2. Выполняет трансформации данных и предоставляет API,3. Управляет хранилищем метаданных,4. Реплицирует данные между серверами	2. Выполняет трансформации данных и предоставляет API	4	10
19	Какой способ параметризации DAG является предпочтительным в Airflow?	1. Использовать конфигурационный файл .env,2. Использовать Airflow Variables,3. Использовать переменные окружения (Environment Variables),4. Использовать hardcoded значения внутри DAG	2. Использовать Airflow Variables	3	11
15	Как в Airflow реализовать динамическое ветвление выполнения DAG на основе данных?	1. Использовать PythonOperator для запуска Python кода,2. Использовать BranchPythonOperator,3. Использовать SqlOperator,4. Использовать SubDagOperator	2. Использовать BranchPythonOperator	4	11
7	Какое хранилище используется в Airflow для сохранения метаданных DAG?	1. Redis,2. MySQL,3. PostgreSQL или SQLite,4. Cassandra	3. PostgreSQL или SQLite	2	11
6	Какой модуль Python позволяет работать с параллельными вычислениями с использованием потоков?	1. asyncio,2. threading,3. multiprocessing,4. concurrent	2. threading	3	12
5	Какой метод в Pandas используется для объединения DataFrame по общим столбцам?	1. merge,2. join,3. concatenate,4. stack	1. merge	2	12
11	Что такое Partition в Apache Kafka?	1. Логический раздел в хранилище для сегментирования данных,2. Программный модуль для обработки сообщений,3. Контроллер потоков данных,4. Метод сжатия сообщений	1. Логический раздел в хранилище для сегментирования данных	2	13
10	Какой компонент Kafka отвечает за хранение записей в топиках?	1. Producer,2. Consumer,3. Broker,4. Zookeeper	3. Broker	2	13
\.



COPY public.quiz_results (id, user_name, user_surname, question_id, user_answer, is_correct, score) FROM stdin;
1	Юрий	Иванов	1	Тип 6 Гибрид (типы 1 + 2 + 3)	t	6
2	Юрий	Иванов	2	3. GIN	t	2
3	Юрий	Иванов	3	3. Использовать конструкцию PARTITION BY	t	2
4	Юрий	Иванов	4	1. CREATE VIEW … WITH SCHEMABINDING	t	3
5	Юрий	Иванов	5	1. merge	t	2
6	Юрий	Иванов	6	2. threading	t	3
7	Юрий	Иванов	7	3. PostgreSQL или SQLite	t	2
8	Юрий	Иванов	8	2. Для создания и обновления моделей в базе данных	t	2
9	Юрий	Иванов	9	4. schema.yml	t	2
10	Юрий	Иванов	10	3. Broker	t	2
11	Юрий	Иванов	11	1. Логический раздел в хранилище для сегментирования данных	t	2
12	Юрий	Иванов	12	3. CREATE TABLE … ENGINE = ReplicatedMergeTree	t	3
13	Юрий	Иванов	13	1. Использовать механизм FlowFile Provenance	t	4
14	Юрий	Иванов	14	3. Задать количество задач (Concurrent Tasks) в процессоре	t	4
15	Юрий	Иванов	15	2. Использовать BranchPythonOperator	t	4
16	Юрий	Иванов	16	2. Выполняет трансформации данных и предоставляет API	t	4
17	Юрий	Иванов	17	1. Управляет метаданными и хранением схем	t	4
18	Юрий	Иванов	18	3. Использовать Scripting Processor	f	0
19	Юрий	Иванов	19	2. Использовать Airflow Variables	t	3
20	Юрий	Иванов	20	2. Использовать git pull для слияния изменений с удаленного репозитория	t	4
21	Юрий	Иванов	21	1. Azure Data Factory	t	3
22	Юрий	Иванов	22	1. Synapse SQL используется для обработки структурированных данных Spark — для распределенной обработки неструктурированных данных	t	4
23	Юрий	Иванов	23	3. ClickHouse — хранение и репликация данных ZooKeeper — управление метаданными и координацией узлов ClickHouse Keeper — альтернатива ZooKeeper для координации узлов	t	4
24	Юрий	Иванов	24	2. Специальный тип учетной записи используемой для приложений и служб для доступа к ресурсам	t	4
25	Юрий	Иванов	25	2. PostgreSQL — до 10 ТБ Greenplum — от 10 ТБ до 100 ТБ Hadoop — от 100 ТБ и более	t	4
26	Юрий	Иванов	26	4. Хранить секреты в Airflow Variables	f	0
27	Юрий	Иванов	27	2. PostgreSQL — хранение данных etcd — управление конфигурацией и координация узлов Patroni — управление состоянием кластера и автоматический failover	t	4
28	Юрий	Иванов	28	3. Sparse Index	t	3
29	Ольга	Леонова	1	Тип 6 Гибрид (типы 1 + 2 + 3)	t	6
30	Ольга	Леонова	2	2. Hash	f	0
31	Ольга	Леонова	3	3. Использовать конструкцию PARTITION BY	t	2
32	Ольга	Леонова	4	4. CREATE VIEW … AS INDEXED	f	0
33	Ольга	Леонова	5	1. merge	t	2
34	Ольга	Леонова	6	3. multiprocessing	f	0
35	Ольга	Леонова	7	4. Cassandra	f	0
36	Ольга	Леонова	8	1. Для проверки синтаксиса SQL-моделей	f	0
37	Ольга	Леонова	9	4. schema.yml	t	2
38	Ольга	Леонова	10	4. Zookeeper	f	0
39	Ольга	Леонова	11	1. Логический раздел в хранилище для сегментирования данных	t	2
40	Ольга	Леонова	12	3. CREATE TABLE … ENGINE = ReplicatedMergeTree	t	3
41	Ольга	Леонова	13	1. Использовать механизм FlowFile Provenance	t	4
42	Ольга	Леонова	14	1. Настроить несколько соединительных цепочек	f	0
43	Ольга	Леонова	15	4. Использовать SubDagOperator	f	0
44	Ольга	Леонова	16	2. Выполняет трансформации данных и предоставляет API	t	4
45	Ольга	Леонова	17	4. Управляет данными репозиториев	f	0
46	Ольга	Леонова	18	2. Использовать Parameter Context	t	3
47	Ольга	Леонова	19	3. Использовать переменные окружения (Environment Variables)	f	0
48	Ольга	Леонова	20	2. Использовать git pull для слияния изменений с удаленного репозитория	t	4
49	Ольга	Леонова	21	1. Azure Data Factory	t	3
50	Ольга	Леонова	22	1. Synapse SQL используется для обработки структурированных данных Spark — для распределенной обработки неструктурированных данных	t	4
51	Ольга	Леонова	23	3. ClickHouse — хранение и репликация данных ZooKeeper — управление метаданными и координацией узлов ClickHouse Keeper — альтернатива ZooKeeper для координации узлов	t	4
52	Ольга	Леонова	24	2. Специальный тип учетной записи используемой для приложений и служб для доступа к ресурсам	t	4
53	Ольга	Леонова	25	2. PostgreSQL — до 10 ТБ Greenplum — от 10 ТБ до 100 ТБ Hadoop — от 100 ТБ и более	t	4
54	Ольга	Леонова	26	2. Зашифровать секреты и хранить в репозитории	f	0
55	Ольга	Леонова	27	1. PostgreSQL — хранение данных etcd — управление конфигурациями Patroni — мониторинг	f	0
56	Ольга	Леонова	28	3. Sparse Index	t	3
57	Gennady	Leonov	2	3. GIN	t	2
58	Gennady	Leonov	3	3. Использовать конструкцию PARTITION BY	t	2
59	Gennady	Leonov	4	1. CREATE VIEW … WITH SCHEMABINDING	t	3
60	Gennady	Leonov	5	1. merge	t	2
61	Gennady	Leonov	6	2. threading	t	3
62	Gennady	Leonov	7	3. PostgreSQL или SQLite	t	2
63	Gennady	Leonov	8	2. Для создания и обновления моделей в базе данных	t	2
64	Gennady	Leonov	9	4. schema.yml	t	2
65	Gennady	Leonov	10	3. Broker	t	2
66	Gennady	Leonov	11	1. Логический раздел в хранилище для сегментирования данных	t	2
67	Gennady	Leonov	12	3. CREATE TABLE … ENGINE = ReplicatedMergeTree	t	3
68	Gennady	Leonov	13	1. Использовать механизм FlowFile Provenance	t	4
69	Gennady	Leonov	14	3. Задать количество задач (Concurrent Tasks) в процессоре	t	4
70	Gennady	Leonov	15	2. Использовать BranchPythonOperator	t	4
71	Gennady	Leonov	16	2. Выполняет трансформации данных и предоставляет API	t	4
72	Gennady	Leonov	17	1. Управляет метаданными и хранением схем	t	4
73	Gennady	Leonov	18	2. Использовать Parameter Context	t	3
74	Gennady	Leonov	19	2. Использовать Airflow Variables	t	3
75	Gennady	Leonov	20	2. Использовать git pull для слияния изменений с удаленного репозитория	t	4
76	Gennady	Leonov	21	1. Azure Data Factory	t	3
77	Gennady	Leonov	22	1. Synapse SQL используется для обработки структурированных данных Spark — для распределенной обработки неструктурированных данных	t	4
78	Gennady	Leonov	23	3. ClickHouse — хранение и репликация данных ZooKeeper — управление метаданными и координацией узлов ClickHouse Keeper — альтернатива ZooKeeper для координации узлов	t	4
79	Gennady	Leonov	25	2. PostgreSQL — до 10 ТБ Greenplum — от 10 ТБ до 100 ТБ Hadoop — от 100 ТБ и более	t	4
80	Gennady	Leonov	26	3. Использовать файл .env и исключить его из .gitignore	f	0
81	Gennady	Leonov	27	2. PostgreSQL — хранение данных etcd — управление конфигурацией и координация узлов Patroni — управление состоянием кластера и автоматический failover	t	4
82	Gennady	Leonov	28	3. Sparse Index	t	3
83	Gennady	Leonov	1	1. Создание новой строки с историей изменений	t	6
84	Gennady	Leonov	24	2. Специальный тип учетной записи используемой для приложений и служб для доступа к ресурсам	t	4
\.




COPY public.quiz_topics (id, topic) FROM stdin;
1	Azure
2	Git
3	MSSQL
4	NiFi
5	Модели данных
6	Архитектура
7	postgres
8	ClickHouse
9	DBT
10	Informatica
11	Airflow
12	Python
13	Kafka
\.

