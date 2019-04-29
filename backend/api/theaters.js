const router = require('express').Router()
const rp = require('request-promise')
const cheerio = require('cheerio')

module.exports = router

const fandango = 'https://www.fandango.com'

router.get('/:zipcode', async (req, res, next) => {
  try {
    const zipcode = Number(req.params.zipcode);
    const response = await rp(`${fandango}/${zipcode}_movietimes?mode=general&q=${zipcode}`);
    const options = cheerio('.nearby-theaters__select>option',response);
    const theaters = [];
    for(let i = 1; i < 11; i++) {
      let theater = {};
      theater.name = options[i].childNodes[0].data; 
      theater.path = options[i].attribs.value;
      theaters.push(theater);
    }
    res.send(theaters)
  } catch (err) {
    next(err)
  }
})

