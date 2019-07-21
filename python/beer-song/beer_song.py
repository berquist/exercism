def recite(start, take=1):
    current = start
    counter = 0
    messages = []
    line1 = "{current1} {bottles} of beer on the wall, {current2} {bottles} of beer."
    line2 = "{message}, {current} {bottles} of beer on the wall."
    while counter < take:
        step = current - 1
        messages.append("")
        messages.append(
            line1.format(
                current1=current if current != 0 else "No more",
                current2=current if current != 0 else "no more",
                bottles="bottle" if current == 1 else "bottles",
            )
        )
        messages.append(
            line2.format(
                message="Take one down and pass it around"
                if current > 1
                else "Take it down and pass it around"
                if current > 0
                else "Go to the store and buy some more",
                current=step if current > 1 else "no more" if current == 1 else 99,
                bottles="bottles" if current != 2 else "bottle",
            )
        )
        counter += 1
        current -= 1
    # Remove the initial newline
    return messages[1:]
