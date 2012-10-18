package opes.institucion

class AlumnosCursos {

    Alumno alumno
    Curso curso

    static AlumnosCursos link(alumno, curso) {
        def alumnosCursos = AlumnosCursos.findByAlumnoAndCurso(alumno, curso)
        if (!alumnosCursos) {
            alumnosCursos = new AlumnosCursos()
            alumno?.addToAlumnosCursos(alumnosCursos)
            curso?.addToAlumnosCursos(alumnosCursos)
            alumnosCursos.save()
        }
        return alumnosCursos
    }

    static void unlink(alumno, curso) {
        def alumnosCursos = AlumnosCursos.findByAlumnoAndCurso(alumno, curso)
        if (alumnosCursos) {
            alumno?.removeFromAlumnosCursos(alumnosCursos)
            curso?.removeFromAlumnosCursos(alumnosCursos)
            alumnosCursos.delete()
        }
    }
}
