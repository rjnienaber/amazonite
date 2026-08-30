private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribePublisherInput
    # The ID of the extension publisher.
    #
    # If you don't supply a `PublisherId`, and you have registered as an extension publisher,
    # `DescribePublisher` returns information about your own publisher account.
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
  end
end
