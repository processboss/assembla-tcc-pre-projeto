package teste;

import java.util.ArrayList;

import oshi.hardware.Processor;
import oshi.software.os.windows.nt.CentralProcessor;

import com.sun.jna.platform.win32.Advapi32Util;
import com.sun.jna.platform.win32.WinReg;

public class EngenhariaReversaProcessadores {


	   public Processor[] getProcessors()
	    {
	        if(_processors == null)
	        {
	            ArrayList arraylist = new ArrayList();
	            String as[] = Advapi32Util.registryGetKeys(WinReg.HKEY_LOCAL_MACHINE, "HARDWARE\\DESCRIPTION\\System\\CentralProcessor");
	            String as1[] = as;
	            int i = as1.length;
	            for(int j = 0; j < i; j++)
	            {
	                String s = as1[j];
	                String s1 = (new StringBuilder()).append("HARDWARE\\DESCRIPTION\\System\\CentralProcessor\\").append(s).toString();
	                CentralProcessor centralprocessor = new CentralProcessor();
	                centralprocessor.setIdentifier(Advapi32Util.registryGetStringValue(WinReg.HKEY_LOCAL_MACHINE, s1, "Identifier"));
	                centralprocessor.setName(Advapi32Util.registryGetStringValue(WinReg.HKEY_LOCAL_MACHINE, s1, "ProcessorNameString"));
	                centralprocessor.setVendor(Advapi32Util.registryGetStringValue(WinReg.HKEY_LOCAL_MACHINE, s1, "VendorIdentifier"));
	                arraylist.add(centralprocessor);
	            }

	            _processors = (Processor[])arraylist.toArray(new Processor[0]);
	        }
	        return _processors;
	    }

	    private Processor _processors[];
		
		
	
}
