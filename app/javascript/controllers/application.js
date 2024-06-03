import { Application } from "@hotwired/stimulus"
import { faker } from '@faker-js/faker';

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
