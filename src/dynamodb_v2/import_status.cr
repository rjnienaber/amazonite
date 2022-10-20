private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum ImportStatus
    InProgress
    Completed
    Cancelling
    Cancelled
    Failed

    def self.to_json(e : ImportStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ImportStatus::InProgress then "IN_PROGRESS"
              when ADDB::ImportStatus::Completed  then "COMPLETED"
              when ADDB::ImportStatus::Cancelling then "CANCELLING"
              when ADDB::ImportStatus::Cancelled  then "CANCELLED"
              when ADDB::ImportStatus::Failed     then "FAILED"
              else
                raise Exception.new("unknown enum value for 'ImportStatus' when serializing to json: '#{e.to_s}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ImportStatus
      value = pull.read_string
      case value
      when "IN_PROGRESS" then ADDB::ImportStatus::InProgress
      when "COMPLETED"   then ADDB::ImportStatus::Completed
      when "CANCELLING"  then ADDB::ImportStatus::Cancelling
      when "CANCELLED"   then ADDB::ImportStatus::Cancelled
      when "FAILED"      then ADDB::ImportStatus::Failed
      else
        raise Exception.new("unknown enum value for 'ImportStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
