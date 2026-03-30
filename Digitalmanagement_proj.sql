create database management;
use management;
CREATE TABLE Books (
    Bookid INT PRIMARY KEY,
    Title VARCHAR(25),
    Author VARCHAR(30),
    Genre VARCHAR(20),
    Published_year INT
);
 CREATE TABLE Members (
    Memberid INT PRIMARY KEY,
    Full_name VARCHAR(30),
    Join_date DATE
);
CREATE TABLE Loans (
    Loanid INT PRIMARY KEY,
    Bookid INT,
    Memberid INT,
    Loandate DATE,
    Returndate DATE,
    FOREIGN KEY (Bookid)
        REFERENCES Books (Bookid),
    FOREIGN KEY (Memberid)
        REFERENCES Members (Memberid)
);
insert into Books values
(1, 'The Great Gatsby', 'F.Scott Fitzgerald', 'Classic', 1925),
(2, '1984', 'George Orwell', 'Dystopian', 1949),
(3, 'The Hobbit', 'J.R.R Tolkien', 'Fantasy', 1937);
insert into Members values
(101,'Nina Kamble','2026-01-15'),
(102,'Rahul Sharma','2026-02-20');
insert into loans values
(501,1,101,'2026-03-01','2026-03-10'),
(502,2,102,'2026-03-05',Null);  
select m.Full_name, b.Title from Loans l join Books b using (Bookid) join Members m using (Memberid) where l.Returndate is null;
select b.Genre, count(*) as Total_loans from Books b join Loans l using (Bookid) group by b.Genre order by Total_loans Desc limit 1;
select b.Title,m.Full_name,l.loandate FROM Loans l join Books b using(Bookid) join Members m using(Memberid);
select Author,count(*) as Bookcount from Books group by Author order by Bookcount desc;
SELECT 
    m.Full_name, COUNT(l.loanid) AS total_books_borrowed
FROM
    Members m
        JOIN
    Loans l USING (Memberid)
GROUP BY Memberid
ORDER BY total_books_borrowed DESC;
select Genre,count(*) as total_books from Books group by Genre;
select Full_name,Join_date from Members where Join_date>'2026-01-01';
select distinct(Full_name),b.Genre from Loans l join Books b using(Bookid) join Members m using(Memberid) where b.Genre = 'Classic'; 
select * from Books where Published_year<(select year(min(Join_date)) from Members);


 