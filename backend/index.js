const express = require ('express');

const {connectDB, db} = require("./dbconnection/databaseconnection")
//get the export module from databaseconnection.js file

const dataRoutes = require('./routes/testsampleRoute')
//get the export module from route folder

const userroutes = require('./routes/userroutes')
//get the export module from userroutes folder

connectDB();
//calling the fuction

const app = express();

const userData = [];

const PORT = 8080

const cors = require('cors')

app.use(cors())

app.use(express.json());

app.use(express.urlencoded({
    extended:true
}))

app.use('/api',userroutes)


app.listen(PORT,()=>{
    console.log(`Listening to http://localhost:${PORT}`);
})





