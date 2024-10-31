const express = require('express');
const router = express.Router();
const {db} = require('../dbconnection/databaseconnection');

//route to get all data from a table
router.get('/data',(req,res)=>{
    const query = 'SELECT * FROM sampledata';

    db.query(query,(err,results)=>{
        if(err){
            return res.status(500).json({error:err.message});
        }
        res.json(results);
    })
})

//route to get a single row of data from a table
router.get('/data/:idsampledata',(req,res)=>{
    const id = req.params.idsampledata; // This will be a request to get the idsampledata from the database
    const query = 'SELECT * FROM sampledata WHERE idsampledata = ?';

    db.query(query,[id],(err,results)=>{
        if(err){
            return res.status(500).json({error:err.message});
        }
        else if(results.length === 0){
            return res.status(404).json({message: "no data found"});
        }
        res.json(results[0]);
    })

})

module.exports = router;