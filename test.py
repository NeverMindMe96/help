import os
import subprocess
from colorama import Fore

def scan_with_yara_rules(rule_directory, target):
    rule_files = []

    # Recursively traverse the rule_directory to find all .yara files
    for root, dirs, files in os.walk(rule_directory):
        for file in files:
            if file.endswith('.yara'):
                rule_files.append(os.path.join(root, file))

    if not rule_files:
        print("No YARA rule files found in the specified directory.")
        return

    print(f"Found {len(rule_files)} YARA rule file(s) in {rule_directory}.")

    # Construct the yara command with all rule files and the target
    yara_cmd = ['yara64'] + rule_files + [target]

    print(f"\nScanning target: {target}\n")

    # Execute the yara command
    try:
        # Run the yara command and capture the output
        result = subprocess.run(yara_cmd, capture_output=True, text=True)

        # Print the output of the yara command
        if result.stdout:
            print(Fore.RED+"YARA Output:")
            print(Fore.RED+result.stdout + "\n ")
            print(Fore.WHITE)
           
        else:
            print(Fore.GREEN+"No matches found.")
    except subprocess.CalledProcessError as e:
        print(f"Error executing YARA command: {e}")
    except FileNotFoundError:
        print("YARA executable not found. Make sure YARA is installed and accessible.")

    print(Fore.WHITE)

# Example usage:
if __name__ == "__main__":
    
    print(Fore.WHITE)
    
    current_dir = os.path.dirname(__file__)

    # settings.ini file path
    settings_file_path = current_dir + '/rule/'
    
    rule_directory = settings_file_path
    target = input("Enter the path of the target folder : ")
   
    scan_with_yara_rules(rule_directory, target)
