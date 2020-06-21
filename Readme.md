<p align="center">
  <img src="https://i.imgur.com/S0lsMX0.png" />
</p>

RunnersWorld is a web application that displays and keeps track of different speedruns for video games. The application is connected to a database to query entries for a game. Each game has a list of users that submitted a run for this particular game.

## Installation
Clone the GitHub Repository, open it up with IntelliJ (be sure to have TomCat, MySQL Workbench and a Browser like Chrome or Firefox according to the courses information installed). Once opened, build the application, and run it. Open the application up typing localhost:8080 in your browser.
For E-Mail functionality the program FakeSMTP is necessary.

## Usage

There are three different user roles currently present in the project.

 1. Spectator 
The spectator is every user that is not logged in. This user can only view and search speedruns, from everyone or specific runners. They also have the posibilty to export speedruns into a Micorsoft Excels sheet.

 2. User
 Every user that is logged in and not the admin has the normal user role. Users can do everything that spectators can do but they can also submit new speedruns. These runs are kept pending until an admin approves them.
 
 3. Administrator
 The admin can do everything a normal user can do, but they also have the ability to validate/deny Speedruns, add/edit games, platforms and speedrun types.
 When validating or denying a speedrun, an E-Mail is sent to the user that submitted the run.

### Passwords

 - Spectator:
No username or pasword needed.
 - Users:
 Username: raphael
 Password: raphael
 Username: max
 Password: max
 Username: clemens
 Password: clemens
 Additionally new users can be created in the web application.
 - Administrator:
 Username: admin
 Password: admin

 
