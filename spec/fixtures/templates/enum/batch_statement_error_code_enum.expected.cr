module Amazonite
  module DynamoDB
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

      def self.from_json(pull : JSON::PullParser) : Amazonite::DynamoDB::BatchStatementErrorCodeEnum
        value = pull.read_string
        case value
        when "ConditionalCheckFailed"          then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::ConditionalCheckFailed
        when "ItemCollectionSizeLimitExceeded" then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::ItemCollectionSizeLimitExceeded
        when "RequestLimitExceeded"            then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::RequestLimitExceeded
        when "ValidationError"                 then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::ValidationError
        when "ProvisionedThroughputExceeded"   then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::ProvisionedThroughputExceeded
        when "TransactionConflict"             then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::TransactionConflict
        when "ThrottlingError"                 then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::ThrottlingError
        when "InternalServerError"             then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::InternalServerError
        when "ResourceNotFound"                then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::ResourceNotFound
        when "AccessDenied"                    then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::AccessDenied
        when "DuplicateItem"                   then Amazonite::DynamoDB::BatchStatementErrorCodeEnum::DuplicateItem
        else
          raise Exception.new("unknown enum value for 'BatchStatementErrorCodeEnum' when deserializing from json: '#{value}'")
        end
      end
    end
  end
end
