Ethan Clark (elc3) - CS214 Final Project
May 12, 2016

My program runs by using the buttons on the bottom left side of the window. The buttons disappear when they are no longer needed, and new buttons will pop up that allow you to simulate/get stats for the baseball game.

You can only click on one radiobutton before you hit submit, or you can enter a player that commits an error. The innings automatically switch when necessary and the game ends when necessary automatically.

The Get Stats button pulls up a new window with the current game stats.

My project uses repetition when prompting for the player names, it uses a lot of selection statements (mainly in determing if it is the top or bottom of the inning), subprograms (either function or sub), and input/output is present throughout.

MainWindow.xaml contains all the information for the widgets that are on the user interface of my program.
MainWindow.xaml.vb contains the majority of my code. It contains subprograms that are bound to button click commands and other miscellaneous subprograms to help my subprogram reduce redundant code and make things easier to read.
HomeTeam.vb contains the 9 players for the home team and stores them in an accesible array.
AwayTeam.vb contains the 9 players for the away team and stores them in an accessible array.
PlayerInformation.vb contains the data variables necessary for keeping stats during the game, which has accessors and mutators for each of those variables.

Visual Studio allows the files in the same project to be able to access one another, so there are no import statements necessary in any of the files.
