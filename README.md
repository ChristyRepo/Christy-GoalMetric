# Introduction 
An awesome application for taking your organization to the next level.

# Getting Started
1.	Clone this repo!
1.	Run `dotnet tool install --global dotnet-ef` from Visual Studio Package Manager Console.
 - For more information, see [this link](https://docs.microsoft.com/en-us/ef/core/miscellaneous/cli/dotnet) for details.
1.	Run `dotnet ef database update --project .\src\MyTalentPlanner.Web.csproj -s .\src\MyTalentPlanner.Web\MyTalentPlanner.Web.csproj` to make sure the database is setup and up to date, but simply running the site in `Debug` will execute the migrations as well. 
1.	Hit Play.

# Build and Test
1. Any significant changes to the database schema should be added like a new table, run `.\addMIgration.ps1 NameOfMigration` in the `Package Manager Console`.
    - This will create a new set of files in the `Migration` folder.
    - Any `global` data needed for a table can be put into the migration `Up()` method using [`migrationBuilder.InsertData`](https://docs.microsoft.com/en-us/ef/core/modeling/data-seeding#manual-migration-customization)
    - Any dev-seeding data can be put in the `MyTalentPlanner.Data/Classes/DbInitializer.SeedData()` method that gets called only when the environment is set to `Development`.
1. Adding in functionality, (AdminLte)[https://adminlte.io/themes/v3/index.html] has a ton of plugins available
 - Check (the plugins)[https://github.com/ColorlibHQ/AdminLTE/tree/master/plugins] first and add them to `wwwroot/plugins`
1. When using `DateTimes` consider `DateTimeOffset` as it holds on to the original timezone, which can make life easier when trying to translate time relative to the clients browser
 
# Development and Deployment
1. Upon creating new functionality, create a new branch and commit your changes to that branch.
1. Merge changes from your branch into `main` by issuing a `pull request` and assigning a few others on the team to review.
     - New commits to `main` will trigger a new build that will succeed or fail.
1. Upon all feature/change completion, go to `Releases` to find the `Production` stage.
1. Hit the `Deploy` button on the `Production` stage to push the new changes to the server.



### Dev Details

#### New Customer Signup Flow
 - Azure B2C flow - Custom_Signup
  - Takes the standard claims plus the billing centric ones, calls the application at `/Billing/InitialCustomerSetup` to send over payment and customer information + create group.
  - Upon success of the above, it will allow the user to complete signup and land at a callback page.