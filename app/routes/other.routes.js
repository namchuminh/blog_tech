const express = require('express');
const router = express.Router();
const ortherController = require('../controllers/other.controller.js');

router.get('/list_articles', ortherController.listArticles);
router.get('/top_trendings', ortherController.topTrending);
router.get('/list_categories', ortherController.listCategories);
router.get('/last_comments', ortherController.lastComments);
router.get('/most_popular', ortherController.mostPopular);

module.exports = router;
