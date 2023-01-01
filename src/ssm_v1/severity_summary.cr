module Amazonite::SsmV1
  class SeveritySummary
    include JSON::Serializable

    @[JSON::Field(key: "CriticalCount")]
    property critical_count : Int32 | Nil

    @[JSON::Field(key: "HighCount")]
    property high_count : Int32 | Nil

    @[JSON::Field(key: "MediumCount")]
    property medium_count : Int32 | Nil

    @[JSON::Field(key: "LowCount")]
    property low_count : Int32 | Nil

    @[JSON::Field(key: "InformationalCount")]
    property informational_count : Int32 | Nil

    @[JSON::Field(key: "UnspecifiedCount")]
    property unspecified_count : Int32 | Nil

    def initialize(
      @critical_count : Int32 | Nil = nil,
      @high_count : Int32 | Nil = nil,
      @medium_count : Int32 | Nil = nil,
      @low_count : Int32 | Nil = nil,
      @informational_count : Int32 | Nil = nil,
      @unspecified_count : Int32 | Nil = nil
    )
    end
  end
end
