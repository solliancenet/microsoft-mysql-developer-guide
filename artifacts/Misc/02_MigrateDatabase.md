# Migrate the on-premises database

## Export the data

1. In the virtual machine, open **MySQL Workbench**
2. Connect to the local instance using `root` with no password
3. Export the `ContosoStore` database
   1. Select **Server->Data Export**
   2. Select the **contosostore** schema
   3. Select the following:
      1. Dump Stored Procedures and Functions
      2. Dump Events
      3. Dump Triggers
   4. Select **Export to Self-contained File**
   5. For the project folder, type `C:\temp\ContosoStore\export.sql`
   6. Select **Start Export**, a single sql file should show in the directory.

## Import the data

### MySQL Workbench

1. Connect to the target MySQL instance
   1. Select **Database->Connect to database**
   2. For the hostname, type the dns of the Azure Database for MySQL single server (ex `mysqldevSUFFIX.mysql.database.azure.com`)
   3. For the username, type **wsuser@mysqldevSUFFIX**
   4. For the password type **Solliance123**
   5. Select **OK**, an error should occur
   6. Browse to the Azure Portal, select the Azure Database for MySQL single server
   7. Select **Add client IP**
   8. Select **Save**
   9. Retry to test the connection
2. Import the backup
   1. Select **Server->Data Import**
   2. Select **Import from Self-Contained File**
   3. Select the `C:\temp\ContosoStore\export.sql` file
   4. Select **Start Import**, after a few momemts, the database will be imported into Azure MySQL

### Using PhpMyAdmin (InApp)

1. Browse to the **mysqldevSUFFIX** web app service
2. Under **blah** select **Inapp MySQL**
3. 