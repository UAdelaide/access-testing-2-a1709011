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

router.post('/message', async function(req, res, next) {
    const { bookID, sellerID, message } = req.body;
    await db.query(`
        INSERT INTO Messages (BuyerID, SellerID, BookID, MessageText, SentAt)
        VALUES (?, ?, ?, ?, NOW())
    `, [CURRENT_BUYER_ID, sellerID, bookID, message]);

    res.status(201).json({ message: })
});

module.exports = router;