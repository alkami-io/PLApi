module FPL
  module ConnectionUtility
    class ApiConnection
      attr_reader :connection

      def initialize
        @connection = Faraday.new('https://fantasy.premierleague.com/drf/')
      end
    end
  end
end
