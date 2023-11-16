// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Calculates the total bird count.
 *
 * @param {number[]} birdsPerDay
 * @returns {number} total bird count
 */
export function totalBirdCount(birdsPerDay) {
  return birdsPerDay.reduce((acc, current) => acc + current, 0);
}

/**
 * Calculates the total number of birds seen in a specific week.
 *
 * @param {number[]} birdsPerDay
 * @param {number} week
 * @returns {number} birds counted in the given week
 */
export function birdsInWeek(birdsPerDay, week) {
  const nDaysPerWeek = 7;
  const start = nDaysPerWeek * (week - 1);
  const stop = nDaysPerWeek * week;
  return totalBirdCount(birdsPerDay.slice(start, stop));
}

/**
 * Fixes the counting mistake by increasing the bird count
 * by one for every second day.
 *
 * @param {number[]} birdsPerDay
 * @returns {number[]} corrected bird count data
 */
export function fixBirdCountLog(birdsPerDay) {
  // can't create a new array :(
  // return birdsPerDay.map((nBirds, day) => day % 2 ? nBirds : nBirds + 1);
  for (let day = 0; day < birdsPerDay.length; day++) {
    if (!(day % 2)) {
      birdsPerDay[day] += 1;
    }
  }
  return birdsPerDay;
}
