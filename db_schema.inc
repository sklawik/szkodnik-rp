#define MYSQL_HOST "samp"
#define MYSQL_USER "www"
#define MYSQL_PASSWORD "123"
#define MYSQL_DB "szkodnikrp"

new MySQL:DB_HANDLE;

stock EnsureCreated(){
    // init database
    mysql_query(DB_HANDLE, "DROP DATABASE IF EXISTS szkodnikrp;", false);
    mysql_query(DB_HANDLE, "CREATE DATABASE szkodnikrp;", false);
    mysql_query(DB_HANDLE, "USE szkodnikrp;", false);

    // players table
    mysql_query(DB_HANDLE, 
    "CREATE TABLE IF NOT EXISTS players(\
        uid INT AUTO_INCREMENT PRIMARY KEY,\
        hash VARCHAR(64) NOT NULL,\
        salt VARCHAR(10) NOT NULL,\
        name VARCHAR(24) NOT NULL,\
        gender INT NOT NULL DEFAULT 1,\
        skin INT NOT NULL DEFAULT 0,\
        health FLOAT NOT NULL DEFAULT 100,\
        cash INT NOT NULL DEFAULT 50,\
        tutorialLevel INT NOT NULL DEFAULT 2,\
        strenght INT NOT NULL DEFAULT 0,\
        level INT NOT NULL DEFAULT 0,\
        BW_Time INT NOT NULL DEFAULT 0,\
        BW_Reason INT NOT NULL DEFAULT 0,\
        AJ_Time INT NOT NULL DEFAULT 0,\
        playTime INT NOT NULL DEFAULT 0,\
        score INT NOT NULL DEFAULT 0,\
        houseSpawn INT NOT NULL DEFAULT 0,\
        bank INT NOT NULL DEFAULT 0,\
        posX FLOAT NOT NULL DEFAULT 0,\
        posY FLOAT NOT NULL DEFAULT 0,\
        posZ FLOAT NOT NULL DEFAULT 0,\
        posVW INT NOT NULL DEFAULT 0,\
        bornDate INT NOT NULL DEFAULT 0,\
        ID_Card INT NOT NULL DEFAULT 0,\
        drivingLicense INT NOT NULL DEFAULT 0,\
        bankAccount INT NOT NULL DEFAULT 0,\
        OOC INT NOT NULL DEFAULT 0,\
        favAnim INT NOT NULL DEFAULT 0,\
        jailTime INT NOT NULL DEFAULT 0,\
        jailX FLOAT NOT NULL DEFAULT 0,\
        jailY FLOAT NOT NULL DEFAULT 0,\
        jailZ FLOAT NOT NULL DEFAULT 0,\
        jailVW INT NOT NULL DEFAULT 0,\
        lastTraining INT NOT NULL DEFAULT 0,\
        objectEditor INT NOT NULL DEFAULT 0,\
        gymBoostTime INT NOT NULL DEFAULT 0\
    );", false);

    // actors table
    mysql_query(DB_HANDLE, 
    "CREATE TABLE IF NOT EXISTS actors(\
        aUID INT AUTO_INCREMENT PRIMARY KEY,\
        aType INT NOT NULL,\
        aName VARCHAR(64) NOT NULL,\
        aAnimLib VARCHAR(32) NOT NULL,\
        aAnimName VARCHAR(32) NOT NULL,\
        aPosX FLOAT NOT NULL,\
        aPosY FLOAT NOT NULL,\
        aPosZ FLOAT NOT NULL,\
        aAng FLOAT NOT NULL,\
        aVW INT NOT NULL,\
        aSkin INT NOT NULL,\
        aRepeat INT NOT NULL,\
        aText VARCHAR(256) NOT NULL\
    );", false);

    // server_groups table (zamiast groups)
    mysql_query(DB_HANDLE, 
    "CREATE TABLE IF NOT EXISTS `server_groups`(\
        uid INT AUTO_INCREMENT PRIMARY KEY,\
        type INT NOT NULL,\
        bank INT NOT NULL,\
        name VARCHAR(32) NOT NULL,\
        chatOOC INT NOT NULL,\
        chatIC INT NOT NULL,\
        color VARCHAR(16) NOT NULL,\
        state INT NOT NULL,\
        vehicleLimit INT NOT NULL,\
        payDay INT NOT NULL\
    );", false);

    // groupMembers table
    mysql_query(DB_HANDLE, 
    "CREATE TABLE IF NOT EXISTS groupMembers(\
        uid INT PRIMARY KEY AUTO_INCREMENT,\
        groupUID INT,\
        playerUID INT,\
        isMapper TINYINT DEFAULT 0,\
        canInvite TINYINT DEFAULT 0,\
        isAdmin TINYINT DEFAULT 0,\
        doorAccess TINYINT DEFAULT 0,\
        vehicleAccess TINYINT DEFAULT 0,\
        productsAccess TINYINT DEFAULT 0,\
        payday INT DEFAULT 0,\
        duty INT DEFAULT 0,\
        reward INT DEFAULT 0,\
        mapper TINYINT DEFAULT 0,\
        FOREIGN KEY (groupUID) REFERENCES `server_groups`(uid),\
        FOREIGN KEY (playerUID) REFERENCES players(uid)\
    );", false);

    // vehicles table
    mysql_query(DB_HANDLE, 
    "CREATE TABLE IF NOT EXISTS vehicles(\
        uid INT PRIMARY KEY AUTO_INCREMENT,\
        color INT DEFAULT 0,\
        color2 INT DEFAULT 0,\
        groupUID INT DEFAULT NULL,\
        playerUID INT DEFAULT NULL,\
        posX FLOAT DEFAULT 876.5847,\
        posY FLOAT DEFAULT -1259.2781,\
        posZ FLOAT DEFAULT 14.6456,\
        angle FLOAT DEFAULT 0,\
        virtualWorld INT DEFAULT 0,\
        fuel INT DEFAULT 100,\
        model INT,\
        HP FLOAT DEFAULT 1000,\
        open TINYINT DEFAULT 0,\
        register INT DEFAULT 0,\
        siren TINYINT DEFAULT 0,\
        banReason VARCHAR(128) DEFAULT '',\
        banCost INT DEFAULT 0,\
        mileAge INT DEFAULT 0,\
        gameId INT DEFAULT 0,\
        FOREIGN KEY (groupUID) REFERENCES `server_groups`(uid),\
        FOREIGN KEY (playerUID) REFERENCES players(uid)\
    );", false);

    // items table
    mysql_query(DB_HANDLE,
    "CREATE TABLE IF NOT EXISTS items(\
        uid INT PRIMARY KEY AUTO_INCREMENT,\
        state INT DEFAULT 0,\
        virtualWorld INT DEFAULT 0,\
        posX FLOAT DEFAULT 0,\
        posY FLOAT DEFAULT 0,\
        posZ FLOAT DEFAULT 0,\
        name VARCHAR(128),\
        type INT,\
        val INT DEFAULT 0,\
        val2 INT DEFAULT 0,\
        val3 INT DEFAULT 0,\
        val4 INT DEFAULT 0,\
        active TINYINT DEFAULT 0,\
        attachX FLOAT DEFAULT 0,\
        attachY FLOAT DEFAULT 0,\
        attachZ FLOAT DEFAULT 0,\
        attachrX FLOAT DEFAULT 0,\
        attachrY FLOAT DEFAULT 0,\
        attachrZ FLOAT DEFAULT 0,\
        sizeX FLOAT DEFAULT 0,\
        sizeY FLOAT DEFAULT 0,\
        sizeZ FLOAT DEFAULT 0,\
        groupUID INT DEFAULT NULL,\
        cost INT DEFAULT 0,\
        groupSender INT DEFAULT 0,\
        vehicleUID INT DEFAULT NULL,\
        playerUID INT,\
        FOREIGN KEY (playerUID) REFERENCES players(uid),\
        FOREIGN KEY (groupUID) REFERENCES `server_groups`(uid),\
        FOREIGN KEY (vehicleUID) REFERENCES vehicles(uid)\
    );", false);

    // serverSettings table
    mysql_query(DB_HANDLE,
    "CREATE TABLE IF NOT EXISTS serverSettings(\
        uid INT AUTO_INCREMENT PRIMARY KEY,\
        `key` VARCHAR(64) NOT NULL,\
        `value` VARCHAR(256) NOT NULL\
    );", false);
}

