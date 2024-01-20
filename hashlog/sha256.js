function calculateHash() {
    const files = document.querySelectorAll('input[type=file]');
    let hashOutput = '';

    // Loop through selected files and calculate their SHA-256 hash using the crypto module
    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        if (file.type === 'application/octet-stream') { // Only process files with a valid MIME type
            const reader = new FileReader();
            reader.onloadend = function() {
                const arrayBuffer = reader.result;
                const hash = crypto.subtle.digest('sha256', arrayBuffer);
                hashOutput += `${file.name}: ${hash}\n`;
            };
            reader.readAsArrayBuffer(file);
        }
    }

    // Display the calculated SHA-256 hashes in a div element on the page
    const outputDiv = document.querySelector('#output');
    outputDiv.innerHTML = hashOutput;
}
