private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class CreateActivationRequest
    include JSON::Serializable

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "DefaultInstanceName")]
    property default_instance_name : String | Nil

    @[JSON::Field(key: "IamRole")]
    property iam_role : String

    @[JSON::Field(key: "RegistrationLimit")]
    property registration_limit : Int32 | Nil

    @[JSON::Field(key: "ExpirationDate", converter: Core::AWSEpochConverter)]
    property expiration_date : Time | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "RegistrationMetadata")]
    property registration_metadata : Array(RegistrationMetadataItem) | Nil

    def initialize(
      @iam_role : String,
      @description : String | Nil = nil,
      @default_instance_name : String | Nil = nil,
      @registration_limit : Int32 | Nil = nil,
      @expiration_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @registration_metadata : Array(RegistrationMetadataItem) | Nil = nil
    )
    end
  end
end
