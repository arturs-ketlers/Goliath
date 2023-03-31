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

    if (currentOffsetKoef > 1) currentOffsetKoef = 1;
    let target = currentPath.total_length * currentOffsetKoef;

    currentPath.interval = setInterval(function(){
      move(currentPath, target);
    }, 1000 / 60);
  }
}

drawPath = (parent, path, name) => {
  let currentPath = path.cloneNode(),
      mapWrapper = document.querySelector('section#map .map');

  currentPath.total_length = currentPath.getTotalLength();
  currentPath.style.strokeDasharray = currentPath.total_length;
  currentPath.style.strokeDashoffset = currentPath.total_length;

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

move = (path, target) => {
  // duration 5s, 60 fps
  let easeProgress = easeInOutSine(path.step / path.max_steps);

  if (++path.step >= path.max_steps) {
    clearInterval(path.interval);
    path.style.strokeDashoffset = target;
  }

  let offset = path.total_length - (easeProgress * target);
  path.style.strokeDashoffset = offset;


  // console.log(target, ' | ', path.total_length, ' | ', offset);

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
