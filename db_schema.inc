#include <a_mysql>

#define MYSQL_HOST "127.0.0.1"
#define MYSQL_USER "www"
#define MYSQL_PASSWORD "123"
#define MYSQL_DB "szkodnikrp"

new MySQL:DB_HANDLE;

forward EnsureCreated();
public EnsureCreated(){
	// db schema

	// init
	mysql_query(DB_HANDLE, "DROP DATABASE IF EXISTS szkodnikrp;");
	mysql_query(DB_HANDLE, "CREATE DATABASE szkodnikrp;");
	mysql_query(DB_HANDLE, "use szkodnikrp;");
	
	// players table
	mysql_query(DB_HANDLE, 
	"CREATE TABLE IF NOT EXISTS players(\n\
	uid INT AUTO_INCREMENT PRIMARY KEY,\n\
	hash VARCHAR(64) NOT NULL,\n\
	salt VARCHAR(10) NOT NULL,\n\
	name VARCHAR(24) NOT NULL,\n\
	gender INT NOT NULL DEFAULT 1,\n\
	skin INT NOT NULL DEFAULT 0,\n\
	health FLOAT NOT NULL DEFAULT 100, \n\
	cash INT NOT NULL DEFAULT 50,\n\
	tutorialLevel INT NOT NULL DEFAULT 2,\n\
	strenght INT NOT NULL DEFAULT 0,\n\
	level INT NOT NULL DEFAULT 0,\n\
	BW_Time INT NOT NULL DEFAULT 0,\n\
	BW_Reason INT NOT NULL DEFAULT 0,\n\
	AJ_Time INT NOT NULL DEFAULT 0,\n\
	playTime INT NOT NULL DEFAULT 0,\n\
	score INT NOT NULL DEFAULT 0,\n\
	houseSpawn INT NOT NULL DEFAULT 0,\n\
	bank INT NOT NULL DEFAULT 0,\n\
	posX FLOAT NOT NULL DEFAULT 0,\n\
	posY FLOAT NOT NULL DEFAULT 0,\n\
	posZ FLOAT NOT NULL DEFAULT 0,\n\
	posVW INT NOT NULL DEFAULT 0,\n\
	bornDate INT NOT NULL DEFAULT 0,\n\
	ID_Card INT NOT NULL DEFAULT 0,\n\
	drivingLicense INT NOT NULL DEFAULT 0,\n\
	bankAccount INT NOT NULL DEFAULT 0,\n\
	OOC INT NOT NULL DEFAULT 0,\n\
	favAnim INT NOT NULL DEFAULT 0,\n\
	jailTime INT NOT NULL DEFAULT 0,\n\
	jailX FLOAT NOT NULL DEFAULT 0,\n\
	jailY FLOAT NOT NULL DEFAULT 0,\n\
	jailZ FLOAT NOT NULL DEFAULT 0,\n\
	jailVW INT NOT NULL DEFAULT 0,\n\
	lastTraining INT NOT NULL DEFAULT 0,\n\
	objectEditor INT NOT NULL DEFAULT 0,\n\
	gymBoostTime INT NOT NULL DEFAULT 0);", false);

	

	// Actors table
	mysql_query(DB_HANDLE, "CREATE TABLE IF NOT EXISTS actors (\n\
	aUID INT AUTO_INCREMENT PRIMARY KEY,\n\
	aType INT NOT NULL,\n\
	aName VARCHAR(64) NOT NULL,\n\
	aAnimLib VARCHAR(32) NOT  NULL,\n\
	aAnimName VARCHAR(32) NOT NULL,\n\
	aPosX FLOAT not null,\n\
	aPosY FLOAT not null,\n\
	aPosZ FLOAT not null,\n\
	aAng FLOAT NOT NULL,\n\
	aVW INT NOT NULL,\n\
	aSkin INT NOT  NULL,\n\
	aRepeat INT NOT NULL,\n\
	aText VARCHAR (256) NOT NULL\n\
	);", false);

	// Groups table
	mysql_query(DB_HANDLE, 
	"CREATE TABLE IF NOT EXISTS groups(\n\
	uid INT AUTO_INCREMENT PRIMARY KEY,\n\
	type INT NOT NULL,\n\
	bank INT NOT NULL,\n\
	name VARCHAR(32) NOT NULL,\n\
	chatOOC INT NOT NULL,\n\
	chatIC INT NOT NULL,\n\
	color VARCHAR(16) NOT NULL,\n\
	state INT NOT NULL,\n\
	vehicleLimit INT NOT NULL,\n\
	payDay INT NOT NULL);", false);

	mysql_query(DB_HANDLE, "CREATE TABLE IF NOT EXISTS groupMembers(\n\
	uid INT PRIMARY KEY AUTO_INCREMENT,\n\
	groupUID INT,\n\
	playerUID INT,\n\
	isMapper TINYINT DEFAULT 0,\n\
	canInvite TINYINT DEFAULT 0,\n\
	isAdmin TINYINT DEFAULT 0,\n\
	doorAccess TINYINT DEFAULT 0,\n\
	vehicleAccess TINYINT DEFAULT 0,\n\
	productsAccess TINYINT DEFAULT 0,\n\
	payday INT DEFAULT 0,\n\
	duty INT DEFAULT 0,\n\
	reward INT DEFAULT 0,\n\
	mapper TINYINT DEFAULT 0,\n\
	FOREIGN KEY (groupUID) REFERENCES groups(uid),\n\
	FOREIGN KEY (playerUID) REFERENCES players(uid)\n\
	);", false);

	mysql_query(DB_HANDLE, "CREATE TABLE IF NOT EXISTS vehicles (\n\
	uid INT PRIMARY KEY AUTO_INCREMENT,\n\
	color INT DEFAULT 0,\n\
	color2 INT DEFAULT 0,\n\
	groupUID INT DEFAULT NULL,\n\
	playerUID INT DEFAULT NULL,\n\
	posX FLOAT DEFAULT 876.5847,\n\
	posY FLOAT DEFAULT -1259.2781,\n\
	posZ FLOAT DEFAULT 14.6456,\n\
	angle FLOAT DEFAULT 0,\n\
	virtualWorld INT DEFAULT 0,\n\
	fuel INT DEFAULT 100,\n\
	model INT,\n\
	HP FLOAT DEFAULT 1000,\n\
	open TINYINT DEFAULT 0,\n\
	register INT DEFAULT 0,\n\
	siren TINYINT DEFAULT 0,\n\
	banReason VARCHAR(128) DEFAULT 0,\n\
	banCost INT DEFAULT 0,\n\
	mileAge INT DEFAULT 0,\n\
	gameId INT DEFAULT 0,\n\
	FOREIGN KEY (groupUID) REFERENCES groups(uid),\n\
	FOREIGN KEY (playerUID) REFERENCES players(uid)\n\
	);", false);




	
	// Objects table
	mysql_query(DB_HANDLE, 
	"CREATE TABLE IF NOT EXISTS objects(\n\
	uid INT AUTO_INCREMENT PRIMARY KEY,\n\
	X FLOAT NOT NULL,\n\
	Y FLOAT NOT NULL,\n\
	Z FLOAT NOT NULL,\n\
	rX FLOAT NOT NULL,\n\
	rY FLOAT NOT NULL,\n\
	rZ FLOAT NOT NULL,\n\
	VW INT NOT NULL);"
	, false);


	// player reports table
	mysql_query(DB_HANDLE, 
	"CREATE TABLE IF NOT EXISTS playerReports(\n\
	uid INT AUTO_INCREMENT PRIMARY KEY,\n\
	issuerUID INT NOT NULL,\n\
	receiverUID FLOAT NOT NULL,\n\
	reason VARCHAR(128) NOT NULL,\n\
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP);"
	, false);

	// logs table
	mysql_query(DB_HANDLE, "CREATE TABLE IF NOT EXISTS playerLogs (\n\
	uid INT PRIMARY KEY AUTO_INCREMENT,\n\
	message VARCHAR(256) DEFAULT ' ',\n\
	type TINYINT NOT NULL,\n\
	playerUID INT, \n\
	anyUID INT DEFAULT 0,\n\
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP\n\
	);", false);

	// playerPenalties
	mysql_query(DB_HANDLE, "CREATE TABLE IF NOT EXISTS playerPenalties(\n\
	uid INT PRIMARY KEY AUTO_INCREMENT,\n\
	reason VARCHAR(128),\n\
	adminUID INT DEFAULT 0,\n\
	receiverUID INT,\n\
	FOREIGN KEY (adminUID) REFERENCES players(uid),\n\
	FOREIGN KEY (receiverUID) REFERENCES players(uid),\n\
	type TINYINT,\n\
	expiration TIMESTAMP DEFAULT CURRENT_TIMESTAMP,\n\
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP);", false);

	mysql_query(DB_HANDLE, "CREATE TABLE IF NOT EXISTS playerDocs (\n\
	uid INT PRIMARY KEY AUTO_INCREMENT,\n\
	playerUID INT,\n\
	type INT,\n\
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,\n\
	FOREIGN KEY (playerUID) REFERENCES players(uid) ON DELETE CASCADE\n\
	);", false);
	

	mysql_query(DB_HANDLE, "CREATE TABLE IF NOT EXISTS items (\n\
	uid INT PRIMARY KEY AUTO_INCREMENT,\n\
	state INT DEFAULT 0,\n\
	virtualWorld INT DEFAULT 0,\n\
	posX FLOAT DEFAULT 0,\n\
	posY FLOAT DEFAULT 0,\n\
	posZ FLOAT DEFAULT 0,\n\
	name VARCHAR(128),\n\
	type INT,\n\
	val INT DEFAULT 0,\n\
	val2 INT DEFAULT 0,\n\
	val3 INT DEFAULT 0,\n\
	val4 INT DEFAULT 0,\n\
	active TINYINT DEFAULT 0,\n\
	attachX FLOAT DEFAULT 0,\n\
	attachY FLOAT DEFAULT 0,\n\
	attachZ FLOAT DEFAULT 0,\n\
	attachrX FLOAT DEFAULT 0,\n\
	attachrY FLOAT DEFAULT 0,\n\
	attachrZ FLOAT DEFAULT 0,\n\
	sizeX FLOAT DEFAULT 0,\n\
	sizeY FLOAT DEFAULT 0,\n\
	sizeZ FLOAT DEFAULt 0,\n\
	groupUID INT DEFAULT NULL,\n\
	cost INT DEFAULT 0,\n\
	groupSender INT DEFAULT 0,\n\
	vehicleUID INT DEFAULT NULL,\n\
	playerUID INT,\n\
	FOREIGN KEY (playerUID) REFERENCES players(uid),\n\
	FOREIGN KEY (groupUID) REFERENCES groups(uid),\n\
	FOREIGN KEY (vehicleUID) REFERENCES vehicles(uid)\n\
	);", false);

	mysql_query(DB_HANDLE, "CREATE TABLE IF NOT EXISTS gameZones(\n\
	uid INT PRIMARY KEY AUTO_INCREMENT,\n\
	minX FLOAT,\n\
	minY FLOAT,\n\
	playerUID INT DEFAULT NULL,\n\
	groupUID INT DEFAULT NULL,\n\
	priceBusiness INT,\n\
	yard INT,\n\
	priceHouse INT,\n\
	name VARCHAR(256),\n\
	FOREIGN KEY (playerUID) REFERENCES players(uid),\n\
	FOREIGN KEY (groupUID) REFERENCES groups(uid)\n\
	);", false);

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
	expirationDate DATETIME DEFAULT (CURRENT_DATE + 30 DAY),\n\
	facingAngle FLOAT,\n\
	outPickupId INT,\n\
	);", false);
	mysql_query(DB_HANDLE,"\n\
	CREATE TABLE IF NOT EXISTS serverSettings (\n\
	magazinePosX FLOAT DEFAULT 0,\n\
	magazinePosY FLOAT DEFAULT 0,\n\
	magazinePosZ FLOAT DEFAULT 0);"
	,false);

	mysql_query(DB_HANDLE, "INSERT INTO serverSettings() VALUES ()", false);

}