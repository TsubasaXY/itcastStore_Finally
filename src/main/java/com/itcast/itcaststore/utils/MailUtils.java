package com.itcast.itcaststore.utils;



import org.testng.annotations.Test;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
/**
 * 发送邮件的工具类
 */
public class MailUtils {
	public static void sendMail(String email, String emailMsg) throws MessagingException {
		// 1.创建一个程序与邮件服务器会话对象 Session
		Properties props = new Properties();
		// 设置邮件传输协议为SMTP
		props.setProperty("mail.transport.protocol", "SMTP");
		// 设置SMTP服务器地址
		props.setProperty("mail.host", "smtp.qq.com");
		// 设置SMTP服务器是否需要用户验证，需要验证smtp.qq.com设置为true
		props.setProperty("mail.smtp.auth", "true");


		// 创建验证器
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("tsubasaxy@vip.qq.com", "hpazbpmazwwubehh");//邮箱账号及授权码
			}
		};

		Session session = Session.getInstance(props, auth);
		// 2.创建一个Message，它相当于是邮件内容
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("tsubasaxy@vip.qq.com")); // 设置发送者
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(email)); // 设置发送方式与接收者
		message.setSubject("用户激活");
		// message.setText("这是一封激活邮件，请<a href='#'>点击</a>");
		message.setContent(emailMsg, "text/html;charset=utf-8");
		// 3.创建 Transport用于将邮件发送
		Transport.send(message);
	}
@Test
public  void test() throws MessagingException {
	sendMail("1931091105@qq.com","hello");
}
}
