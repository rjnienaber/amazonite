private alias AK = Amazonite::KinesisV1

module Amazonite::KinesisV1
  enum ConsumerStatus
    Creating
    Deleting
    Active

    def self.to_json(e : ConsumerStatus, json : JSON::Builder) : Nil
      value = case e
              when AK::ConsumerStatus::Creating then "CREATING"
              when AK::ConsumerStatus::Deleting then "DELETING"
              when AK::ConsumerStatus::Active   then "ACTIVE"
              else
                raise Exception.new("unknown enum value for 'ConsumerStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ConsumerStatus
      value = pull.read_string
      case value
      when "CREATING" then AK::ConsumerStatus::Creating
      when "DELETING" then AK::ConsumerStatus::Deleting
      when "ACTIVE"   then AK::ConsumerStatus::Active
      else
        raise Exception.new("unknown enum value for 'ConsumerStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ConsumerStatus::Creating then "CREATING"
      when AK::ConsumerStatus::Deleting then "DELETING"
      when AK::ConsumerStatus::Active   then "ACTIVE"
      else
        raise Exception.new("unknown enum value for 'ConsumerStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ConsumerStatus?
      case key
      when "CREATING" then AK::ConsumerStatus::Creating
      when "DELETING" then AK::ConsumerStatus::Deleting
      when "ACTIVE"   then AK::ConsumerStatus::Active
      else
        nil
      end
    end
  end
end
