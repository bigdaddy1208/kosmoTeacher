package controller;
// Controller�� ���� �޼��带 execute()ȣ���� �� ���� ��ȯ �ؾ��� ��ü
// ����  execute()�� Controller�� ���ؼ� ȣ���� �ǰ� ���� ��ȯ�ϴ� ���� ���� ��ü
// ��ȯ 
// view��ο� , �̵������ �����ؼ� ��ȯ�Ǵ� ��ü 
public class ActionForward {
	private String url;// ���� ������ �� ��ȯ�ϴ� View�� ���
	private boolean method; // ���� ���� �� �̵��� �̵� ���-> redirect,forward
	public ActionForward() {
	}
	public ActionForward(String url, boolean method) {
		this.url = url;
		this.method = method;
	}
	public String getUrl() {
		return url;
	}
	public boolean isMethod() {
		return method;
	}
	
}
