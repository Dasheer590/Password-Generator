#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 [-l length] [-n number] [-s] [-f filename] [-p passphrase] [-h]"
    echo
    echo "   -l length     Specify the length of the passwords (between 8 and 64 characters)"
    echo "   -n number     Specify the number of passwords to generate (default is 3)"
    echo "   -s            Save the passwords to a file"
    echo "   -f filename   Specify the filename for saving passwords (default is 'passwords.txt.cpt')"
    echo "   -p passphrase Specify the passphrase for encryption"
    echo "   -h            Display this help message"
    echo
    exit 1
}

# Default values
PASS_LENGTH=12
NUM_PASSWORDS=3
SAVE_TO_FILE=false
FILENAME="passwords.txt.cpt"
PASSPHRASE=""

# Parse command-line options
while getopts "l:n:sf:p:h" opt; do
    case ${opt} in
        l)
            PASS_LENGTH=${OPTARG}
            ;;
        n)
            NUM_PASSWORDS=${OPTARG}
            ;;
        s)
            SAVE_TO_FILE=true
            ;;
        f)
            FILENAME=${OPTARG}
            ;;
        p)
            PASSPHRASE=${OPTARG}
            ;;
        h)
            display_help
            ;;
        *)
            display_help
            ;;
    esac
done

# Validate PASS_LENGTH
if ! [[ $PASS_LENGTH =~ ^[0-9]+$ ]] || [ "$PASS_LENGTH" -lt 8 ] || [ "$PASS_LENGTH" -gt 64 ]; then
    echo "Error: Please enter a valid number for password length between 8 and 64."
    exit 1
fi

# Validate NUM_PASSWORDS
if ! [[ $NUM_PASSWORDS =~ ^[0-9]+$ ]] || [ "$NUM_PASSWORDS" -lt 1 ]; then
    echo "Error: Please enter a valid number for the number of passwords (must be at least 1)."
    exit 1
fi

# Function to check for required commands
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "Error: $1 is not installed. Please install it and try again."
        exit 1
    fi
}

# Check for required commands
check_command openssl
check_command ccrypt

# Generating passwords
passwords=()
for p in $(seq 1 $NUM_PASSWORDS); do
    passwords+=("$(openssl rand -base64 48 | cut -c1-$PASS_LENGTH)")
done

# Display generated passwords
echo "Here are the generated passwords:"
printf "%s\n" "${passwords[@]}"

# Save to file if specified
if [ "$SAVE_TO_FILE" = true ]; then
    if [ -z "$PASSPHRASE" ]; then
        echo "Enter a passphrase for encrypting the passwords:"
        read -s PASSPHRASE
    fi
    for password in "${passwords[@]}"; do
        echo "$password" | ccrypt -e -K "$PASSPHRASE" >> "$FILENAME"
    done
    echo "Passwords saved securely to $FILENAME"
else
    echo "Passwords not saved."
fi

