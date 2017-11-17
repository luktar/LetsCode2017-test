# LetsCode2017-test
Test repository for Let's Code 2017 event.

## How to set up backend:

1. Download latest version of VSCode.
2. Download VSCode extension for C#.
1. Open folder ./TodoApi where file Test.sln is located.
3. Download MariaDB database zip version https://downloads.mariadb.org/mariadb/10.2.10/
4. Unzip and go to ./bin directory. Run command "mysqld --console".
5. Login to database server by using username 'root' and empty password. Use your favorite mysql provider.
6. Set password for 'root' user to '12345'.
7. Execute script located in ./TodoApi/SQL/krwinka.sql - ex. in Workbench by pressing F5 button.
8. Run 'build' task in VSCode.
9. Press F5 in VSCode - website should appear.
10. Go to http://localhost:5000/api/todo. Note that port number can be different.
11. You should see: [{"id":1,"name":"Hello MySQL!","isComplete":true}]

Done!

## How to setup client:

1. Look at README file in client folder.
