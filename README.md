# Simple http todo app

this is a simple todo app with basic operations including adding, editing, deleting tasks
the tasks are stored in a simple database which can be accessed through an http server

with the simple app UI, the user can eaily access his tasks from any device
the authentication system wasn't implenmented to keep things simple

cool fact, this project was coded in ONLY 2 HOURS


the project contains a flutter app and a django api
sooo if u're lazy u can just give a look at the screenshots else...

create a new flutter project with the name todo_app and copy the lib folder & pubspec.yaml file 
into your app directory and overwrite the main.dart & pubspec.yaml files

run flutter pub get then flutter run and here u go

if ure planning to run it in an emulator don't forget that an apk will be built
soo don't forget to add the internet access permission and the AndroidManifest.xml
and change the domain in links.dart to your local domain


after building your flutter project u need to run the django api
go to the api folder and run python3 manage.py runserver in the public host 0:8000
you might need to install django & orjson packages using pip3

enjoy 
