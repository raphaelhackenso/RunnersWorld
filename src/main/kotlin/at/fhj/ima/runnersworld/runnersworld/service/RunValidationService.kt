package at.fhj.ima.runnersworld.runnersworld.service


import at.fhj.ima.runnersworld.runnersworld.dto.SpeedRunDto
import at.fhj.ima.runnersworld.runnersworld.entity.RunValidation
import at.fhj.ima.runnersworld.runnersworld.entity.Speedrun
import at.fhj.ima.runnersworld.runnersworld.entity.User
import at.fhj.ima.runnersworld.runnersworld.repository.RunValidationRepository
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class RunValidationService(val runValidationRepository: RunValidationRepository) {

    fun createNewRunValidation(inputSpeedrun: Speedrun): RunValidation {
        return RunValidation(
                speedrun = inputSpeedrun,
                status = inputSpeedrun.state
        )
    }

    fun createNewEmptyRunValidation(): RunValidation {
        return RunValidation()
    }


    @Transactional
    fun save(runValidation: RunValidation) {
        runValidationRepository.save(runValidation)
    }


    fun findAll(): List<RunValidation> {
        return runValidationRepository.findAll()
    }

    fun findByRunValidationId(search: String): List<RunValidation> {
        return runValidationRepository.findByRunValidationId(search)
    }

    fun findAllPending(): List<RunValidation> {
        return runValidationRepository.findAllPending()
    }

    fun findByRunId(id: Int): RunValidation {
        return runValidationRepository.findByRunId(id)
    }


}