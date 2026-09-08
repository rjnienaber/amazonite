private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PayerResponsibilityScope
    VpcEndpointCharges

    def self.to_json(e : PayerResponsibilityScope, json : JSON::Builder) : Nil
      value = case e
              when AEC::PayerResponsibilityScope::VpcEndpointCharges then "vpc-endpoint-charges"
              else
                raise Exception.new("unknown enum value for 'PayerResponsibilityScope' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PayerResponsibilityScope
      value = pull.read_string
      case value
      when "vpc-endpoint-charges" then AEC::PayerResponsibilityScope::VpcEndpointCharges
      else
        raise Exception.new("unknown enum value for 'PayerResponsibilityScope' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PayerResponsibilityScope::VpcEndpointCharges then "vpc-endpoint-charges"
      else
        raise Exception.new("unknown enum value for 'PayerResponsibilityScope' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PayerResponsibilityScope?
      case key
      when "vpc-endpoint-charges" then AEC::PayerResponsibilityScope::VpcEndpointCharges
      else
        nil
      end
    end
  end
end
