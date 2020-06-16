package at.fhj.ima.runnersworld.runnersworld.service


import at.fhj.ima.runnersworld.runnersworld.dto.SpeedRunDto
import at.fhj.ima.runnersworld.runnersworld.entity.Speedrun
import at.fhj.ima.runnersworld.runnersworld.entity.User
import at.fhj.ima.runnersworld.runnersworld.repository.SpeedRunRepository
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class SpeedRunService(val speedRunRepository: SpeedRunRepository) {

    fun createNewSpeedRun(): SpeedRunDto {
        val newSpeedRun = Speedrun()
        return convertEntityToDto(newSpeedRun)
    }


    @Transactional
    fun save(dto: SpeedRunDto) {
        speedRunRepository.save(convertDtoToEntity(dto))
    }

    @Transactional
    fun saveValidDeny(speedrun: Speedrun){
        speedRunRepository.save(speedrun)
    }


    private fun convertEntityToDto(entity: Speedrun): SpeedRunDto {
        return SpeedRunDto(entity.id, entity.game, entity.platform, entity.inGameTime, entity.validationURL, entity.notes, entity.date, entity.typeOfRun, entity.runner)
    }


    fun convertDtoToEntity(dto: SpeedRunDto): Speedrun {
        val speedRun = Speedrun()
        speedRun.id = dto.id
        speedRun.game = dto.game
        speedRun.platform = dto.platform
        speedRun.inGameTime = dto.inGameTime
        speedRun.validationURL = dto.validationURL
        speedRun.notes = dto.notes
        speedRun.date = dto.date
        speedRun.typeOfRun = dto.typeOfRun
        speedRun.runner = dto.runner

        speedRun.state = "pending"

        //TODO runValidation

        return speedRun
    }


    fun findAll(): List<Speedrun> {
        return speedRunRepository.findAll(Sort.by(Sort.Direction.ASC, "inGameTime"))
    }

    fun findBySpeedrunId(id: Int): Speedrun {
        return speedRunRepository.findBySpeedrunId(id)
    }


}