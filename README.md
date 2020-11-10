# ScrapLogger
## Have you ever wanted a Logger for Powershell? 

#### Problem: 
**There seems to be a lack of logging capability in PowerShell.**  While there are a few options out there, most loggers are not nearly as sophisiticated as loggers for other 
languages (I'm looking at you, Winston for JavaScript). Im not sure why this is, but I find that Im constantly re-inventing the wheel with logging in powershell. 

### Enter ScrapLog 
ScrapLog is a very simple logger (for now): It takes in whatever message you supply, and the log level, and handles the rest. It will output color formatting for stdout viewing, 
as well as provided succient information, which makes is easily consumable to a file. 

# Future / ToDos 

* todo: Add support for outputting to file formats (i.e JSON, csv, xml) 
* todo: Add support for SQL Server Logging (MSSQL)  
* todo: Add support for autodetecting errors, information and warning messages 
