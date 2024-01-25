# **Teams and player management:**

These 2 services were written in RUBY and used a mysql database, the Teams micro-service is responsible for managing Teams. It provides functionalities such as creating, updating, retrieving, and deleting Teams.

The player micro-service is responsible for managing player. It provides functionalities such as creating, updating, retrieving, and deleting player.

[https://en.wikipedia.org/wiki/Ruby_(programming_language)](https://en.wikipedia.org/wiki/Ruby_(programming_language))

It uses a Mysql database ( Relational database ) as  a primary database to store its data, and it provides a GRPC interface to deal with it, it’s dumps and all that it knows is teams/ players only, the methods it provides are

## Team manager
    rpc GetTeamManager (GetTeamManagerRequest) returns (GetTeamManagerResponse) {}
    rpc GetTeamManagers (GetTeamManagersRequest) returns (GetTeamManagersResponse) {}
    rpc CreateTeamManager (CreateTeamManagerRequest) returns (CreateTeamManagerResponse) {}
    rpc UpdateTeamManager (UpdateTeamManagerRequest) returns (UpdateTeamManagerResponse) {}
    rpc DeleteTeamManager (DeleteTeamManagerRequest) returns (DeleteTeamManagerResponse) {}
## Players
    rpc GetPlayer(GetPlayerRequest) returns (GetPlayerResponse) {}
    rpc CreatePlayer(CreatePlayerRequest) returns (CreatePlayerResponse) {}
    rpc UpdatePlayer(UpdatePlayerRequest) returns (UpdatePlayerResponse) {}
    rpc DeletePlayer(DeletePlayerRequest) returns (DeletePlayerResponse) {}
    rpc GetPlayers(GetPlayersRequest) returns (GetPlayersResponse) {}
## Teams
    rpc CreateTeam(CreateTeamRequest) returns (CreateTeamResponse) {}
    rpc GetTeam(GetTeamRequest) returns (GetTeamResponse) {}
    rpc UpdateTeam(UpdateTeamRequest) returns (UpdateTeamResponse) {}
    rpc DeleteTeam(DeleteTeamRequest) returns (DeleteTeamResponse) {}
    rpc GetTeams(GetTeamsRequest) returns (GetTeamsResponse) {}
