const express = require('express');
const router = express.Router();
const {db} = require('../dbconnection/databaseconnection');
const { createUser, getAllUsers, updateUser, deleteUser } = require('../controllers/userController');

//POST REQUEST

router.post('/add_user',createUser)

//GET ALL USERS
router.get('/getusers',getAllUsers)

//Updating User
router.put('/update_user/:id',updateUser)

//DELETE
router.delete('/delete/:id',deleteUser)

module.exports = router;