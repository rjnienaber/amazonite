private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class Activation
    include JSON::Serializable

    @[JSON::Field(key: "ActivationId")]
    property activation_id : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "DefaultInstanceName")]
    property default_instance_name : String | Nil

    @[JSON::Field(key: "IamRole")]
    property iam_role : String | Nil

    @[JSON::Field(key: "RegistrationLimit")]
    property registration_limit : Int32 | Nil

    @[JSON::Field(key: "RegistrationsCount")]
    property registrations_count : Int32 | Nil

    @[JSON::Field(key: "ExpirationDate", converter: Core::AWSEpochConverter)]
    property expiration_date : Time | Nil

    @[JSON::Field(key: "Expired")]
    property expired : Bool | Nil

    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @activation_id : String | Nil = nil,
      @description : String | Nil = nil,
      @default_instance_name : String | Nil = nil,
      @iam_role : String | Nil = nil,
      @registration_limit : Int32 | Nil = nil,
      @registrations_count : Int32 | Nil = nil,
      @expiration_date : Time | Nil = nil,
      @expired : Bool | Nil = nil,
      @created_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil
    )
    end
  end
end
