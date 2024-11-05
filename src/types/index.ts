export interface CreatePoiDto {
    status: 'ONLINE' | 'OFFLINE' | 'MAINTENANCE';
    name: string;
    address: {
      country: string;
      zipCode: string;
      city: string;
      street: string;
      houseNumber: string;
    };
    openingHours: {
        openingDays: string[];
        openingHours: string;
      closingHours: string;
    };
    pumps: {
      name: string;
      products: {
        name: string;
        prices: {
            price: number;
          currency: string;
        }[];
      }[];
    }[];
  }