private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetEbsEncryptionByDefaultResult
    # Indicates whether encryption by default is enabled.
    property ebs_encryption_by_default : Bool | Nil

    # Reserved for future use.
    property sse_type : SSEType | Nil

    def initialize(
      @ebs_encryption_by_default : Bool | Nil = nil,
      @sse_type : SSEType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ebs_encryption_by_default
        params << {"#{prefix}EbsEncryptionByDefault", Core::QueryValue.bool(value)}
      end

      if value = @sse_type
        params << {"#{prefix}SseType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ebs_encryption_by_default: Core::XMLValue.bool(node.xpath_node("*[local-name()='ebsEncryptionByDefault']")),
        sse_type: (n = node.xpath_node("*[local-name()='sseType']")) ? AEC::SSEType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ebs_encryption_by_default, @sse_type)
  end
end
