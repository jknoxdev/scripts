import subprocess


def login():
    password = input("Enter your Bitwarden password: ")
    p = subprocess.Popen(["bw", "login", "--raw"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True)
    output, _ = p.communicate(input=password)

    bw_session = output.strip()
    if bw_session:
        print("Logged in successfully.")
        print(f"BW_SESSION={bw_session}")
    else:
        print("Login failed.")

def list_items():
    result = subprocess.run(["bw", "list", "items"], capture_output=True, text=True)
    return result.stdout


def create_item():
    name = input("Enter item name: ")
    username = input("Enter username: ")
    password = input("Enter password: ")
    subprocess.run(["bw", "create", "item", "--name", name, "--username", username, "--password", password])


def get_item():
    name = input("Enter item name: ")
    result = subprocess.run(["bw", "get", "item", name], capture_output=True, text=True)
    return result.stdout


def delete_item():
    name = input("Enter item name: ")
    subprocess.run(["bw", "delete", "item", name])


def import_folders():
    file_path = input("Enter the path to the file containing folder names: ")
    with open(file_path, "r") as file:
        folders = file.read().splitlines()
    
    for folder in folders:
        subprocess.run(["bw", "create", "folder", folder])
    
    print("Folders imported successfully.")


def print_menu():
    print("\n--- Bitwarden CLI Menu ---")
    print("1. Login")
    print("2. List Items")
    print("3. Create Item")
    print("4. Get Item")
    print("5. Delete Item")
    print("6. Import Folders")
    print("0. Exit")


def main():
    is_logged_in = False

    while True:
        print_menu()
        choice = input("Enter your choice: ")

        if choice == "1":
            if is_logged_in:
                print("Already logged in.")
            else:
                login()
                is_logged_in = True
                print("Logged in successfully.")
        elif choice == "2":
            if is_logged_in:
                items = list_items()
                print(items)
            else:
                print("Please log in first.")
        elif choice == "3":
            if is_logged_in:
                create_item()
                print("Item created successfully.")
            else:
                print("Please log in first.")
        elif choice == "4":
            if is_logged_in:
                item = get_item()
                print(item)
            else:
                print("Please log in first.")
        elif choice == "5":
            if is_logged_in:
                delete_item()
                print("Item deleted successfully.")
            else:
                print("Please log in first.")
        elif choice == "6":
            if is_logged_in:
                import_folders()
            else:
                print("Please log in first.")
        elif choice == "0":
            break
        else:
            print("Invalid choice. Please try again.")


if __name__ == "__main__":
    main()
