const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

router.get('/', userController.getAllUserController);
router.get('/:id', userController.getUserByIdController);
router.post('/', userController.createUserController);
router.put('/:id', userController.updateUserController);
router.put('/delete/:id', userController.deleteUserController); 


module.exports = router;
