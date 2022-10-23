private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum TableStatus
    Creating
    Updating
    Deleting
    Active
    InaccessibleEncryptionCredentials
    Archiving
    Archived

    def self.to_json(e : TableStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::TableStatus::Creating                          then "CREATING"
              when ADDB::TableStatus::Updating                          then "UPDATING"
              when ADDB::TableStatus::Deleting                          then "DELETING"
              when ADDB::TableStatus::Active                            then "ACTIVE"
              when ADDB::TableStatus::InaccessibleEncryptionCredentials then "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
              when ADDB::TableStatus::Archiving                         then "ARCHIVING"
              when ADDB::TableStatus::Archived                          then "ARCHIVED"
              else
                raise Exception.new("unknown enum value for 'TableStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::TableStatus
      value = pull.read_string
      case value
      when "CREATING"                            then ADDB::TableStatus::Creating
      when "UPDATING"                            then ADDB::TableStatus::Updating
      when "DELETING"                            then ADDB::TableStatus::Deleting
      when "ACTIVE"                              then ADDB::TableStatus::Active
      when "INACCESSIBLE_ENCRYPTION_CREDENTIALS" then ADDB::TableStatus::InaccessibleEncryptionCredentials
      when "ARCHIVING"                           then ADDB::TableStatus::Archiving
      when "ARCHIVED"                            then ADDB::TableStatus::Archived
      else
        raise Exception.new("unknown enum value for 'TableStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
