-- CreateTable
CREATE TABLE "point_of_interest" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "ownerName" TEXT NOT NULL,
    "addressId" INTEGER,

    CONSTRAINT "point_of_interest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "point_of_interest_address" (
    "id" SERIAL NOT NULL,
    "pointOfInterestId" INTEGER,
    "country" TEXT NOT NULL,
    "zipCode" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "houseNumber" TEXT NOT NULL,

    CONSTRAINT "point_of_interest_address_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "point_of_interest_address_pointOfInterestId_key" ON "point_of_interest_address"("pointOfInterestId");

-- AddForeignKey
ALTER TABLE "point_of_interest_address" ADD CONSTRAINT "point_of_interest_address_pointOfInterestId_fkey" FOREIGN KEY ("pointOfInterestId") REFERENCES "point_of_interest"("id") ON DELETE CASCADE ON UPDATE CASCADE;