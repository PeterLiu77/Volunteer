package com.peter;

import org.apache.shiro.authc.UsernamePasswordToken;
import org.junit.Test;
import com.peter.utils.Encrypt;

public class ShiroPasswordTest {

	@Test
	public void testJavaMail() throws Exception {
		UsernamePasswordToken upToken = new UsernamePasswordToken();
		upToken.setUsername("aa");
		upToken.setPassword("123".toCharArray());
		Object pwd = Encrypt.md5(new String(upToken.getPassword()), upToken.getUsername());
		System.out.println(pwd);
		upToken.setUsername("bb");
		upToken.setPassword("123".toCharArray());
		pwd = Encrypt.md5(new String(upToken.getPassword()), upToken.getUsername());
		System.out.println(pwd);
		upToken.setUsername("cc");
		upToken.setPassword("123".toCharArray());
		pwd = Encrypt.md5(new String(upToken.getPassword()), upToken.getUsername());
		System.out.println(pwd);
		upToken.setUsername("dd");
		upToken.setPassword("123".toCharArray());
		pwd = Encrypt.md5(new String(upToken.getPassword()), upToken.getUsername());
		System.out.println(pwd);
	}
}