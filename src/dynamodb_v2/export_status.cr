private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum ExportStatus
    InProgress
    Completed
    Failed

    def self.to_json(e : ExportStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ExportStatus::InProgress then "IN_PROGRESS"
              when ADDB::ExportStatus::Completed  then "COMPLETED"
              when ADDB::ExportStatus::Failed     then "FAILED"
              else
                raise Exception.new("unknown enum value for 'ExportStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ExportStatus
      value = pull.read_string
      case value
      when "IN_PROGRESS" then ADDB::ExportStatus::InProgress
      when "COMPLETED"   then ADDB::ExportStatus::Completed
      when "FAILED"      then ADDB::ExportStatus::Failed
      else
        raise Exception.new("unknown enum value for 'ExportStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
