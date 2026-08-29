module Amazonite::SsmV1
  # The number of managed nodes found for each patch severity level defined in the request filter.
  class SeveritySummary
    include JSON::Serializable

    # The total number of resources or compliance items that have a severity level of `Critical`.
    # Critical severity is determined by the organization that published the compliance items.
    @[JSON::Field(key: "CriticalCount")]
    property critical_count : Int32 | Nil

    # The total number of resources or compliance items that have a severity level of high. High
    # severity is determined by the organization that published the compliance items.
    @[JSON::Field(key: "HighCount")]
    property high_count : Int32 | Nil

    # The total number of resources or compliance items that have a severity level of medium. Medium
    # severity is determined by the organization that published the compliance items.
    @[JSON::Field(key: "MediumCount")]
    property medium_count : Int32 | Nil

    # The total number of resources or compliance items that have a severity level of low. Low
    # severity is determined by the organization that published the compliance items.
    @[JSON::Field(key: "LowCount")]
    property low_count : Int32 | Nil

    # The total number of resources or compliance items that have a severity level of informational.
    # Informational severity is determined by the organization that published the compliance items.
    @[JSON::Field(key: "InformationalCount")]
    property informational_count : Int32 | Nil

    # The total number of resources or compliance items that have a severity level of unspecified.
    # Unspecified severity is determined by the organization that published the compliance items.
    @[JSON::Field(key: "UnspecifiedCount")]
    property unspecified_count : Int32 | Nil

    def initialize(
      @critical_count : Int32 | Nil = nil,
      @high_count : Int32 | Nil = nil,
      @medium_count : Int32 | Nil = nil,
      @low_count : Int32 | Nil = nil,
      @informational_count : Int32 | Nil = nil,
      @unspecified_count : Int32 | Nil = nil,
    )
    end
  end
end
