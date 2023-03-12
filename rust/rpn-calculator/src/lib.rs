#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

fn stack_is_valid_for_op(stack: &Vec<i32>) -> bool {
    stack.len() >= 2
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    let mut stack: Vec<i32> = vec![];
    for input in inputs {
        match input {
            CalculatorInput::Add => {
                if !stack_is_valid_for_op(&stack) {
                    return None;
                }
                let b = stack.pop().unwrap();
                let a = stack.pop().unwrap();
                stack.push(a + b);
            }
            CalculatorInput::Subtract => {
                if !stack_is_valid_for_op(&stack) {
                    return None;
                }
                let b = stack.pop().unwrap();
                let a = stack.pop().unwrap();
                stack.push(a - b);
            }
            CalculatorInput::Multiply => {
                if !stack_is_valid_for_op(&stack) {
                    return None;
                }
                let b = stack.pop().unwrap();
                let a = stack.pop().unwrap();
                stack.push(a * b);
            }
            CalculatorInput::Divide => {
                if !stack_is_valid_for_op(&stack) {
                    return None;
                }
                let b = stack.pop().unwrap();
                let a = stack.pop().unwrap();
                stack.push(a / b);
            }
            CalculatorInput::Value(v) => stack.push(*v),
        }
    }
    if stack.len() != 1 {
        None
    } else {
        stack.pop()
    }
}
