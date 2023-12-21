#include <YSI\y_hooks>


hook OnGameModeInit()
{
	TruckerVehicles[0] = AddStaticVehicleEx(456,2453.0000,-2115.6633,13.6452,0.0000,-1,-1,300); // Yankee
	TruckerVehicles[1] = AddStaticVehicleEx(456,2457.0000,-2115.6633,13.6452,0.0000,-1,-1,300); // Yankee
	TruckerVehicles[2] = AddStaticVehicleEx(456,2461.0000,-2115.6633,13.6452,0.0000,-1,-1,300); // Yankee
	TruckerVehicles[3] = AddStaticVehicleEx(456,2465.0000,-2115.6633,13.6452,0.0000,-1,-1,300); // Yankee
	TruckerVehicles[4] = AddStaticVehicleEx(456,2469.0000,-2115.6633,13.6452,0.0000,-1,-1,300); // Yankee
	TruckerVehicles[5] = AddStaticVehicleEx(414,2473.0000,-2115.6633,13.6452,0.0000,-1,-1,300); // Mule
	TruckerVehicles[6] = AddStaticVehicleEx(414,2477.0000,-2115.6633,13.6452,0.0000,-1,-1,300); // Mule
	TruckerVehicles[7] = AddStaticVehicleEx(414,2481.0000,-2115.6633,13.6452,0.0000,-1,-1,300); // Mule
	TruckerVehicles[8] = AddStaticVehicleEx(414,2485.0000,-2115.6633,13.6452,0.0000,-1,-1,300); // Mule
	TruckerVehicles[9] = AddStaticVehicleEx(443,2489.0000,-2115.6633,13.6452,0.0000,-1,-1,300); // xe biz	
	return 1;
}


CMD:rsxetruck(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		for(new i = 0; i < sizeof(TruckerVehicles); i++)
		{
			if(!IsVehicleOccupied(TruckerVehicles[i]))
			{
				SetVehicleVirtualWorld(TruckerVehicles[i], 0);
				LinkVehicleToInterior(TruckerVehicles[i], 0);
				SetVehicleToRespawn(TruckerVehicles[i]);
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "You have respawned all unoccupied Trucker Vehicles.");
	}
	return 1;
}

CMD:layhang(playerid, params[]) {
	return cmd_loadshipment(playerid, params);
}

CMD:loadshipment(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 16 || PlayerInfo[playerid][pJob2] == 16)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(IsATruckerCar(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        if(!CheckPointCheck(playerid))
	        {
	            if(GetPVarInt(playerid, "LoadTruckTime") > 0)
	            {
	                SendClientMessageEx(playerid, COLOR_WHITE, "Dang dua cac mat hang len xe!");
					return 1;
	            }
	            if(TruckUsed[playerid] != INVALID_VEHICLE_ID)
	            {
	                SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang giao mat hang khac, su dung /huybo giaohang de huy bo giao hang.");
					return 1;
	            }
				if(TruckContents{vehicleid} != 0)
				{
				    return SendClientMessageEx(playerid, COLOR_GRAD2, "Da dua hang len xe thanh cong.");
				}
				if(TruckDeliveringTo[vehicleid] != INVALID_BUSINESS_ID && TruckContents{vehicleid} == 0)
				{
				    return SendClientMessageEx(playerid, COLOR_GRAD2, "Da dua hang len xe thanh cong.");
				}
	            gPlayerCheckpointStatus[playerid] = CHECKPOINT_LOADTRUCK;
	            if(!IsABoat(vehicleid))
	            {
		            SetPlayerCheckpoint(playerid, 2431.5337,-2112.5366,13.5469, 4);
		            GameTextForPlayer(playerid, "~w~Dia diem ~r~Ben cang Ocean Docks", 5000, 1);
		            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Chon hang hoa de van chuyen tai ben cang Ocean Docks (Di theo diem cham do tren radar).");
				}
				else
				{
		            SetPlayerCheckpoint(playerid,2098.6543,-104.3568,-0.4820, 4);
		            GameTextForPlayer(playerid, "~w~Dia diem ~r~Ben cang Palamino", 5000, 1);
		            SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Chon hang hoa de van chuyen tai ben cang Palamino (Di theo diem cham do tren radar).");
				}
	        }
	        else return SendClientMessageEx(playerid, COLOR_WHITE, "Xin hay chac chan rang cac diem checkpoint cua ban da bi xoa bo.");
	    }
	    else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong lai chiec xe tai cho hang hoa yeu cau!");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai Nguoi dua hang!");
	return 1;
}