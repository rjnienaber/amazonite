module Amazonite::CloudWatchLogsV1
  class ListAnomaliesResponse
    include JSON::Serializable

    # An array of structures, where each structure contains information about one anomaly that a log
    # anomaly detector has found.
    @[JSON::Field(key: "anomalies")]
    property anomalies : Array(Anomaly) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @anomalies : Array(Anomaly) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@anomalies, @next_token)
  end
end
