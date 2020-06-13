package at.fhj.ima.runnersworld.runnersworld.converter


import at.fhj.ima.runnersworld.runnersworld.entity.Platform
import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import at.fhj.ima.runnersworld.runnersworld.repository.PlatformRepository
import org.springframework.core.convert.converter.Converter
import org.springframework.stereotype.Component

@Component
class StringToPlatformConverter(val platformRepository: PlatformRepository) : Converter<String, Platform?> {
    override fun convert(source: String): Platform? {
        if (source.isNullOrBlank()) {
            return null
        }
        return platformRepository.getOne(Integer.parseInt(source));
    }
}
