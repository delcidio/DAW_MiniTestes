package minitetstes

class Membro {

    String nome
    String cargo
    String username
    String password

    static hasMany = [tarefas: Tarefa]

    static constraints = {
        tarefas  nullable: true // pode ser null
        password size: 5..15, blank: false, password: true
    }

    // Modificando o modo como a representação textual é gerada
    String toString() {
        this.username
    }
}
