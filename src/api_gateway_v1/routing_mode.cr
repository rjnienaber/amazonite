private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum RoutingMode
    BasePathMappingOnly
    RoutingRuleOnly
    RoutingRuleThenBasePathMapping

    def self.to_json(e : RoutingMode, json : JSON::Builder) : Nil
      value = case e
              when AAG::RoutingMode::BasePathMappingOnly            then "BASE_PATH_MAPPING_ONLY"
              when AAG::RoutingMode::RoutingRuleOnly                then "ROUTING_RULE_ONLY"
              when AAG::RoutingMode::RoutingRuleThenBasePathMapping then "ROUTING_RULE_THEN_BASE_PATH_MAPPING"
              else
                raise Exception.new("unknown enum value for 'RoutingMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::RoutingMode
      value = pull.read_string
      case value
      when "BASE_PATH_MAPPING_ONLY"              then AAG::RoutingMode::BasePathMappingOnly
      when "ROUTING_RULE_ONLY"                   then AAG::RoutingMode::RoutingRuleOnly
      when "ROUTING_RULE_THEN_BASE_PATH_MAPPING" then AAG::RoutingMode::RoutingRuleThenBasePathMapping
      else
        raise Exception.new("unknown enum value for 'RoutingMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::RoutingMode::BasePathMappingOnly            then "BASE_PATH_MAPPING_ONLY"
      when AAG::RoutingMode::RoutingRuleOnly                then "ROUTING_RULE_ONLY"
      when AAG::RoutingMode::RoutingRuleThenBasePathMapping then "ROUTING_RULE_THEN_BASE_PATH_MAPPING"
      else
        raise Exception.new("unknown enum value for 'RoutingMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::RoutingMode?
      case key
      when "BASE_PATH_MAPPING_ONLY"              then AAG::RoutingMode::BasePathMappingOnly
      when "ROUTING_RULE_ONLY"                   then AAG::RoutingMode::RoutingRuleOnly
      when "ROUTING_RULE_THEN_BASE_PATH_MAPPING" then AAG::RoutingMode::RoutingRuleThenBasePathMapping
      else
        nil
      end
    end
  end
end
