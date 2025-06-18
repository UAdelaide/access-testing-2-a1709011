var express = require('express');
var router = express.Router();
var db = require('../db');

var CURRENT_BUYER_ID = 1;

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

router.get('/messages', async (req, res) => {
  const [rows] = await db.query(`
    SELECT m.MessageText, m.SentAt, bi.Title, u.Name AS BuyerName
    FROM Messages m
    JOIN BookListings bl ON m.BookID = bl.BookID
    JOIN BookInfo bi ON bl.BookInfoID = bi.BookInfoID
    JOIN Users u ON m.BuyerID = u.UserID
    WHERE m.SellerID = ?
    ORDER BY m.SentAt DESC
  `, [CURRENT_BUYER_ID]);
  res.json(rows);
});

router.post('/message', async function(req, res, next) {
    const { bookID, sellerID, message } = req.body;
    await db.query(`
        INSERT INTO Messages (BuyerID, SellerID, BookID, MessageText, SentAt)
        VALUES (?, ?, ?, ?, NOW())
    `, [CURRENT_BUYER_ID, sellerID, bookID, message]);

    res.status(201).json({ message: 'Message sent' });
});

module.exports = router;