const express = require('express');
const router = express.Router();
const {db} = require('../dbconnection/databaseconnection');

//POST REQUEST

router.post('/add_user',(req,res)=> {
    console.log('Results: ',req.body);

    const pdata = {
        name:req.body.name,
        age:req.body.age,
        address:req.body.address
    }; 

    const sql = 'INSERT INTO sampledata (name,age,address) VALUES (?,?,?)';
    const values = [pdata.name, pdata.age,pdata.address]

    db.query(sql,values,(err,results)=>{
        if(err){
            console.error('Error inserting data',err);
            return res.status(500).send({
                Status_code: 500,
                Message: "Error Inserting data",
                Error: err.message
            });
        }
        const responseData = { idsampledata: results.insertId,...pdata};
        console.log("Final Result: ", responseData);

        res.status(200).send({
            Status_code:200,
            Message: "User Data Added",
            User: responseData
        });
    });

});

//GET ALL USERS
router.get('/getusers',(req,res)=>{
    const sql = 'SELECT * FROM sampledata';

    db.query(sql,(err,results)=>{
        if(err){
            console.error('Error fetching data ',err)
            return res.status(500).send({
                Status_code:500,
                Message: "Error fetching data",
                Error: err.message
            })};

            res.status(200).send(results);
    })
})

//Updating User
router.put('/update_user/:id',(req,res)=>{

    const userID = req.params.id;
    const {name,age,address}= req.body;

    const sql = 'UPDATE sampledata SET name = ?, age = ?, address = ? WHERE idsampledata = ?'
    const values = [name,age,address,userID]

    db.query(sql,values,(err,results)=>{
        if(err){
            console.error('Error Updating Data', err)
            return res.status(500).send({
                Status_code:500,
                Message:"Error updating data",
                Error: err.message
            });
        }
        else if(results.affectedRows === 0){
            return res.status(404).send({
                Status_code:404,
                Message:"User Not Found"      
            });
        }
        res.status(200).send({
            Status_code:200,
            Message:"User Data Updated"
        })
    })

})

//DELETE
router.delete('/delete/:id',(req,res)=>{
    const userID = req.params.id
    const sql = "DELETE FROM sampledata WHERE idsampledata = ?"
    const values = userID
    db.query(sql,values,(err,results)=>{
        if(err){
            console.error("Failed to Delete selected row ",err)
            return res.status(500).send({
                Status_code:500,
                Message:"Error updating data",
                Error: err.message
            });
        }
        res.status(200).send({
            Status_code:200,
            Message:"User Data Deleted Successfully"
        })
    })
})

module.exports = router;