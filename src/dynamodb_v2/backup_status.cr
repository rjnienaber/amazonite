private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum BackupStatus
    Creating
    Deleted
    Available

    def self.to_json(e : BackupStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::BackupStatus::Creating  then "CREATING"
              when ADDB::BackupStatus::Deleted   then "DELETED"
              when ADDB::BackupStatus::Available then "AVAILABLE"
              else
                raise Exception.new("unknown enum value for 'BackupStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::BackupStatus
      value = pull.read_string
      case value
      when "CREATING"  then ADDB::BackupStatus::Creating
      when "DELETED"   then ADDB::BackupStatus::Deleted
      when "AVAILABLE" then ADDB::BackupStatus::Available
      else
        raise Exception.new("unknown enum value for 'BackupStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
