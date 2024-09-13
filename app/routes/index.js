const userRoute = require("./user.routes.js");
const authRoute = require("./auth.routes.js");
const categoryRoute = require("./category.routes.js");
const articleRoute = require("./article.routes.js");
const commentRoute = require("./comment.routes.js");

function route(app){
    app.use("/articles", articleRoute);
    app.use("/comments", commentRoute);
    app.use("/categories", categoryRoute);
    app.use("/users", userRoute);
    app.use("/auth", authRoute);
}

module.exports = route