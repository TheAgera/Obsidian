
This application provides currently four features
- Taking an AutoCAD drawings and running .scr files on them using the AcCoreConsole
- Can install latest STABLE release of AutoCAD from the click of a button
- Can migrate all settings from a previous AutoCAD install to a new one, important for using .lisp files with AutoCAD LT
- Will copy files from file server used for the CCI AutoCAD cuix along with adding support paths in the registry

Run Scripts Page Explained
- This page uses the accoreconsole to run AutoCAD in a CMD window (max line space)
- The "SCR" command is run, which stands for "Script"
- These commands are executed sequentially, mimicking user input in a command line.
- The purpose of this page and application is to allow the same set of commands
- to be run on dozens of drawings.
- Start by selecting the currently in-use version of AutoCAD from the drop-down.
- Then select the script from the script drop-down. These scripts have been verified to work and are common use-cases.
- Click the Add Drawings button to open a file explorer window.
- Select the drawing(s) from one folder to load them into the application.
- If drawing(s) from more folders are desired, click the add button to add more.
- Once the ACAD version, script, and drawing(s) are loaded, click the run button.
- The accoreconsole will open a separate instance for each drawing in the background.
- The application will check if the drawing was saved or not to determine if the operation was a success or failure.
- Right-clicking on a drawing item will open a context menu, the three options are: Event Log, Open File Location, and Delete.
- The Event Log opens Event Viewer, under Applications and CCI AutoCAD manager will be a report of what the accoreconsole did. If there are any errors, the event will be reported as an error, and the accoreconsole output will display any errors.

###### Manage Library Page Explained
- This page manages the installation and maintenance of the menu library.
- This page displays the installed version on your local machine and the version available on the file server.

- Depending on the version found locally or on the server, certain options will be disabled.
- The "menu library" consist of all the drawing files and the CCI menu file.
- To load the menu file, type the command "CUILOAD" into the AutoCAD command line. This command will open a window with a file picker. Click "Load" and select the file "CCI" to load the custom menu.
- The custom menu will add two tabs with commonly used electrical symbols that can be loaded into the drawing.

###### Profile Migrate
- This page is responsible for migrating existing settings to a newer version of AutoCAD. 
- Select the newest version of AutoCAD installed on the machine.
- Then click the "Migrate Profiles" button, this action opens an additional GUI menu.
- In this menu, select the settings that are desired to be transferred from a previous release.
- This feature helps migrate AutoCAD LT users to version 24 or higher, as these versions allow the use.
- of LISP (.lisp) files, while still keeping the users settings from a previous AutoCAD install.

###### AutoCAD Install Page
- This page facilitates the installation of the latest stable release of AutoCAD, preloaded with the CCI menu and required dependencies.