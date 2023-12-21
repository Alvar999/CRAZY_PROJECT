// Speedo by #lkdiep
#include <a_samp>
#include <YSI\y_hooks>

new PlayerText:SpeedoTD[MAX_PLAYERS][11];

stock GetVehicleSpeed(vehicleid)
{
    new
        Float:vel[3],
        Float:tempspeed;
    GetVehicleVelocity(vehicleid, vel[0], vel[1], vel[2]);
    tempspeed = floatsqroot((vel[0] * vel[0]) + (vel[1] * vel[1]) + (vel[2] * vel[2])) * 136.666667;
    return floatround(tempspeed, floatround_round);
}

hook OnPlayerUpdate(playerid)
{
    if(IsPlayerInAnyVehicle(playerid))
    {
        new speed[1280], fuelcc[1280];
        new vspeed;
        vspeed = GetVehicleSpeed(GetPlayerVehicleID(playerid));
        format(speed, sizeof(speed), "%d", vspeed);
        PlayerTextDrawSetString(playerid, SpeedoTD[playerid][9], speed);
        new iVehicleID = GetPlayerVehicleID(playerid);
        format(fuelcc, sizeof(fuelcc), "%.0f", VehicleFuel[iVehicleID]);
        PlayerTextDrawSetString(playerid, SpeedoTD[playerid][5], fuelcc);
        new string[128], vehicleid = GetPlayerVehicleID(playerid), Float:health;
      	format(string, sizeof(string), "%s", GetVehicleName(vehicleid));
    	PlayerTextDrawSetString(playerid, SpeedoTD[playerid][10], string);
    	format(string, sizeof(string), "%d~n~Health", floatround(health));
    	PlayerTextDrawSetString(playerid, SpeedoTD[playerid][8], string);
    }
    return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        PlayerTextDrawShow(playerid, SpeedoTD[playerid][0]);
        PlayerTextDrawShow(playerid, SpeedoTD[playerid][1]);
        PlayerTextDrawShow(playerid, SpeedoTD[playerid][2]);
        PlayerTextDrawShow(playerid, SpeedoTD[playerid][3]);
	    PlayerTextDrawShow(playerid, SpeedoTD[playerid][4]);
	    PlayerTextDrawShow(playerid, SpeedoTD[playerid][5]);
	    PlayerTextDrawShow(playerid, SpeedoTD[playerid][6]);
	    PlayerTextDrawShow(playerid, SpeedoTD[playerid][7]);
//	    PlayerTextDrawShow(playerid, SpeedoTD[playerid][8]);
	    PlayerTextDrawShow(playerid, SpeedoTD[playerid][9]);
	    PlayerTextDrawShow(playerid, SpeedoTD[playerid][10]);
    }else{
        PlayerTextDrawHide(playerid, SpeedoTD[playerid][0]);
	    PlayerTextDrawHide(playerid, SpeedoTD[playerid][1]);
	    PlayerTextDrawHide(playerid, SpeedoTD[playerid][2]);
        PlayerTextDrawHide(playerid, SpeedoTD[playerid][3]);
	    PlayerTextDrawHide(playerid, SpeedoTD[playerid][4]);
	    PlayerTextDrawHide(playerid, SpeedoTD[playerid][5]);
	    PlayerTextDrawHide(playerid, SpeedoTD[playerid][6]);
	    PlayerTextDrawHide(playerid, SpeedoTD[playerid][7]);
	    PlayerTextDrawHide(playerid, SpeedoTD[playerid][8]);
	    PlayerTextDrawHide(playerid, SpeedoTD[playerid][9]);
	    PlayerTextDrawHide(playerid, SpeedoTD[playerid][10]);
    }
    return 1;
}

hook OnPlayerConnect(playerid) {
SpeedoTD[playerid][0] = CreatePlayerTextDraw(playerid, 550.000000, 150.000000, "_");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][0], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][0], 0.600000, 0.100000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][0], 298.500000, 100.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][0], 1);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][0], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][0], 2);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][0], -1);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][0], 255);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][0], -65401);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][0], 1);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][0], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][0], 0);

SpeedoTD[playerid][1] = CreatePlayerTextDraw(playerid, 550.000000, 150.000000, "_");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][1], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][1], 0.600000, 0.100000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][1], 298.500000, 100.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][1], 1);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][1], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][1], 2);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][1], -1);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][1], 255);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][1], -65401);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][1], 1);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][1], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][1], 0);

