// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

function SearchVersion(){
  const element = document.getElementById("error_content_version_id")
  fetch('/error/versions?version=' + element.value, {
    headers: {
      'Accept': 'text/vnd.turbo-stream.html'
    }
  })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html));
}

import { Turbo } from "@hotwired/turbo-rails"
const { StreamActions } = Turbo

StreamActions.redirect = function(){
  const url = this.getAttribute("url")
  window.location = url
}