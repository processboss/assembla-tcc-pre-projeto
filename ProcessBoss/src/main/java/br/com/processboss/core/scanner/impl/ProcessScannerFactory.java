package br.com.processboss.core.scanner.impl;

import br.com.processboss.core.scanner.ProcessScanner;
import br.com.processboss.core.util.ServerSystemInformation;


public abstract class ProcessScannerFactory {

	public static ProcessScanner getInstance(){

		if(ServerSystemInformation.getName().startsWith("windows")){
			return new WindowsProcessScanner();
		}
		
		return new UnixProcessScanner();
		
	}
}

