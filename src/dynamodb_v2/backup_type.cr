private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum BackupType
    User
    System
    AwsBackup

    def self.to_json(e : BackupType, json : JSON::Builder) : Nil
      value = case e
              when ADDB::BackupType::User      then "USER"
              when ADDB::BackupType::System    then "SYSTEM"
              when ADDB::BackupType::AwsBackup then "AWS_BACKUP"
              else
                raise Exception.new("unknown enum value for 'BackupType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::BackupType
      value = pull.read_string
      case value
      when "USER"       then ADDB::BackupType::User
      when "SYSTEM"     then ADDB::BackupType::System
      when "AWS_BACKUP" then ADDB::BackupType::AwsBackup
      else
        raise Exception.new("unknown enum value for 'BackupType' when deserializing from json: '#{value}'")
      end
    end
  end
end
