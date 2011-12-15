// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 

package oshi.software.os;


// Referenced classes of package oshi.software.os:
//            OperatingSystemVersion

public interface OperatingSystem
{

    public abstract String getFamily();

    public abstract String getManufacturer();

    public abstract OperatingSystemVersion getVersion();
}
