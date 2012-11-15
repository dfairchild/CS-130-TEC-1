package myadventure

import uk.co.desirableobjects.oauth.scribe.OauthService
import org.scribe.model.Token

class linkedInService {

	boolean transactional = false

	def apiUrl = 'http://api.linkedin.com/v1/people/~'
	
	
	def apiKey = 'x07lieazci3p'
	def apiSecret = 'boT6wtTd2yg1i1Ld'
	def userToken = 'f12fa618-7f4a-4ec3-a255-38291149ae3c'
	def userSecret = '4636ea72-1314-42e9-b8a3-2561184e4f46'
	
	OauthService oauthService
	
	//connect to LinkedIn with user entered profile information	
    def connectToLinkedIn() {
		//first pass -- retrieve your own profile
		Token linkedInAccessToken = session[oauthService.findSessionKeyForAccessToken('linkedin')]
		
		//set up result as an empty hashmap
		def result = [:]
		
		//get response from call 
		def response = oauthService.postLinkedInResource(linkedInAccessToken, 'https://api.linkedin.com/v1/people/~')
		/*def slurper = new XmlSlurper().parseTest(response)
		result.first_name = slurper.person.first-name as String
		result.last_name = slurper.person.last-name as String
		
		result.email = "a@a.com"
		result.password = "12345"*/
		
    }
}
