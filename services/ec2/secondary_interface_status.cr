private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SecondaryInterfaceStatus
    Available
    InUse

    def self.to_json(e : SecondaryInterfaceStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::SecondaryInterfaceStatus::Available then "available"
              when AEC::SecondaryInterfaceStatus::InUse     then "in-use"
              else
                raise Exception.new("unknown enum value for 'SecondaryInterfaceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SecondaryInterfaceStatus
      value = pull.read_string
      case value
      when "available" then AEC::SecondaryInterfaceStatus::Available
      when "in-use"    then AEC::SecondaryInterfaceStatus::InUse
      else
        raise Exception.new("unknown enum value for 'SecondaryInterfaceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SecondaryInterfaceStatus::Available then "available"
      when AEC::SecondaryInterfaceStatus::InUse     then "in-use"
      else
        raise Exception.new("unknown enum value for 'SecondaryInterfaceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SecondaryInterfaceStatus?
      case key
      when "available" then AEC::SecondaryInterfaceStatus::Available
      when "in-use"    then AEC::SecondaryInterfaceStatus::InUse
      else
        nil
      end
    end
  end
end
