private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum PolicyScopeType
    All
    Aws
    Local

    def self.to_json(e : PolicyScopeType, json : JSON::Builder) : Nil
      value = case e
              when AI::PolicyScopeType::All   then "All"
              when AI::PolicyScopeType::Aws   then "AWS"
              when AI::PolicyScopeType::Local then "Local"
              else
                raise Exception.new("unknown enum value for 'PolicyScopeType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PolicyScopeType
      value = pull.read_string
      case value
      when "All"   then AI::PolicyScopeType::All
      when "AWS"   then AI::PolicyScopeType::Aws
      when "Local" then AI::PolicyScopeType::Local
      else
        raise Exception.new("unknown enum value for 'PolicyScopeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::PolicyScopeType::All   then "All"
      when AI::PolicyScopeType::Aws   then "AWS"
      when AI::PolicyScopeType::Local then "Local"
      else
        raise Exception.new("unknown enum value for 'PolicyScopeType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::PolicyScopeType?
      case key
      when "All"   then AI::PolicyScopeType::All
      when "AWS"   then AI::PolicyScopeType::Aws
      when "Local" then AI::PolicyScopeType::Local
      else
        nil
      end
    end
  end
end
