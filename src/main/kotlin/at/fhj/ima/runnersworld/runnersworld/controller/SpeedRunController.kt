package at.fhj.ima.runnersworld.runnersworld.controller

import at.fhj.ima.runnersworld.runnersworld.dto.SpeedRunDto
import at.fhj.ima.runnersworld.runnersworld.dto.UserDto
import at.fhj.ima.runnersworld.runnersworld.entity.User
import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import at.fhj.ima.runnersworld.runnersworld.repository.PlatformRepository
import at.fhj.ima.runnersworld.runnersworld.repository.SpeedRunRepository
import at.fhj.ima.runnersworld.runnersworld.repository.TypeOfRunRepository
import at.fhj.ima.runnersworld.runnersworld.service.SpeedRunService
import at.fhj.ima.runnersworld.runnersworld.service.UserService
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.data.domain.Sort
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
class SpeedRunController(val speedRunService: SpeedRunService, val gameRepository: GameRepository,
                         val platformRepository: PlatformRepository, val typeOfRunRepository: TypeOfRunRepository
) {

    //TODO -> update to be used with Services

    @RequestMapping("/addSpeedRun", method = [RequestMethod.GET])
    fun addSpeedRun(model: Model): String {
        //model.addAttribute("speedrun", speedRunService.createNewSpeedRun())
        model.set("speedrun", speedRunService.createNewSpeedRun())
        return showAddSpeedRunView(model)
    }

    fun showAddSpeedRunView(model: Model): String {
        model.set("games", gameRepository.findAll())
        model.set("platforms", platformRepository.findAll())
        model.set("typeOfRuns", typeOfRunRepository.findAll())
        return "addSpeedRun"
    }


    @RequestMapping("/listSpeedRuns", method = [RequestMethod.GET])
    fun listSpeedRuns(model: Model, @RequestParam(required = false) search: String?): String {
        if (search != null) {
            //TODO search
            //model.set("speedRuns", speedRunRepository.findByTypeOfRun(search))
        } else {
            //model.set("speedRuns", speedRunRepository.findAll(Sort.by(Sort.Direction.ASC, "inGameTime")))
            model.set("speedRuns", speedRunService.findAll())
        }
        return "listSpeedRuns"
    }


    @RequestMapping("/saveNewSpeedRun", method = [RequestMethod.POST])
    fun saveNewSpeedRun(@ModelAttribute("speedrun") @Valid speedrun: SpeedRunDto, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return showAddSpeedRunView(model)
        }
        try {
            //speedRunService.save(speedrun?: SpeedRunDto())
            //model.set("message", "User ${user.username} ")

            //return addSpeedRun(model)
            //speedRunService.save( (speedRunService.convertDtoToEntity(speedrun, user)) )
            speedRunService.save(speedrun)

        } catch (dive: DataIntegrityViolationException) {
            if (dive.message.orEmpty().contains("username_UK")) {
                bindingResult.rejectValue("username", "username.alreadyInUse", "Username bereits vergeben");
                return showAddSpeedRunView(model)
            } else {
                throw dive;
            }
        }

        return "redirect:/displayUser"

    }


}