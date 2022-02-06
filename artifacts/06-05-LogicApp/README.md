# Logic Apps with MySQL

Logic Apps can be used to connect to Azure Database for MySQL instances and perform actions such as SELECT, INSERT, DELETE and UPDATE.  However Logics Apps do not have any direct integration that allow for triggers that fire from MySQL DDL or DML events.  In order for the MySQL actions to connect to the MySQL instance, you will have to install a Logic Apps Gateway.  This can be done with Azure instances, but the Azure Database for MySQL will need private endpoints enabled and the gateway will need to run in a virtual machine that can access that private endpoint.

## Setup the Private EndPoint

TODO

## Install the Logic Apps Gateway

TODO

## Review the Logic App

We have already created a Logic App that uses a timer trigger to check for new Orders in the database and then send an email.

- Open the **mysqldevSUFFIX** logic app
- Update the variables:
  - TODO
- Select **Save**
- TODO

## Test Trigger

- Browse back to the Contoso Store, create a new order
- Switch to your email, wait for an email to show up with the order details.