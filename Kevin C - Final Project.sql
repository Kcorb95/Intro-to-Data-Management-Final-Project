----------------------------------------------------------------------------------------
-- Kevin Corbett
--
-- CMPT308
--
-- Discord Bot Database
--
-- 12/5/2016
----------------------------------------------------------------------------------------

-- Drop existing tables and views if exists
DROP VIEW userProfileView;
DROP VIEW groupView;
DROP VIEW reactionView;

DROP TABLE IF EXISTS Reactions CASCADE;
DROP TABLE IF EXISTS GroupData CASCADE;
DROP TABLE IF EXISTS Groups CASCADE;
DROP TABLE IF EXISTS Levels CASCADE;
DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS Profile CASCADE;

--Create the Users table
CREATE TABLE Users (
  uid            INTEGER NOT NULL UNIQUE,
  nickname       TEXT    NOT NULL,
  profilePicture TEXT    NOT NULL,
  joinDate       DATE    NOT NULL,
  roles          TEXT    NOT NULL,
  CHECK (uid >= 0),
  PRIMARY KEY (uid)
);

--Create the Levels table
CREATE TABLE Levels (
  uid        INTEGER NOT NULL REFERENCES Users (uid),
  level      INTEGER NOT NULL DEFAULT 0,
  experience INTEGER NOT NULL DEFAULT 0,
  CHECK (uid >= 0),
  CHECK (level >= 0),
  CHECK (experience >= 0),
  PRIMARY KEY (uid)
);

--Create the Groups table
CREATE TABLE Groups (
  gid  SERIAL  NOT NULL  UNIQUE,
  name TEXT    NOT NULL UNIQUE,
  oid  INTEGER NOT NULL  REFERENCES Users (uid),
  CHECK (gid >= 0),
  CHECK (oid >= 0),
  PRIMARY KEY (gid)
);

--Create the GroupData table
CREATE TABLE GroupData (
  gid INTEGER NOT NULL REFERENCES Groups (gid),
  mid INTEGER NOT NULL REFERENCES Users (uid),
  CHECK (gid >= 0),
  CHECK (mid >= 0),
  PRIMARY KEY (gid, mid)
);

--Create the Profile table
CREATE TABLE Profile (
  uid       INTEGER NOT NULL UNIQUE REFERENCES Users (uid),
  currency  INTEGER NOT NULL DEFAULT 0,
  badges    TEXT             DEFAULT ' ',
  steam     TEXT             DEFAULT ' ',
  battlenet TEXT             DEFAULT ' ',
  instagram TEXT             DEFAULT ' ',
  snapchat  TEXT             DEFAULT ' ',
  twitter   TEXT             DEFAULT ' ',
  CHECK (uid >= 0),
  CHECK (currency >= 0),
  PRIMARY KEY (uid)
);

--Create the Reactions table
CREATE TABLE Reactions (
  rid   SERIAL  NOT NULL  UNIQUE,
  uid   INTEGER NOT NULL  REFERENCES Users (uid),
  name  TEXT    NOT NULL  UNIQUE,
  image TEXT    NOT NULL,
  CHECK (rid >= 0),
  CHECK (uid >= 0),
  PRIMARY KEY (rid)
);

--Populate Users table
INSERT INTO Users (uid, nickname, profilePicture, joinDate, roles)
VALUES (0001, 'kevin', '/bot/data/profile/0001.png', current_date, 'admin');

INSERT INTO Users (uid, nickname, profilePicture, joinDate, roles)
VALUES (0002, 'user1', '/bot/data/profile/0002.png', current_date, 'noob');

INSERT INTO Users (uid, nickname, profilePicture, joinDate, roles)
VALUES (0003, 'user2', '/bot/data/profile/0003.png', current_date, 'member');

INSERT INTO Users (uid, nickname, profilePicture, joinDate, roles)
VALUES (0004, 'user3', '/bot/data/profile/0004.png', current_date, 'noob');

INSERT INTO Users (uid, nickname, profilePicture, joinDate, roles)
VALUES (0005, 'user4', '/bot/data/profile/0005.png', current_date, 'moderator');

INSERT INTO Users (uid, nickname, profilePicture, joinDate, roles)
VALUES (0006, 'user5', '/bot/data/profile/0006.png', current_date, 'moderator');