SpeedoTD[playerid][2] = CreatePlayerTextDraw(playerid, 550.000000, 150.000000, "_");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][2], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][2], 0.600000, 0.100000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][2], 298.500000, 100.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][2], 1);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][2], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][2], 2);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][2], -1);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][2], 255);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][2], -65401);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][2], 1);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][2], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][2], 0);

SpeedoTD[playerid][3] = CreatePlayerTextDraw(playerid, 500.000000, 155.000000, "KM/H");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][3], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][3], 0.300000, 1.500000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][3], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][3], 0);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][3], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][3], 1);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][3], -65281);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][3], 255);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][3], 50);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][3], 0);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][3], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][3], 0);

SpeedoTD[playerid][4] = CreatePlayerTextDraw(playerid, 500.000000, 155.000000, "KM/H");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][4], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][4], 0.300000, 1.500000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][4], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][4], 0);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][4], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][4], 1);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][4], -65281);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][4], 255);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][4], 50);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][4], 0);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][4], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][4], 0);

SpeedoTD[playerid][5] = CreatePlayerTextDraw(playerid, 535.000000, 155.000000, "100");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][5], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][5], 0.300000, 1.500000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][5], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][5], 1);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][5], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][5], 1);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][5], -1);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][5], 255);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][5], 50);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][5], 0);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][5], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][5], 0);

SpeedoTD[playerid][6] = CreatePlayerTextDraw(playerid, 533.000000, 170.000000, "xang");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][6], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][6], 0.300000, 1.500000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][6], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][6], 0);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][6], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][6], 1);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][6], -65281);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][6], 255);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][6], 50);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][6], 0);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][6], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][6], 0);

SpeedoTD[playerid][7] = CreatePlayerTextDraw(playerid, 565.000000, 170.000000, "health");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][7], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][7], 0.300000, 1.500000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][7], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][7], 0);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][7], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][7], 1);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][7], -65281);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][7], 255);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][7], 50);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][7], 0);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][7], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][7], 0);

SpeedoTD[playerid][8] = CreatePlayerTextDraw(playerid, 567.000000, 155.000000, "1000");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][8], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][8], 0.300000, 1.500000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][8], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][8], 1);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][8], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][8], 1);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][8], 16777215);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][8], 255);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][8], 50);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][8], 0);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][8], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][8], 0);

SpeedoTD[playerid][9] = CreatePlayerTextDraw(playerid, 465.000000, 130.000000, "44");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][9], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][9], 0.500000, 4.500000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][9], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][9], 1);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][9], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][9], 1);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][9], 255);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][9], 16711935);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][9], 50);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][9], 0);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][9], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][9], 0);

SpeedoTD[playerid][10] = CreatePlayerTextDraw(playerid, 510.000000, 130.000000, "Bam N");
PlayerTextDrawFont(playerid, SpeedoTD[playerid][10], 1);
PlayerTextDrawLetterSize(playerid, SpeedoTD[playerid][10], 0.500000, 1.500000);
PlayerTextDrawTextSize(playerid, SpeedoTD[playerid][10], 400.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, SpeedoTD[playerid][10], 1);
PlayerTextDrawSetShadow(playerid, SpeedoTD[playerid][10], 0);
PlayerTextDrawAlignment(playerid, SpeedoTD[playerid][10], 1);
PlayerTextDrawColor(playerid, SpeedoTD[playerid][10], -1);
PlayerTextDrawBackgroundColor(playerid, SpeedoTD[playerid][10], 255);
PlayerTextDrawBoxColor(playerid, SpeedoTD[playerid][10], 50);
PlayerTextDrawUseBox(playerid, SpeedoTD[playerid][10], 0);
PlayerTextDrawSetProportional(playerid, SpeedoTD[playerid][10], 1);
PlayerTextDrawSetSelectable(playerid, SpeedoTD[playerid][10], 0);
	return 1;
}

hook OnPlayerExitVehicle(playerid, vehicleid)
{
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][0]);
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][1]);
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][2]);
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][3]);
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][4]);
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][5]);
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][6]);
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][7]);
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][8]);
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][9]);
    PlayerTextDrawHide(playerid, SpeedoTD[playerid][10]);
    return 1;
}
