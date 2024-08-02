# Password Generator

This repository contains a Bash script for generating and optionally saving encrypted passwords. It offers flexibility in password length, quantity, and file saving options, with built-in validation and encryption.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [Command-Line Options](#command-line-options)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The password generator script allows users to generate multiple passwords of specified lengths, optionally save them to a file, and encrypt them using a passphrase. The script uses `openssl` for password generation and `ccrypt` for encryption.

## Features

- Generate passwords of customizable length and quantity.
- Encrypt passwords using a passphrase.
- Save passwords to a file with optional encryption.
- Command-line options for flexible usage, to automate the generation and saving of passwords without user interaction, useful for scripting purposes.
- Input validation for passwords and required commands.

## Technologies Used

- **Bash**: Scripting language used to write the script.
- **OpenSSL**: For generating random passwords.
- **ccrypt**: For encrypting passwords.

## Setup and Installation

To set up this project locally, follow these steps:

1. **Clone the repository:**

    ```sh
    git clone https://github.com/your-username/password-generator.git
    cd password-generator
    ```

2. **Ensure required tools are installed:**

    - Install `openssl` and `ccrypt` on your system. For example, on Debian-based systems, you can install them with:

      ```sh
      sudo apt-get install openssl ccrypt
      ```

3. **Make the script executable:**

    ```sh
    chmod +x password_generator.sh
    ```

## Usage

To use the password generator script, follow these instructions:

### Basic Command

```sh
./password_generator.sh
This will run the script with default settings.

## Command-Line Options

**-l length**  
Specify the length of the passwords (between 8 and 64 characters).  
*Example:* `-l 16`

**-n number**  
Specify the number of passwords to generate.  
*Example:* `-n 5`

**-s**  
Save the generated passwords to a file.  
The script will prompt for a filename and passphrase if this option is used.

**-f filename**  
Specify the filename for saving passwords (used with `-s`).  
*Example:* `-f my_passwords.txt`

**-p passphrase**  
Specify the passphrase for encryption (used with `-s`).  
*Example:* `-p "securepassphrase"`

**-h**  
Display the help message.

# Examples

**Generate 5 passwords of length 16 and save to a file with encryption:**

```sh
./password_generator.sh -l 16 -n 5 -s -f my_passwords.txt -p "securepassphrase"

**Generate 3 passwords of length 12 without saving to a file:**

```sh
./password_generator.sh -l 12 -n 3

**Generate 10 passwords of length 20 and save to a file:**

```sh
./password_generator.sh -l 20 -n 10 -s -f passwords.txt

# Contributing

If you would like to contribute to this project, please follow these guidelines:

1. **Fork the repository.**
2. **Create a new branch for your changes.**
3. **Submit a pull request with a clear description of your changes.**

Feel free to reach out with any questions or suggestions!

# License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT). See the [LICENSE](LICENSE) file for details.

