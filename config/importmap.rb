# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-autocomplete", to: "https://cdn.jsdelivr.net/npm/stimulus-autocomplete@3.0.2/src/autocomplete.min.js"

pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.4.1/dist/chart.js"
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.2
