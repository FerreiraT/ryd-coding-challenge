-- CreateTable
CREATE TABLE "point_of_interest_pump" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "products" TEXT[],

    CONSTRAINT "point_of_interest_pump_pkey" PRIMARY KEY ("id")
);
