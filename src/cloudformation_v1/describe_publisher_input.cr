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

    def validate! : Nil
      if value = @publisher_id
        raise Core::ValidationError.new("PublisherId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PublisherId length must be <= 40") if value.size > 40
        raise Core::ValidationError.new("PublisherId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-zA-Z]{12,40}$"))
      end
    end

    def_equals_and_hash(@publisher_id)
  end
end
