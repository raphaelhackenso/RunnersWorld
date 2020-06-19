package at.fhj.ima.runnersworld.runnersworld.controller

import at.fhj.ima.runnersworld.runnersworld.dto.SpeedRunDto
import at.fhj.ima.runnersworld.runnersworld.entity.Game
import at.fhj.ima.runnersworld.runnersworld.entity.Speedrun
import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import at.fhj.ima.runnersworld.runnersworld.repository.PlatformRepository
import at.fhj.ima.runnersworld.runnersworld.repository.TypeOfRunRepository
import at.fhj.ima.runnersworld.runnersworld.service.GameService
import at.fhj.ima.runnersworld.runnersworld.service.PlatformService
import at.fhj.ima.runnersworld.runnersworld.service.RunValidationService
import at.fhj.ima.runnersworld.runnersworld.service.SpeedRunService
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.data.domain.Sort
import org.springframework.security.authentication.AnonymousAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
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
class SpeedRunController(val speedRunService: SpeedRunService, val gameService: GameService,
                         val platformService: PlatformService, val typeOfRunRepository: TypeOfRunRepository,
                         val runValidationService: RunValidationService
) {

    //TODO -> update to be used with Services

    @RequestMapping("/addSpeedRun", method = [RequestMethod.GET])
    fun addSpeedRun(model: Model): String {
        //model.addAttribute("speedrun", speedRunService.createNewSpeedRun())
        model.set("speedrun", speedRunService.createNewSpeedRun())
        return showAddSpeedRunView(model)
    }

    fun showAddSpeedRunView(model: Model): String {
        showListSpeedrun(model)
        return "addSpeedRun"
    }


    @RequestMapping("/listSpeedRuns", method = [RequestMethod.GET])
    fun listSpeedRuns(model: Model): String {
        showListSpeedrun(model)
        return "listSpeedRuns"
    }


    @RequestMapping("rankSpeedrun", method = [RequestMethod.GET])
    fun rankSpeedrun(model: Model, @RequestParam("game", required = false) game: Int?,
                     @RequestParam("typeOfRun", required = false) typeOfRun: Int?,
                     @RequestParam("platform", required = false) platform: Int?): String {

        val searchContitions = listOf<Int?>(game, typeOfRun, platform)


        if (!searchContitions.contains(null)) {
            // Why does IntelliJ require the Elvis operator, even though it can never be null ?
            val resultSpeedruns = speedRunService.rankSpeedRuns(game ?: 0, typeOfRun ?: 0, platform ?: 0)

            if (resultSpeedruns.isEmpty()) {
                setWariningNoSpeedruns(model)
            } else {
                model.set("rankSpeedRuns", resultSpeedruns)
            }

        } else {
            setWariningNoSpeedruns(model)
        }

        showListSpeedrun(model)

        val auth = SecurityContextHolder.getContext().authentication
        if (auth is AnonymousAuthenticationToken || auth == null) {
            return "aSpeedRuns"
        } else {
            return "listSpeedRuns"
        }

    }


    fun setWariningNoSpeedruns(model: Model) {
        model.set("warningMessage", "Für diese Kombination sind noch keine Speedruns vorhanden")
    }

    fun showListSpeedrun(model: Model) {
        model.set("games", gameService.findAll())
        model.set("platforms", platformService.findAll())
        model.set("typeOfRuns", typeOfRunRepository.findAll()) //TODO update for service
        model.set("speedRunsNew", speedRunService.findNewestValid("validated", 15))
    }


    @RequestMapping("/saveNewSpeedRun", method = [RequestMethod.POST])
    fun saveNewSpeedRun(@ModelAttribute("speedrun") @Valid speedrun: SpeedRunDto, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return showAddSpeedRunView(model)
        }
        try {

            runValidationService.save(runValidationService.createNewRunValidation(speedRunService.convertDtoToEntity(speedrun)))

        } catch (dive: DataIntegrityViolationException) {
            throw dive;
        }

        return "redirect:/displayUser"
    }


}