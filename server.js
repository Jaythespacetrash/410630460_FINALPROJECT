const express = require('express');
const app = express();
const path = require('path');
const enrollRoutes = require('./routes/enroll');

app.use(express.json());
app.use(express.static(__dirname));
app.use('/api/enroll', enrollRoutes);

app.listen(3000, () => console.log('伺服器已啟動 http://localhost:3000'));