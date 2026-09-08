private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DomainType
    Vpc
    Standard

    def self.to_json(e : DomainType, json : JSON::Builder) : Nil
      value = case e
              when AEC::DomainType::Vpc      then "vpc"
              when AEC::DomainType::Standard then "standard"
              else
                raise Exception.new("unknown enum value for 'DomainType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DomainType
      value = pull.read_string
      case value
      when "vpc"      then AEC::DomainType::Vpc
      when "standard" then AEC::DomainType::Standard
      else
        raise Exception.new("unknown enum value for 'DomainType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DomainType::Vpc      then "vpc"
      when AEC::DomainType::Standard then "standard"
      else
        raise Exception.new("unknown enum value for 'DomainType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DomainType?
      case key
      when "vpc"      then AEC::DomainType::Vpc
      when "standard" then AEC::DomainType::Standard
      else
        nil
      end
    end
  end
end
