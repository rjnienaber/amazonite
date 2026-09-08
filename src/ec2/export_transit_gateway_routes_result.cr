private alias Core = Amazonite::Core

module Amazonite::EC2
  class ExportTransitGatewayRoutesResult
    # The URL of the exported file in Amazon S3. For example,
    # s3://*bucket_name*/VPCTransitGateway/TransitGatewayRouteTables/*file_name*.
    property s3_location : String | Nil

    def initialize(
      @s3_location : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @s3_location
        params << {"#{prefix}S3Location", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        s3_location: Core::XMLValue.string(node.xpath_node("*[local-name()='s3Location']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@s3_location)
  end
end
