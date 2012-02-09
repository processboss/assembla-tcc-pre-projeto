package br.com.tcc.estudos.gpb.core.model.scanner;

public abstract class ProcessScannerFactory {

	public static ProcessScanner getInstance(){
		
		String osName = System.getProperty("os.name");

		if(osName.toLowerCase().startsWith("windows")){
			return new WindowsProcessScanner();
		}
		
		return new UnixProcessScanner();
	}
}
