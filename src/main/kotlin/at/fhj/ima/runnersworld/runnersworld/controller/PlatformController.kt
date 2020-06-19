package at.fhj.ima.runnersworld.runnersworld.controller

import at.fhj.ima.runnersworld.runnersworld.entity.Game
import at.fhj.ima.runnersworld.runnersworld.entity.Platform
import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import at.fhj.ima.runnersworld.runnersworld.repository.PlatformRepository
import at.fhj.ima.runnersworld.runnersworld.service.PlatformService
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import javax.validation.Valid

@Controller
class PlatformController(val platformService: PlatformService) {

    @RequestMapping("/listPlatform", method = [RequestMethod.GET])
    fun listPlatform(model: Model, @RequestParam(required = false) search: String?): String {
        if (search != null) {
            model.set("platform", platformService.findPlatformByName(search))
        } else {
            model.set("platform", platformService.findAll())
        }
        return "listPlatform"
    }

    @RequestMapping("/changePlatform", method = [RequestMethod.POST])
    @Secured("ROLE_ADMIN")
    fun changePlatform(@ModelAttribute("platform") @Valid platform: Platform,
                       bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return showEditPlatformView(model)
        }

        try {
            platformService.save(platform)
        } catch (dive: DataIntegrityViolationException) {
            if (dive.message.orEmpty().contains("name_UK")) {
                bindingResult.rejectValue("name", "platform.alreadyInUse", "Diese Platform gibt es bereits!");
                return showEditPlatformView(model)

            } else {
                throw dive;
            }
        }
        return "redirect:/listPlatform"
    }


    @RequestMapping("/editPlatform", method = [RequestMethod.GET])
    @Secured("ROLE_ADMIN")
    fun editPlatform(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            model.set("platform", platformService.findPlatformById(id))
        } else {
            model.set("platform", platformService.createNewPlatform())
        }
        return showEditPlatformView(model)
    }

    fun showEditPlatformView(model: Model): String {
        return "editPlatform"
    }


}