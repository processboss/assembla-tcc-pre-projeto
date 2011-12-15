// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 

package oshi.software.os.windows;

import oshi.software.os.OperatingSystem;
import oshi.software.os.OperatingSystemVersion;
import oshi.software.os.windows.nt.OSVersionInfoEx;

public class WindowsOperatingSystem
    implements OperatingSystem
{

    public WindowsOperatingSystem()
    {
        _version = null;
    }

    public OperatingSystemVersion getVersion()
    {
        if(_version == null)
            _version = new OSVersionInfoEx();
        return _version;
    }

    public String getFamily()
    {
        return "Windows";
    }

    public String getManufacturer()
    {
        return "Microsoft";
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(getManufacturer());
        stringbuilder.append(" ");
        stringbuilder.append(getFamily());
        stringbuilder.append(" ");
        stringbuilder.append(getVersion().toString());
        return stringbuilder.toString();
    }

    private OperatingSystemVersion _version;
}
