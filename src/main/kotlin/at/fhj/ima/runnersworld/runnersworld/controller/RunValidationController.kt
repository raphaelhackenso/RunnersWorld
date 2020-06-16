package at.fhj.ima.runnersworld.runnersworld.controller

import at.fhj.ima.runnersworld.runnersworld.entity.Speedrun
import at.fhj.ima.runnersworld.runnersworld.entity.User
import at.fhj.ima.runnersworld.runnersworld.repository.RunValidationRepository
import at.fhj.ima.runnersworld.runnersworld.service.RunValidationService
import at.fhj.ima.runnersworld.runnersworld.service.SpeedRunService
import at.fhj.ima.runnersworld.runnersworld.service.UserService
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import javax.validation.Valid

@Controller
class RunValidationController(val runValidationService: RunValidationService,
                              val userService: UserService,
                              val speedRunService: SpeedRunService) {


    @RequestMapping("/listRunValidations", method = [RequestMethod.GET])
    @Secured("ROLE_ADMIN")
    fun listRunValidations(model: Model, @RequestParam(required = false) search: String?): String {
        if (search != null) {
            //TODO search
            model.set("runValidations", runValidationService.findByRunValidationId(search))
        } else {
            model.set("runValidations", runValidationService.findAllPending())
        }
        return "listRunValidations"
    }

    @RequestMapping("/validateRunValidation", method = [RequestMethod.POST])
    @Secured("ROLE_ADMIN")
    fun validateRunValidation(model: Model, @RequestParam("id") id: Int, @RequestParam("validatedBy") validatedBy: Int): String {
        var runValidation = runValidationService.findByRunId(id)
        var validSpeedrun = runValidation.speedrun
        val validator = userService.findByUserId(validatedBy)

        runValidation.status = "validated"
        runValidation.validatedBy = validator

        validSpeedrun?.state = "validated"

        try {
            runValidationService.save(runValidation)
            speedRunService.saveValidDeny(validSpeedrun ?: Speedrun())

        } catch (dive: DataIntegrityViolationException) {
            throw dive
        }

        model.set("message", "Speedrun Nr ${runValidation.speedrun?.id} wurde erfolgreich von ${validator.username} validiert")
        return listRunValidations(model, null)
    }


    @RequestMapping("/denyRunValidation", method = [RequestMethod.POST])
    @Secured("ROLE_ADMIN")
    fun denyRunValidation(model: Model, @RequestParam("id") id: Int, @RequestParam("validatedBy") validatedBy: Int): String {
        var runValidation = runValidationService.findByRunId(id)
        var deniedSpeedrun = runValidation.speedrun
        val validator = userService.findByUserId(validatedBy)

        runValidation.status = "denied"
        runValidation.validatedBy = validator

        deniedSpeedrun?.state = "denied"

        try {
            runValidationService.save(runValidation)
            speedRunService.saveValidDeny(deniedSpeedrun ?: Speedrun())

        } catch (dive: DataIntegrityViolationException) {
            throw dive
        }

        model.set("errorMessage", "Speedrun Nr ${runValidation.speedrun?.id} wurde von ${validator.username} anulliert")
        return listRunValidations(model, null)
    }

}