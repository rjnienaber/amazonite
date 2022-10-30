private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum GlobalTableStatus
    Creating
    Active
    Deleting
    Updating

    def self.to_json(e : GlobalTableStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::GlobalTableStatus::Creating then "CREATING"
              when ADDB::GlobalTableStatus::Active   then "ACTIVE"
              when ADDB::GlobalTableStatus::Deleting then "DELETING"
              when ADDB::GlobalTableStatus::Updating then "UPDATING"
              else
                raise Exception.new("unknown enum value for 'GlobalTableStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::GlobalTableStatus
      value = pull.read_string
      case value
      when "CREATING" then ADDB::GlobalTableStatus::Creating
      when "ACTIVE"   then ADDB::GlobalTableStatus::Active
      when "DELETING" then ADDB::GlobalTableStatus::Deleting
      when "UPDATING" then ADDB::GlobalTableStatus::Updating
      else
        raise Exception.new("unknown enum value for 'GlobalTableStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
