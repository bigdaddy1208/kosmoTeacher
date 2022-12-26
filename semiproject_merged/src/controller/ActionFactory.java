package controller;

import java.io.FileReader;
import java.util.Properties;
import action.Action;

public class ActionFactory {
	private static ActionFactory factory;
	private Properties prop;
	private ActionFactory() {
		prop = new Properties();
	}
	public static synchronized ActionFactory getFactory() {
		if(factory == null) factory= new ActionFactory();
		return factory;
	}

	public Action getAction(String cmd) {
		String path ="D:\\Teacher\\spring\\workspace\\semiproject_merged_1226_am\\semiproject_merged\\src\\controller\\classinfo.properties";
		Action action = null;
		try {
			prop.load(new FileReader(path));
			String modelObj = prop.getProperty(cmd);
			Class<Action> hc = (Class<Action>) Class.forName(modelObj);
			action = hc.newInstance();
		} catch (Exception e) {

			e.printStackTrace();
		}

		return action;
	}
}





