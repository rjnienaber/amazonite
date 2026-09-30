private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Specifies a single partition field.
  class PartitionField
    include JSON::Serializable

    # The partition transform to apply. The only valid value is `TIME_HOUR`.
    @[JSON::Field(key: "Transform", converter: AK::PartitionTransform)]
    property transform : PartitionTransform

    # The name of the source column used for partitioning. This column must be of the `timestamptz`
    # type.
    @[JSON::Field(key: "SourceName")]
    property source_name : String

    def initialize(
      @transform : PartitionTransform,
      @source_name : String,
    )
    end

    def validate! : Nil
      if value = @source_name
        raise Core::ValidationError.new("SourceName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SourceName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("SourceName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\.\\_]+$"))
      end
    end

    def_equals_and_hash(@transform, @source_name)
  end
end
