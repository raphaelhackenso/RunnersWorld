package at.fhj.ima.runnersworld.runnersworld.controller

import at.fhj.ima.runnersworld.runnersworld.service.TypeOfRunService
import at.fhj.ima.runnersworld.runnersworld.entity.TypeOfRun
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
class TypeOfRunController(val typeOfRunService: TypeOfRunService) {

    @RequestMapping("/listTypeOfRuns", method = [RequestMethod.GET])
    fun listTypeOfRuns(model: Model, @RequestParam(required = false) search: String?): String {
        if (search != null) {
            model.set("typeOfRuns", typeOfRunService.findTypeOfRunByName(search))
        } else {
            model.set("typeOfRuns", typeOfRunService.findAll())
        }
        return "listTypeOfRuns"
    }

    @RequestMapping("/changeTypeOfRun", method = [RequestMethod.POST])
    @Secured("ROLE_ADMIN")
    fun changeTypeOfRun(@ModelAttribute("typeOfRun") @Valid typeOfRun: TypeOfRun,
                        bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return showEditTypeOfRunView(model)
        }

        try {
            typeOfRunService.save(typeOfRun)
        } catch (dive: DataIntegrityViolationException) {
            if (dive.message.orEmpty().contains("name_UK")) {
                bindingResult.rejectValue("name", "typeOfRun.alreadyInUse", "Diese Kategorie gibt es bereits!");
                return showEditTypeOfRunView(model)

            } else {
                throw dive;
            }
        }
        return "redirect:/listTypeOfRuns"
    }


    @RequestMapping("/editTypeOfRun", method = [RequestMethod.GET])
    @Secured("ROLE_ADMIN")
    fun editTypeOfRun(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            model.set("typeOfRun", typeOfRunService.findTypeOfRunById(id))
        } else {
            model.set("typeOfRun", typeOfRunService.createNewTypeOfRun())
        }
        return showEditTypeOfRunView(model)
    }

    fun showEditTypeOfRunView(model: Model): String {
        return "editTypeOfRun"
    }

}