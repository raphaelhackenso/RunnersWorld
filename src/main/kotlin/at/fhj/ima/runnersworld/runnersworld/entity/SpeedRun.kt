package at.fhj.ima.runnersworld.runnersworld.entity

import java.io.Serializable
import java.time.LocalDate
import java.time.LocalTime
import javax.persistence.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id


@Entity
class SpeedRun (

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,

    @ManyToOne(fetch = FetchType.EAGER)
    var game: Game? = null,

    //@ManyToOne
    //var platform: Platform? = null,

    @ManyToOne(fetch = FetchType.EAGER)
    var runner: User? = null,

    var inGameTime: LocalTime? = null,
    var gameVersion: Double? = null,
    var validationURL: String? = null,
    var notes: String? = null,
    var date: LocalDate? = null,
    var state: String? = null

    //@OneToOne
    //var runValidation: RunValidation? = null,

    //@ManyToOne(fetch = FetchType.EAGER)
    //var typeOfRun: TypeOfRun? = null


) : Comparable<SpeedRun>, Serializable {
    override fun compareTo(other: SpeedRun): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as SpeedRun
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}