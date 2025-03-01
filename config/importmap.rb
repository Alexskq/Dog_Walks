# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "flatpickr" # @4.6.13
pin "flatpickr", to: "https://unpkg.com/flatpickr@4.6.13/dist/esm/index.js"
# pin 'flatpickr/l10n/fr',
#     to: 'https://cdn.jsdelivr.net/npm/flatpickr@4.6.13/dist/l10n/fr.js'
pin "flatpickr/dist/l10n/fr.js", to: "flatpickr--dist--l10n--fr.js.js" # @4.6.13
pin "mapbox-gl", to: "https://ga.jspm.io/npm:mapbox-gl@3.1.2/dist/mapbox-gl.js"

pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.1.0/nodelibs/browser/process-production.js"
