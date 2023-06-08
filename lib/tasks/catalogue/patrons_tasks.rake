Rake::Task["db:sessions:clear"].clear
Rake::Task["db:sessions:trim"].clear

namespace "db:sessions" do
  desc "Clear the sessions table"
  task clear: :environment do
    ActionDispatch::Session::ActiveRecordStore.session_class.connection.execute "TRUNCATE TABLE #{ActionDispatch::Session::ActiveRecordStore.session_class.table_name}"
  end

  desc "Trim old sessions from the table (default: > 30 days)"
  task trim: :environment do
    cutoff_period = (ENV["SESSION_DAYS_TRIM_THRESHOLD"] || 30).to_i.days.ago
    ActionDispatch::Session::ActiveRecordStore.session_class
      .where("updated_at < ?", cutoff_period)
      .delete_all
  end
end
