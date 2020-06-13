package at.fhj.ima.runnersworld.runnersworld.converter


import at.fhj.ima.runnersworld.runnersworld.entity.RunValidation
import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import at.fhj.ima.runnersworld.runnersworld.repository.RunValidationRepository
import org.springframework.core.convert.converter.Converter
import org.springframework.stereotype.Component

@Component
class StringToRunValidationConverter(val runValidationRepository: RunValidationRepository) : Converter<String, RunValidation?> {
    override fun convert(source: String): RunValidation? {
        if (source.isNullOrBlank()) {
            return null
        }
        return runValidationRepository.getOne(Integer.parseInt(source));
    }
}
