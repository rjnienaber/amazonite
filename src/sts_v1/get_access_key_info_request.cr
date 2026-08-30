private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetAccessKeyInfoRequest
    # The identifier of an access key.
    #
    # This parameter allows (through its regex pattern) a string of characters that can consist of any
    # upper- or lowercase letter or digit.
    property access_key_id : String

    def initialize(
      @access_key_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AccessKeyId", @access_key_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        access_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AccessKeyId']")).not_nil!,
      )
    end

    def_equals_and_hash(@access_key_id)
  end
end
