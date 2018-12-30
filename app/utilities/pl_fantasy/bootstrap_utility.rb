require "#{Rails.root}/app/utilities/pl_fantasy/connection_utility.rb"

module PLFantasy
  module BootstrapUtility
    class Bootstrap
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /bootstrap
      def bootstrap(write)
        options = {
          write: write,
          response: api_connection.connection.get('bootstrap'),
          filename: "bootstrap_#{DateTime.current}"
        }

        write_or_display_data(options)
      end

      # Endpoint: /bootstrap-static
      def bootstrap_static(write)
        options = {
          write: write,
          response: api_connection.connection.get('bootstrap-static'),
          filename: "bootstrap-static_#{DateTime.current}"
        }

        write_or_display_data(options)
      end

      private

      def write_to_json(filename, response)
        File.open("#{Rails.root}/raw_data/json_files/pl_fantasy_data/pulled_data/bootstrap/#{filename}.json","w") do |f|
          f.write(response.force_encoding("UTF-8"))
        end
      end

      def write_or_display_data(options={})
        options[:write] == true ? write_to_json(options[:filename], options[:response].body) : JSON.parse(options[:response].body)
      end
    end
  end
end
