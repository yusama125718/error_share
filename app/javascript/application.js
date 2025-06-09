// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

import { Turbo } from "@hotwired/turbo-rails"
const { StreamActions } = Turbo

StreamActions.redirect = function(){
  const url = this.getAttribute("url")
  window.location = url
}