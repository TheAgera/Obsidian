
**.\ScriptV2.ps1 -Name "[User Name]" -Department [Enter Department] -Description [Enter Title] -Division [Enter Division] -Manager dkeith -EmployeeID 1 -Homephone 2 -Mobile 3 -Office 115 -OfficePhone 5 -Title 6 -add @{ProxyAddresses="meow@meow.com"} **

The purpose of this script is to help streamline the creation of users within CCI. Copy the following the code into the command and replace the parameter values within the brackets. The brackets themself can be deleted.


Eventually there will be a GUI so you don't need to remember all of the parameters. Id like to make this using visual studio as it is easy, but if I can build it using electron, it would serve purpose of this being a web app, and ultimately allowing other departments to create the user accounts.

