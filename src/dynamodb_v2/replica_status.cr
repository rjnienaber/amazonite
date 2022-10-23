private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum ReplicaStatus
    Creating
    CreationFailed
    Updating
    Deleting
    Active
    RegionDisabled
    InaccessibleEncryptionCredentials

    def self.to_json(e : ReplicaStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ReplicaStatus::Creating                          then "CREATING"
              when ADDB::ReplicaStatus::CreationFailed                    then "CREATION_FAILED"
              when ADDB::ReplicaStatus::Updating                          then "UPDATING"
              when ADDB::ReplicaStatus::Deleting                          then "DELETING"
              when ADDB::ReplicaStatus::Active                            then "ACTIVE"
              when ADDB::ReplicaStatus::RegionDisabled                    then "REGION_DISABLED"
              when ADDB::ReplicaStatus::InaccessibleEncryptionCredentials then "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
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
      else
        raise Exception.new("unknown enum value for 'ReplicaStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
