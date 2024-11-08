import { PrismaClient } from '@prisma/client';
import { CreatePoiDto } from '../types';

export class PoiService {
  private prisma: PrismaClient;

  constructor() {
    this.prisma = new PrismaClient();
  }

  async create(data: CreatePoiDto) {
    const pump = {
        create: data.pumps.map((pump) => ({
          name: pump.name,
          products: {
            create: pump.products.map((product) => ({
              name: product.name,
              prices: {
                create: product.prices,
              },
            })),
          },
        })),
      };

    return this.prisma.pointOfInterest.create({
      data: {
        status: data.status,
        name: data.name,
        address: {
          create: data.address
        },
        openingHours: {
          create: {
            openingDays: data.openingHours.openingDays,
            openingHours: data.openingHours.openingHours,
            closingHours: data.openingHours.closingHours
          }
        },
        pump: pump
      },
      include: {
        address: true,
        openingHours: true,
        pump: true
      }
    });
  }

  async findAll() {
    return this.prisma.pointOfInterest.findMany({
      include: {
        address: true,
        openingHours: true,
        pump: {
          include: {
            products: {
              include: {
                prices: true
              }
            }
          }
        }
      }
    });
  }

  async findById(id: number) {
    return this.prisma.pointOfInterest.findUnique({
      where: { id },
      include: {
        address: true,
        openingHours: true,
        pump: {
          include: {
            products: {
              include: {
                prices: true
              }
            }
          }
        }
      }
    });
  }

  async update(id: number, data: Partial<CreatePoiDto>) {
    return this.prisma.pointOfInterest.update({
      where: { id },
      data: {
        status: data.status,
        address: data.address ? {
          update: data.address
        } : undefined,
        openingHours: data.openingHours ? {
          delete: {},
          create: data.openingHours
        } : undefined,
        pump: data.pumps ? {
          deleteMany: {},
          create: data.pumps.map(pump => ({
            name: pump.name,
            fuelProducts: {
              create: pump.products.map(product => ({
                name: product.name,
                prices: {
                  create: product.prices
                }
              }))
            }
          }))
        } : undefined
      },
      include: {
        address: true,
        openingHours: true,
        pump: {
          include: {
            products: {
              include: {
                prices: true
              }
            }
          }
        }
      }
    });
  }
  async delete(id: number) {
    await this.prisma.pointOfInterest.delete({
      where: { id }
    });
  }
}