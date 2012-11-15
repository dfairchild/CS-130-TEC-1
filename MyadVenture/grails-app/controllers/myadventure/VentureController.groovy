package myadventure

import org.springframework.dao.DataIntegrityViolationException

class VentureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ventureInstanceList: Venture.list(params), ventureInstanceTotal: Venture.count()]
    }

    def create() {
        [ventureInstance: new Venture(params)]
    }

    def save() {
        def ventureInstance = new Venture(params)
        if (!ventureInstance.save(flush: true)) {
            render(view: "create", model: [ventureInstance: ventureInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'venture.label', default: 'Venture'), ventureInstance.id])
        redirect(action: "show", id: ventureInstance.id)
    }

    def show(Long id) {
        def ventureInstance = Venture.get(id)
        if (!ventureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "list")
            return
        }

        [ventureInstance: ventureInstance]
    }

    def edit(Long id) {
        def ventureInstance = Venture.get(id)
        if (!ventureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "list")
            return
        }

        [ventureInstance: ventureInstance]
    }

    def update(Long id, Long version) {
        def ventureInstance = Venture.get(id)
        if (!ventureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ventureInstance.version > version) {
                ventureInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'venture.label', default: 'Venture')] as Object[],
                          "Another user has updated this Venture while you were editing")
                render(view: "edit", model: [ventureInstance: ventureInstance])
                return
            }
        }

        ventureInstance.properties = params

        if (!ventureInstance.save(flush: true)) {
            render(view: "edit", model: [ventureInstance: ventureInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'venture.label', default: 'Venture'), ventureInstance.id])
        redirect(action: "show", id: ventureInstance.id)
    }

    def delete(Long id) {
        def ventureInstance = Venture.get(id)
        if (!ventureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "list")
            return
        }

        try {
            ventureInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'venture.label', default: 'Venture'), id])
            redirect(action: "show", id: id)
        }
    }
}
