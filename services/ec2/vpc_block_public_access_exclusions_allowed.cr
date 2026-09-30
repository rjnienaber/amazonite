private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcBlockPublicAccessExclusionsAllowed
    Allowed
    NotAllowed

    def self.to_json(e : VpcBlockPublicAccessExclusionsAllowed, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcBlockPublicAccessExclusionsAllowed::Allowed    then "allowed"
              when AEC::VpcBlockPublicAccessExclusionsAllowed::NotAllowed then "not-allowed"
              else
                raise Exception.new("unknown enum value for 'VpcBlockPublicAccessExclusionsAllowed' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcBlockPublicAccessExclusionsAllowed
      value = pull.read_string
      case value
      when "allowed"     then AEC::VpcBlockPublicAccessExclusionsAllowed::Allowed
      when "not-allowed" then AEC::VpcBlockPublicAccessExclusionsAllowed::NotAllowed
      else
        raise Exception.new("unknown enum value for 'VpcBlockPublicAccessExclusionsAllowed' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcBlockPublicAccessExclusionsAllowed::Allowed    then "allowed"
      when AEC::VpcBlockPublicAccessExclusionsAllowed::NotAllowed then "not-allowed"
      else
        raise Exception.new("unknown enum value for 'VpcBlockPublicAccessExclusionsAllowed' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcBlockPublicAccessExclusionsAllowed?
      case key
      when "allowed"     then AEC::VpcBlockPublicAccessExclusionsAllowed::Allowed
      when "not-allowed" then AEC::VpcBlockPublicAccessExclusionsAllowed::NotAllowed
      else
        nil
      end
    end
  end
end
