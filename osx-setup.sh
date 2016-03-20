#!/usr/bin/env bash

########
# fncs #
########

display_help() {
    echo
    echo "Setup a new OSX machine"
    echo
    echo "Usage: ${0} [option...]"
    echo
    echo "  --help          display help"
    echo "  --install-apps  install applications"
    echo "  --install-exts  install extensions"
    echo "  --config-apps   configure applications"
    echo "  --config-host   configure host"
    echo
}

display_error() {
    echo 
    echo "Invalid argument"
    echo "----------------"
}

display_require_arg() {
    echo
    echo "An argument is required"
    echo "-----------------------"
}

########
# args #
########

# must provide at least one argument
if [[ $# -eq 0 ]]; then
    display_require_arg
    display_help
    exit 0
fi

# Use > 1 to consume two arguments per pass in the loop
#   each argument has a corresponding value to go with it
# Use > 0 to consume one or more arguments per pass in the loop
#   some arguments don't have a corresponding value to go with it

while [[ $# > 0 ]]; do
    key="$1"

    case $key in
        --help)
            display_help
            exit 0
            ;;
        --install-apps)
            source ./settings.sh
            source ./install-apps.sh
            ;;
        --install-exts)
            source ./settings.sh
            source ./install-exts.sh
            ;;
        --config-apps)
            source ./settings.sh
            source ./config-apps.sh
            ;;
        --config-host)
            source ./settings.sh
            source ./config-host.sh
            ;;
        *)
            display_error
            display_help
            exit 0
            ;;
    esac

    shift

done
