private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class PatchComplianceData
    include JSON::Serializable

    @[JSON::Field(key: "Title")]
    property title : String

    @[JSON::Field(key: "KBId")]
    property kb_id : String

    @[JSON::Field(key: "Classification")]
    property classification : String

    @[JSON::Field(key: "Severity")]
    property severity : String

    @[JSON::Field(key: "State", converter: AS::PatchComplianceDataState)]
    property state : PatchComplianceDataState

    @[JSON::Field(key: "InstalledTime", converter: Core::AWSEpochConverter)]
    property installed_time : Time

    @[JSON::Field(key: "CVEIds")]
    property cve_ids : String | Nil

    def initialize(
      @title : String,
      @kb_id : String,
      @classification : String,
      @severity : String,
      @state : PatchComplianceDataState,
      @installed_time : Time,
      @cve_ids : String | Nil = nil
    )
    end
  end
end
