onload = (event) => {
  let currentPath = document.querySelectorAll('section#map .current-path');
  if (currentPath.length) {
    let offset = +currentPath[0].dataset.offset;
    currentPath[0].style.strokeDashoffset = offset;
  }
}
