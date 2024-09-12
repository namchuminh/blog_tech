const { Op } = require("sequelize");
const User = require("../models/user.model.js");
const createUploader = require('../middlewares/upload.middleware.js');

const upload = createUploader();

class UserController {
  // [GET] /users
  async index(req, res) {
    try {
      // Nhận tham số từ query (nếu không có thì mặc định)
      const { page = 1, limit = 10, search = "" } = req.query;

      // Chuyển đổi page và limit sang kiểu số nguyên
      const pageNumber = parseInt(page, 10);
      const limitNumber = parseInt(limit, 10);
      const offset = (pageNumber - 1) * limitNumber;

      // Điều kiện tìm kiếm theo username hoặc email (có thể tùy chỉnh)
      const searchCondition = {
        [Op.or]: [
          { username: { [Op.like]: `%${search}%` } },
          { email: { [Op.like]: `%${search}%` } }
        ]
      };

      // Tìm kiếm và phân trang
      const { rows: users, count: totalUsers } = await User.findAndCountAll({
        where: searchCondition,
        attributes: ['user_id', 'username', 'email', 'fullname', 'avatar_url', 'bio', 'role', 'createdAt'],
        limit: limitNumber,
        offset: offset
      });

      // Trả về kết quả với tổng số người dùng và các thông tin phân trang
      res.status(200).json({
        totalUsers,
        currentPage: pageNumber,
        totalPages: Math.ceil(totalUsers / limitNumber),
        users
      });
    } catch (error) {
      res.status(500).json({ message: "Lỗi khi lấy danh sách người dùng", error });
    }
  }

  // [GET] /user/:id
  async show(req, res) {
    try {
      const user = await User.findByPk(req.params.id, {
        attributes: ['user_id', 'username', 'email', 'fullname', 'avatar_url', 'bio', 'role', 'createdAt']
      });
      if (!user) {
        return res.status(404).json({ message: "Không tìm thấy người dùng" });
      }
      res.status(200).json(user);
    } catch (error) {
      res.status(500).json({ message: "Lỗi khi lấy thông tin người dùng", error });
    }
  }

  // [GET] /user/profile
  async profile(req, res) {
    try {
      const userId = req.user.userId; // id lấy từ token đã xác thực
      const user = await User.findByPk(userId, {
        attributes: ['user_id', 'username', 'email', 'fullname', 'avatar_url', 'bio', 'role', 'createdAt']
      });
      if (!user) {
        return res.status(404).json({ message: "Không tìm thấy người dùng" });
      }
      res.status(200).json(user);
    } catch (error) {
      res.status(500).json({ message: "Lỗi khi lấy thông tin hồ sơ", error });
    }
  }

  // [PUT] /users
  async update(req, res) {
    try {
      const userId = req.user.userId; // id lấy từ token đã xác thực

      const { fullname, bio } = req.body;

      if(!fullname) return res.status(400).json({ message: "Họ tên là bắt buộc" });
      
      // Thực hiện upload avatar nếu có file
      if (req.file) {
        let avatar_url = req.file.path.replace(/\\/g, '/');
        await User.update(
          { fullname, avatar_url, bio },
          { where: { user_id: userId } }
        );
      }else{
        await User.update(
          { fullname, bio },
          { where: { user_id: userId } }
        );
      }
    
      const updatedUser = await User.findOne(
        { 
          where: { user_id: userId },
          attributes: ['user_id', 'username', 'email', 'fullname', 'avatar_url', 'bio', 'role', 'createdAt'] 
        }
      );

      if (!updatedUser) {
        return res.status(404).json({ message: "Không tìm thấy người dùng" });
      }

      res.status(200).json({ message: "Cập nhật thông tin thành công", user: updatedUser });
    } catch (error) {
      res.status(500).json({ message: "Lỗi khi cập nhật thông tin", error });
    }
  }

  // [PATCH] /users/:id/block
  async block(req, res) {
    try {
      const { id } = req.params;
      const user = await User.findByPk(id);

      if (!user) {
        return res.status(404).json({ message: "Không tìm thấy người dùng" });
      }

      if (user.role === 'admin') {
        return res.status(403).json({ message: "Không thể khóa quản trị viên" });
      }

      await User.update(
        { role: 'blocked' },
        { where: { user_id: id } }
      );

      res.status(200).json({ message: "Người dùng đã bị khóa" });
    } catch (error) {
      res.status(500).json({ message: "Lỗi khi khóa người dùng", error });
    }
  }
}

module.exports = new UserController();