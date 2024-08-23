# Emoji Search Bash (EMS)

![Demo Animation](demo.gif)

This is a small script I decided to make because I needed some emojis (also because I spend most of my time in the terminal).

## Installation

```bash
bash <(curl -s -L https://github.com/silgon/ems/raw/main/starter.sh)
```

The dependencies are `jq` and `xclip`. The script will try to install them if possible.

## Notes
For the more experienced users, I recommend to copy the `ems` file into one of your `bin` folders. The script is extremely simple.

This is inspired on [wofi-emoji](https://github.com/Zeioth/wofi-emoji). Actually, it was me trying to use it and I realized i needed wayland (which I do not want). I read the code and I created this small repository.
