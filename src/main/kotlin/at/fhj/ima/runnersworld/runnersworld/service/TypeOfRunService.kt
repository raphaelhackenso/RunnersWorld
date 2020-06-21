package at.fhj.ima.runnersworld.runnersworld.service

import at.fhj.ima.runnersworld.runnersworld.entity.TypeOfRun
import at.fhj.ima.runnersworld.runnersworld.repository.TypeOfRunRepository
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional


@Service
class TypeOfRunService(val typeOfRunRepository: TypeOfRunRepository) {


    fun findAll(): List<TypeOfRun> {
        return typeOfRunRepository.findAll()
    }

    fun findTypeOfRunById(id: Int): TypeOfRun {
        return typeOfRunRepository.findTypeOfRunById(id)
    }

    fun createNewTypeOfRun(): TypeOfRun {
        val newTypeOfRun = TypeOfRun()
        return newTypeOfRun
    }

    @Transactional
    fun save(typeOfRun: TypeOfRun) {
        typeOfRunRepository.save(typeOfRun)
    }

    fun findTypeOfRunByName(search: String): List<TypeOfRun> {
        return typeOfRunRepository.findTypeOfRunByName(search)
    }


}