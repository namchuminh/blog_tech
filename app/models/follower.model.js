const { DataTypes } = require("sequelize");
const sequelize = require("../config/db.config.js");

const Follower = sequelize.define("follower", {
    follower_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    follower_user_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    followed_user_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
}, {
    tableName: "followers",
    timestamps: true
});

module.exports = Follower;
