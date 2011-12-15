// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 

package oshi.hardware;


// Referenced classes of package oshi.hardware:
//            Processor, Memory

public interface HardwareAbstractionLayer
{

    public abstract Processor[] getProcessors();

    public abstract Memory getMemory();
}
