const { DataTypes } = require('sequelize');
const sequelize = require('../database');

const Payment = sequelize.define('Payment', {
  PaymentID: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
  EnrollID: DataTypes.INTEGER,
  Amount: DataTypes.DECIMAL(8,2),
  PayDate: DataTypes.DATE,
  Method: DataTypes.STRING,
}, {
  tableName: 'Payment',
  timestamps: false
});

module.exports = Payment;