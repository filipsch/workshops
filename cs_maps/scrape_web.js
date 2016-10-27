
// scrape_techstars.js

var webPage = require('webpage');
var page = webPage.create();

var fs = require('fs');
var path = 'germancities.html'

page.open('http://www.citymayors.com/gratis/german_topcities.html', function (status) {
  var content = page.content;
  fs.write(path,content,'w')
  phantom.exit();
});

