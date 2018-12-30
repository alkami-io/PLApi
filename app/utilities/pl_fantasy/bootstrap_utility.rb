require "#{Rails.root}/app/utilities/pl_fantasy/connection_utility.rb"

module PLFantasy
  module BootstrapUtility
    class Bootstrap
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionUtility::ApiConnection.new
      end

      def bootstrap(write)
        response = api_connection.connection.get('bootstrap')
        filename = "bootstrap_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      def bootstrap_static(write)
        response = api_connection.connection.get('bootstrap-static')
        filename = "bootstrap-static_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      def write_to_json(filename, response)
        File.open("#{Rails.root}/raw_data/json_files/pl_fantasy_data/pulled_data/bootstrap/#{filename}.json","w") do |f|
          f.write(response.force_encoding("UTF-8"))
        end
      end
    end
  end
end
