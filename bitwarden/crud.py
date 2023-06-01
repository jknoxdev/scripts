import subprocess


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


def main():
    while True:
        print("\n--- Bitwarden CLI ---")
        print("1. List Items")
        print("2. Create Item")
        print("3. Get Item")
        print("4. Delete Item")
        print("0. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            items = list_items()
            print(items)
        elif choice == "2":
            create_item()
            print("Item created successfully.")
        elif choice == "3":
            item = get_item()
            print(item)
        elif choice == "4":
            delete_item()
            print("Item deleted successfully.")
        elif choice == "0":
            break
        else:
            print("Invalid choice. Please try again.")


if __name__ == "__main__":
    main()
