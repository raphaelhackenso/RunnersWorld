package at.fhj.ima.runnersworld.runnersworld.entity

import java.time.LocalDate
import java.time.LocalTime
import java.io.Serializable
import javax.persistence.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
class Platform (
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,

        @OneToMany(fetch = FetchType.EAGER)
        var speedRuns: Set<SpeedRun>? = null,

        var name: String? = null




) : Comparable<Platform>, Serializable {
    override fun compareTo(other: Platform): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Platform
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}