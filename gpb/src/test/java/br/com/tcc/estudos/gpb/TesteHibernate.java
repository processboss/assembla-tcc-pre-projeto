package br.com.tcc.estudos.gpb;

import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.tcc.estudos.gpb.core.model.Processo;
import br.com.tcc.estudos.gpb.core.model.persistence.HibernateUtil;
import br.com.tcc.estudos.gpb.core.model.scanner.ProcessScanner;
import br.com.tcc.estudos.gpb.core.model.scanner.ProcessScannerFactory;

public class TesteHibernate {

	public static void main(String[] args) {
		try {
			Session session = HibernateUtil.getSession();

			Transaction tx = session.beginTransaction();

			ProcessScanner scanner = ProcessScannerFactory.getInstance();
			
			System.out.println("### INICIO ###");
			for (int i=0;i<5;i++) {
				Set<Processo> processos = scanner.readAllProcess();
				for (Processo processo : processos) {
					session.save(processo);
				}
				Thread.sleep(1000);
			}
			System.out.println("### FIM ###");
			tx.commit();


			session.close();

		} catch (HibernateException e1) {
			e1.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
