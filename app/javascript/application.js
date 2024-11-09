// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import DashboardTabs from "./controllers/dashboard_tabs.js"
Stimulus.register("dashboard-tabs", DashboardTabs)
