// Place your Spring DSL code here
beans = {
	javaMailSender(org.springframework.mail.javamail.JavaMailSenderImpl) {
		host="mail.sintelti.com.mx"
		port="587"
		username="jbautista@sintelti.com.mx"
		password="1234R2D27982cb"
		protocol="smtp"
		javaMailProperties=["mail.smtp.auth":true]
	}
}