private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class PatchBaselineIdentity
    include JSON::Serializable

    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    @[JSON::Field(key: "BaselineName")]
    property baseline_name : String | Nil

    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    @[JSON::Field(key: "BaselineDescription")]
    property baseline_description : String | Nil

    @[JSON::Field(key: "DefaultBaseline")]
    property default_baseline : Bool | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
      @baseline_name : String | Nil = nil,
      @operating_system : OperatingSystem | Nil = nil,
      @baseline_description : String | Nil = nil,
      @default_baseline : Bool | Nil = nil
    )
    end
  end
end
