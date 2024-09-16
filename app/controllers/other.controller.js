const sequelize = require('../config/db.config.js');
const Article = require('../models/article.model.js');
const ArticleView = require('../models/article_view.model');
const ArticleLike = require('../models/article_like.model');
const Comment = require('../models/comment.model');
const User = require('../models/user.model');
const { Op, fn, col } = require("sequelize");

class OtherController {

    // [GET] /orthers/list_articles
    async listArticles(req, res) {
        const { search, page = 1, limit = 10 } = req.query;
        const offset = (page - 1) * limit;
        try {
            // Build where clause for search functionality
            let whereClause = search
                ? { title: { [Op.like]: `%${search}%` } }
                : {};

            whereClause = {
                ...whereClause,
                privacy: 'public' // Chỉ lấy các bài viết được duyệt
            };

            // Fetch articles with pagination and order
            const { rows, count } = await Article.findAndCountAll({
                where: whereClause,
                limit: parseInt(limit),
                offset: parseInt(offset),
                order: [['article_id', 'DESC']], // Order by article_id in descending order
            });

            const totalPages = Math.ceil(count / limit);

            // Send response in the desired format
            res.status(200).json({
                totalArticles: count, // Total number of articles
                currentPage: parseInt(page), // Current page
                totalPages, // Total pages
                articles: rows, // Array of articles
            });
        } catch (error) {
            res.status(500).json({ message: "Lỗi khi truy vấn bài viết", error });
        }
    }

    // [GET] /orthers/top_trendings
    async topTrending(req, res) {
        const { limit = 2 } = req.query; // Số bài viết top trending mỗi loại (mặc định là 2)

        try {
            // Truy vấn top trending bài viết theo lượt xem
            const topViews = await sequelize.query(`
            SELECT a.article_id, a.user_id, a.title, a.content, a.tags, a.privacy, a.is_draft, a.slug, a.image_url, a.createdAt, a.updatedAt
            FROM articles a
            LEFT JOIN article_views av ON a.article_id = av.article_id
            GROUP BY a.article_id
            ORDER BY COALESCE(SUM(av.view_count), 0) DESC
            LIMIT :limit
        `, {
                replacements: { limit: parseInt(limit, 10) },
                type: sequelize.QueryTypes.SELECT
            });

            // Truy vấn top trending bài viết theo lượt thích
            const topLikes = await sequelize.query(`
            SELECT a.article_id, a.user_id, a.title, a.content, a.tags, a.privacy, a.is_draft, a.slug, a.image_url, a.createdAt, a.updatedAt
            FROM articles a
            LEFT JOIN article_likes al ON a.article_id = al.article_id
            GROUP BY a.article_id
            ORDER BY COALESCE(COUNT(al.like_id), 0) DESC
            LIMIT :limit
        `, {
                replacements: { limit: parseInt(limit, 10) },
                type: sequelize.QueryTypes.SELECT
            });

            // Truy vấn top trending bài viết theo bình luận
            const topComments = await sequelize.query(`
            SELECT a.article_id, a.user_id, a.title, a.content, a.tags, a.privacy, a.is_draft, a.slug, a.image_url, a.createdAt, a.updatedAt
            FROM articles a
            LEFT JOIN comments c ON a.article_id = c.article_id
            GROUP BY a.article_id
            ORDER BY COALESCE(COUNT(c.comment_id), 0) DESC
            LIMIT :limit
        `, {
                replacements: { limit: parseInt(limit, 10) },
                type: sequelize.QueryTypes.SELECT
            });

            // Kết hợp các bài viết top trending từ các truy vấn khác nhau vào một mảng duy nhất
            const uniqueArticles = {};

            // Kiểm tra kiểu dữ liệu và kết hợp kết quả
            if (Array.isArray(topViews)) {
                topViews.forEach(article => uniqueArticles[article.article_id] = article);
            }
            if (Array.isArray(topLikes)) {
                topLikes.forEach(article => uniqueArticles[article.article_id] = article);
            }
            if (Array.isArray(topComments)) {
                topComments.forEach(article => uniqueArticles[article.article_id] = article);
            }

            // Chuyển đổi đối tượng thành mảng và sắp xếp theo article_id
            const articles = Object.values(uniqueArticles).sort((a, b) => b.article_id - a.article_id);

            // Gửi phản hồi JSON chứa các bài viết top trending
            res.status(200).json({
                message: "Danh sách bài viết Top Trending theo lượt xem, lượt thích và bình luận",
                articles
            });
        } catch (error) {
            res.status(500).json({ message: 'Lỗi khi lấy bài viết top trending', error });
        }
    }
}

module.exports = new OtherController();
