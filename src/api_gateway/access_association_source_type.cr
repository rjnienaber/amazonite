private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  enum AccessAssociationSourceType
    Vpce

    def self.to_json(e : AccessAssociationSourceType, json : JSON::Builder) : Nil
      value = case e
              when AAG::AccessAssociationSourceType::Vpce then "VPCE"
              else
                raise Exception.new("unknown enum value for 'AccessAssociationSourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::AccessAssociationSourceType
      value = pull.read_string
      case value
      when "VPCE" then AAG::AccessAssociationSourceType::Vpce
      else
        raise Exception.new("unknown enum value for 'AccessAssociationSourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::AccessAssociationSourceType::Vpce then "VPCE"
      else
        raise Exception.new("unknown enum value for 'AccessAssociationSourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::AccessAssociationSourceType?
      case key
      when "VPCE" then AAG::AccessAssociationSourceType::Vpce
      else
        nil
      end
    end
  end
end
