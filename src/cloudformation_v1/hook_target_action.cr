private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum HookTargetAction
    Create
    Update
    Delete
    Import

    def self.to_json(e : HookTargetAction, json : JSON::Builder) : Nil
      value = case e
              when ACF::HookTargetAction::Create then "CREATE"
              when ACF::HookTargetAction::Update then "UPDATE"
              when ACF::HookTargetAction::Delete then "DELETE"
              when ACF::HookTargetAction::Import then "IMPORT"
              else
                raise Exception.new("unknown enum value for 'HookTargetAction' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::HookTargetAction
      value = pull.read_string
      case value
      when "CREATE" then ACF::HookTargetAction::Create
      when "UPDATE" then ACF::HookTargetAction::Update
      when "DELETE" then ACF::HookTargetAction::Delete
      when "IMPORT" then ACF::HookTargetAction::Import
      else
        raise Exception.new("unknown enum value for 'HookTargetAction' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::HookTargetAction::Create then "CREATE"
      when ACF::HookTargetAction::Update then "UPDATE"
      when ACF::HookTargetAction::Delete then "DELETE"
      when ACF::HookTargetAction::Import then "IMPORT"
      else
        raise Exception.new("unknown enum value for 'HookTargetAction' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::HookTargetAction?
      case key
      when "CREATE" then ACF::HookTargetAction::Create
      when "UPDATE" then ACF::HookTargetAction::Update
      when "DELETE" then ACF::HookTargetAction::Delete
      when "IMPORT" then ACF::HookTargetAction::Import
      else
        nil
      end
    end
  end
end
