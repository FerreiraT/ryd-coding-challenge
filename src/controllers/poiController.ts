import { Request, Response } from 'express';
import { PoiService } from '../services/poiService';

export class PoiController {
  private service: PoiService;

  constructor() {
    this.service = new PoiService();
  }

  async create(req: Request, res: Response) {
    try {
      const station = await this.service.create(req.body);
      res.status(201).json(station);
    } catch (error) {
      res.status(500).json({ error: 'Failed to create poi' });
    }
  }

  async findAll(req: Request, res: Response) {
    try {
      const stations = await this.service.findAll();
      res.json(stations);
    } catch (error) {
      res.status(500).json({ error: 'Failed to fetch pois' });
    }
  }

  async findById(req: Request, res: Response) {
    try {
      const station = await this.service.findById(Number(req.params.id));
      if (!station) {
        return res.status(404).json({ error: 'poi not found' });
      }
      res.json(station);
    } catch (error) {
      res.status(500).json({ error: 'Failed to fetch poi' });
    }
  }
  async update(req: Request, res: Response) {
    try {
      const station = await this.service.update(Number(req.params.id), req.body);
      res.json(station);
    } catch (error) {
      res.status(500).json({ error: 'Failed to update poi' });
    }
  }

  async delete(req: Request, res: Response) {
    try {
      await this.service.delete(Number(req.params.id));
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ error: 'Failed to delete poi' });
    }
  }
}