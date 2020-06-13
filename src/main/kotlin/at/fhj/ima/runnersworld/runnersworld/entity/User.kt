package at.fhj.ima.runnersworld.runnersworld.entity

import java.io.Serializable
import javax.persistence.*
import javax.validation.constraints.Size


enum class UserRole {
    ROLE_USER,
    ROLE_ADMIN
}

@Entity
@Table(uniqueConstraints = [UniqueConstraint(name = "username_UK", columnNames = ["username"])])
class User(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,
        @Column(nullable = false, unique = true)
        @field:Size(min=2, max=240)
        var username: String? = null,
        @field:Size(min=2, max=240)
        var password: String? = null,
        @Enumerated(EnumType.STRING)
        var role: UserRole? = null,


        @OneToMany(mappedBy = "runner")
        var speedruns: Set<Speedrun>? = null,

        @OneToMany
        var runValidations: Set<RunValidation>? = null


) : Comparable<User>, Serializable {
    override fun compareTo(other: User): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as User
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }

}