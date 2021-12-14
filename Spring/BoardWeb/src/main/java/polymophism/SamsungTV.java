package polymophism;

public class SamsungTV implements TV{
	
	private Speaker speaker;
	
	private int price;
	
	//객체 초기화 매소드
	public void initMethod() {
		System.out.println("객체 초기화 작업 처리.. ");
	}
	
	public SamsungTV() {
		System.out.println("==> SamsungTV 객체 생성(1) <==");
	}
	
//	public SamsungTV(Speaker speaker) {
//		System.out.println("==> SamsungTV 객체 생성(2) <==");
//		this.speaker = speaker;
//	}
//	
//	public SamsungTV(Speaker speaker, int price) {
//		this.speaker = speaker;
//		this.price = price;
//		System.out.println("==> SamsungTV 객체 생성(3) <==");
//	}
	
	public void setSpeaker(Speaker speaker) {
		System.out.println("==> setSpeaker() 호출");
		this.speaker = speaker;
	}
	
	public void setPrice(int price) {
		System.out.println("==> setPrice() 호출");
		this.price = price;
	}
	
	public void powerOn() {
		System.out.println("SamsungTV -- Turn On (price = " + price + ")");
	}

	public void powerOff() {
		System.out.println("SamsungTV -- Turn Off");
	}

	public void volumeUp() {
		speaker.volumeUp();
	}

	public void volumeDown() {
		speaker.volumeDown();
	}
	

}
