-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "fname" TEXT NOT NULL,
    "lname" TEXT NOT NULL,
    "friendId" TEXT,
    CONSTRAINT "User_friendId_fkey" FOREIGN KEY ("friendId") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Car" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "color" TEXT NOT NULL,
    "bought" BOOLEAN NOT NULL DEFAULT false,
    "name" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "Car_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Carblog" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "content" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,
    CONSTRAINT "Carblog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CategoryCarBlogs" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "carblogId" TEXT,
    CONSTRAINT "CategoryCarBlogs_carblogId_fkey" FOREIGN KEY ("carblogId") REFERENCES "Carblog" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CategoriesOnCarBlogs" (
    "carBlogId" TEXT NOT NULL,
    "categoryId" TEXT NOT NULL,
    "assignedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "asssignedBy" TEXT NOT NULL,

    PRIMARY KEY ("carBlogId", "categoryId"),
    CONSTRAINT "CategoriesOnCarBlogs_carBlogId_fkey" FOREIGN KEY ("carBlogId") REFERENCES "Carblog" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "CategoriesOnCarBlogs_carBlogId_fkey" FOREIGN KEY ("carBlogId") REFERENCES "CategoryCarBlogs" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_friendId_key" ON "User"("friendId");

-- CreateIndex
CREATE UNIQUE INDEX "Car_userId_key" ON "Car"("userId");
