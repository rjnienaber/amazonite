private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # Represents the warm throughput configuration on the stream. This is only present for On-Demand
  # Kinesis Data Streams in accounts that have `MinimumThroughputBillingCommitment` enabled.
  class WarmThroughputObject
    include JSON::Serializable

    # The target warm throughput value on the stream. This indicates that the stream is currently
    # scaling towards this target value.
    @[JSON::Field(key: "TargetMiBps")]
    property target_mi_bps : Int32 | Nil

    # The current warm throughput value on the stream. This is the write throughput in MiBps that the
    # stream is currently scaled to handle.
    @[JSON::Field(key: "CurrentMiBps")]
    property current_mi_bps : Int32 | Nil

    def initialize(
      @target_mi_bps : Int32 | Nil = nil,
      @current_mi_bps : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @target_mi_bps
        raise Core::ValidationError.new("TargetMiBps value must be >= 0") if value < 0
      end

      if value = @current_mi_bps
        raise Core::ValidationError.new("CurrentMiBps value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@target_mi_bps, @current_mi_bps)
  end
end
