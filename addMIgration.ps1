$migrationName = $args[0]

dotnet ef migrations add $migrationName --project .\src\MyTalentPlanner.Data\MyTalentPlanner.Data.csproj -s .\src\MyTalentPlanner.Web\MyTalentPlanner.Web.csproj --context MyTalentPlannerContext