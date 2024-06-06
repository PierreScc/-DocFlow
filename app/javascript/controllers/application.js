import { Application } from "@hotwired/stimulus"
import { faker } from '@faker-js/faker';
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
