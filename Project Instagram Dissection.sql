-- Users Table
CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(50) UNIQUE NOT NULL,
  Email VARCHAR(100) UNIQUE NOT NULL,
  Full_Name VARCHAR(100) NOT NULL,
  Bio TEXT,
  Registration_Date DATE NOT NULL
);


-- Posts Table  
CREATE TABLE Posts (
  PostID INT PRIMARY KEY,
  UserID INT NOT NULL,
  Caption TEXT,
  Image_URL VARCHAR(200) NOT NULL,
  Location VARCHAR(100),
  Post_Date DATE NOT NULL,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Comments Table
CREATE TABLE Comments (
  CommentID INT PRIMARY KEY,
  PostID INT NOT NULL,
  UserID INT NOT NULL, 
  Text TEXT NOT NULL,
  Comment_Date DATE NOT NULL,
  FOREIGN KEY (PostID) REFERENCES Posts(PostID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Likes Table
CREATE TABLE Likes (
  LikeID INT PRIMARY KEY,
  PostID INT NOT NULL,
  UserID INT NOT NULL,
  Like_Date DATE NOT NULL,
  FOREIGN KEY (PostID) REFERENCES Posts(PostID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Followers Table
CREATE TABLE Followers (
  FollowerID INT PRIMARY KEY,
  FollowingUserID INT NOT NULL,
  FollowerUserID INT NOT NULL,
  Follow_Date DATE NOT NULL,
  FOREIGN KEY (FollowingUserID) REFERENCES Users(UserID),
  FOREIGN KEY (FollowerUserID) REFERENCES Users(UserID)
);

-- Hashtags Table
CREATE TABLE Hashtags (
  HashtagID INT PRIMARY KEY,
  Tag VARCHAR(50) UNIQUE NOT NULL
);

-- PostHashtags Table
CREATE TABLE PostHashtags (
  PostHashtagID INT PRIMARY KEY,
  PostID INT NOT NULL,
  HashtagID INT NOT NULL,
  FOREIGN KEY (PostID) REFERENCES Posts(PostID),
  FOREIGN KEY (HashtagID) REFERENCES Hashtags(HashtagID)
);