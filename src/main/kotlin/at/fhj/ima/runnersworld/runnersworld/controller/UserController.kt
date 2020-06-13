package at.fhj.ima.runnersworld.runnersworld.controller

import at.fhj.ima.runnersworld.runnersworld.controller.advice.CurrentUserControllerAdvice
import at.fhj.ima.runnersworld.runnersworld.dto.UserDto
import at.fhj.ima.runnersworld.runnersworld.repository.SpeedRunRepository
import at.fhj.ima.runnersworld.runnersworld.repository.UserRepository
import at.fhj.ima.runnersworld.runnersworld.service.UserService
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.data.domain.Sort
import org.springframework.security.access.annotation.Secured
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.*
import org.springframework.web.servlet.ModelAndView
import javax.servlet.http.HttpServletRequest
import javax.validation.Valid

@Controller
class UserController(val userService: UserService) {


    @RequestMapping("/registerUser", method = [RequestMethod.GET])
    fun registerUser(model: Model): String {
        //var newUserDto = UserDto()
        //model.set("user", newUserDto)

        model.set("user", userService.createNewUser())
        return showRegisterUser(model)
    }

    fun showRegisterUser(model: Model): String {
        return "registerUser"
    }

    //TODO https://www.baeldung.com/registration-with-spring-mvc-and-spring-security


    @RequestMapping("/registerUserAccount", method = [RequestMethod.POST])
    fun registerUserAccount(@ModelAttribute("user") @Valid user: UserDto, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return showRegisterUser(model)
        }
        try {
            if (user.isPasswordsMatch()) {
                userService.save(user)
            } else {
                bindingResult.rejectValue("passwordRepeat", "passwordRepeat.dontmatch", "Die Passwörter stimmen nicht überein   ");
                return showRegisterUser(model)
            }

        } catch (dive: DataIntegrityViolationException) {
            if (dive.message.orEmpty().contains("username_UK")) {
                bindingResult.rejectValue("username", "username.alreadyInUse", "Username bereits vergeben");
                return showRegisterUser(model)
            } else {
                throw dive;
            }
        }

        model.set("message", "User ${user.username} has been registered")
        //return "redirect:/registerUser"
        return registerUser(model)
        //TODO add change/show User account jsp

    }

    /* TODO include
    @ExceptionHandler(Exception::class)
    fun handleError(req: HttpServletRequest, ex: Exception): ModelAndView {
        val modelAndView = ModelAndView()
        modelAndView.addObject("exception", ex)
        modelAndView.addObject("url", req.requestURI)
        modelAndView.viewName = "error"
        return modelAndView
    }


     */


    @RequestMapping("/displayUser", method = [RequestMethod.GET])
    fun displayUser(model: Model): String {
        return "displayUser"
    }

}