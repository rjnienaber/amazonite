private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum PolicyType
    Inline
    Managed

    def self.to_json(e : PolicyType, json : JSON::Builder) : Nil
      value = case e
              when AI::PolicyType::Inline  then "INLINE"
              when AI::PolicyType::Managed then "MANAGED"
              else
                raise Exception.new("unknown enum value for 'PolicyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PolicyType
      value = pull.read_string
      case value
      when "INLINE"  then AI::PolicyType::Inline
      when "MANAGED" then AI::PolicyType::Managed
      else
        raise Exception.new("unknown enum value for 'PolicyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::PolicyType::Inline  then "INLINE"
      when AI::PolicyType::Managed then "MANAGED"
      else
        raise Exception.new("unknown enum value for 'PolicyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::PolicyType?
      case key
      when "INLINE"  then AI::PolicyType::Inline
      when "MANAGED" then AI::PolicyType::Managed
      else
        nil
      end
    end
  end
end
