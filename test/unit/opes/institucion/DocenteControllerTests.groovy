package opes.institucion



import org.junit.*
import grails.test.mixin.*

@TestFor(DocenteController)
@Mock(Docente)
class DocenteControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/docente/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.docenteInstanceList.size() == 0
        assert model.docenteInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.docenteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.docenteInstance != null
        assert view == '/docente/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/docente/show/1'
        assert controller.flash.message != null
        assert Docente.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/docente/list'


        populateValidParams(params)
        def docente = new Docente(params)

        assert docente.save() != null

        params.id = docente.id

        def model = controller.show()

        assert model.docenteInstance == docente
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/docente/list'


        populateValidParams(params)
        def docente = new Docente(params)

        assert docente.save() != null

        params.id = docente.id

        def model = controller.edit()

        assert model.docenteInstance == docente
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/docente/list'

        response.reset()


        populateValidParams(params)
        def docente = new Docente(params)

        assert docente.save() != null

        // test invalid parameters in update
        params.id = docente.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/docente/edit"
        assert model.docenteInstance != null

        docente.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/docente/show/$docente.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        docente.clearErrors()

        populateValidParams(params)
        params.id = docente.id
        params.version = -1
        controller.update()

        assert view == "/docente/edit"
        assert model.docenteInstance != null
        assert model.docenteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/docente/list'

        response.reset()

        populateValidParams(params)
        def docente = new Docente(params)

        assert docente.save() != null
        assert Docente.count() == 1

        params.id = docente.id

        controller.delete()

        assert Docente.count() == 0
        assert Docente.get(docente.id) == null
        assert response.redirectedUrl == '/docente/list'
    }
}
