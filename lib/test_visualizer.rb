require 'rubygems'
require 'thor'

SCALE = 20.0

# This gem helps visualize your test architecture.
class TestVisualizer < Thor
  desc 'viz', 'visualize your test architecture'
  def viz
    e2es = count_files(%w[system features])
    integrations = count_files(['integration'])
    units = count_files(%w[models
                           controllers
                           helpers
                           channels
                           mailers])

    print_results(e2es, integrations, units)
  end

  desc 'print_results', 'print your results'
  def print_results(e2es, integrations, units)
    max = [e2es, integrations, units].max

    scale_factor = 1
    scale_factor = SCALE / max.to_f if max > SCALE

    scaled_e2es = e2es * scale_factor
    scaled_integrations = integrations * scale_factor
    scaled_units = units * scale_factor
    scaled_max = max * scale_factor

    <<~RESULT
      Results:
      --------

      #{print_layer(scaled_e2es, (scaled_max - scaled_e2es) / 2)}
      #{print_layer(scaled_integrations, (scaled_max - scaled_integrations) / 2)}
      #{print_layer(scaled_units, (scaled_max - scaled_units) / 2)}

      E2E tests (#{e2es})
      Integration tests (#{integrations})
      Unit tests (#{units})
    RESULT
  end

  private

  def count_files(dir_names)
    matches = []
    dir_names.each do |dir|
      tests = Dir.glob("**/#{dir}/**/*{_test.rb,test.rb}")
      specs = Dir.glob("**/#{dir}/**/*{_spec.rb,spec.rb}")
      features = Dir.glob("**/#{dir}/**/*{.feature}")

      matches.concat(tests, specs, features)
    end

    matches.count
  end

  def print_layer(count, padding)
    "#{' ' * padding}#{'*' * count}"
  end
end
