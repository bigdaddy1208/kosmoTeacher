package controller;
// Controller가 모델의 메서드를 execute()호출한 후 모델이 반환 해야할 객체
// 모델의  execute()가 Controller에 의해서 호출이 되고 나서 반환하는 값을 가진 객체
// 반환 
// view경로와 , 이동방식을 결정해서 반환되는 객체 
public class ActionForward {
	private String url;// 모델이 실행한 후 반환하는 View의 경로
	private boolean method; // 모델이 실행 후 이동할 이동 방식-> redirect,forward
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
