/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */


/**
 * Determines the cooking status of a lasagna.
 *
 * @param {number | undefined} timer
 * @returns {string} lasagna status
 */
export function cookingStatus(timer) {
  if (timer === undefined) {
    return 'You forgot to set the timer.';
  } else if (timer > 0) {
    return 'Not done, please wait.';
  } else {
    return 'Lasagna is done.';
  }
}


/**
 * Determines the cooking status of a lasagna.
 *
 * @param {string[]} layers
 * @param {number} avgTimePerLayer
 * @returns {number} total time
 */
export function preparationTime(layers, avgTimePerLayer = 2) {
  return layers.length * avgTimePerLayer;
}


/**
 * Determines the amount of noodles and sauce required.
 *
 * @param {string[]} layers
 * @returns {Record<string, number>} required noodles and sauce
 */
export function quantities(layers) {
  let noodles = 0;
  let sauce = 0;
  for (const layer of layers) {
    switch (layer) {
    case 'noodles': {
      noodles += 50;
      continue;
    }
    case 'sauce': {
      sauce += 0.2;
      continue;
    }
    default:
      continue;
    }
  }
  return {'noodles': noodles, 'sauce': sauce};
}

/**
 *
 *
 * @param {string[]} friendIngredients
 * @param {string[]} myIngredients
 * @returns {undefined} nothing
 */
export function addSecretIngredient(friendIngredients, myIngredients) {
  myIngredients.push(friendIngredients[friendIngredients.length - 1]);
}


/**
 *
 *
 * @param {Record<string, number>} recipe
 * @param {number} numPortions
 * @returns {Record<string, number>} scaled recipe
 */
export function scaleRecipe(recipe, numPortions) {
  let scaledRecipe = {};
  for (const ingredient of Object.keys(recipe)) {
    scaledRecipe[ingredient] = (recipe[ingredient] / 2) * numPortions;
  }
  return scaledRecipe;
}
