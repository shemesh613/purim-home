const puppeteer = require('puppeteer');
const path = require('path');
(async()=>{
  const b = await puppeteer.launch({headless:'new',args:['--no-sandbox']});
  const p = await b.newPage();
  await p.setCacheEnabled(false);
  await p.setViewport({width:1280,height:900});
  await p.goto('https://shemesh613.github.io/purim-home/?v='+Date.now(), {waitUntil:'networkidle2',timeout:30000});
  await new Promise(r=>setTimeout(r,3000));
  await p.evaluate(()=>{
    const els = document.querySelectorAll('.zone-title');
    for(const el of els) {
      if(el.textContent.includes('ערכים')) { el.scrollIntoView({behavior:'instant',block:'start'}); break; }
    }
  });
  await new Promise(r=>setTimeout(r,1000));
  await p.screenshot({path: path.join(__dirname, 'ss_integrated.png')});
  console.log('Screenshot saved');
  const found = await p.evaluate(()=>!!document.querySelector('a[href*="impressive-3d-world"]'));
  console.log('3D game card found:', found);
  await b.close();
})();
