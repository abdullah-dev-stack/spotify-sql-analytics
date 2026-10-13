-- =======================================================
-- SPOTIFY STREAMING & ANALYTICS: BUSINESS LOGIC
-- =======================================================
USE SpotifyAnalytics;

-- QUERY 1: Detailed User Listening History
SELECT 
    u.Username,
    t.Title AS TrackName,
    a.ArtistName,
    s.StreamDateTime,
    s.SecondsPlayed
FROM StreamingHistory s
JOIN Users u ON s.UserID = u.UserID
JOIN Tracks t ON s.TrackID = t.TrackID
JOIN Artists a ON t.ArtistID = a.ArtistID
WHERE u.Username = 'Abdullah_CS'
ORDER BY s.StreamDateTime DESC;

-- QUERY 2: Listener Engagement (Total Minutes)
SELECT 
    u.Username,
    u.SubscriptionTier,
    ROUND(SUM(s.SecondsPlayed) / 60, 2) AS TotalMinutesListened
FROM Users u
LEFT JOIN StreamingHistory s ON u.UserID = s.UserID
GROUP BY u.UserID, u.Username, u.SubscriptionTier
ORDER BY TotalMinutesListened DESC;

-- QUERY 3: Enterprise View for Artist Royalties 
CREATE OR REPLACE VIEW ArtistRoyalties AS
SELECT 
    a.ArtistName,
    COUNT(s.StreamID) AS EligibleStreams,
    ROUND(COUNT(s.StreamID) * 0.004, 4) AS EstimatedEarningsUSD 
FROM StreamingHistory s
JOIN Tracks t ON s.TrackID = t.TrackID
JOIN Artists a ON t.ArtistID = a.ArtistID
WHERE s.SecondsPlayed > 30 
GROUP BY a.ArtistID, a.ArtistName;