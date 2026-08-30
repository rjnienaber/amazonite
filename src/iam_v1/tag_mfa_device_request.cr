private alias Core = Amazonite::Core

module Amazonite::IamV1
  class TagMFADeviceRequest
    # The unique identifier for the IAM virtual MFA device to which you want to add tags. For virtual
    # MFA devices, the serial number is the same as the ARN.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property serial_number : String

    # The list of tags that you want to attach to the IAM virtual MFA device. Each tag consists of a
    # key name and an associated value.
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @serial_number : String,
      @tags : Array(Tag),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SerialNumber", @serial_number}

      @tags.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def_equals_and_hash(@serial_number, @tags)
  end
end
