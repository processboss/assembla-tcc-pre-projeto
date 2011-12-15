// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 

package oshi.software.os.windows.nt;

import com.sun.jna.platform.win32.*;
import com.sun.jna.ptr.IntByReference;

public class OSNativeSystemInfo
{

    public OSNativeSystemInfo()
    {
        _si = null;
        com.sun.jna.platform.win32.WinBase.SYSTEM_INFO system_info = new com.sun.jna.platform.win32.WinBase.SYSTEM_INFO();
        Kernel32.INSTANCE.GetSystemInfo(system_info);
        try
        {
            IntByReference intbyreference = new IntByReference();
            com.sun.jna.platform.win32.WinNT.HANDLE handle = Kernel32.INSTANCE.GetCurrentProcess();
            if(Kernel32.INSTANCE.IsWow64Process(handle, intbyreference) && intbyreference.getValue() > 0)
                Kernel32.INSTANCE.GetNativeSystemInfo(system_info);
        }
        catch(UnsatisfiedLinkError unsatisfiedlinkerror) { }
        _si = system_info;
    }

    public OSNativeSystemInfo(com.sun.jna.platform.win32.WinBase.SYSTEM_INFO system_info)
    {
        _si = null;
        _si = system_info;
    }

    public int getNumberOfProcessors()
    {
        return _si.dwNumberOfProcessors.intValue();
    }

    private com.sun.jna.platform.win32.WinBase.SYSTEM_INFO _si;
}
