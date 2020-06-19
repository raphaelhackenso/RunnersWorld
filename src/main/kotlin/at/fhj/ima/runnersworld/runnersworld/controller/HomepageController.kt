package at.fhj.ima.runnersworld.runnersworld.controller

import org.springframework.security.authentication.AnonymousAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class HomePageController {


    @RequestMapping("", method = [RequestMethod.GET])
    fun homePage(): String {
        val auth = SecurityContextHolder.getContext().authentication
        if (auth is AnonymousAuthenticationToken) {
            return "redirect:aSpeedRuns"
        }

        return "redirect:listSpeedRuns"

    }

}

