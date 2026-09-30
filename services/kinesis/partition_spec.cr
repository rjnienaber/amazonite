private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Specifies how the destination table is partitioned.
  class PartitionSpec
    include JSON::Serializable

    # The list of partition fields.
    @[JSON::Field(key: "PartitionFields")]
    property partition_fields : Array(PartitionField) = [] of PartitionField

    def initialize(
      @partition_fields : Array(PartitionField),
    )
    end

    def validate! : Nil
      if value = @partition_fields
        raise Core::ValidationError.new("PartitionFields must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("PartitionFields must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@partition_fields)
  end
end
