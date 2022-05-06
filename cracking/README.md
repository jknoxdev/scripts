# cracking
------
## crack7zip
 - crack7zip.rb
   - Asks the user for the filename and implements the techniques from [How to Crack Encrypted 7z Archives](https://infinitelogins.com/2020/04/29/how-to-crack-encrypted-7z-archives/)
     - Extracts the hash from the file using  Nguyen Dac Truong's [7z2john.py](https://github.com/truongkma/ctf-tools/blob/master/John/run/7z2john.py)
     - Removes the first ten characters from the file to extract the hash.
     - Checks to see if there is a wordlist available and downloads one if not. For this version it is checking at /usr/share/wordlists/rockyou.txt
     - Executes hashcat using the 11600 mode for 7-zip.
     - If the hashcat fails, it will attempt through using Matúš Tejiščák's [rarcrack](https://github.com/ziman/rarcrack) and modify the first run's xml config file to include special characters.
