/*
  Warnings:

  - Added the required column `pointOfInterestId` to the `point_of_interest_pump` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "point_of_interest_pump" ADD COLUMN     "pointOfInterestId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "point_of_interest_pump" ADD CONSTRAINT "point_of_interest_pump_pointOfInterestId_fkey" FOREIGN KEY ("pointOfInterestId") REFERENCES "point_of_interest"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
