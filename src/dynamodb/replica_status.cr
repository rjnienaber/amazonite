private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum ReplicaStatus
    Creating
    CreationFailed
    Updating
    Deleting
    Active
    RegionDisabled
    InaccessibleEncryptionCredentials
    Archiving
    Archived
    ReplicationNotAuthorized

    def self.to_json(e : ReplicaStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ReplicaStatus::Creating                          then "CREATING"
              when ADDB::ReplicaStatus::CreationFailed                    then "CREATION_FAILED"
              when ADDB::ReplicaStatus::Updating                          then "UPDATING"
              when ADDB::ReplicaStatus::Deleting                          then "DELETING"
              when ADDB::ReplicaStatus::Active                            then "ACTIVE"
              when ADDB::ReplicaStatus::RegionDisabled                    then "REGION_DISABLED"
              when ADDB::ReplicaStatus::InaccessibleEncryptionCredentials then "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
              when ADDB::ReplicaStatus::Archiving                         then "ARCHIVING"
              when ADDB::ReplicaStatus::Archived                          then "ARCHIVED"
              when ADDB::ReplicaStatus::ReplicationNotAuthorized          then "REPLICATION_NOT_AUTHORIZED"
              else
                raise Exception.new("unknown enum value for 'ReplicaStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ReplicaStatus
      value = pull.read_string
      case value
      when "CREATING"                            then ADDB::ReplicaStatus::Creating
      when "CREATION_FAILED"                     then ADDB::ReplicaStatus::CreationFailed
      when "UPDATING"                            then ADDB::ReplicaStatus::Updating
      when "DELETING"                            then ADDB::ReplicaStatus::Deleting
      when "ACTIVE"                              then ADDB::ReplicaStatus::Active
      when "REGION_DISABLED"                     then ADDB::ReplicaStatus::RegionDisabled
      when "INACCESSIBLE_ENCRYPTION_CREDENTIALS" then ADDB::ReplicaStatus::InaccessibleEncryptionCredentials
      when "ARCHIVING"                           then ADDB::ReplicaStatus::Archiving
      when "ARCHIVED"                            then ADDB::ReplicaStatus::Archived
      when "REPLICATION_NOT_AUTHORIZED"          then ADDB::ReplicaStatus::ReplicationNotAuthorized
      else
        raise Exception.new("unknown enum value for 'ReplicaStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::ReplicaStatus::Creating                          then "CREATING"
      when ADDB::ReplicaStatus::CreationFailed                    then "CREATION_FAILED"
      when ADDB::ReplicaStatus::Updating                          then "UPDATING"
      when ADDB::ReplicaStatus::Deleting                          then "DELETING"
      when ADDB::ReplicaStatus::Active                            then "ACTIVE"
      when ADDB::ReplicaStatus::RegionDisabled                    then "REGION_DISABLED"
      when ADDB::ReplicaStatus::InaccessibleEncryptionCredentials then "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
      when ADDB::ReplicaStatus::Archiving                         then "ARCHIVING"
      when ADDB::ReplicaStatus::Archived                          then "ARCHIVED"
      when ADDB::ReplicaStatus::ReplicationNotAuthorized          then "REPLICATION_NOT_AUTHORIZED"
      else
        raise Exception.new("unknown enum value for 'ReplicaStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::ReplicaStatus?
      case key
      when "CREATING"                            then ADDB::ReplicaStatus::Creating
      when "CREATION_FAILED"                     then ADDB::ReplicaStatus::CreationFailed
      when "UPDATING"                            then ADDB::ReplicaStatus::Updating
      when "DELETING"                            then ADDB::ReplicaStatus::Deleting
      when "ACTIVE"                              then ADDB::ReplicaStatus::Active
      when "REGION_DISABLED"                     then ADDB::ReplicaStatus::RegionDisabled
      when "INACCESSIBLE_ENCRYPTION_CREDENTIALS" then ADDB::ReplicaStatus::InaccessibleEncryptionCredentials
      when "ARCHIVING"                           then ADDB::ReplicaStatus::Archiving
      when "ARCHIVED"                            then ADDB::ReplicaStatus::Archived
      when "REPLICATION_NOT_AUTHORIZED"          then ADDB::ReplicaStatus::ReplicationNotAuthorized
      else
        nil
      end
    end
  end
end
