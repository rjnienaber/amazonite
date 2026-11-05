private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum BulkOperationStatus
    InProgress
    Completed
    CompletedWithErrors
    Cancelling
    Cancelled
    Failed

    def self.to_json(e : BulkOperationStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::BulkOperationStatus::InProgress          then "IN_PROGRESS"
              when ADDB::BulkOperationStatus::Completed           then "COMPLETED"
              when ADDB::BulkOperationStatus::CompletedWithErrors then "COMPLETED_WITH_ERRORS"
              when ADDB::BulkOperationStatus::Cancelling          then "CANCELLING"
              when ADDB::BulkOperationStatus::Cancelled           then "CANCELLED"
              when ADDB::BulkOperationStatus::Failed              then "FAILED"
              else
                raise Exception.new("unknown enum value for 'BulkOperationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::BulkOperationStatus
      value = pull.read_string
      case value
      when "IN_PROGRESS"           then ADDB::BulkOperationStatus::InProgress
      when "COMPLETED"             then ADDB::BulkOperationStatus::Completed
      when "COMPLETED_WITH_ERRORS" then ADDB::BulkOperationStatus::CompletedWithErrors
      when "CANCELLING"            then ADDB::BulkOperationStatus::Cancelling
      when "CANCELLED"             then ADDB::BulkOperationStatus::Cancelled
      when "FAILED"                then ADDB::BulkOperationStatus::Failed
      else
        raise Exception.new("unknown enum value for 'BulkOperationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::BulkOperationStatus::InProgress          then "IN_PROGRESS"
      when ADDB::BulkOperationStatus::Completed           then "COMPLETED"
      when ADDB::BulkOperationStatus::CompletedWithErrors then "COMPLETED_WITH_ERRORS"
      when ADDB::BulkOperationStatus::Cancelling          then "CANCELLING"
      when ADDB::BulkOperationStatus::Cancelled           then "CANCELLED"
      when ADDB::BulkOperationStatus::Failed              then "FAILED"
      else
        raise Exception.new("unknown enum value for 'BulkOperationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::BulkOperationStatus?
      case key
      when "IN_PROGRESS"           then ADDB::BulkOperationStatus::InProgress
      when "COMPLETED"             then ADDB::BulkOperationStatus::Completed
      when "COMPLETED_WITH_ERRORS" then ADDB::BulkOperationStatus::CompletedWithErrors
      when "CANCELLING"            then ADDB::BulkOperationStatus::Cancelling
      when "CANCELLED"             then ADDB::BulkOperationStatus::Cancelled
      when "FAILED"                then ADDB::BulkOperationStatus::Failed
      else
        nil
      end
    end
  end
end
