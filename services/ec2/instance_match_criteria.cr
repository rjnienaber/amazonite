private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceMatchCriteria
    Open
    Targeted

    def self.to_json(e : InstanceMatchCriteria, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceMatchCriteria::Open     then "open"
              when AEC::InstanceMatchCriteria::Targeted then "targeted"
              else
                raise Exception.new("unknown enum value for 'InstanceMatchCriteria' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceMatchCriteria
      value = pull.read_string
      case value
      when "open"     then AEC::InstanceMatchCriteria::Open
      when "targeted" then AEC::InstanceMatchCriteria::Targeted
      else
        raise Exception.new("unknown enum value for 'InstanceMatchCriteria' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceMatchCriteria::Open     then "open"
      when AEC::InstanceMatchCriteria::Targeted then "targeted"
      else
        raise Exception.new("unknown enum value for 'InstanceMatchCriteria' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceMatchCriteria?
      case key
      when "open"     then AEC::InstanceMatchCriteria::Open
      when "targeted" then AEC::InstanceMatchCriteria::Targeted
      else
        nil
      end
    end
  end
end
