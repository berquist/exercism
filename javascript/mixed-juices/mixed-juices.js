// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  var time;
  switch (name) {
  case 'Pure Strawberry Joy':
    time = 0.5;
    break;
  case 'Energizer':
    time = 1.5;
    break;
  case 'Green Garden':
    time = 1.5;
    break;
  case 'Tropical Island':
    time = 3.0;
    break;
  case 'All or Nothing':
    time = 5.0;
    break;
  default:
    time = 2.5;
    break;
  }
  return time;
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  const nWedgesPer = limes.map((size) => {
    switch (size) {
    case 'small':
      return 6;
    case 'medium':
      return 8;
    case 'large':
      return 10;
    default:
      throw new Error('invalid lime size');
    }
  });
  var nToCut = 0;
  var nCurrentWedges = 0;
  for (let limeidx = 0; limeidx < nWedgesPer.length; limeidx++) {
    if (nCurrentWedges >= wedgesNeeded) {
      break;
    }
    nCurrentWedges += nWedgesPer[limeidx];
    nToCut += 1;
  }
  return nToCut;
}

/**
 *
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {number}
 */
export function remainingOrdersIndex(timeLeft, orders) {
  if (timeLeft == 0) {
    return -1;
  }
  var timeUsed = 0;
  var drinkidx = 0;
  while ((timeUsed < timeLeft) && (drinkidx < orders.length)) {
    timeUsed += timeToMixJuice(orders[drinkidx]);
    drinkidx += 1;
  }
  return drinkidx
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  return orders.slice(remainingOrdersIndex(timeLeft, orders), orders.length);
}
