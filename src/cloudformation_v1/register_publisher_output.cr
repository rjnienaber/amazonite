private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RegisterPublisherOutput
    # The ID assigned this account by CloudFormation for publishing extensions.
    property publisher_id : String | Nil

    def initialize(
      @publisher_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
      )
    end

    def_equals_and_hash(@publisher_id)
  end
end
