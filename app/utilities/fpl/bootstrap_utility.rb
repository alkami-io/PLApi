require "#{Rails.root}/app/utilities/fpl/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module FPL
  module BootstrapUtility
    class Bootstrap
      include CoreUtility::DataToJSON

      attr_reader :api_connection

      def initialize
        @api_connection = FPL::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /bootstrap
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def bootstrap(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get('bootstrap'),
          directory: 'fpl_data/pulled_data/bootstrap',
          filename: "bootstrap_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /bootstrap-static
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def bootstrap_static(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get('bootstrap-static'),
          directory: 'fpl_data/pulled_data/bootstrap_static',
          filename: "bootstrap-static_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
