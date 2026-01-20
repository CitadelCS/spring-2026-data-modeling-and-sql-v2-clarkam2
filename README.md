# CSCI 601 Data Modeling

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

## Environment Setup

> [!NOTE]  
> Java is not needed for this and is an optional step

1.) Install Java JDK 17+. JDK located [here](https://openjdk.java.net/install/). If you have a Mac you can use `brew`.

```bash
brew install java
```

2.) Create your personal repository from Github. You should receive a unique link from your professor from Github Classroom that will generate a private repository within your Github account.
It should look something like this.

```bash
https://classroom.github.com/a/{classroomId}
```

This will create your personal repository within the [Citadel CS Github Organization](https://github.com/CitadelCS).

3.) Open IntelliJ and select `Get from VCS`

![Get From VCS](./images/getfromvcs.png)

4.) Copy the URL of your newly created personal repo and paste it into the text box. Click `Clone` and this will copy the
code from Github to your local machine and create a new IntelliJ project for you.

![VCS](./images/versioncontrolurl.png)

5.) On the right hand side of IntelliJ select the Datasource tab. Create a Datasource in IntelliJ in order to connect to the database by selecting `Postgres`

![Datasource Addition](./images/instruction_1.png)

6.) Input the connection information sent to you from your professor

![Credential Addition](./images/instruction_2.png)

7.) Link the CA Certificate file to your credentials

![CA Certificate Link](./images/instruction_3.png)

8.) Test your connection and you should see a successful message

![Successful Connection](./images/instruction_4.png)

9.) Click `Apply` and you now have a datasource that you can connect to and run queries on.

![Datsource View](./images/instruction_5.png)

10.) Then open the directory labeled `sample` and run the `sample.sql` script.

![Sample SQL](./images/instruction_6.png)

11.) After running you should see a new schema with a table called `person` created.

![Sample Schema Created](./images/instruction_7.png)

12.) Success! You now have a connection to a cloud managed Postgres DB that you can run queries.