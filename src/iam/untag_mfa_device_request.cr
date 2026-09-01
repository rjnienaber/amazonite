private alias Core = Amazonite::Core

module Amazonite::Iam
  class UntagMFADeviceRequest
    # The unique identifier for the IAM virtual MFA device from which you want to remove tags. For
    # virtual MFA devices, the serial number is the same as the ARN.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property serial_number : String

    # A list of key names as a simple array of strings. The tags with matching keys are removed from
    # the specified instance profile.
    property tag_keys : Array(String) = [] of String

    def initialize(
      @serial_number : String,
      @tag_keys : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SerialNumber", @serial_number}

      @tag_keys.each_with_index(1) do |item, i|
        params << {"#{prefix}TagKeys.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        tag_keys: node.xpath_nodes("*[local-name()='TagKeys']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @serial_number
        raise Core::ValidationError.new("SerialNumber length must be >= 9") if value.size < 9
        raise Core::ValidationError.new("SerialNumber length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("SerialNumber does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@-]+$"))
      end

      if value = @tag_keys
        raise Core::ValidationError.new("TagKeys must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TagKeys must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@serial_number, @tag_keys)
  end
end
