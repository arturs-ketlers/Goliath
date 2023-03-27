onload = (event) => {
  let wrapper = document.querySelector('section#map .path-wrapper');

  if (wrapper) {
    let path = wrapper.querySelector('section#map .path'),
        pathParent = path.closest('g');

    // Target path
    // let targetPath = path.cloneNode();
    // pathParent.appendChild(targetPath);
    // targetPath.classList.add('path--target');

    // Current path
    let currentOffsetKoef = +wrapper.dataset.currentOffset,
        currentPath = drawPath(pathParent, path, 'current');

    // 60 fps;
    currentPath.step = 0;
    currentPath.max_steps = (15000 / 60);

    let max = currentPath.getTotalLength(),
        target = max * currentOffsetKoef;
    currentPath.style.strokeDasharray = max;

    currentPath.interval = setInterval(function(){
      move(currentPath, target, max);
    }, 1000 / 60);
  }
}

drawPath = (parent, path, name) => {
  let currentPath = path.cloneNode(),
      mapWrapper = document.querySelector('section#map .map');

  parent.appendChild(currentPath);
  currentPath.classList.add(`path--${name}`);

  // currentPath.marker = document.createElement('span');
  // currentPath.marker.classList.add('map__pin', 'map__pin--current');
  // mapWrapper.appendChild(currentPath.marker);

  return currentPath;
}

easeInOutSine = (x) => {
  return -(Math.cos(Math.PI * x) - 1) / 2;
};

move = (path, target, max) => {
  // duration 5s, 60 fps
  let easeProgress = easeInOutSine(path.step / path.max_steps);

  if (++path.step >= path.max_steps) {
    clearInterval(path.interval);
    path.style.strokeDashoffset = target;
  }

  let offset = max - (easeProgress * target);
  path.style.strokeDashoffset = offset;


  // console.log(target, ' | ', max, ' | ', offset);

  // TODO: CHECK:
  // https://stackoverflow.com/questions/22633718/get-points-y-coordinate-on-svg-path

  // Move marker
  // let mapWrapper = document.querySelector('section#map .path-wrapper'),
  //     baseVal = mapWrapper.viewBox.baseVal;
  //
  // cords = path.getPointAtLength(offset);
  // x = cords['x'];
  // y = cords['y'];
  // // console.log(mapWrapper.viewBox.baseVal);
  //
  // r = x / baseVal.width * 100 + '%';
  // t = y / baseVal.height * 100 + '%';
  //
  // path.marker.style.right = r
  // path.marker.style.top = t

  // console.info(`${path.step}:`, `x: ${x}, y: ${y}`);
};
