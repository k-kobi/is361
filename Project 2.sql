-- Kobi Kobi IS361 Project 2: Building relational database management system
DROP TABLE IF EXISTS Room_Access;
DROP TABLE IF EXISTS Rooms;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Groups1;

-- Create Groups1 (idk why it doesn't let me just create groups), users, and rooms tables
CREATE TABLE Groups1 (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(50) NOT NULL
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(50) NOT NULL,
    GroupID INT,
    FOREIGN KEY (GroupID) REFERENCES Groups1(GroupID)
);

CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomName VARCHAR(50) NOT NULL
);

-- Create room_access table (many to many)
CREATE TABLE Room_Access (
    AccessID INT PRIMARY KEY AUTO_INCREMENT,
    GroupID INT,
    RoomID INT,
    FOREIGN KEY (GroupID) REFERENCES Groups1(GroupID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

-- Insert data into the tables
INSERT INTO Groups1 (GroupName) VALUES
('I.T.'),
('Sales'),
('Administration'),
('Operations');

INSERT INTO Users (UserName, GroupID) VALUES
('Modesto', 1),
('Ayine', 1),
('Christopher', 2),
('Cheong Woo', 2),
('Saulat', 3),
('Heidy', NULL);

INSERT INTO Rooms (RoomName) VALUES
('101'),
('102'),
('Auditorium A'),
('Auditorium B');

INSERT INTO Room_Access (GroupID, RoomID) VALUES
(1, 1),
(1, 2),
(2, 2), 
(2, 3);

-- All groups, and the users in each group.
SELECT g.GroupName, u.UserName
FROM Groups1 g
LEFT JOIN Users u ON g.GroupID = u.GroupID
ORDER BY g.GroupName, u.UserName;

-- All rooms, and the groups assigned to each room
SELECT r.RoomName, g.GroupName
FROM Rooms r
LEFT JOIN Room_Access ra ON r.RoomID = ra.RoomID
LEFT JOIN Groups1 g ON ra.GroupID = g.GroupID
ORDER BY r.RoomName, g.GroupName;

-- A list of users, the groups that they belong to, and the rooms to which they are assigned
SELECT u.UserName, g.GroupName, r.RoomName
FROM Users u
LEFT JOIN Groups1 g ON u.GroupID = g.GroupID
LEFT JOIN Room_Access ra ON g.GroupID = ra.GroupID
LEFT JOIN Rooms r ON ra.RoomID = r.RoomID
ORDER BY u.UserName, g.GroupName, r.RoomName;
