How to run the application?

1. Extract the zip file.
2. Go to "code" folder than run these commands:
    1. composer install
    2. npm install
    3. npm run dev
4. Create new database named as "survey" and export database from Documents/sql/survey.sql.
Note: Database contains dummy data. 2 surveys. 3 users. Password of last 2 users are aaa@123
5. Update database credentials in .env file.
6. Then go back to code folder and run this command
    php artisan serve
7. Open "http://127.0.0.1:8000" in any browser

Note: Migrations are also created. If you want to check.
