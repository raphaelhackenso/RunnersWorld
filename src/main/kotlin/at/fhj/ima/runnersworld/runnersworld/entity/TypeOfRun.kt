package at.fhj.ima.runnersworld.runnersworld.entity

import java.io.Serializable
import javax.persistence.*
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.validation.constraints.NotEmpty
import javax.validation.constraints.NotNull

@Entity
class TypeOfRun (
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,
        @field:NotEmpty()
        @field:NotNull()
        var category: String? = null





) : Comparable<TypeOfRun>, Serializable {
    override fun compareTo(other: TypeOfRun): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as TypeOfRun
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}