namespace :db do
  namespace :migrate do
    desc 'Execute SQL directly against the database'
    task :with_sql, [:sql] => :environment do |t, args|
      ActiveRecord::Base.connection.execute(args[:sql])
    end
  end
end
