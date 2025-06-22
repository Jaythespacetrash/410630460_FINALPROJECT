const express = require('express');
const router = express.Router();
const sequelize = require('../database');
const Enrollment = require('../models/Enrollment');
const Payment = require('../models/Payment');

router.post('/', async (req, res) => {
  const { studentId, classId, term, amount, method } = req.body;

  const t = await sequelize.transaction();
  try {
    const enroll = await Enrollment.create({
      StudentID: studentId,
      ClassID: classId,
      Term: term,
      EnrollDate: new Date()
    }, { transaction: t });

    await Payment.create({
      EnrollID: enroll.EnrollID,
      Amount: amount,
      PayDate: new Date(),
      Method: method
    }, { transaction: t });

    await t.commit();
    res.json({ message: '報名與繳費成功！' });
  } catch (err) {
    await t.rollback();
    res.status(500).json({ message: '交易失敗，已回滾。', error: err.message });
  }
});

module.exports = router;