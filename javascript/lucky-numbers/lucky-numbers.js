// @ts-check

/**
 * Calculates the sum of the two input arrays.
 *
 * @param {number[]} array1
 * @param {number[]} array2
 * @returns {number} sum of the two arrays
 */
export function twoSum(array1, array2) {
  const convert = (arr) => {return Number(arr.join(''))};
  return convert(array1) + convert(array2);
}

/**
 * Checks whether a number is a palindrome.
 *
 * @param {number} value
 * @returns {boolean} whether the number is a palindrome or not
 */
export function luckyNumber(value) {
  const s = String(value);
  return s == s.split('').reverse().join('');
}

/**
 * Determines the error message that should be shown to the user
 * for the given input value.
 *
 * @param {string|null|undefined} input
 * @returns {string} error message
 */
export function errorMessage(input) {
  if ((input === undefined) || (input === null) || (input.length == 0)) {
    return 'Required field';
  } else {
    const parsed = Number(input);
    if (Number.isNaN(parsed) || (parsed == 0)) {
      return 'Must be a number besides 0';
    } else {
      return '';
    }
  }
}
