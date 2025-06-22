const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('JoyEnglish', 'root', 'rootpass', {
  host: 'localhost',
  dialect: 'mariadb'
});

module.exports = sequelize;