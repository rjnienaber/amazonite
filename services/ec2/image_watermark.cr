private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a watermark attached to an AMI.
  class ImageWatermark
    # The watermark identifier, in `accountId:watermarkName` format (for example,
    # `123456789012:approvedAmi`). The `accountId` portion is the Amazon Web Services account ID of
    # the watermark creator. The `watermarkName` portion is customer-provided.
    property watermark_key : String | Nil

    # The Region where the watermark was originally attached.
    property source_image_region : String | Nil

    # The ID of the AMI to which the watermark was originally attached.
    property source_image_id : String | Nil

    # The creation date of the source AMI, in the following format:
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*.*ssssss*+*HH*:*MM*.
    property source_image_creation_time : Time | Nil

    # The date and time the watermark was attached to the AMI, in the following format:
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*.*ssssss*+*HH*:*MM*.
    property watermark_creation_time : Time | Nil

    def initialize(
      @watermark_key : String | Nil = nil,
      @source_image_region : String | Nil = nil,
      @source_image_id : String | Nil = nil,
      @source_image_creation_time : Time | Nil = nil,
      @watermark_creation_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @watermark_key
        params << {"#{prefix}WatermarkKey", value}
      end

      if value = @source_image_region
        params << {"#{prefix}SourceImageRegion", value}
      end

      if value = @source_image_id
        params << {"#{prefix}SourceImageId", value}
      end

      if value = @source_image_creation_time
        params << {"#{prefix}SourceImageCreationTime", Core::QueryValue.time(value)}
      end

      if value = @watermark_creation_time
        params << {"#{prefix}WatermarkCreationTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        watermark_key: Core::XMLValue.string(node.xpath_node("*[local-name()='watermarkKey']")),
        source_image_region: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceImageRegion']")),
        source_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceImageId']")),
        source_image_creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='sourceImageCreationTime']")),
        watermark_creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='watermarkCreationTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@watermark_key, @source_image_region, @source_image_id, @source_image_creation_time, @watermark_creation_time)
  end
end
