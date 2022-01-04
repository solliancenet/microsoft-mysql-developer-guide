# Migrate the on-premises database

## Export the data

1. In the virtual machine, open the MySQL Workbench
2. Connect to the local instance using `root` with no password
3. Export the `ContosoStore` database
   1. Select **Server->Data Export**
   2. Select the **contosostore** schema
   3. Select the following:
      1. Dump Stored Procedures and Functions
      2. Dump Events
      3. Dump Triggers
   4. Select **Export to Self-contained File**
   5. For the project folder, type `C:\temp\ContosoStore\export`
   6. Select **Start Export**, you should now see a single sql file in the directory

## Import the data

### MySQL Workbench

1. Connect to the target MySQL instance
   1. Select **Database->Connect to database**
   2. For the hostname, type the dns of the Azure Database for MySQL server (ex `mysqldevSUFFIX.mysql.database.azure.com`)
   3. For the username, type **wsuser@mysqldevSUFFIX**
   4. For the password type **Solliance123**
   5. Select **OK**
2. Import the backup
   1. Select **Server->Data Import**
   2. For the project folder, type `C:\temp\ContosoStore\export`
   3. Select **Load folder contents**
   4. For the default target schema, select **New**
   5. For the name, type **ContosoStore**, then select **OK**
   6. Select **Start Import**

## Import the data to Azure

1. Connect to the Azure MySQL instance
   1. Select **Database->Connect to database**
   2. For the hostname, type the dns of the Azure Database for MySQL server (ex `mysqldevSUFFIX.mysql.database.azure.com`)
   3. For the username, type **wsuser@mysqldevSUFFIX**
   4. For the password type **Solliance123**
   5. Select **OK**
2. Import the backup
   1. Select **Server->Data Import**
   2. For the project folder, type `C:\temp\ContosoStore\export`
   3. Select **Load folder contents**
   4. For the default target schema, select **New**
   5. For the name, type **ContosoStore**, then select **OK**
   6. Select **Start Import**

### PhpMyAdmin

