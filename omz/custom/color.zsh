#!/bin/zsh

# Function for color script
colors() {
    local term_cols="${1:-$(tput cols || echo 80)}"
    awk -v term_cols="$term_cols" 'BEGIN{
        s="/\\";
        for (colnum = 0; colnum<term_cols; colnum++) {
            r = 255-(colnum*255/term_cols);
            g = (colnum*510/term_cols);
            b = (colnum*255/term_cols);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum%2+1,1);
        }
        printf "\n";
    }'
}
