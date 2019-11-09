const path = require('path')
module.exports = {
  chainWebpack: config => {
    if (process.env.VUE_SERVE_DOCS) {
      config.entry('app' ).set(path.resolve(__dirname, './src/main.js'));
    }
  }
}