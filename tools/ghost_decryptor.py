"""
Ghost Toolbox Universal Archive Decryptor & Extractor
Tests and brute-forces known internal Ghost Spectre passwords against any encrypted .bin, .update, or .7z payload.
"""

import sys
import os
import subprocess
import argparse

KNOWN_PASSWORDS = [
    "ghostX2021", "root", "unroot", "wsa2309", "runtimex86", "runtime",
    "xbox", "gamebar", "ghostwidgets", "cortana", "mscortanabeta",
    "phone", "yourphone789", "notepad", "paint", "1note", "msnote",
    "hevc", "store2022", "store0appx", "storepwd", "store1703",
    "8wekyb3d8bbwe", "uxthemepatcher.com", "YTDLP", "ytdlp3", "YTX",
    "ghostboxx", "ghostytyt", "tkp", "mshub", "xbr", "db123", "DB",
    "nh123", "xxx", "x", "xyz", "co", "d", "de", "test", "cla",
    "start", "112233", "unpause"
]

def find_7za():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    candidates = [
        os.path.join(base_dir, "7zip_2026", "7z.exe"),
        os.path.join(base_dir, "wget", "7z1900-extra", "x64", "7za.exe"),
        os.path.join(base_dir, "wget", "7z1900-extra", "7za.exe"),
        os.path.join(base_dir, "..", "tools", "7zip_2026", "7z.exe"),
        os.path.join(base_dir, "..", "Ghost Toolbox", "wget", "7z1900-extra", "x64", "7za.exe"),
        "7z", "7za"
    ]
    for c in candidates:
        if os.path.exists(c):
            return c
    return "7z"

def test_archive(archive_path, output_dir=None):
    if not os.path.exists(archive_path):
        print(f"[-] File not found: {archive_path}")
        return False

    seven_zip = find_7za()
    print(f"[*] Testing archive: {archive_path}")
    print(f"[*] Using 7-Zip engine: {seven_zip}")

    matched_pw = None
    for pw in KNOWN_PASSWORDS:
        cmd = [seven_zip, "t", archive_path, f"-p{pw}", "-y"]
        res = subprocess.run(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        if res.returncode == 0:
            matched_pw = pw
            break

    if matched_pw:
        print(f"[+] SUCCESS! Decryption Key Found: '{matched_pw}'")
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)
            print(f"[+] Extracting to: {output_dir}...")
            cmd = [seven_zip, "x", archive_path, f"-p{matched_pw}", f"-o{output_dir}", "-aoa", "-y"]
            subprocess.run(cmd)
            print("[+] Extraction completed successfully.")
        return True
    else:
        print("[-] None of the known Ghost Spectre keys unlocked this archive.")
        return False

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Ghost Toolbox Universal Archive Decryptor")
    parser.add_argument("archive", help="Path to encrypted .bin, .update, or .7z file")
    parser.add_argument("-o", "--output", help="Directory to extract files if password is found")
    args = parser.parse_args()

    test_archive(args.archive, args.output)
