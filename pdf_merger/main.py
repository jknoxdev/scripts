import os
import re
from PyPDF4 import PdfFileMerger
from sanitize_filename import sanitize

def find_matched_pdfs(summaries_files, status_files):
    matched_pdfs = {}

    for summary_file in summaries_files:
        summary_base_name = sanitize(os.path.splitext(summary_file)[0])
        summary_words = summary_base_name.lower().split()

        matched_files = []

        for status_file in status_files:
            status_base_name = sanitize(os.path.splitext(status_file)[0])
            status_words = status_base_name.lower().split()

            match_words = []
            for word1 in summary_words:
                if word1 not in ["the"] and not any(c.isdigit() or c == '-' for c in word1):
                    for word2 in status_words:
                        if word2 not in ["the"] and not any(c.isdigit() or c == '-' for c in word2) and (word1 in word2 or word2 in word1):
                            match_words.append(word1)

            if match_words:
                matched_files.append(status_file)
                print(f"Matched words in filenames: {', '.join(match_words)}")

        if matched_files:
            matched_pdfs[summary_file] = matched_files

    return matched_pdfs



def merge_pdfs(matched_pdfs, folder_path):
    merge_folder_path = os.path.join(folder_path, "merged")
    os.makedirs(merge_folder_path, exist_ok=True)

    for summary_file, status_files in matched_pdfs.items():
        merger = PdfFileMerger()

        for status_file in status_files:
            summary_path = os.path.join(folder_path, "summaries", summary_file)
            status_path = os.path.join(folder_path, "status", status_file)
            merger.append(summary_path)
            merger.append(status_path)

        output_filename = os.path.join(merge_folder_path, f"aggregated_report_{summary_file}")
        merger.write(output_filename)
        merger.close()

        print(f"Merged PDFs into {output_filename}")

def preview_matched_pdfs(matched_pdfs):
    print("Matched PDFs:")
    for i, (summary_file, status_files) in enumerate(matched_pdfs.items()):
        print(f"{i+1}. Summary: {summary_file}")
        for j, status_file in enumerate(status_files):
            print(f"   {j+1}. Status: {status_file}")

def export_merge_list(matched_pdfs, folder_path):
    export_file_path = os.path.join(folder_path, "merge_list.txt")
    with open(export_file_path, "w") as f:
        for summary_file, status_files in matched_pdfs.items():
            f.write(f"Summary: {summary_file}\n")
            for status_file in status_files:
                f.write(f"   Status: {status_file}\n")

    print(f"Merge list exported to {export_file_path}")


def sanitize_filenames(folder_path):
    summaries_folder_path = os.path.join(folder_path, "summaries")
    status_folder_path = os.path.join(folder_path, "status")

    for file_name in os.listdir(summaries_folder_path):
        if file_name.endswith(".pdf"):
            sanitized_name = sanitize(os.path.splitext(file_name)[0])
            sanitized_name = re.sub(r"[-\d]+", "", sanitized_name)
            os.rename(
                os.path.join(summaries_folder_path, file_name),
                os.path.join(summaries_folder_path, f"{sanitized_name}.pdf")
            )

    for file_name in os.listdir(status_folder_path):
        if file_name.endswith(".pdf"):
            sanitized_name = sanitize(os.path.splitext(file_name)[0])
            sanitized_name = re.sub(r"[-\d]+", "", sanitized_name)
            os.rename(
                os.path.join(status_folder_path, file_name),
                os.path.join(status_folder_path, f"{sanitized_name}.pdf")
            )

    print("Filenames sanitized.")



# Example usage
folder_path = "./"

summaries_files = [f for f in os.listdir(os.path.join(folder_path, "summaries")) if f.endswith(".pdf")]
status_files = [f for f in os.listdir(os.path.join(folder_path, "status")) if f.endswith(".pdf")]

matched_pdfs = {}

while True:
    print("Menu:")
    print("1. List PDFs")
    print("2. Find matches")
    print("3. Preview matched PDFs")
    print("4. Merge PDFs")
    print("5. Export merge list")
    print("6. Sanitize filenames")
    print("7. Quit")

    choice = input("Enter your choice (1-7): ")

    if choice == "1":
        print("PDFs in summaries:")
        for i, pdf in enumerate(summaries_files):
            print(f"{i+1}. {pdf}")
        print("PDFs in status:")
        for i, pdf in enumerate(status_files):
            print(f"{i+1}. {pdf}")
    elif choice == "2":
        matched_pdfs = find_matched_pdfs(summaries_files, status_files)
        if len(matched_pdfs) == 0:
            print("No matches found.")
        else:
            print("Matches found.")
    elif choice == "3":
        if len(matched_pdfs) == 0:
            print("No matches found. Please find matches first.")
        else:
            preview_matched_pdfs(matched_pdfs)
    elif choice == "4":
        if len(matched_pdfs) == 0:
            print("No matches found. Please find matches first.")
        else:
            merge_pdfs(matched_pdfs, folder_path)
    elif choice == "5":
        if len(matched_pdfs) == 0:
            print("No matches found. Please find matches first.")
        else:
            export_merge_list(matched_pdfs, folder_path)
    elif choice == "6":
        sanitize_filenames(folder_path)
    elif choice == "7":
        print("Quitting...")
        break
    else:
        print("Invalid choice. Please try again.")
