private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum BackupTypeFilter
    User
    System
    AwsBackup
    All

    def self.to_json(e : BackupTypeFilter, json : JSON::Builder) : Nil
      value = case e
              when ADDB::BackupTypeFilter::User      then "USER"
              when ADDB::BackupTypeFilter::System    then "SYSTEM"
              when ADDB::BackupTypeFilter::AwsBackup then "AWS_BACKUP"
              when ADDB::BackupTypeFilter::All       then "ALL"
              else
                raise Exception.new("unknown enum value for 'BackupTypeFilter' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::BackupTypeFilter
      value = pull.read_string
      case value
      when "USER"       then ADDB::BackupTypeFilter::User
      when "SYSTEM"     then ADDB::BackupTypeFilter::System
      when "AWS_BACKUP" then ADDB::BackupTypeFilter::AwsBackup
      when "ALL"        then ADDB::BackupTypeFilter::All
      else
        raise Exception.new("unknown enum value for 'BackupTypeFilter' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::BackupTypeFilter::User      then "USER"
      when ADDB::BackupTypeFilter::System    then "SYSTEM"
      when ADDB::BackupTypeFilter::AwsBackup then "AWS_BACKUP"
      when ADDB::BackupTypeFilter::All       then "ALL"
      else
        raise Exception.new("unknown enum value for 'BackupTypeFilter' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::BackupTypeFilter?
      case key
      when "USER"       then ADDB::BackupTypeFilter::User
      when "SYSTEM"     then ADDB::BackupTypeFilter::System
      when "AWS_BACKUP" then ADDB::BackupTypeFilter::AwsBackup
      when "ALL"        then ADDB::BackupTypeFilter::All
      else
        nil
      end
    end
  end
end
