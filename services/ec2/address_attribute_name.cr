private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AddressAttributeName
    DomainName

    def self.to_json(e : AddressAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AEC::AddressAttributeName::DomainName then "domain-name"
              else
                raise Exception.new("unknown enum value for 'AddressAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AddressAttributeName
      value = pull.read_string
      case value
      when "domain-name" then AEC::AddressAttributeName::DomainName
      else
        raise Exception.new("unknown enum value for 'AddressAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AddressAttributeName::DomainName then "domain-name"
      else
        raise Exception.new("unknown enum value for 'AddressAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AddressAttributeName?
      case key
      when "domain-name" then AEC::AddressAttributeName::DomainName
      else
        nil
      end
    end
  end
end
