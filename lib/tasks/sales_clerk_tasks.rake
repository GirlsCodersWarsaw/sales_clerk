
namespace :db do
desc "Load sample english shop database"
task fixtures: :environment do
  require 'active_record/fixtures'
  fixtures_dir = File.join(Rails.root, '/spec/fixtures/en')
  Dir.glob(File.join(fixtures_dir,'*.yml')).each do |file|
    base_name = File.basename(file, '.*')
    puts "Loading #{base_name}..."
    ActiveRecord::Fixtures.create_fixtures(fixtures_dir, base_name)
  end
end
end

namespace :db do
  desc "Load sample finnish shop database"
  task finnish_fixtures: :environment do
    require 'active_record/fixtures'
    fixtures_dir = File.join(Rails.root, '/spec/fixtures/fi')
    Dir.glob(File.join(fixtures_dir,'*.yml')).each do |file|
      base_name = File.basename(file, '.*')
      puts "Loading #{base_name}..."
      ActiveRecord::Fixtures.create_fixtures(fixtures_dir, base_name)
    end
  end
end