package minitetstes

import org.hibernate.criterion.Order
import org.springframework.dao.DataIntegrityViolationException

class MembroController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    //Por mim
    def listarOrdNome = {
        [membroInstanceList: Membro.list(sort: "nome", order: "asc"), membroInstanceTotal: Membro.count()]
    }

    def membsComCargXeTarfY = {
        [membroInstanceList: Membro.list(params), membroInstanceTotal: Membro.count()]
    }

    def doMembsComCargXeTarfY  = {
       // println(params.cargo)
    }

    //Retorna a quantidade de tarefas de cada Membro;
    def membrosQuantTarefas= {
        [membroInstanceList: Membro.list(params), membroInstanceTotal: Membro.count()]
    }
    //Fim de por mim


    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [membroInstanceList: Membro.list(params), membroInstanceTotal: Membro.count()]
    }

    def create() {
        [membroInstance: new Membro(params)]
    }

    def save() {
        def membroInstance = new Membro(params)
        if (!membroInstance.save(flush: true)) {
            render(view: "create", model: [membroInstance: membroInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'membro.label', default: 'Membro'), membroInstance.id])
        redirect(action: "show", id: membroInstance.id)
    }

    def show(Long id) {
        def membroInstance = Membro.get(id)
        if (!membroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'membro.label', default: 'Membro'), id])
            redirect(action: "list")
            return
        }

        [membroInstance: membroInstance]
    }

    def edit(Long id) {
        def membroInstance = Membro.get(id)
        if (!membroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'membro.label', default: 'Membro'), id])
            redirect(action: "list")
            return
        }

        [membroInstance: membroInstance]
    }

    def update(Long id, Long version) {
        def membroInstance = Membro.get(id)
        if (!membroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'membro.label', default: 'Membro'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (membroInstance.version > version) {
                membroInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'membro.label', default: 'Membro')] as Object[],
                        "Another user has updated this Membro while you were editing")
                render(view: "edit", model: [membroInstance: membroInstance])
                return
            }
        }

        membroInstance.properties = params

        if (!membroInstance.save(flush: true)) {
            render(view: "edit", model: [membroInstance: membroInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'membro.label', default: 'Membro'), membroInstance.id])
        redirect(action: "show", id: membroInstance.id)
    }

    def delete(Long id) {
        def membroInstance = Membro.get(id)
        if (!membroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'membro.label', default: 'Membro'), id])
            redirect(action: "list")
            return
        }

        try {
            membroInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'membro.label', default: 'Membro'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'membro.label', default: 'Membro'), id])
            redirect(action: "show", id: id)
        }
    }
}
