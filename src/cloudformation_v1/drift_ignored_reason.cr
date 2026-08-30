private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum DriftIgnoredReason
    ManagedByAws
    WriteOnlyProperty
    SensitiveProperty

    def self.to_json(e : DriftIgnoredReason, json : JSON::Builder) : Nil
      value = case e
              when ACF::DriftIgnoredReason::ManagedByAws      then "MANAGED_BY_AWS"
              when ACF::DriftIgnoredReason::WriteOnlyProperty then "WRITE_ONLY_PROPERTY"
              when ACF::DriftIgnoredReason::SensitiveProperty then "SENSITIVE_PROPERTY"
              else
                raise Exception.new("unknown enum value for 'DriftIgnoredReason' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::DriftIgnoredReason
      value = pull.read_string
      case value
      when "MANAGED_BY_AWS"      then ACF::DriftIgnoredReason::ManagedByAws
      when "WRITE_ONLY_PROPERTY" then ACF::DriftIgnoredReason::WriteOnlyProperty
      when "SENSITIVE_PROPERTY"  then ACF::DriftIgnoredReason::SensitiveProperty
      else
        raise Exception.new("unknown enum value for 'DriftIgnoredReason' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::DriftIgnoredReason::ManagedByAws      then "MANAGED_BY_AWS"
      when ACF::DriftIgnoredReason::WriteOnlyProperty then "WRITE_ONLY_PROPERTY"
      when ACF::DriftIgnoredReason::SensitiveProperty then "SENSITIVE_PROPERTY"
      else
        raise Exception.new("unknown enum value for 'DriftIgnoredReason' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::DriftIgnoredReason?
      case key
      when "MANAGED_BY_AWS"      then ACF::DriftIgnoredReason::ManagedByAws
      when "WRITE_ONLY_PROPERTY" then ACF::DriftIgnoredReason::WriteOnlyProperty
      when "SENSITIVE_PROPERTY"  then ACF::DriftIgnoredReason::SensitiveProperty
      else
        nil
      end
    end
  end
end
