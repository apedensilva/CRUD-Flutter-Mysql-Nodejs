const mysql = require('mysql2');

require('dotenv').config();

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME 
});

// Define the connectDB function
const connectDB = () => {
    db.connect(err => {
        if (err) {
            console.error('Database connection failed:', err.stack); 
            return;
        }
        console.log('Connected to Database');
        
    });
};

// Export the connectDB function
module.exports = {connectDB,db};
