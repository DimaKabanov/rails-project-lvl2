// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "bootstrap/dist/css/bootstrap.min.css"
import Rails from "@rails/ujs"
import 'bootstrap/dist/js/bootstrap';
import "@fortawesome/fontawesome-free/css/all.min.css"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"

Rails.start()
// Turbolinks.start()
// ActiveStorage.start()
const images = require.context('../images', true);
