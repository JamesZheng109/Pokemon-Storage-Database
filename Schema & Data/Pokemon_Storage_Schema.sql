CREATE SCHEMA IF NOT EXISTS Pokemon_Storage;
USE Pokemon_Storage;
CREATE TABLE IF NOT EXISTS `Trainer` (
  `TrainerID` int ,
  `TrainerName` varchar(20),
  `HomeRegion` varchar(20),
  PRIMARY KEY (`TrainerID`)
);
CREATE TABLE IF NOT EXISTS `BoxTheme` (
  `ThemeID` int,
  `ThemeName` varchar(20),
  PRIMARY KEY (`ThemeID`)
);
CREATE TABLE IF NOT EXISTS `PCBox` (
  `BoxID` int,
  `BoxName` varchar(20),
  PRIMARY KEY (`BoxID`)
);
CREATE TABLE IF NOT EXISTS `PCInfo` (
  `LocationID` int,
  `LocationName` varchar(100),
  `PCRegion` varchar(100),
  `PCTown` varchar(100),
  PRIMARY KEY (`LocationID`)
);
CREATE TABLE IF NOT EXISTS `Nature` (
  `NatureID` int,
  `NatureName` varchar(50),
  PRIMARY KEY (`NatureID`)
);
CREATE TABLE IF NOT EXISTS `Pokemon` (
  `PokeID` int,
  `PokedexNo` int,
  `PokeName` varchar(20),
  `Type1` varchar(10),
  `Type2` varchar(10) null,
  PRIMARY KEY (`PokeID`)
);
CREATE TABLE IF NOT EXISTS`Actions` (
  `ActionID` int,
  `ActType` varchar(10),
  PRIMARY KEY (`ActionID`)
);
CREATE TABLE IF NOT EXISTS `Item` (
  `ItemID` int,
  `ItemName` varchar(50),
  PRIMARY KEY (`ItemID`)
);
CREATE TABLE IF NOT EXISTS `Ability` (
  `AbilityID` int,
  `AbilityName` varchar(50),
  PRIMARY KEY (`AbilityID`)
);
CREATE TABLE IF NOT EXISTS `TrainerPoke` (
  `TrainerPokeID` int,
  `TrainerID` int,
  `PokeID` int,
  `NatureID` int,
  `AbilityID` int,
  `ItemID` int,
  `PokeNickname` varchar(20) null,
  `Move1` varchar(20),
  `Move2` varchar(20) null,
  `Move3` varchar(20) null,
  `Move4` varchar(20) null,
  `Level` int,
  `Health` int,
  `Attack` int,
  `Defense` int,
  `SpecialAttack` int,
  `SpecialDefense` int,
  `Speed` int,
  `MeetAt` varchar(50),
  PRIMARY KEY (`TrainerPokeID`),
  FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
  FOREIGN KEY (PokeID) REFERENCES Pokemon(PokeID),
  FOREIGN KEY (NatureID) REFERENCES Nature(NatureID),
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
  FOREIGN KEY (AbilityID) REFERENCES Ability(AbilityID)
);
CREATE TABLE IF NOT EXISTS`TransactionInfo` (
  `TransactionID` int,
  `TrainerPokeID` int,
  `LocationID` int,
  `BoxID` int,
  `ThemeID` int,
  `ActionID` int,
  `BoxNickName` varchar(20) NULL,
  `Time` time,
  `Date` date,
  PRIMARY KEY (`TransactionID`),
  FOREIGN KEY (TrainerPokeID) REFERENCES TrainerPoke(TrainerPokeID),
  FOREIGN KEY (LocationID) REFERENCES PCInfo(LocationID),
  FOREIGN KEY (BoxID) REFERENCES PCBox(BoxID),
  FOREIGN KEY (ThemeID) REFERENCES BoxTheme(ThemeID),
  FOREIGN KEY (ActionID) REFERENCES Actions(ActionID)
);