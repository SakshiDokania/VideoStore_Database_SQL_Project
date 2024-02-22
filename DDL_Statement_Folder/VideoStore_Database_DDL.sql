/*  */

-- Create the EliteVideo database
CREATE DATABASE EliteVideo;

-- Switch to the EliteVideo database
USE EliteVideo;

-- Create the MOVIE table
CREATE TABLE MOVIE (
    MovieID integer PRIMARY KEY,
    Title varchar(100),
    YearReleased integer,
    Runtime integer,
    Genre varchar(50)
);

-- Create the VIDEO table
CREATE TABLE VIDEO (
    VideoID integer PRIMARY KEY,
    MovieID integer,
    DatePurchased datetime,
    VideoCondition varchar(10),
    FOREIGN KEY (MovieID) REFERENCES MOVIE(MovieID)
);

-- Create the MEMBERSHIP table
CREATE TABLE MEMBERSHIP (
    MemberID integer PRIMARY KEY,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    PhoneNumber varchar(20),
    StreetAddress varchar(100),
    City varchar(50),
    State char(2),
    ZipCode integer
);

-- Create the RENTAL table
CREATE TABLE RENTAL (
    RentalID integer PRIMARY KEY,
    MemberID integer,
    RentalDate datetime,
    ReturnDate datetime,
    FOREIGN KEY (MemberID) REFERENCES MEMBERSHIP(MemberID)
);

-- Create the DETAILRENTAL table
CREATE TABLE DETAILRENTAL (
    RentalID integer,
    VideoID integer,
    FOREIGN KEY (RentalID) REFERENCES RENTAL(RentalID),
    FOREIGN KEY (VideoID) REFERENCES VIDEO(VideoID)
);

-- Create the PRICE table
CREATE TABLE PRICE (
    PriceID integer PRIMARY KEY,
    PriceCategory varchar(20),
    Price decimal(5,2)
);

