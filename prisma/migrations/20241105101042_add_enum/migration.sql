/*
  Warnings:

  - You are about to drop the column `ownerName` on the `point_of_interest` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "PointOfInterestOpenningHours" AS ENUM ('CaseOne', 'CaseTwo', 'CaseThree');

-- AlterTable
ALTER TABLE "point_of_interest" DROP COLUMN "ownerName",
ADD COLUMN     "openingHours" "PointOfInterestOpenningHours";
