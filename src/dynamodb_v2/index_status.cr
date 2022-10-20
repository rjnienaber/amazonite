private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum IndexStatus
    Creating
    Updating
    Deleting
    Active

    def self.to_json(e : IndexStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::IndexStatus::Creating then "CREATING"
              when ADDB::IndexStatus::Updating then "UPDATING"
              when ADDB::IndexStatus::Deleting then "DELETING"
              when ADDB::IndexStatus::Active   then "ACTIVE"
              else
                raise Exception.new("unknown enum value for 'IndexStatus' when serializing to json: '#{e.to_s}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::IndexStatus
      value = pull.read_string
      case value
      when "CREATING" then ADDB::IndexStatus::Creating
      when "UPDATING" then ADDB::IndexStatus::Updating
      when "DELETING" then ADDB::IndexStatus::Deleting
      when "ACTIVE"   then ADDB::IndexStatus::Active
      else
        raise Exception.new("unknown enum value for 'IndexStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end