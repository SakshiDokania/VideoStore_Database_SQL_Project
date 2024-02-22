INSERT INTO Movie (MovieID, Title, YearReleased, Runtime, Genre)  
VALUES
  (1, 'The Matrix', 1999, 136, 'Action'),
  (2, 'Forrest Gump', 1994, 142, 'Drama'), 
  (3, 'Inception', 2010, 148, 'Action'),
  (4, 'Spirited Away', 2001, 125, 'Animation'),
  (5, 'Interstellar', 2014, 169, 'Sci-Fi'),
  (6, 'Avatar: The Way of Water', 2022, 192, 'Action'),
  (7, 'Babylon', 2022, 189, 'Drama'),
  (8, 'Everything Everywhere All at Once', 2022, 139, 'Comedy'),
  (9, 'John Wick 4', 2023, 137, 'Action'),
  (10, 'Barbie', 2023, 115, 'Comedy');

INSERT INTO Video (VideoID, MovieID, DatePurchased, VideoCondition)
VALUES
  (1, 1, '2020-01-01', 'Good'),
  (2, 1, '2020-03-15', 'Fair'),
  (3, 2, '2019-05-05', 'Good'),
  (4, 3, '2021-07-12', 'Excellent'),
  (5, 4, '2022-01-19', 'Fair'),
  (6, 5, '2023-02-01', 'Good'),
  (7, 9, '2023-02-15', 'Excellent'),
  (8, 10, '2023-03-10', 'Good');  

INSERT INTO Membership (MemberID, FirstName, LastName, Email, PhoneNumber, StreetAddress, City, State, ZipCode)
VALUES
  (1, 'John', 'Doe', 'john@example.com', '123-456-7890', '123 Main St', 'Anytown', 'CA', 90210),
  (2, 'Jane', 'Doe', 'jane@example.com', '987-654-3210', '456 Oak Rd', 'Mytown', 'NY', 12345),
  (3, 'Bob', 'Smith', 'bob@example.com', '456-789-0123', '789 1st Ave', 'Somewhere', 'FL', 34567);
  
INSERT INTO Rental (RentalID, MemberID, RentalDate, ReturnDate)  
VALUES
  (1, 1, '2023-02-01', '2023-02-05'),
  (2, 1, '2023-03-15', '2023-03-19'),
  (3, 2, '2023-02-15', '2023-02-19'),
  (4, 2, '2023-01-01', '2023-01-05'),
  (5, 3, '2023-03-10', '2023-03-15');
  
INSERT INTO DetailRental (RentalID, VideoID)
VALUES
  (1, 4),
  (2, 1),
  (3, 6), 
  (4, 3),
  (5, 7);
  
INSERT INTO Price (PriceID, PriceCategory, Price)  
VALUES
  (1, 'New Release', 5.00),
  (2, 'Regular', 2.50),
  (3, 'Discount', 1.00);
  
 
