package minitetstes

import org.springframework.dao.DataIntegrityViolationException

class TarefaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    //***********************Acrescimo*******************
    def buscaTarefasDoMembro = {
        [tarefaInstanceTotal: Tarefa.count()]
    }

    def doBuscaTarefasDoMembro = {
        def regra = Tarefa.where {
            eq('membro', Membro.findById(params.membro))
        }
        def results = regra.findAll()
        [tarefaInstanceList: results, tarefaInstanceTotal: Tarefa.count()]
    }

    def buscaTarefaUmadata = { }

    def doBuscaTarefaUmadata = {
        def regra = Tarefa.where {
            prazo == params.data  //params.data eh a data trazida do formulario da view 'buscaTarefaUmadata'
        }
        Tarefa results = regra.find()
       /*
       def results = Tarefa.withCriteria {
            eq('prazo', params.query)
        }
       //Tambem funciona
       */
        [tarefaInstanceList: results, tarefaInstanceTotal: Tarefa.count()]
    }

    def listarEntre2datas = {
       [tarefaInstanceTotal: Tarefa.count()]
    }   //a action “listarEntre2datas” eh apenas para redirecionar para o arquivo “.../views/Tarefa/listarEntre2datas.gsp”.

    //Adicionei este metodo e sua respectiva view
    def doListarEntre2Datas() {

        def results = Tarefa.withCriteria {
            between('prazo', params.data1, params.query)
        }

        [tarefaInstanceList: results, tarefaInstanceTotal: Tarefa.count()]
    }

    def tarefasMembroCargo = {

    }

    def dotarefasMembroCargo = {

    }
       /////////////////////////////////
    //Fim de Acrescimo

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tarefaInstanceList: Tarefa.list(params), tarefaInstanceTotal: Tarefa.count()]
    }

    def create() {
        [tarefaInstance: new Tarefa(params)]
    }

    def save() {
        def tarefaInstance = new Tarefa(params)
        if (!tarefaInstance.save(flush: true)) {
            render(view: "create", model: [tarefaInstance: tarefaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), tarefaInstance.id])
        redirect(action: "show", id: tarefaInstance.id)
    }

    def show(Long id) {
        def tarefaInstance = Tarefa.get(id)
        if (!tarefaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), id])
            redirect(action: "list")
            return
        }

        [tarefaInstance: tarefaInstance]
    }

    def edit(Long id) {
        def tarefaInstance = Tarefa.get(id)
        if (!tarefaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), id])
            redirect(action: "list")
            return
        }

        [tarefaInstance: tarefaInstance]
    }

    def update(Long id, Long version) {
        def tarefaInstance = Tarefa.get(id)
        if (!tarefaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tarefaInstance.version > version) {
                tarefaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tarefa.label', default: 'Tarefa')] as Object[],
                          "Another user has updated this Tarefa while you were editing")
                render(view: "edit", model: [tarefaInstance: tarefaInstance])
                return
            }
        }

        tarefaInstance.properties = params

        if (!tarefaInstance.save(flush: true)) {
            render(view: "edit", model: [tarefaInstance: tarefaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), tarefaInstance.id])
        redirect(action: "show", id: tarefaInstance.id)
    }

    def delete(Long id) {
        def tarefaInstance = Tarefa.get(id)
        if (!tarefaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), id])
            redirect(action: "list")
            return
        }

        try {
            tarefaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), id])
            redirect(action: "show", id: id)
        }
    }
}

