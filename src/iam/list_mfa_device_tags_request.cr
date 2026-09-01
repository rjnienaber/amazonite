private alias Core = Amazonite::Core

module Amazonite::Iam
  class ListMFADeviceTagsRequest
    # The unique identifier for the IAM virtual MFA device whose tags you want to see. For virtual MFA
    # devices, the serial number is the same as the ARN.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property serial_number : String

    # Use this parameter only when paginating results and only after you receive a response indicating
    # that the results are truncated. Set it to the value of the `Marker` element in the response that
    # you received to indicate where the next call should start.
    property marker : String | Nil

    # Use this only when paginating results to indicate the maximum number of items you want in the
    # response. If additional items exist beyond the maximum you specify, the `IsTruncated` response
    # element is `true`.
    #
    # If you do not include this parameter, the number of items defaults to 100. Note that IAM might
    # return fewer results, even when there are more results available. In that case, the
    # `IsTruncated` response element returns `true`, and `Marker` contains a value to include in the
    # subsequent call that tells the service where to continue from.
    property max_items : Int32 | Nil

    def initialize(
      @serial_number : String,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SerialNumber", @serial_number}

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
      )
    end

    def validate! : Nil
      if value = @serial_number
        raise Core::ValidationError.new("SerialNumber length must be >= 9") if value.size < 9
        raise Core::ValidationError.new("SerialNumber length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("SerialNumber does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@-]+$"))
      end

      if value = @marker
        raise Core::ValidationError.new("Marker length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Marker length must be <= 320") if value.size > 320
        raise Core::ValidationError.new("Marker does not match the required pattern") unless value.matches?(Regex.new("^[ -ÿ]+$"))
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@serial_number, @marker, @max_items)
  end
end
