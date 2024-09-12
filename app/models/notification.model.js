const { DataTypes } = require("sequelize");
const sequelize = require("../config/db.config.js");

const Notification = sequelize.define("notification", {
    notification_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    user_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    type: {
        type: DataTypes.ENUM("comment", "like", "follow"),
        allowNull: false
    },
    related_user_id: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    article_id: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    comment_id: {
        type: DataTypes.INTEGER,
        allowNull: true
    }
}, {
    tableName: "notifications",
    timestamps: true
});

module.exports = Notification;
