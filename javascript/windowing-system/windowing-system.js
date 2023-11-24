// @ts-check

export class Size {
/**
 * @param {number} width
 * @param {number} height
 */
  constructor(width = 80, height = 60) {
    this.width = width;
    this.height = height;
  }

/**
 * @param {number} newWidth
 * @param {number} newHeight
 *
 * @returns {void}
 */
  resize(newWidth, newHeight) {
    this.width = newWidth;
    this.height = newHeight;
  }
}

export class Position {
/**
 * @param {number} x
 * @param {number} y
 */
  constructor(x = 0, y = 0) {
    this.x = x;
    this.y = y;
  }

/**
 * @param {number} newX
 * @param {number} newY
 *
 * @returns {void}
 */
  move(newX, newY) {
    this.x = newX;
    this.y = newY;
  }
}

export class ProgramWindow {
  constructor() {
    this.screenSize = new Size(800, 600);
    this.size = new Size();
    this.position = new Position();
  }

/**
 * @param {Size} newSize
 *
 * @returns {void}
 */
  resize(newSize) {
    let newWidth = Math.max(newSize.width, 1);
    if ((newWidth + this.position.x) > this.screenSize.width) {
      newWidth = this.screenSize.width - this.position.x;
    }
    let newHeight = Math.max(newSize.height, 1);
    if ((newHeight + this.position.y) > this.screenSize.height) {
      newHeight = this.screenSize.height - this.position.y;
    }
    this.size.resize(newWidth, newHeight);
  }

/**
 * @param {Position} newPos
 *
 * @returns {void}
 */
  move(newPos) {
    let newX = Math.min(
      Math.max(newPos.x, 0),
      this.screenSize.width - this.size.width
    );
    let newY = Math.min(
      Math.max(newPos.y, 0),
      this.screenSize.height - this.size.height
    );
    this.position.move(newX, newY);
  }
}

/**
 * @param {ProgramWindow} programWindow
 *
 * @returns {ProgramWindow} updated window
 */
export function changeWindow(programWindow) {
  programWindow.resize(new Size(400, 300));
  programWindow.move(new Position(100, 150));
  return programWindow;
}
