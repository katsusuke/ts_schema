require "rake"
require "ts_schema"

namespace :ts_schema do
  desc "Generates a schema file in the default javascripts location, or the location specified in the ts_config initializer options"
  task generate: :environment do
    TsSchema.output_file
  end
end

namespace :db do
  def auto_generate_and_save_file
    TsSchema.output_file if TsSchema.configuration.auto_generate
    puts "generated"
  end

  task :migrate do
    at_exit { auto_generate_and_save_file }
  end
end
