package opes.util

class ValidacionTipoArchivoService {

	def word = ["doc", "docx"]
	def wordMime = ["application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"]
	def pdf = ["pdf"]
	def pdfMime=["application/pdf"]
	def audio= ["mp3", "wav", "wma"]
	def audioMime=["audio/x-mpeg-3", "audio/wav", "audio/x-ms-wma"]
	def foto=["jpg","jpeg", "gif", "png", "jpe", "bmp"]
	def fotoMime=["image/jpeg", "image/jpeg", "image/gif", "image/png", "image/jpeg", "image/bmp" ]
	

	String isWord(String extension){
		extension = extension.toLowerCase()
		def index = word.indexOf(extension)+1
        log.info index
        log.info "MIME de la extension $extension"
        return index ? wordMime[index] : null
	}
	
	
	String isPdf(String extension){
		extension = extension.toLowerCase()
		def index = pdf.indexOf(extension)+1
        log.info pdfMime[index]
        log.info "MIME de la extension $extension"
        return index ? pdfMime[index] : null
	}
	
	
	String isAudio(String extension){
		extension = extension.toLowerCase()
		def index = audio.indexOf(extension)+1
        log.info index
        log.info "MIME de la extension $extension"
        return index ? audioMime[index] : null
	}
	
	String isFoto(String extension){
		extension = extension.toLowerCase()
		def index = foto.indexOf(extension)+1
        log.info fotoMime[index]
        log.info "MIME de la extension $extension"
        return fotoMime[index]
	}
	
	
}