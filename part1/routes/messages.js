var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/items', async function(req, res, next) {
    const [rows] = await db.query(`
        SELECT bl.BookID, b.Title, bl.SellerID, u.Name AS SellerName
        FROM BookListings bl
        JOIN BookInfo b ON bl.BookInfoID = b.BookInfoID
        JOIN Users u ON bl.SellerID = u.UserID
    `);
    res.json(rows);
});

module.exports = router;