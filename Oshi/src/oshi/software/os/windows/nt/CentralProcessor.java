// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 

package oshi.software.os.windows.nt;

import oshi.hardware.Processor;

public class CentralProcessor
    implements Processor
{

    public CentralProcessor()
    {
    }

    public String getVendor()
    {
        return _vendor;
    }

    public void setVendor(String s)
    {
        _vendor = s;
    }

    public String getName()
    {
        return _name;
    }

    public void setName(String s)
    {
        _name = s;
    }

    public String getIdentifier()
    {
        return _identifier;
    }

    public void setIdentifier(String s)
    {
        _identifier = s;
    }

    public String toString()
    {
        return _name;
    }

    private String _vendor;
    private String _name;
    private String _identifier;
}
