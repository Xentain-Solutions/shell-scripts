#!/bin/bash

# Function to display welcome message
welcome() {
    echo "
    
__   __          _        _           _____       _       _   _                 
\ \ / /         | |      (_)         / ____|     | |     | | (_)                
 \ V / ___ _ __ | |_ __ _ _ _ __    | (___   ___ | |_   _| |_ _  ___  _ __  ___ 
  > < / _ \ '_ \| __/ _` | | '_ \    \___ \ / _ \| | | | | __| |/ _ \| '_ \/ __|
 / . \  __/ | | | || (_| | | | | |  |____) | (_) | | |_| | |_| | (_) | | | \__ \
/_/ \_\___|_| |_|\__\__,_|_|_| |_|  |_____/ \___/|_|\__,_|\__|_|\___/|_| |_|___/

    "
    echo "Welcome to my script. This script installs and uninstalls my SSH key(s)."
    echo "You should only run this script when you need to give me access to your server."
    echo "As soon as I am finished working on your server, you should uninstall the key(s)."
    echo "THIS SCRIPT AFFECTS ONLY THE LOGGED-IN USER."
}

# Function to display options
options() {
    echo "Please select from one of the following options:"
    echo "1| Install all keys"
    echo "2| Remove all keys"
    read -r option
}

# Function to install all keys
install_keys() {
    cd || exit 1
    mkdir -p ~/.ssh

    if ! grep -q "Mythical Kitten Primary" ~/.ssh/authorized_keys; then
        echo "# Mythical Kitten Primary" >> ~/.ssh/authorized_keys
        echo "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIID43YH1tfu6AZfddca0ZwI4WT7Vt6zQkfIgb/NJAMJ/AAAAC3NzaDp0ZXJtaXVz Mythical Kitten Primary" >> ~/.ssh/authorized_keys
    fi

    if ! grep -q "# Neon Primary" ~/.ssh/authorized_keys; then
        echo "# Neon Primary" >> ~/.ssh/authorized_keys
        echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCBPMmBWhJMJWlJqnEObPdjbYWgFYZDNtsGFVisqOoDgIaMz/Dq2oimPytdiH69i5AwLlbvaRi6iKJK5+DmOmxZ2f9LNp949sv/7RKPbg6LxkzN5gLtC9mXxr9+oCGYuF71vVkRFhJqoOjqPJrnY0OWFE/dZ/LSFamwdxE1fZmsf6vdR4Bpx1EXg/LFGrVvtTxe7Zi9yXDDNYC2k+M2HTlbu7HNlWEjHHnNZBC1qSZwjjaRJ7r71B9pPuuF4BEvBPRF1YOAXuRTPPS9M4wnvouO5CQ3bOz6JCqbG8oypV5z1wDOFAy1RgPND63inPycYbkvoM0J+Pw5vTVyIOzsZbeh Neon Primary" >> ~/.ssh/authorized_keys
    fi

    if ! grep -q "# Plactrix Primary" ~/.ssh/authorized_keys; then
        echo "# Plactrix Primary" >> ~/.ssh/authorized_keys
        echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDb2OrJyyIIzXQNJamg9Xp1/t4qusN+BO6EdNpu/8CcakTrcDXWzKnNriaJTX1sBO3+xM8akSKkcTYoryZPVfNk6C2PXfO5DqDCgD09yYbcuY5PeR+h1j5PzYq45sLhnUh598JjzmOec+a1yUEVc7MirwPh0TeQgzFWzW4pXNFFhzkG1m2cmyhsTI/n6/rJGZEUO3b6fb5lC0uZgZcUg+VJq4Bfj67XlNhHVpl+loGVaO0eqAR8p5NAAvb2gSzNlJ95X7UVN9gKmByYgjkfet/DNWYo3iNnEfV3Ndlft4iuomDG/mooK+sakxBPJUhy/S7QFj1yXKEdA97M9vVrJiQaQMjNERC8zrhtlfruyHb/TFg6fehazdFLoo/CaSvn9J0v2UGbiNSi3Jq+d9Zz4hVLA4azUiRFxzig/mbwmplo3yETdY6QaBCWLnV1kk++YwZmHmTJ/UBTGz6UXVafBr+5dB6LLMKcEg/z1JFrTCHRbm23PP4ej53e1jImZv8YZZM= Plactrix Primary" >> ~/.ssh/authorized_keys
    fi

    if ! grep -q "# Nicklas Primary" ~/.ssh/authorized_keys; then
        echo "# Nicklas Primary" >> ~/.ssh/authorized_keys
        echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAyoOvVcC7ydh/69F+JsSwyMoiaLZL6dL1vFfLVACFGF Nicklas Primary" >> ~/.ssh/authorized_keys
    fi

    if ! grep -q "# Sam Primary" ~/.ssh/authorized_keys; then
        echo "# Sam Primary" >> ~/.ssh/authorized_keys
        echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgtYYh8eSSi9/g1jLFE7TVm/Q9yfXGIXmV49AZrgqX7Pesi8Jix86pmxNV8edpArfXmUQEYM3eTQAeIz6/P7Z5XW+17d/SsM+Ksx0Ix6Svk6xVw/hYpGDp3X0caJ2U6drS9msiSSG9RdmoX5p9j8MrlSmLdQLXD93V1nkIaoZbAN0BdSHe9i3erh3qcj0N7k3OfI6fv5VaETV6GXMqSUIDhU7CZChyFcQVOfUsADWfsKNTaG5j/l5oHI7wyAwG0AuPtMyX/twrogIAx8iJi6uPeGVCsJCGWc8+/OX/P4c4j1uSHJBR7IljWwOtkV4ylNTGhtX0Db21mIoiwePYPIkA9MtUH3A2acAjw+BmYlej9bc4zxzA8OMB8kEeU3AcmL+5Zd/Z+gBUoB6Vc+tLxriPds6pqTaJEWhkyUSrNiimUEdgvMwFqo+e1r5R3x8R8pykbD2Yswc0QvzMV/FnkAjsYcFrG/VcRbAPoZMNdKUR/H+pu1TZx+7gcSUXdNm4Z68= Sam Primary" >> ~/.ssh/authorized_keys
    fi

    if ! grep -q "# Tim USHIO Primary" ~/.ssh/authorized_keys; then
        echo "# Tim USHIO Primary" >> ~/.ssh/authorized_keys
        echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIxnZW29GD/jV504UfJils55ptODSJW2Tda8XzbfqJP/ Tim USHIO Primary" >> ~/.ssh/authorized_keys
    fi
    
    # Add other SSH keys in a similar manner as above

    echo "All keys installed successfully."
}

# Function to remove all keys
remove_keys() {
    cd || exit 1
    mkdir -p ~/.ssh

    if grep -q "# Mythical Kitten" ~/.ssh/authorized_keys; then
        sed -i '/Mythical Kitten/d' ~/.ssh/authorized_keys
    fi

    if grep -q "# Neon" ~/.ssh/authorized_keys; then
        sed -i '/Neon/d' ~/.ssh/authorized_keys
    fi

    if grep -q "# Plactrix" ~/.ssh/authorized_keys; then
        sed -i '/Plactrix/d' ~/.ssh/authorized_keys
    fi

    if grep -q "# Nicklas" ~/.ssh/authorized_keys; then
        sed -i '/Nicklas/d' ~/.ssh/authorized_keys
    fi

    if grep -q "# Sam" ~/.ssh/authorized_keys; then
        sed -i '/Sam/d' ~/.ssh/authorized_keys
    fi

    if grep -q "# Tim USHIO" ~/.ssh/authorized_keys; then
        sed -i '/Tim USHIO/d' ~/.ssh/authorized_keys
    fi
    
    echo "Keys removed successfully."
}

# Script starts here
welcome
options

case $option in
  1) install_keys ;;
  2) remove_keys ;;
  *) echo "Invalid choice. Please run the script again and choose either 1 or 2." ;;
esac
