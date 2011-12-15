// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 

package oshi;

import com.sun.jna.Platform;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.software.os.OperatingSystem;
import oshi.software.os.windows.WindowsHardwareAbstractionLayer;
import oshi.software.os.windows.WindowsOperatingSystem;

public class SystemInfo
{

    public SystemInfo()
    {
        _os = null;
        _hardware = null;
    }

    public OperatingSystem getOperatingSystem()
    {
        if(_os == null)
            if(Platform.isWindows())
                _os = new WindowsOperatingSystem();
            else
                throw new RuntimeException((new StringBuilder()).append("Operating system not supported: ").append(Platform.getOSType()).toString());
        return _os;
    }

    public HardwareAbstractionLayer getHardware()
    {
        if(_hardware == null)
            if(Platform.isWindows())
                _hardware = new WindowsHardwareAbstractionLayer();
            else
                throw new RuntimeException((new StringBuilder()).append("Operating system not supported: ").append(Platform.getOSType()).toString());
        return _hardware;
    }

    private OperatingSystem _os;
    private HardwareAbstractionLayer _hardware;
}
