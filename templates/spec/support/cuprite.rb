require "capybara/cuprite"

Capybara.javascript_driver = :cuprite

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    window_size: [1200, 800],
    timeout: 10,
    headless: ENV.fetch("CUPRITE_HEADLESS", true),
    js_errors: ENV.fetch("CUPRITE_JS_ERRORS", false)
  )
end
