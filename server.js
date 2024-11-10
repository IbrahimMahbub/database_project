const express = require('express');
const mysql = require('mysql2');
const app = express();
const PORT = 3000;

// Database configuration
const dbConfigs = {
    Location1: { host: 'localhost', user: 'root', password: '1234567890', database: 'Location1' },
    Location2: { host: 'localhost', user: 'root', password: '1234567890', database: 'Location2' },
    Location3: { host: 'localhost', user: 'root', password: '1234567890', database: 'Location3' }
};

// Route to fetch data
app.get('/getData', (req, res) => {
    const location = req.query.location;
    const dbConfig = dbConfigs[location];

    if (!dbConfig) {
        return res.status(400).json({ error: 'Invalid location selected.' });
    }

    // Connect to the database
    const connection = mysql.createConnection(dbConfig);

    // Fetch data
    const queries = [
        "SELECT * FROM Customers",
        "SELECT * FROM Orders",
        "SELECT * FROM Products",
        "SELECT * FROM Inventory"
    ];

    let results = {};
    let completedQueries = 0;

    queries.forEach((query, index) => {
        connection.query(query, (err, result) => {
            if (err) return res.status(500).json({ error: 'Database error.' });

            results[queries[index].split(" ")[3]] = result; // Use table name as key
            completedQueries++;

            if (completedQueries === queries.length) {
                connection.end();
                res.json(results);
            }
        });
    });
});

// Start server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});

app.use(express.static('public'));
