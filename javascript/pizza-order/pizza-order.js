/// <reference path="./global.d.ts" />
//
// @ts-check

function pizzaPriceOfExtrasAcc(totalExtrasCost, extras) {
  if (extras.length == 0) {
    return totalExtrasCost;
  } else {
    const [currentExtra, ...remainingExtras] = extras;
    let extraCost = 0;
    switch (currentExtra) {
    case 'ExtraSauce':
      extraCost = 1;
      break;
    case 'ExtraToppings':
      extraCost = 2;
      break;
    }
    return pizzaPriceOfExtrasAcc(totalExtrasCost + extraCost, remainingExtras);
  }
}

function pizzaPriceOfExtras(extras) {
  return pizzaPriceOfExtrasAcc(0, extras);
  // let cost = 0;
  // for (const currentExtra of extras) {
  //   switch (currentExtra) {
  //   case 'ExtraSauce':
  //     cost += 1;
  //     break;
  //   case 'ExtraToppings':
  //     cost += 2;
  //     break;
  //   }    
  // }
  // return cost;
}

/**
 * Determine the prize of the pizza given the pizza and optional extras
 *
 * @param {Pizza} pizza name of the pizza to be made
 * @param {Extra[]} extras list of extras
 *
 * @returns {number} the price of the pizza
 */
export function pizzaPrice(pizza, ...extras) {
  let basePrice = 0;
    switch (pizza) {
    case 'Margherita':
      basePrice = 7;
      break;
    case 'Caprese':
      basePrice = 9;
      break;
    case 'Formaggio':
      basePrice = 10;
      break;
    }
  return basePrice + pizzaPriceOfExtras(extras);
}

/**
 * @param {number} totalCost
 * @param {PizzaOrder[]} pizzaOrders
 *
 * @returns {number} the price of the pizza
 */
function orderPriceAcc(totalCost, ...pizzaOrders) {
  if (pizzaOrders.length == 0) {
    return totalCost;
  } else {
    const [order, ...remainingOrders] = pizzaOrders;
    return orderPriceAcc(
      totalCost + pizzaPrice(order.pizza, ...order.extras),
      ...remainingOrders
    );
  }
}

/**
 * Calculate the prize of the total order, given individual orders
 *
 * @param {PizzaOrder[]} pizzaOrders a list of pizza orders
 * @returns {number} the price of the total order
 */
export function orderPrice(pizzaOrders) {
  // return orderPriceAcc(0, ...pizzaOrders);
  let totalCost = 0;
  for (const order of pizzaOrders) {
    totalCost += pizzaPrice(order.pizza, ...order.extras);
  }
  return totalCost;
}
