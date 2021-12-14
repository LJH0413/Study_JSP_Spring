package polymophism;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("tv")
public class LGTV implements TV{
	
	@Autowired
	@Qualifier
	private Speaker speaker;

	public void powerOn() {
		System.out.println("LGTV -- Turn On");
	}

	public void powerOff() {
		System.out.println("LGTV -- Turn Off");
	}

	public void volumeUp() {
		speaker.volumeUp();
	}

	public void volumeDown() {
		speaker.volumeDown();
	}
}
