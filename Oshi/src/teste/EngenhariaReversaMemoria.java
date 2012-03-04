package teste;

import com.sun.jna.platform.win32.Kernel32;
import com.sun.jna.platform.win32.Win32Exception;

public class EngenhariaReversaMemoria {

	 public EngenhariaReversaMemoria()
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
