import re


RE_ITALICS = re.compile('(.*)_(.*)_(.*)')
RE_BOLD = re.compile('(.*)__(.*)__(.*)')


def make_em(m1) -> str:
    return m1.group(1) + '<em>' + m1.group(2) + '</em>' + m1.group(3)


def make_strong(m1) -> str:
    return m1.group(1) + '<strong>' + m1.group(2) + '</strong>' + m1.group(3)


def parse(markdown: str) -> str:
    lines = markdown.split('\n')
    res = ''
    in_list = False
    in_list_append = False
    for i in lines:
        if re.match('###### (.*)', i) is not None:
            i = '<h6>' + i[7:] + '</h6>'
        elif re.match('## (.*)', i) is not None:
            i = '<h2>' + i[3:] + '</h2>'
        elif re.match('# (.*)', i) is not None:
            i = '<h1>' + i[2:] + '</h1>'
        m = re.match(r'\* (.*)', i)
        if m:
            if not in_list:
                in_list = True
                is_bold = False
                is_italic = False
                curr = m.group(1)
                m1 = RE_BOLD.match(curr)
                if m1:
                    curr = make_strong(m1)
                    is_bold = True
                m1 = RE_ITALICS.match(curr)
                if m1:
                    curr = make_em(m1)
                    is_italic = True
                i = '<ul><li>' + curr + '</li>'
            else:
                is_bold = False
                is_italic = False
                curr = m.group(1)
                m1 = RE_BOLD.match(curr)
                if m1:
                    is_bold = True
                m1 = RE_ITALICS.match(curr)
                if m1:
                    is_italic = True
                if is_bold:
                    curr = make_strong(m1)
                if is_italic:
                    curr = make_em(m1)
                i = '<li>' + curr + '</li>'
        else:
            if in_list:
                in_list_append = True
                in_list = False

        m = re.match('<h|<ul|<p|<li', i)
        if not m:
            i = '<p>' + i + '</p>'
        m = RE_BOLD.match(i)
        if m:
            i = make_strong(m)
        m = RE_ITALICS.match(i)
        if m:
            i = make_em(m)
        if in_list_append:
            i = '</ul>' + i
            in_list_append = False
        res += i
    if in_list:
        res += '</ul>'
    return res
