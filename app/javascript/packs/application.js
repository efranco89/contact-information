// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// The following configurations are for Bootstrap
// more info https://matthewhoelter.com/2021/08/13/how-to-install-bootstrap-5-in-ruby-on-rails-6-with-webpack.html
require("@popperjs/core")
import "bootstrap"
// Import the specific modules you may need (Modal, Alert, etc)
import { Tooltip, Popover } from "bootstrap"
// The stylesheet location we created earlier
require("../stylesheets/application.scss")
require("../stylesheets/styles.css")

// for the application layout
require("../stylesheets/dashboard.css")
require("../stylesheets/dashboard.rtl.css")
// for fontawesome icons
import "@fortawesome/fontawesome-free/css/all"



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
