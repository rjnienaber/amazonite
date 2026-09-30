private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum TableStatus
    Creating
    Updating
    Deleting
    Active
    InaccessibleEncryptionCredentials
    Archiving
    Archived
    ReplicationNotAuthorized

    def self.to_json(e : TableStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::TableStatus::Creating                          then "CREATING"
              when ADDB::TableStatus::Updating                          then "UPDATING"
              when ADDB::TableStatus::Deleting                          then "DELETING"
              when ADDB::TableStatus::Active                            then "ACTIVE"
              when ADDB::TableStatus::InaccessibleEncryptionCredentials then "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
              when ADDB::TableStatus::Archiving                         then "ARCHIVING"
              when ADDB::TableStatus::Archived                          then "ARCHIVED"
              when ADDB::TableStatus::ReplicationNotAuthorized          then "REPLICATION_NOT_AUTHORIZED"
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
      when "REPLICATION_NOT_AUTHORIZED"          then ADDB::TableStatus::ReplicationNotAuthorized
      else
        raise Exception.new("unknown enum value for 'TableStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::TableStatus::Creating                          then "CREATING"
      when ADDB::TableStatus::Updating                          then "UPDATING"
      when ADDB::TableStatus::Deleting                          then "DELETING"
      when ADDB::TableStatus::Active                            then "ACTIVE"
      when ADDB::TableStatus::InaccessibleEncryptionCredentials then "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
      when ADDB::TableStatus::Archiving                         then "ARCHIVING"
      when ADDB::TableStatus::Archived                          then "ARCHIVED"
      when ADDB::TableStatus::ReplicationNotAuthorized          then "REPLICATION_NOT_AUTHORIZED"
      else
        raise Exception.new("unknown enum value for 'TableStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::TableStatus?
      case key
      when "CREATING"                            then ADDB::TableStatus::Creating
      when "UPDATING"                            then ADDB::TableStatus::Updating
      when "DELETING"                            then ADDB::TableStatus::Deleting
      when "ACTIVE"                              then ADDB::TableStatus::Active
      when "INACCESSIBLE_ENCRYPTION_CREDENTIALS" then ADDB::TableStatus::InaccessibleEncryptionCredentials
      when "ARCHIVING"                           then ADDB::TableStatus::Archiving
      when "ARCHIVED"                            then ADDB::TableStatus::Archived
      when "REPLICATION_NOT_AUTHORIZED"          then ADDB::TableStatus::ReplicationNotAuthorized
      else
        nil
      end
    end
  end
end
