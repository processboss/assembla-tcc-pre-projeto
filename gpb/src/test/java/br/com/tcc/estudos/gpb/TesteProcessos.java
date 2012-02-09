package br.com.tcc.estudos.gpb;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class TesteProcessos {

	public static void main(String[] args) throws InterruptedException {
	
			try {
				String ls_str;

				Process ls_proc = Runtime.getRuntime().exec("cmd /C TASKLIST /V");

				BufferedReader ls_in = new BufferedReader(new InputStreamReader(ls_proc.getInputStream()));

				try {
					
					while ((ls_str = ls_in.readLine()) != null) {
						System.out.println(ls_str);
					}
					
				} catch (IOException e) {
					System.exit(0);
				}
			} catch (IOException e1) {
				System.err.println(e1);
				System.exit(1);
			}

			System.exit(0);

	}
	
}
