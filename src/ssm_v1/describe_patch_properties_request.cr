private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DescribePatchPropertiesRequest
    include JSON::Serializable

    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem

    @[JSON::Field(key: "Property", converter: AS::PatchProperty)]
    property property : PatchProperty

    @[JSON::Field(key: "PatchSet", converter: AS::PatchSet)]
    property patch_set : PatchSet | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @operating_system : OperatingSystem,
      @property : PatchProperty,
      @patch_set : PatchSet | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
