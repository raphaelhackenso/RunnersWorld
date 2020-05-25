package at.fhj.ima.runnersworld.runnersworld

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer
import org.springframework.context.annotation.Bean
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder

@SpringBootApplication
@EnableGlobalMethodSecurity(securedEnabled = true)
class RunnersworldApplication : SpringBootServletInitializer() {

    @Bean
    fun passwordEncoder(): PasswordEncoder {
        return BCryptPasswordEncoder();

    }
}

fun main(args: Array<String>) {
    runApplication<RunnersworldApplication>(*args)
}
