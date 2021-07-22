# National Park Database #
![jairph-CmngxmGY3YU-unsplash](https://user-images.githubusercontent.com/48274694/126594112-202b526b-1f7a-4565-813f-222ce9523ce3.jpg)


### About ###
This is the CLI for accessing and updating 
the National Park Database. We built
a model of the National Park System of a country.
The database used is `MySQL` and the CLI is written 
in `python3` using `PyMySQL`.

### Installation ###
To create a local copy of the database you can use
the given `database.sql` file.
\
To connect to your database you will need
 to store the config of your database in a 
`config.py` file. 
Here's a sample `config.py`:
```
username = 'aaaaa' # Enter the username of user of the database
password = 'aaaaa' # password of the mysql server user
port = 5005 # port of the host on which server is running
db = 'aaaaa' # database name
```
After this install the external dependencies.
We recommend the creation of a `virtual environment` 
before this step.
```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
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
The data is date specific, the results might not be the
same at the user's end as past services will not be available 

### Contributors ###
Triansh Sharma, 2019101006 \
Raj Maheshwari, 2019101039 \
Kannav Mehta, 2019101044
