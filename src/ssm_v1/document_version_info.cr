private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DocumentVersionInfo
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    @[JSON::Field(key: "IsDefaultVersion")]
    property is_default_version : Bool | Nil

    @[JSON::Field(key: "DocumentFormat", converter: AS::DocumentFormat)]
    property document_format : DocumentFormat | Nil

    @[JSON::Field(key: "Status", converter: AS::DocumentStatus)]
    property status : DocumentStatus | Nil

    @[JSON::Field(key: "StatusInformation")]
    property status_information : String | Nil

    @[JSON::Field(key: "ReviewStatus", converter: AS::ReviewStatus)]
    property review_status : ReviewStatus | Nil

    def initialize(
      @name : String | Nil = nil,
      @display_name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @version_name : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @is_default_version : Bool | Nil = nil,
      @document_format : DocumentFormat | Nil = nil,
      @status : DocumentStatus | Nil = nil,
      @status_information : String | Nil = nil,
      @review_status : ReviewStatus | Nil = nil
    )
    end
  end
end
