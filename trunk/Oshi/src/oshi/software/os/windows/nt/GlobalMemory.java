// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 

package oshi.software.os.windows.nt;

import com.sun.jna.platform.win32.*;
import oshi.hardware.Memory;

public class GlobalMemory
    implements Memory
{

    public GlobalMemory()
    {
        _memory = new com.sun.jna.platform.win32.WinBase.MEMORYSTATUSEX();
        if(!Kernel32.INSTANCE.GlobalMemoryStatusEx(_memory))
            throw new Win32Exception(Kernel32.INSTANCE.GetLastError());
        else
            return;
    }

    public long getAvailable()
    {
        return _memory.ullAvailPhys.longValue();
    }

    public long getTotal()
    {
        return _memory.ullTotalPhys.longValue();
    }

    com.sun.jna.platform.win32.WinBase.MEMORYSTATUSEX _memory;
}
