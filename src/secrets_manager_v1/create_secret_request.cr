module Amazonite::SecretsManagerV1
  class CreateSecretRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "ClientRequestToken")]
    property client_request_token : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    @[JSON::Field(key: "SecretBinary")]
    property secret_binary : String | Nil

    @[JSON::Field(key: "SecretString")]
    property secret_string : String | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "AddReplicaRegions")]
    property add_replica_regions : Array(ReplicaRegionType) | Nil

    @[JSON::Field(key: "ForceOverwriteReplicaSecret")]
    property force_overwrite_replica_secret : Bool | Nil

    @[JSON::Field(key: "Type")]
    property type : String | Nil

    def initialize(
      @name : String,
      @client_request_token : String | Nil = nil,
      @description : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @secret_binary : String | Nil = nil,
      @secret_string : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @add_replica_regions : Array(ReplicaRegionType) | Nil = nil,
      @force_overwrite_replica_secret : Bool | Nil = nil,
      @type : String | Nil = nil,
    )
    end
  end
end
