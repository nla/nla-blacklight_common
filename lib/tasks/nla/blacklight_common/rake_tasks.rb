module Nla
  module BlacklightCommon
    module RakeTasks
      Dir[File.expand_path(File.join(File.dirname(__FILE__), "tasks/*.rake"))].each { |ext| load ext } if defined?(Rake)
    end
  end
end
