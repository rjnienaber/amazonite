private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum WitnessStatus
    Creating
    Deleting
    Active

    def self.to_json(e : WitnessStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::WitnessStatus::Creating then "CREATING"
              when ADDB::WitnessStatus::Deleting then "DELETING"
              when ADDB::WitnessStatus::Active   then "ACTIVE"
              else
                raise Exception.new("unknown enum value for 'WitnessStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::WitnessStatus
      value = pull.read_string
      case value
      when "CREATING" then ADDB::WitnessStatus::Creating
      when "DELETING" then ADDB::WitnessStatus::Deleting
      when "ACTIVE"   then ADDB::WitnessStatus::Active
      else
        raise Exception.new("unknown enum value for 'WitnessStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::WitnessStatus::Creating then "CREATING"
      when ADDB::WitnessStatus::Deleting then "DELETING"
      when ADDB::WitnessStatus::Active   then "ACTIVE"
      else
        raise Exception.new("unknown enum value for 'WitnessStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::WitnessStatus?
      case key
      when "CREATING" then ADDB::WitnessStatus::Creating
      when "DELETING" then ADDB::WitnessStatus::Deleting
      when "ACTIVE"   then ADDB::WitnessStatus::Active
      else
        nil
      end
    end
  end
end
