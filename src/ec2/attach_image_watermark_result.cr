private alias Core = Amazonite::Core

module Amazonite::EC2
  class AttachImageWatermarkResult
    # The watermark identifier, in `accountId:watermarkName` format (for example,
    # `123456789012:approvedAmi`).
    property watermark_key : String | Nil

    def initialize(
      @watermark_key : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @watermark_key
        params << {"#{prefix}WatermarkKey", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        watermark_key: Core::XMLValue.string(node.xpath_node("*[local-name()='watermarkKey']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@watermark_key)
  end
end
