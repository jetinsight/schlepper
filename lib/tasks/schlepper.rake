namespace :schlepper do
  desc 'Run all pending Schlepper tasks'
  task run: :environment do
    Schlepper::Process.new.run_all
  end

  desc 'Run a single Schlepper task by version number (e.g. rake schlepper:run_one[20231015120000])'
  task :run_one, [:version] => :environment do |_, args|
    raise ArgumentError, 'A version number is required (e.g. rake schlepper:run_one[20231015120000])' if args[:version].blank?
    Schlepper::Process.new.run_one(args[:version])
  end
end
