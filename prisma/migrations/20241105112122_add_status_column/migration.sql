/*
  Warnings:

  - Added the required column `status` to the `point_of_interest` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "point_of_interest" ADD COLUMN     "status" TEXT NOT NULL;
