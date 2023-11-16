var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
app.MapGet("", () => "Working on linux!");
app.Run();
