package br.com.processboss.core.util;

/**
 * 
 * @author Marco Paulo Ollivier
 *
 * Retorna informações do Sistema.
 *
 */
public abstract class ServerSystemInformation {

	private  ServerSystemInformation() {}
	
	/**
	 * retorna nome do SO de maneira formatada
	 * 
	 * @return nome do sistema
	 */
	public static String getName(){
		return System.getProperty("os.name").toLowerCase();
	}
	
	
}
