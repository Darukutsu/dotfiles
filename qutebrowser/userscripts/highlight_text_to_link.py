#!/usr/bin/env python3

import os
import urllib.parse
try:
    import pyperclip
except ImportError:
    try:
        import pyclip as pyperclip
    except ImportError:
        PYPERCLIP = False
    else:
        PYPERCLIP = True
else:
    PYPERCLIP = True

def send_command_to_qute(command):
    with open(os.environ.get("QUTE_FIFO"), "w") as f:
        f.write(command)

def encode_to_url(string):
    lowercase_string = string.lower()
    encoded_string = urllib.parse.quote(lowercase_string)
    return encoded_string

def main():
    current_web_page_url = os.environ.get("QUTE_CURRENT_URL")
    if current_web_page_url is None:
        current_web_page_url = os.environ.get("QUTE_URL")
    selected_text = os.environ.get("QUTE_SELECTED_TEXT")
    encoded_url = encode_to_url(selected_text)
    if current_web_page_url is not None:
        highlight_web_page_url = current_web_page_url + "#:~:text=" + encoded_url
    else:
        highlight_web_page_url = encoded_url

    if PYPERCLIP:
        pyperclip.copy(highlight_web_page_url)
        send_command_to_qute("message-info 'Highlighted text to link created.'")
    else:
        # Qute's yank command  won't copy accross multiple lines so we
        # compromise by placing lines on a single line seperated by the
        # specified delimiter
        send_command_to_qute("yank inline '{code}'\n".format(code=highlight_web_page_url))
        #send_command_to_qute("message-info 'Highlighted text to link created.'")


if __name__ == "__main__":
    main()
