private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class Patch
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String | Nil

    @[JSON::Field(key: "ReleaseDate", converter: Core::AWSEpochConverter)]
    property release_date : Time | Nil

    @[JSON::Field(key: "Title")]
    property title : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "ContentUrl")]
    property content_url : String | Nil

    @[JSON::Field(key: "Vendor")]
    property vendor : String | Nil

    @[JSON::Field(key: "ProductFamily")]
    property product_family : String | Nil

    @[JSON::Field(key: "Product")]
    property product : String | Nil

    @[JSON::Field(key: "Classification")]
    property classification : String | Nil

    @[JSON::Field(key: "MsrcSeverity")]
    property msrc_severity : String | Nil

    @[JSON::Field(key: "KbNumber")]
    property kb_number : String | Nil

    @[JSON::Field(key: "MsrcNumber")]
    property msrc_number : String | Nil

    @[JSON::Field(key: "Language")]
    property language : String | Nil

    @[JSON::Field(key: "AdvisoryIds")]
    property advisory_ids : Array(String) | Nil

    @[JSON::Field(key: "BugzillaIds")]
    property bugzilla_ids : Array(String) | Nil

    @[JSON::Field(key: "CVEIds")]
    property cve_ids : Array(String) | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Epoch")]
    property epoch : Int32 | Nil

    @[JSON::Field(key: "Version")]
    property version : String | Nil

    @[JSON::Field(key: "Release")]
    property release : String | Nil

    @[JSON::Field(key: "Arch")]
    property arch : String | Nil

    @[JSON::Field(key: "Severity")]
    property severity : String | Nil

    @[JSON::Field(key: "Repository")]
    property repository : String | Nil

    def initialize(
      @id : String | Nil = nil,
      @release_date : Time | Nil = nil,
      @title : String | Nil = nil,
      @description : String | Nil = nil,
      @content_url : String | Nil = nil,
      @vendor : String | Nil = nil,
      @product_family : String | Nil = nil,
      @product : String | Nil = nil,
      @classification : String | Nil = nil,
      @msrc_severity : String | Nil = nil,
      @kb_number : String | Nil = nil,
      @msrc_number : String | Nil = nil,
      @language : String | Nil = nil,
      @advisory_ids : Array(String) | Nil = nil,
      @bugzilla_ids : Array(String) | Nil = nil,
      @cve_ids : Array(String) | Nil = nil,
      @name : String | Nil = nil,
      @epoch : Int32 | Nil = nil,
      @version : String | Nil = nil,
      @release : String | Nil = nil,
      @arch : String | Nil = nil,
      @severity : String | Nil = nil,
      @repository : String | Nil = nil
    )
    end
  end
end
