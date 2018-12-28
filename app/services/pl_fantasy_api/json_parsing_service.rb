require 'pl_fantasy_api/connection_service'

module PLFantasy
  module JSONParser
    class Elements
      attr_reader :raw_json
      def initialize
        file = File.read("#{Rails.root}/json_files/pl_fantasy_elements.json")
        @raw_json = JSON.parse(file)
      end

      def element_ids
        raw_json.map {|element| element["id"]}
      end

      def element_histories
        api_connection = PLFantasy::ConnectionService.api_connection
        element_ids.each do |element_id|
          element_history = api_connection.get("element-summary/#{element_id}")
          File.open("#{Rails.root}/json_files/element_histories/element_#{element_id}","w") do |f|
            f.write(JSON.parse(element_history.body))
          end
        end
      end
    end
  end
end
