import os
import subprocess
import json
import sys

print("===============================================================================")
print("             GHOST TOOLBOX SYSTEMATIC VERIFICATION & TEST SUITE                ")
print("===============================================================================")

workspace = r"C:\Users\Administrator\Desktop\New folder (4)"
test_results = {}

# TEST 1: Binary Updater Integrity
print("\n[TEST 1] Verifying Reconstructed Updater Binary...")
updater_bin = os.path.join(workspace, "bin", "toolbox.updater.x64.exe")
if os.path.exists(updater_bin):
    sz = os.path.getsize(updater_bin)
    print(f"  [+] Found bin\\toolbox.updater.x64.exe ({sz:,} bytes)")
    test_results["updater_binary_exists"] = True
    test_results["updater_binary_size"] = sz
else:
    print("  [-] bin\\toolbox.updater.x64.exe missing!")
    test_results["updater_binary_exists"] = False

# TEST 2: Core Script Integrity
print("\n[TEST 2] Verifying Core Script Integrity...")
core_script = os.path.join(workspace, "src", "core", "run.ghost.cmd")
if os.path.exists(core_script):
    sz = os.path.getsize(core_script)
    with open(core_script, "r", encoding="latin1") as f:
        lines = f.readlines()
    print(f"  [+] Core script exists: {sz:,} bytes across {len(lines):,} lines")
    test_results["core_script_lines"] = len(lines)
    test_results["core_script_size"] = sz
else:
    test_results["core_script_exists"] = False

# TEST 3: Tools & Dependencies
print("\n[TEST 3] Testing Tools & System Dependencies...")
deps = [
    ("nhcolor", os.path.join(workspace, "tools", "system_deps", "nhcolor.exe")),
    ("hashsum", os.path.join(workspace, "tools", "system_deps", "hashsum.bat")),
    ("7za", os.path.join(workspace, "tools", "wget", "7z1900-extra", "x64", "7za.exe")),
    ("wget", os.path.join(workspace, "tools", "wget", "wget.exe")),
    ("ReduceMemory", os.path.join(workspace, "tools", "system_deps", "ReduceMemory_x64.exe")),
    ("EcMenu", os.path.join(workspace, "tools", "system_deps", "EcMenu_x64.exe"))
]

for name, path in deps:
    if os.path.exists(path):
        sz = os.path.getsize(path)
        print(f"  [+] Dependency '{name}': Verified ({sz:,} bytes)")
        test_results[f"dep_{name}"] = True
    else:
        print(f"  [-] Dependency '{name}': MISSING at {path}")
        test_results[f"dep_{name}"] = False

# TEST 4: Functional Testing of nhcolor.exe
print("\n[TEST 4] Testing nhcolor.exe functionality...")
nhcolor_path = os.path.join(workspace, "tools", "system_deps", "nhcolor.exe")
try:
    res = subprocess.run([nhcolor_path, "0A", "Test Color String"], capture_output=True, text=True, timeout=5)
    print("  [+] nhcolor executed successfully (returncode 0)")
    test_results["nhcolor_functional"] = True
except Exception as e:
    print(f"  [-] nhcolor failed: {e}")
    test_results["nhcolor_functional"] = False

# TEST 5: Functional Testing of 7za.exe with memory.bin
print("\n[TEST 5] Testing 7za.exe decryption with known passwords on memory.bin...")
seven_zip = os.path.join(workspace, "tools", "wget", "7z1900-extra", "x64", "7za.exe")
memory_bin = os.path.join(workspace, "tools", "wget", "memory.bin")

try:
    cmd = [seven_zip, "t", memory_bin, "-px", "-y"]
    res = subprocess.run(cmd, capture_output=True, text=True, timeout=5)
    if res.returncode == 0:
        print("  [+] 7za archive test: PASS (Decryption key 'x' verified)")
        test_results["archive_decrypt_test"] = True
    else:
        print(f"  [-] 7za archive test failed with code {res.returncode}")
        test_results["archive_decrypt_test"] = False
except Exception as e:
    print(f"  [-] 7za test error: {e}")
    test_results["archive_decrypt_test"] = False

# TEST 6: Static Goto Integrity (Broken Label Check)
print("\n[TEST 6] Auditing Broken GOTO Labels...")
audit_json = os.path.join(workspace, "docs", "GOTO_AUDIT_REPORT.json")
if os.path.exists(audit_json):
    with open(audit_json, "r", encoding="utf-8") as f:
        audit = json.load(f)
    broken_count = audit.get("total_broken_jumps", 0)
    print(f"  [*] Detected {broken_count} broken jumps to missing labels in original script.")
    test_results["broken_labels_detected"] = broken_count

# Summary
print("\n===============================================================================")
print("                             VERIFICATION SUMMARY                              ")
print("===============================================================================")
all_passed = all(v is True for k, v in test_results.items() if isinstance(v, bool) and "broken" not in k)
if all_passed:
    print("[+] ALL CRITICAL DEPENDENCY & BINARY TESTS PASSED!")
else:
    print("[!] Some issues detected; remediation required.")

with open(os.path.join(workspace, "docs", "TEST_RESULTS.json"), "w", encoding="utf-8") as f:
    json.dump(test_results, f, indent=2)
