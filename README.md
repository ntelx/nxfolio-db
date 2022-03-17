<div align="center">
  <img src="https://images.squarespace-cdn.com/content/v1/5f5908d1fc93772d79901335/1600194319074-2RVN3VAOO43MBNFOL9H9/Screen_Shot_2020-09-09_at_12.04.52_PM-removebg-preview.png?format=1500w">
</div>
<div align="center">
  <strong>NTELX provides analytical insights and risk management for global trade and international supply chains</strong>
  <br>
  <a href="https://www.ntelx.com/casestudies">View Case Studies »</a>
  <br>
  <br>
  <br>
</div>

# NXFolio
**NXFolio** is a universal model of supply chain data to enable detailed comparisons across any source. It has a comprehensive, flexible relational database data models that lets developers and companies build the state-of-the-art global trade and logitics solution.

NXFolio was originally developed by researchers and engineers working on the
........ The system is 
general enough to be applicable in a wide variety of other domains, as well.

NXFolio provides stable Postgres data model and extensive supply chain reference data.

Keep up-to-date with release announcements and security updates by subscribing
to
[announce@ntelx.org](https://groups.google.com/a/ntelx.org/forum/#!forum/announce).

## Visuals
<div align="center">
<img src="https://ntelx-public-images.s3.amazonaws.com/foliodb-overview-2.png">
</div>

## Installation
NXFolio Data Model is tested and supported on Postgres 14.2 version.

### Install with pgAdmin

1. Create a new user for NXFolio 

```
CREATE USER foliodbowner WITH LOGIN NOSUPERUSER INHERIT CREATEDB CREATEROLE PASSWORD 'reset_password';

```

2. Create a new database
```
CREATE DATABASE foliodb WITH OWNER = foliodbowner
```

3. Open query tool in pgAdmin and copy the DDL from ddl/nxfolio-ddl.sql and execute.

4. In the query tool copy the reference data from data folder and execute.


### Install PostgreSQL 14.2 [Refer to the download page](https://www.postgresql.org/download/)
- [ ] Install pgadmin as well along with postgres server
- [ ] Remember the password provided at the time of installation
#### NXFolio DB setup with pgAdmin
##### Connect to local installed postgres server
- [ ] Open pgAdmin application
- [ ] If prompted, enter the password which was set during the installation. PGAdmin will connect to the local postres server.
##### Create foliodbowner user
Create a new user foliodbowner with below privileges
- [ ] LOGIN
- [ ] CREATEDB
- [ ] CREATEROLE
    - e.g. CREATE USER foliodbowner WITH
        LOGIN
        NOSUPERUSER
        INHERIT
        CREATEDB
        CREATEROLE
        PASSWORD 'XXXXXXX';
##### Create foliodb database
Create a new database for NXFolio
- [ ] Owner of the database will be foliodbowner
    - e.g. CREATE DATABASE foliodb
        WITH 
        OWNER = foliodbowner
        ENCODING = 'UTF8'
        LC_COLLATE = 'English_United States.1252'
        LC_CTYPE = 'English_United States.1252'
        TABLESPACE = pg_default (-----> TODO - do we need to create a new table space)
        CONNECTION LIMIT = -1;
##### Generate schema and tables

- [ ] Load ddl/nxfolio-ddl.sql in pgAdmin query tool for foliodb database
- [ ] Run the script
- [ ] Verify there is no error while running script
- [ ] Verify tables, sequences and indexes are created

##### Load reference data

- [ ] Load data/nxfolio-reference-data.sql in pgAdmin query tool for foliodb database
- [ ] Run the script
- [ ] Verify there is no error while running script


## Usage
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Contributing
State if you are open to contributions and what your requirements are for accepting them.

For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

You can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers.