INSERT INTO Users (uid, nickname, profilePicture, joinDate, roles)
VALUES (0007, 'user6', '/bot/data/profile/0007.png', current_date, 'bot');

INSERT INTO Users (uid, nickname, profilePicture, joinDate, roles)
VALUES (0008, 'user7', '/bot/data/profile/0008.png', current_date, 'noob');

INSERT INTO Users (uid, nickname, profilePicture, joinDate, roles)
VALUES (0009, 'user8', '/bot/data/profile/0009.png', current_date, 'member');

INSERT INTO Users (uid, nickname, profilePicture, joinDate, roles)
VALUES (0010, 'user9', '/bot/data/profile/0010.png', current_date, 'noob');

--Populate Levels table
INSERT INTO Levels (uid, level, experience)
VALUES (0001, 50, 1899);

INSERT INTO Levels (uid, level, experience)
VALUES (0002, 2, 15);

INSERT INTO Levels (uid, level, experience)
VALUES (0003, 0, 0);

INSERT INTO Levels (uid, level, experience)
VALUES (0004, 20, 460);

INSERT INTO Levels (uid, level, experience)
VALUES (0005, 13, 234);

INSERT INTO Levels (uid, level, experience)
VALUES (0006, 44, 1521);

INSERT INTO Levels (uid, level, experience)
VALUES (0007, 2, 14);

INSERT INTO Levels (uid, level, experience)
VALUES (0008, 9, 165);

INSERT INTO Levels (uid, level, experience)
VALUES (0009, 6, 133);

INSERT INTO Levels (uid, level, experience)
VALUES (0010, 13, 243);

--Populate Groups table
INSERT INTO Groups (name, oid)
VALUES ('group1', 0002);

INSERT INTO Groups (name, oid)
VALUES ('group2', 0001);

INSERT INTO Groups (name, oid)
VALUES ('group3', 0008);

INSERT INTO Groups (name, oid)
VALUES ('group4', 0010);

INSERT INTO Groups (name, oid)
VALUES ('group5', 0004);

--Populate GroupData table
INSERT INTO GroupData (gid, mid)
VALUES (0001, 0001);

INSERT INTO GroupData (gid, mid)
VALUES (0001, 0002);

INSERT INTO GroupData (gid, mid)
VALUES (0002, 0001);

INSERT INTO GroupData (gid, mid)
VALUES (0002, 0009);

INSERT INTO GroupData (gid, mid)
VALUES (0003, 0002);

INSERT INTO GroupData (gid, mid)
VALUES (0004, 0010);

INSERT INTO GroupData (gid, mid)
VALUES (0004, 0007);

INSERT INTO GroupData (gid, mid)
VALUES (0005, 0002);

INSERT INTO GroupData (gid, mid)
VALUES (0005, 0007);

INSERT INTO GroupData (gid, mid)
VALUES (0005, 0009);

INSERT INTO GroupData (gid, mid)
VALUES (0005, 00010);

INSERT INTO GroupData (gid, mid)
VALUES (0005, 0006);

INSERT INTO GroupData (gid, mid)
VALUES (0001, 0008);

INSERT INTO GroupData (gid, mid)
VALUES (0002, 0008);

INSERT INTO GroupData (gid, mid)
VALUES (0004, 0001);

--Populate Profile table
INSERT INTO Profile (uid, currency, badges, steam, battlenet, instagram, snapchat, twitter)
VALUES (0001, 10, 'admin', 'steam1', 'battle1', 'insta1', 'snap1', 'twitter1');

INSERT INTO Profile (uid, currency, twitter)
VALUES (0002, 111, 'twitter2');

INSERT INTO Profile (uid, currency, badges, steam, snapchat, twitter)
VALUES (0003, 14, 'new', 'steam3', 'snap3', 'twitter3');

INSERT INTO Profile (uid, currency, steam, battlenet, snapchat)
VALUES (0004, 6, 'steam4', 'battle4', 'snap4');

INSERT INTO Profile (uid, currency, snapchat, twitter)
VALUES (0005, 11, 'snap5', 'twitter5');

INSERT INTO Profile (uid, currency)
VALUES (0006, 12);

INSERT INTO Profile (uid, currency, snapchat, twitter)
VALUES (0007, 0, 'snap7', 'twitter7');

INSERT INTO Profile (uid, battlenet, twitter)
VALUES (0008, 'battle8', 'twitter8');

