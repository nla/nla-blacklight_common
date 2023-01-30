module Catalogue
  module Patrons
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("templates", __dir__)

      def copy_migrations
        if Dir.exist? "../../../../../../db/patrons_migrate"
          Dir.foreach("db/patrons_migrate") do |file|
            next if file == "." || file == ".."
            copy_migration File.basename(file, ".*")
          end
        else
          directory("../../../../../../db/patrons_migrate", "db/patrons_migrate")
        end
      end

      private

      def copy_migration(filename)
        puts filename
        if self.class.migration_exists?("db/patrons_migrate", filename.to_s)
          say_status("skipped", "Migration #{filename}.rb already exists")
        else
          template("migrations/#{filename}.rb", "db/patrons_migrate/#{filename}.rb")
        end
      end
    end
  end
end
