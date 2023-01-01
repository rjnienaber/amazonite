module Amazonite::SsmV1
  class GetParametersByPathRequest
    include JSON::Serializable

    @[JSON::Field(key: "Path")]
    property path : String

    @[JSON::Field(key: "Recursive")]
    property recursive : Bool | Nil

    @[JSON::Field(key: "ParameterFilters")]
    property parameter_filters : Array(ParameterStringFilter) | Nil

    @[JSON::Field(key: "WithDecryption")]
    property with_decryption : Bool | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @path : String,
      @recursive : Bool | Nil = nil,
      @parameter_filters : Array(ParameterStringFilter) | Nil = nil,
      @with_decryption : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
