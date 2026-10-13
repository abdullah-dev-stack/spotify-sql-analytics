-- =======================================================
-- SPOTIFY STREAMING & ANALYTICS DATABASE SCHEMA
-- =======================================================
CREATE DATABASE IF NOT EXISTS SpotifyAnalytics;
USE SpotifyAnalytics;

CREATE TABLE IF NOT EXISTS Artists (
    ArtistID INT AUTO_INCREMENT PRIMARY KEY,
    ArtistName VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    JoinDate DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Tracks (
    TrackID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    DurationSeconds INT NOT NULL,
    ArtistID INT NOT NULL,
    ReleaseDate DATE NOT NULL,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    SubscriptionTier ENUM('Free', 'Premium') DEFAULT 'Free',
    RegistrationDate DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS StreamingHistory (
    StreamID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    TrackID INT NOT NULL,
    StreamDateTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    SecondsPlayed INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID) ON DELETE CASCADE
);