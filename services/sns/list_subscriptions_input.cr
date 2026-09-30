private alias Core = Amazonite::Core

module Amazonite::Sns
  # Input for ListSubscriptions action.
  class ListSubscriptionsInput
    # Token returned by the previous `ListSubscriptions` request.
    property next_token : String | Nil

    def initialize(
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@next_token)
  end
end
