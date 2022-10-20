private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum BatchStatementErrorCodeEnum
    ConditionalCheckFailed
    ItemCollectionSizeLimitExceeded
    RequestLimitExceeded
    ValidationError
    ProvisionedThroughputExceeded
    TransactionConflict
    ThrottlingError
    InternalServerError
    ResourceNotFound
    AccessDenied
    DuplicateItem

    def self.to_json(e : BatchStatementErrorCodeEnum, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::BatchStatementErrorCodeEnum
      value = pull.read_string
      case value
      when "ConditionalCheckFailed"          then ADDB::BatchStatementErrorCodeEnum::ConditionalCheckFailed
      when "ItemCollectionSizeLimitExceeded" then ADDB::BatchStatementErrorCodeEnum::ItemCollectionSizeLimitExceeded
      when "RequestLimitExceeded"            then ADDB::BatchStatementErrorCodeEnum::RequestLimitExceeded
      when "ValidationError"                 then ADDB::BatchStatementErrorCodeEnum::ValidationError
      when "ProvisionedThroughputExceeded"   then ADDB::BatchStatementErrorCodeEnum::ProvisionedThroughputExceeded
      when "TransactionConflict"             then ADDB::BatchStatementErrorCodeEnum::TransactionConflict
      when "ThrottlingError"                 then ADDB::BatchStatementErrorCodeEnum::ThrottlingError
      when "InternalServerError"             then ADDB::BatchStatementErrorCodeEnum::InternalServerError
      when "ResourceNotFound"                then ADDB::BatchStatementErrorCodeEnum::ResourceNotFound
      when "AccessDenied"                    then ADDB::BatchStatementErrorCodeEnum::AccessDenied
      when "DuplicateItem"                   then ADDB::BatchStatementErrorCodeEnum::DuplicateItem
      else
        raise Exception.new("unknown enum value for 'BatchStatementErrorCodeEnum' when deserializing from json: '#{value}'")
      end
    end
  end
end