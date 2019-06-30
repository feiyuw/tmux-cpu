#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_cpu_percentage() {
	iostat -c 2 disk0 | sed '/^\s*$/d' | tail -n 1 | awk '{usage=100-$6} END {printf("%3.1f%%", usage)}' | sed 's/,/./'
}

main() {
	print_cpu_percentage
}
main
