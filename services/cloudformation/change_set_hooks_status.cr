private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum ChangeSetHooksStatus
    Planning
    Planned
    Unavailable

    def self.to_json(e : ChangeSetHooksStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::ChangeSetHooksStatus::Planning    then "PLANNING"
              when ACF::ChangeSetHooksStatus::Planned     then "PLANNED"
              when ACF::ChangeSetHooksStatus::Unavailable then "UNAVAILABLE"
              else
                raise Exception.new("unknown enum value for 'ChangeSetHooksStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ChangeSetHooksStatus
      value = pull.read_string
      case value
      when "PLANNING"    then ACF::ChangeSetHooksStatus::Planning
      when "PLANNED"     then ACF::ChangeSetHooksStatus::Planned
      when "UNAVAILABLE" then ACF::ChangeSetHooksStatus::Unavailable
      else
        raise Exception.new("unknown enum value for 'ChangeSetHooksStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ChangeSetHooksStatus::Planning    then "PLANNING"
      when ACF::ChangeSetHooksStatus::Planned     then "PLANNED"
      when ACF::ChangeSetHooksStatus::Unavailable then "UNAVAILABLE"
      else
        raise Exception.new("unknown enum value for 'ChangeSetHooksStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ChangeSetHooksStatus?
      case key
      when "PLANNING"    then ACF::ChangeSetHooksStatus::Planning
      when "PLANNED"     then ACF::ChangeSetHooksStatus::Planned
      when "UNAVAILABLE" then ACF::ChangeSetHooksStatus::Unavailable
      else
        nil
      end
    end
  end
end
