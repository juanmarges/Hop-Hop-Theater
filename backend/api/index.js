const router = require('express').Router()
const rp = require('request-promise')
const cheerio = require('cheerio')

module.exports = router

router.use('/users', require('./users'))

const fandango = "https://www.fandango.com"

router.get('/theaters/:zipcode', async (req, res, next) => {
  try {
    const zipcode = Number(req.params.zipcode);
    const response = await rp(`${fandango}/${zipcode}_movietimes?mode=general&q=${zipcode}`);
    const options = cheerio('.nearby-theaters__select>option',response);
    const theaters = [];
    for(let i = 1; i < 11; i++) {
      let theater = {};
      const path = options[i].attribs.value;
      console.log(path);
      theater.name = options[i].childNodes[0].data; 
      theater.path = path.slice(1,path.indexOf("theater-page")-1);
      theaters.push(theater);
    }
    res.send(theaters)
  } catch (err) {
    next(err)
  }
})

router.get('/movies', async (req,res,next) => {
  try {
    const path = "regal-battery-park-AAPOS";
    const now = new Date();
    const dateString = `${now.getFullYear()}/${now.getMonth() + 1}/${now.getDate()}`;
    console.log(`${fandango}/${path}/theater-page?date=${dateString}`);
    const response = await rp(`${fandango}/${path}/theater-page?date=${dateString}`);
    res.send(response);
  } catch(err) {
    next(err)
  }
})


router.use((req, res, next) => {
  const error = new Error('Not Found')
  error.status = 404
  next(error)
})
