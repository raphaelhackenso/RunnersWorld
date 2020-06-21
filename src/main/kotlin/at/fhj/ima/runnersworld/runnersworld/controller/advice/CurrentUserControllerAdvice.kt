package at.fhj.ima.runnersworld.runnersworld.controller.advice


import at.fhj.ima.runnersworld.runnersworld.repository.UserRepository
import org.springframework.security.authentication.AnonymousAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.*
import java.security.Principal


@ControllerAdvice
class CurrentUserControllerAdvice(val userRepository: UserRepository) {

    @ModelAttribute
    fun addCurrentUser(model: Model) {
        val auth = SecurityContextHolder.getContext().authentication
        if (auth is AnonymousAuthenticationToken) {
            return
        }
        val username = auth.name
        val currentUser = userRepository.findByUsername(username)
        model.addAttribute("currentUser", currentUser)
    }


}
