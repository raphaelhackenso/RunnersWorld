import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

fun main() {

    //print(BCryptPasswordEncoder().encode("admin"));
    println(BCryptPasswordEncoder().encode("raphael"));
    println(BCryptPasswordEncoder().encode("max"));
    println(BCryptPasswordEncoder().encode("clemens"));
}

