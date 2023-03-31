pub fn find(array: &[i32], key: i32) -> Option<usize> {
    let len = array.len();
    if len == 0 {
        return None;
    }
    let mut ilo = 0;
    let mut ihi = len - 1;
    let mut imid: usize;
    while ilo <= ihi {
        imid = (ihi + ilo) / 2;
        let current_val = array[imid];
        if current_val < key {
            // We aren't going to overflow because of the main loop
            // condition...
            ilo = imid + 1;
        } else if current_val > key {
            // ...but we might underflow.
            if imid == 0 {
                return None;
            }
            ihi = imid - 1;
        } else {
            return Some(imid);
        }
    }
    None
}
