/*
  Warnings:

  - You are about to drop the column `openingHours` on the `point_of_interest` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "point_of_interest" DROP COLUMN "openingHours";

-- DropEnum
DROP TYPE "PointOfInterestOpenningHours";

-- CreateTable
CREATE TABLE "point_of_interest_openning_hours_case" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "openingDays" TEXT[],
    "openingHours" TIMESTAMP(3) NOT NULL,
    "closingHours" TIMESTAMP(3) NOT NULL,
    "pointOfInterestId" INTEGER NOT NULL,

    CONSTRAINT "point_of_interest_openning_hours_case_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "point_of_interest_openning_hours_case_pointOfInterestId_key" ON "point_of_interest_openning_hours_case"("pointOfInterestId");

-- AddForeignKey
ALTER TABLE "point_of_interest_openning_hours_case" ADD CONSTRAINT "point_of_interest_openning_hours_case_pointOfInterestId_fkey" FOREIGN KEY ("pointOfInterestId") REFERENCES "point_of_interest"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
