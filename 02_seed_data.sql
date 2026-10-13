-- =======================================================
-- SPOTIFY STREAMING & ANALYTICS: SEED DATA
-- =======================================================
USE SpotifyAnalytics;

INSERT INTO Artists (ArtistName, Genre, JoinDate) VALUES
('The Weeknd', 'R&B', '2011-03-21'),
('Taylor Swift', 'Pop', '2006-10-24'),
('Kendrick Lamar', 'Hip-Hop', '2011-07-02');

INSERT INTO Tracks (Title, DurationSeconds, ArtistID, ReleaseDate) VALUES
('Blinding Lights', 200, 1, '2019-11-29'),
('Save Your Tears', 215, 1, '2020-08-09'),
('Cruel Summer', 178, 2, '2019-08-23'),
('Anti-Hero', 200, 2, '2022-10-21'),
('HUMBLE.', 177, 3, '2017-03-30'),
('DNA.', 185, 3, '2017-04-14');

INSERT INTO Users (Username, SubscriptionTier, RegistrationDate) VALUES
('Abdullah_CS', 'Premium', '2025-01-15'),
('DataNerd99', 'Free', '2026-03-22'),
('MusicLover01', 'Premium', '2024-11-05');

INSERT INTO StreamingHistory (UserID, TrackID, StreamDateTime, SecondsPlayed) VALUES
(1, 1, '2026-10-10 08:30:00', 200),
(1, 2, '2026-10-10 08:35:00', 215),
(2, 3, '2026-10-11 14:15:00', 178),
(3, 1, '2026-10-12 18:45:00', 200),
(1, 3, '2026-10-12 19:00:00', 178),
(2, 5, '2026-10-13 09:20:00', 45),
(3, 4, '2026-10-13 10:10:00', 200),
(1, 1, '2026-10-13 11:00:00', 200);