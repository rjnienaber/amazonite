module Amazonite::SsmV1
  class MaintenanceWindowAutomationParameters
    include JSON::Serializable

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    def initialize(
      @document_version : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil
    )
    end
  end
end