INSERT INTO Profile (uid, currency, instagram, snapchat, twitter)
VALUES (0009, 1, 'insta9', 'snap9', 'twitter9');

INSERT INTO Profile (uid, currency, twitter)
VALUES (0010, 1, 'twitter10');

--Populate Reactions table
INSERT INTO Reactions (uid, name, image)
VALUES (0001, 'reaction1', '/bot/data/reactions/reaction1.png');

INSERT INTO Reactions (uid, name, image)
VALUES (0001, 'reaction2', '/bot/data/reactions/reaction2.png');

INSERT INTO Reactions (uid, name, image)
VALUES (0002, 'reaction3', '/bot/data/reactions/reaction3.png');

INSERT INTO Reactions (uid, name, image)
VALUES (0004, 'reaction4', '/bot/data/reactions/reaction4.png');

INSERT INTO Reactions (uid, name, image)
VALUES (0010, 'reaction5', '/bot/data/reactions/reaction5.png');

INSERT INTO Reactions (uid, name, image)
VALUES (0005, 'reaction6', '/bot/data/reactions/reaction6.png');

INSERT INTO Reactions (uid, name, image)
VALUES (0001, 'reaction7', '/bot/data/reactions/reaction7.png');

INSERT INTO Reactions (uid, name, image)
VALUES (0009, 'reaction8', '/bot/data/reactions/reaction8.png');

--User Profile View
CREATE VIEW userProfileView AS
  SELECT
    u.uid,
    u.nickname,
    l.level,
    l.experience,
    u.profilePicture,
    u.roles,
    p.currency,
    p.badges,
    p.steam,
    p.battlenet,
    p.instagram,
    p.snapchat,
    p.twitter
  FROM Users u, Profile p, Levels l
  WHERE u.uid = p.uid AND u.uid = l.uid
  ORDER BY uid;

--Group View
CREATE VIEW groupView AS
  SELECT
    Groups.gid,
    Groups.name,
    Groups.oid,
    GroupData.mid
  FROM Groups
    INNER JOIN GroupData
      ON Groups.gid = GroupData.gid
  ORDER BY gid;

--Reaction View
CREATE VIEW reactionView AS
  SELECT
    u.uid,
    u.nickname,
    r.rid,
    r.name,
    r.image
  FROM Users u, Reactions r
  WHERE u.uid = r.uid
  ORDER BY uid;

--Create Group Procedure
CREATE OR REPLACE FUNCTION createGroup(TEXT, INTEGER)
  RETURNS VOID AS
$$
DECLARE
  groupName TEXT := $1;
  ownerID   INTEGER := $2;
BEGIN
  INSERT INTO groups (name, oid)
  VALUES (groupName, ownerID);
END;
$$
LANGUAGE plpgsql;

SELECT createGroup('NewGroup', 0010);
SELECT *
FROM Groups
WHERE oid = 0010;

--addMember Procedure
CREATE OR REPLACE FUNCTION addMember(INTEGER, INTEGER)
  RETURNS VOID AS
$$
DECLARE
  groupID INTEGER := $1;
  userID  INTEGER := $2;
BEGIN
  INSERT INTO GroupData (gid, mid)
  VALUES (groupID, userID);
END;
$$
LANGUAGE plpgsql;

SELECT addMember(6, 0005);
SELECT *
FROM GroupData
WHERE gid = 6;

--addReaction Procedure
CREATE OR REPLACE FUNCTION addReaction(INTEGER, TEXT, TEXT)
  RETURNS VOID AS
$$
DECLARE
  userID           INTEGER := $1;
  reactionName     TEXT := $2;
  reactionLocation TEXT := $3;
BEGIN
  INSERT INTO Reactions (uid, name, image)
  VALUES (userID, reactionName, reactionLocation);
END;
$$
LANGUAGE plpgsql;

SELECT addReaction(0005, 'NewReaction', '/bot/data/reactions/NewReaction.png');
SELECT *
FROM Reactions
WHERE uid = 0005;

--Grant bot the important privileges since it is going to be the main one interacting with the database
REVOKE ALL ON * FROM bot;
GRANT SELECT, INSERT, UPDATE ON * TO bot;

--Grant ALL privileges in db to admin
REVOKE ALL ON * FROM botAdmin;
GRANT ALL PRIVILEGES ON * TO botAdmin;