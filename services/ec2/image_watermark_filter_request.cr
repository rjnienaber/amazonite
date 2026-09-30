private alias Core = Amazonite::Core

module Amazonite::EC2
  # The watermark filter criteria for an allowed image. Each entry can specify one or more fields.
  # All specified fields must match the same watermark on the image.
  class ImageWatermarkFilterRequest
    # The `accountId:name` of the watermark. Supports wildcards (`*`, `?`).
    property watermark_key : String | Nil

    # The Region where the watermark was originally created. Supports wildcards (`*`, `?`).
    property source_image_region : String | Nil

    # The maximum number of days that have elapsed since the source image was created.
    #
    # Constraints: Minimum value of 0. Maximum value of 2147483647.
    property maximum_days_since_source_image_created : Int32 | Nil

    # The maximum number of days that have elapsed since the watermark was attached to the image.
    #
    # Constraints: Minimum value of 0. Maximum value of 2147483647.
    property maximum_days_since_watermark_created : Int32 | Nil

    def initialize(
      @watermark_key : String | Nil = nil,
      @source_image_region : String | Nil = nil,
      @maximum_days_since_source_image_created : Int32 | Nil = nil,
      @maximum_days_since_watermark_created : Int32 | Nil = nil,
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

      if value = @maximum_days_since_source_image_created
        params << {"#{prefix}MaximumDaysSinceSourceImageCreated", value.to_s}
      end

      if value = @maximum_days_since_watermark_created
        params << {"#{prefix}MaximumDaysSinceWatermarkCreated", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        watermark_key: Core::XMLValue.string(node.xpath_node("*[local-name()='WatermarkKey']")),
        source_image_region: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceImageRegion']")),
        maximum_days_since_source_image_created: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaximumDaysSinceSourceImageCreated']")),
        maximum_days_since_watermark_created: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaximumDaysSinceWatermarkCreated']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@watermark_key, @source_image_region, @maximum_days_since_source_image_created, @maximum_days_since_watermark_created)
  end
end
