package at.fhj.ima.runnersworld.runnersworld.converter

import at.fhj.ima.runnersworld.runnersworld.entity.Game
import at.fhj.ima.runnersworld.runnersworld.repository.GameRepository
import org.springframework.core.convert.converter.Converter
import org.springframework.stereotype.Component

@Component
class StringToGameConverter(val gameRepository: GameRepository) : Converter<String, Game?> {
    override fun convert(source: String): Game? {
        if (source.isNullOrBlank()) {
            return null
        }
        return gameRepository.getOne(Integer.parseInt(source));
    }
}
