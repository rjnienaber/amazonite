module Amazonite::CloudWatchV1
  class MetricCharacteristics
    include JSON::Serializable

    @[JSON::Field(key: "PeriodicSpikes")]
    property periodic_spikes : Bool | Nil

    def initialize(
      @periodic_spikes : Bool | Nil = nil,
    )
    end
  end
end
