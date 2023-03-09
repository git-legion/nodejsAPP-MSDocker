const mysql = require("mysql2");


// Create a connection to the database
const connection = mysql.createConnection({
  host: "127.0.0.1",	// enter your private ip here
  user: "root",
  password: "root",
  port: "3306",
  database: "employees_db"
});

// open the MySQL connection
connection.connect(error => {
  if (error) throw error;
  console.log("Successfully connected to the MYSQL database.");
});

module.exports = connection;
