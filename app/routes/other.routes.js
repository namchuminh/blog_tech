const express = require('express');
const router = express.Router();
const ortherController = require('../controllers/other.controller.js');

router.get('/list_articles', ortherController.listArticles);
router.get('/top_trendings', ortherController.topTrending);

module.exports = router;
