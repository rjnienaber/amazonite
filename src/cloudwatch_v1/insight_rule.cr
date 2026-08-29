module Amazonite::CloudWatchV1
  class InsightRule
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "State")]
    property state : String

    @[JSON::Field(key: "Schema")]
    property schema : String

    @[JSON::Field(key: "Definition")]
    property definition : String

    @[JSON::Field(key: "ManagedRule")]
    property managed_rule : Bool | Nil

    @[JSON::Field(key: "ApplyOnTransformedLogs")]
    property apply_on_transformed_logs : Bool | Nil

    def initialize(
      @name : String,
      @state : String,
      @schema : String,
      @definition : String,
      @managed_rule : Bool | Nil = nil,
      @apply_on_transformed_logs : Bool | Nil = nil,
    )
    end
  end
end
