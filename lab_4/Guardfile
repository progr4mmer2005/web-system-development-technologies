guard :minitest, all_on_start: false, spring: false, test_file_patterns: %w[*_test.rb] do
  watch(%r{^test/.*_test\.rb$})
  watch("test/test_helper.rb") { "test" }
  watch("config/routes.rb") { "test" }
  watch("config/application.rb") { "test" }
  watch("Gemfile.lock") { "test" }
  watch(%r{^config/(environments|initializers)/.*\.rb$}) { "test" }

  watch(%r{^app/models/(.*?)\.rb$}) do |matches|
    "test/models/#{matches[1]}_test.rb"
  end

  watch(%r{^app/controllers/(.*?)_controller\.rb$}) do |matches|
    matches[1] == "application" ? "test" : resource_tests(matches[1])
  end

  watch(%r{^app/views/([^/]+)/.*\.html\.erb$}) do |matches|
    matches[1] == "layouts" ? "test" : resource_tests(matches[1])
  end

  watch(%r{^app/helpers/(.*?)_helper\.rb$}) do |matches|
    matches[1] == "application" ? "test" : resource_tests(matches[1])
  end
end

def resource_tests(resource)
  ["test/controllers/#{resource}_controller_test.rb"] +
    Dir["test/integration/#{resource}_*_test.rb"] +
    Dir["test/helpers/#{resource}_helper_test.rb"]
end
