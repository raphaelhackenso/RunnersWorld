package at.fhj.ima.runnersworld.runnersworld


import at.fhj.ima.runnersworld.runnersworld.security.MyUserDetailsService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter

@Configuration
@EnableWebSecurity
class WebSecurityConfig : WebSecurityConfigurerAdapter() {

    @Autowired
    private lateinit var myUserDetailsService: MyUserDetailsService;

    override fun configure(http: HttpSecurity) {
        http


                .authorizeRequests()


                .antMatchers("/").permitAll()
                .antMatchers("/aSpeedRuns").permitAll()
                .antMatchers("/rankSpeedrun").permitAll()
                .antMatchers("/registerUser").permitAll()
                .antMatchers("/registerUserAccount").permitAll()
                .antMatchers("/adisplayUser").permitAll()

                .antMatchers("/css/custom.css").permitAll()
                .antMatchers("/js/custom.js").permitAll()


                .anyRequest().authenticated()
                .and()
                .formLogin()
                .defaultSuccessUrl("/listSpeedRuns")
                .and()
                .logout()
                .logoutSuccessUrl("/aSpeedRuns")
                .deleteCookies("JSESSIONID")
                .and()
                .rememberMe().key("uniqueAndSecret").userDetailsService(myUserDetailsService);
    }

}
