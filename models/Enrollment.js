const { DataTypes } = require('sequelize');
const sequelize = require('../database');

const Enrollment = sequelize.define('Enrollment', {
  EnrollID: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
  StudentID: DataTypes.STRING,
  ClassID: DataTypes.STRING,
  Term: DataTypes.STRING,
  EnrollDate: DataTypes.DATE,
}, {
  tableName: 'Enrollment',
  timestamps: false
});

module.exports = Enrollment;