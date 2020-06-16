package at.fhj.ima.runnersworld.runnersworld.converter

import org.springframework.core.convert.converter.Converter
import org.springframework.stereotype.Component
import java.time.LocalTime
import java.time.format.DateTimeFormatter

@Component
class SpringToTimeConverter : Converter<String?, LocalTime?> {
    override fun convert(source: String): LocalTime? {
        if (source.isNullOrBlank()) {
            return null
        }
        return LocalTime.parse(source, DateTimeFormatter.ISO_LOCAL_TIME);
    }

}