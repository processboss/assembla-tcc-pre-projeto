// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 

package oshi.software.os.windows.nt;

import com.sun.jna.Native;
import com.sun.jna.platform.win32.*;
import oshi.software.os.OperatingSystemVersion;

public class OSVersionInfoEx
    implements OperatingSystemVersion
{

    public OSVersionInfoEx()
    {
        _versionInfo = new com.sun.jna.platform.win32.WinNT.OSVERSIONINFOEX();
        if(!Kernel32.INSTANCE.GetVersionEx(_versionInfo))
            throw new Win32Exception(Kernel32.INSTANCE.GetLastError());
        else
            return;
    }

    public int getMajor()
    {
        return _versionInfo.dwMajorVersion.intValue();
    }

    public int getMinor()
    {
        return _versionInfo.dwMinorVersion.intValue();
    }

    public int getBuildNumber()
    {
        return _versionInfo.dwBuildNumber.intValue();
    }

    public int getPlatformId()
    {
        return _versionInfo.dwPlatformId.intValue();
    }

    public String getServicePack()
    {
        return Native.toString(_versionInfo.szCSDVersion);
    }

    public int getSuiteMask()
    {
        return _versionInfo.wSuiteMask.intValue();
    }

    public byte getProductType()
    {
        return _versionInfo.wProductType;
    }

    public String toString()
    {
        String s = null;
        if(_versionInfo.dwPlatformId.intValue() == 2)
        {
            if(_versionInfo.dwMajorVersion.intValue() == 6 && _versionInfo.dwMinorVersion.intValue() == 1 && _versionInfo.wProductType == 1)
                s = "7";
            else
            if(_versionInfo.dwMajorVersion.intValue() == 6 && _versionInfo.dwMinorVersion.intValue() == 1 && _versionInfo.wProductType != 1)
                s = "Server 2008 R2";
            else
            if(_versionInfo.dwMajorVersion.intValue() == 6 && _versionInfo.dwMinorVersion.intValue() == 0 && _versionInfo.wProductType != 1)
                s = "Server 2008";
            else
            if(_versionInfo.dwMajorVersion.intValue() == 6 && _versionInfo.dwMinorVersion.intValue() == 0 && _versionInfo.wProductType == 1)
                s = "Vista";
            else
            if(_versionInfo.dwMajorVersion.intValue() == 5 && _versionInfo.dwMinorVersion.intValue() == 2 && _versionInfo.wProductType != 1 && User32.INSTANCE.GetSystemMetrics(89) != 0)
                s = "Server 2003";
            else
            if(_versionInfo.dwMajorVersion.intValue() == 5 && _versionInfo.dwMinorVersion.intValue() == 2 && _versionInfo.wProductType != 1 && User32.INSTANCE.GetSystemMetrics(89) == 0)
                s = "Server 2003 R2";
            else
            if(_versionInfo.dwMajorVersion.intValue() == 5 && _versionInfo.dwMinorVersion.intValue() == 2 && _versionInfo.wProductType == 1)
                s = "XP";
            else
            if(_versionInfo.dwMajorVersion.intValue() == 5 && _versionInfo.dwMinorVersion.intValue() == 1)
                s = "XP";
            else
            if(_versionInfo.dwMajorVersion.intValue() == 5 && _versionInfo.dwMinorVersion.intValue() == 0)
                s = "2000";
            else
            if(_versionInfo.dwMajorVersion.intValue() == 4)
            {
                s = "NT 4";
                if(Native.toString(_versionInfo.szCSDVersion) == "Service Pack 6" && Advapi32Util.registryKeyExists(WinReg.HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Hotfix\\Q246009"))
                    return "NT4 SP6a";
            } else
            {
                throw new RuntimeException((new StringBuilder()).append("Unsupported Windows NT version: ").append(_versionInfo.toString()).toString());
            }
            if(_versionInfo.wServicePackMajor.intValue() > 0)
                s = (new StringBuilder()).append(s).append(" SP").append(_versionInfo.wServicePackMajor.intValue()).toString();
        } else
        if(_versionInfo.dwPlatformId.intValue() == 1)
        {
            if(_versionInfo.dwMajorVersion.intValue() == 4 && _versionInfo.dwMinorVersion.intValue() == 90)
                s = "ME";
            else
            if(_versionInfo.dwMajorVersion.intValue() == 4 && _versionInfo.dwMinorVersion.intValue() == 10)
            {
                if(_versionInfo.szCSDVersion[1] == 'A')
                    s = "98 SE";
                else
                    s = "98";
            } else
            if(_versionInfo.dwMajorVersion.intValue() == 4 && _versionInfo.dwMinorVersion.intValue() == 0)
            {
                if(_versionInfo.szCSDVersion[1] == 'C' || _versionInfo.szCSDVersion[1] == 'B')
                    s = "95 OSR2";
                else
                    s = "95";
            } else
            {
                throw new RuntimeException((new StringBuilder()).append("Unsupported Windows 9x version: ").append(_versionInfo.toString()).toString());
            }
        } else
        {
            throw new RuntimeException((new StringBuilder()).append("Unsupported Windows platform: ").append(_versionInfo.toString()).toString());
        }
        return s;
    }

    public OSVersionInfoEx(com.sun.jna.platform.win32.WinNT.OSVERSIONINFOEX osversioninfoex)
    {
        _versionInfo = osversioninfoex;
    }

    private com.sun.jna.platform.win32.WinNT.OSVERSIONINFOEX _versionInfo;
}
