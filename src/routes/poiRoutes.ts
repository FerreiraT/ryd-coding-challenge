import { Router } from 'express';
import { PoiController } from '../controllers/poiController';

const router = Router();
const poiController = new PoiController();

router.get('/poi', poiController.findAll);
router.get('/poi/:id', poiController.findById);
router.post('/poi', poiController.create);
router.put('/poi/:id', poiController.update);
router.delete('/poi/:id', poiController.delete);

export default router;