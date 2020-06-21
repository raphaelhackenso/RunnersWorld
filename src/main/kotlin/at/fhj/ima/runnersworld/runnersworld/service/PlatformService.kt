package at.fhj.ima.runnersworld.runnersworld.service

import at.fhj.ima.runnersworld.runnersworld.entity.Platform
import at.fhj.ima.runnersworld.runnersworld.repository.PlatformRepository
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional


@Service
class PlatformService(val platformRepository: PlatformRepository) {

    fun findAll(): List<Platform> {
        return platformRepository.findAll()
    }

    fun findPlatformById(id: Int): Platform {
        return platformRepository.findPlatformById(id)
    }

    fun createNewPlatform(): Platform {
        val newPlatform = Platform()
        return newPlatform
    }

    @Transactional
    fun save(platform: Platform) {
        platformRepository.save(platform)
    }

    fun findPlatformByName(search: String): List<Platform> {
        return platformRepository.findPlatformByName(search)
    }


}
