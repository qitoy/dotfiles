# -*- coding: utf-8 -*-
import re
from xkeysnail.transform import *

define_timeout(1)

define_modmap({
    Key.CAPSLOCK: Key.ESC,
})

define_multipurpose_modmap({
    # SandS
    Key.SPACE: [Key.SPACE, Key.LEFT_SHIFT],
})

define_keymap(None, {
    # use dvorak for JIS
    K("YEN"): K("EQUAL"),
    K("LShift-YEN"): K("LShift-EQUAL"),
    K("EQUAL"): K("MINUS"),
    K("LShift-EQUAL"): K("LShift-MINUS"),
    K("MINUS"): K("KEY_0"),
    K("LShift-MINUS"): K("LShift-KEY_0"),
    K("KEY_0"): K("KEY_9"),
    K("LShift-KEY_0"): K("LShift-KEY_9"),
    K("KEY_9"): K("KEY_8"),
    K("LShift-KEY_9"): K("LShift-KEY_8"),
    K("KEY_8"): K("KEY_7"),
    K("LShift-KEY_8"): K("LShift-KEY_7"),
    K("KEY_7"): K("KEY_6"),
    K("LShift-KEY_7"): K("LShift-KEY_6"),
    K("KEY_6"): K("KEY_5"),
    K("LShift-KEY_6"): K("LShift-KEY_5"),
    K("KEY_5"): K("KEY_4"),
    K("LShift-KEY_5"): K("LShift-KEY_4"),
    K("KEY_4"): K("KEY_3"),
    K("LShift-KEY_4"): K("LShift-KEY_3"),
    K("KEY_3"): K("KEY_2"),
    K("LShift-KEY_3"): K("LShift-KEY_2"),
    K("KEY_2"): K("KEY_1"),
    K("LShift-KEY_2"): K("LShift-KEY_1"),
    K("KEY_1"): K("GRAVE"),
    K("LShift-KEY_1"): K("LShift-GRAVE"),

    # Emacs-like keybind
    K("LC-Y"): K("RIGHT"),
    K("LC-N"): K("LEFT"),
})
