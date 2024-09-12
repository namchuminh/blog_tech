const userRoute = require("./user.routes.js");
const authRoute = require("./auth.routes.js");
const categoryRoute = require("./category.routes.js");

function route(app){
    app.use("/categories", categoryRoute);
    app.use("/users", userRoute);
    app.use("/auth", authRoute);
}

module.exports = route