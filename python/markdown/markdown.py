import re


RE_ITALICS = re.compile('(.*)_(.*)_(.*)')
RE_BOLD = re.compile('(.*)__(.*)__(.*)')


def wrap_tag(m: re.Match, tag: str) -> str:
    return f"{m.group(1)}<{tag}>{m.group(2)}</{tag}>{m.group(3)}"


def wrap_bold_italics(s: str) -> str:
    m = RE_BOLD.match(s)
    if m:
        s = wrap_tag(m, "strong")
    m = RE_ITALICS.match(s)
    if m:
        s = wrap_tag(m, "em")
    return s


def parse(markdown: str) -> str:
    lines = markdown.split('\n')
    res = []
    in_list = False
    in_list_append = False
    for i in lines:
        if re.match('###### (.*)', i) is not None:
            i = f'<h6>{i[7:]}</h6>'
        elif re.match('## (.*)', i) is not None:
            i = f'<h2>{i[3:]}</h2>'
        elif re.match('# (.*)', i) is not None:
            i = f'<h1>{i[2:]}</h1>'
        m = re.match(r'\* (.*)', i)
        if m:
            curr = m.group(1)
            if not in_list:
                in_list = True
                curr = wrap_bold_italics(curr)
                i = f'<ul><li>{curr}</li>'
            else:
                curr = wrap_bold_italics(curr)
                i = f'<li>{curr}</li>'
        else:
            if in_list:
                in_list_append = True
                in_list = False

        m = re.match('<h|<ul|<p|<li', i)
        if not m:
            i = f'<p>{i}</p>'
        i = wrap_bold_italics(i)
        if in_list_append:
            i = f'</ul>{i}'
            in_list_append = False
        res.append(i)
    if in_list:
        res.append('</ul>')
    return "".join(res)
