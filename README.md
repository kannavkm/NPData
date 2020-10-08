# National Park Database #

### About ###
This is the CLI for accessing and updating 
the National Park Database. What we tried to build
is a model of a National Park system of a country.
The database is using `MySQL` and the CLI is written 
in `python3` using `PyMySQL`.

### Installation ###
To create a local copy of the database you may use
use the given `database.sql` file.
\
To connect to your database you will need
 to store the config of your database in a 
`config.py` file. 
Here's a sample `config.py`:
```
username = 'aaaaa' # Enter the username of user of the database
password = 'aaaaa' # password of the mysql server user
port = 5005 # port on which server is running
db = 'aaaaa' # database name
```
After this install the external dependencies.
We recommend the creation of a `virtual environment` 
before this step.
```
pip install -r reqirements.txt
```
Now run `main.py`
```
python3 main.py
```
### Usage ###
The CLI is divided into three broad interfaces,
**The Admin Interface** for the National Park 
Employees, the **User Interface** for the Users to 
book Trips and services, and the **Scientific
Interface** that caters to the scientific community
where you can search for species data based on different
parameters.

### Project Specific ###
