package polymophism;

import org.springframework.stereotype.Component;

@Component("apple")
public class AppleSpeaker implements Speaker{
	
	public AppleSpeaker( ) {
		System.out.println("===> AppleSpeaker 객체 생성 <===");
	}

	public void volumeUp() {
		System.out.println("Apple Speaker volume Up");
	}

	public void volumeDown() {
		System.out.println("Apple Speaker volume Down");
	}

}
