package at.fhj.ima.runnersworld.runnersworld.converter


import at.fhj.ima.runnersworld.runnersworld.entity.TypeOfRun
import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import at.fhj.ima.runnersworld.runnersworld.repository.TypeOfRunRepository
import org.springframework.core.convert.converter.Converter
import org.springframework.stereotype.Component

@Component
class StringToTypeOfRunConverter(val typeOfRunRepository: TypeOfRunRepository) : Converter<String, TypeOfRun?> {
    override fun convert(source: String): TypeOfRun? {
        if (source.isNullOrBlank()) {
            return null
        }
        return typeOfRunRepository.getOne(Integer.parseInt(source));
    }
}
