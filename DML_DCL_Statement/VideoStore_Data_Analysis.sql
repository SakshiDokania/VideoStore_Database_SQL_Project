/* Below are the codes for performing analysis for questions on the VideoStore dataset.
The codes have been written using DML and DCL statements.*/ 

-- Task 1
-- SQL statement to retrieve movie titles along with the count of rentals for each movie
-- Selecting the title of the movie and the count of rentals (number of times the movie was rented).
SELECT M.Title, COUNT(DR.VideoID) AS RentalCount
-- From the Movie table (aliased as M), Video table (aliased as V), and DetailRental table (aliased as DR).
FROM Movie M 
JOIN Video V ON M.MovieID = V.MovieID
JOIN DetailRental DR ON V.VideoID = DR.VideoID 
-- Grouping the results by the title of the movie.
GROUP BY M.Title;

-- Task 2 
-- SQL statement to display name, email, phone number, and address of members who have rented movies released after 01/01/2023
-- Selecting specific columns from the Membership table (aliased as M).
SELECT M.FirstName, M.LastName, M.Email, M.PhoneNumber,
  -- Concatenating address components to form a complete address.
  CONCAT(M.StreetAddress, ', ', M.City, ', ', M.State, ' ', M.ZipCode) AS Address
-- From the Membership table (aliased as M) and its related tables.
FROM Membership M
-- Joining the tables to get information about members, rentals, detail rentals, videos, and movies.
JOIN Rental R ON M.MemberID = R.MemberID
JOIN DetailRental DR ON R.RentalID = DR.RentalID
JOIN Video V ON DR.VideoID = V.VideoID
JOIN Movie MV ON V.MovieID = MV.MovieID
-- Filtering the results to include only movies released in 2023 or later.
WHERE MV.YearReleased >= 2023;

-- Task 3
-- SQL statement using the EXISTS function to display members who have rented at least one movie
-- Selecting specific columns from the Membership table (aliased as M).
SELECT M.MemberID, 
  -- Concatenating the first and last names to form the full member name.
  CONCAT(M.FirstName, ' ', M.LastName) AS MemberName, 
  -- Concatenating address components to form a complete address.
  CONCAT(M.StreetAddress, ', ', M.City, ', ', M.State, ' ', M.ZipCode) AS Address
FROM Membership M -- From the Membership table (aliased as M).
-- Filtering the results to include only members who have rented movies.
WHERE EXISTS (
  SELECT 1 -- Subquery: Checking if there is at least one record in the Rental table for the current member.
  FROM Rental R  -- Connecting the subquery to the main query using the MemberID.
  WHERE R.MemberID = M.MemberID
);

-- Adding a new column 'Rating' to the Movie table to store movie ratings.
ALTER TABLE Movie ADD COLUMN Rating INTEGER;
-- Updating the movie ratings for specific movies.
UPDATE Movie 
SET Rating = 5
WHERE MovieID IN (1, 3, 6, 8, 9, 10);

UPDATE Movie
SET Rating = 4 
WHERE MovieID IN (2, 5, 7);
-- Task 4: Retrieving information about members who have rented movies with a rating higher than 4.
-- Selecting specific columns from the Membership table (aliased as M).
SELECT M.MemberID, 
  CONCAT(M.FirstName, ' ', M.LastName) AS MemberName, -- Concatenating the first and last names to form the full member name.
  CONCAT(M.StreetAddress, ', ', M.City, ', ', M.State, ' ', M.ZipCode) AS Address    -- Concatenating address components to form a complete address.
FROM Membership M  -- From the Membership table (aliased as M).
-- Filtering the results using the EXISTS function.
WHERE EXISTS (
  -- Subquery: Checking if there is at least one record in the Rental, DetailRental, Video, and Movie tables for the current member.
  SELECT 1
  FROM Rental R
  JOIN DetailRental DR ON R.RentalID = DR.RentalID
  JOIN Video V ON DR.VideoID = V.VideoID
  JOIN Movie MV ON V.MovieID = MV.MovieID
   -- Conditions: Checking for movies with a rating higher than 4 and matching MemberID.
  WHERE MV.Rating > 4 AND R.MemberID = M.MemberID  
);
