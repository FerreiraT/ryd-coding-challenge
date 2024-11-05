/*
  Warnings:

  - You are about to drop the column `products` on the `point_of_interest_pump` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "point_of_interest_pump" DROP COLUMN "products";

-- CreateTable
CREATE TABLE "pump_product" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "pumpId" TEXT NOT NULL,

    CONSTRAINT "pump_product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_price" (
    "id" SERIAL NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "currency" TEXT NOT NULL,
    "pumpProductId" INTEGER NOT NULL,
    "pointOfInterestPumpId" INTEGER NOT NULL,

    CONSTRAINT "product_price_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "pump_product" ADD CONSTRAINT "pump_product_pumpId_fkey" FOREIGN KEY ("pumpId") REFERENCES "point_of_interest_pump"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_price" ADD CONSTRAINT "product_price_pumpProductId_fkey" FOREIGN KEY ("pumpProductId") REFERENCES "pump_product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
