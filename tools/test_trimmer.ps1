$code = @'
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

public class MemoryTrimmer {
    [DllImport("psapi.dll")]
    public static extern int EmptyWorkingSet(IntPtr hwProc);

    public static int TrimAll() {
        int count = 0;
        foreach (Process proc in Process.GetProcesses()) {
            try {
                if (!proc.HasExited && proc.Id > 4) {
                    EmptyWorkingSet(proc.Handle);
                    count++;
                }
            } catch { }
        }
        return count;
    }
}
'@

Add-Type -TypeDefinition $code -Language CSharp
$trimmed = [MemoryTrimmer]::TrimAll()
Write-Host "Trimmed working set of $trimmed processes successfully."
