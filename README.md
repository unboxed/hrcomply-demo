README
======

Demonstration of a JRuby on Rails application

* Ruby on Rails 4.1.7
* JRuby 1.7.16.1
* Java 1.6 or later
* MySQL for development and testing
* MSSQL for production via DATABASE_URL environment variable

Deployment on Windows/MS SQL Server
-----------------------------------

The WAR file has been tested on Winows 2008 R2/SQL Server 2008 R2 and should
work fine with with later versions. The version of JDK/Tomcat used was 1.7 and
7.0 respectively but it should work on Java 6 and Tomcat 6.0.

Requirements:

1.  The environment variable HRCOMPLY_SECRET_KEY_BASE should contain a random
    string that serves as the secret for encrypting the Ruby on Rails session
    cookie and other related services.

2.  The environment variable HRCOMPLY_DATABASE_URL should contain the JDBC
    connection string for the database. The user should be the owner of the
    database so that it can automatically migrate and inspect the database.

    An example connection string would be:

    ```
    HRCOMPLY_DATABASE_URL=jdbc:sqlserver://localhost:1433;database=hrcomply_production;user=<username>;password=<password>;encrypt=false;loginTimeout=30;
    ```

To install the WAR file either use the Tomcat manager web application to uploaded
it or copy it to `CATALINA_HOME/webapps`. The application assumes that it is
nstalled in the ROOT context (i.e. the URL path is '/') - mounting it at another
path will break the compiled assets.

The WAR file can be downloaded from the releases section of this repository.
