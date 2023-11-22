const layers = [
  'noodles',
  'sauce',
  'noodles',
];
let noodles = 0;
let sauce = 0;
for (const layer in layers) {
  // switch (layer) {
  // case 'noodles': {
  //   noodles += 50;
  //   break;
  // }
  // case 'sauce': {
  //   sauce += 0.2;
  //   break;
  // }
  // default:
  //   break;
  // }
  console.log(layer);
  if (layer == 'noodles') {
    noodles += 50;
  } else if (layer == 'sauce') {
    sauce += 0.2;
  }
}

console.log({'noodles': noodles, 'sauce': sauce});
