private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum ChangeAction
    Add
    Modify
    Remove
    Import
    Dynamic
    SyncWithActual

    def self.to_json(e : ChangeAction, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ChangeAction
      value = pull.read_string
      case value
      when "Add"            then ACF::ChangeAction::Add
      when "Modify"         then ACF::ChangeAction::Modify
      when "Remove"         then ACF::ChangeAction::Remove
      when "Import"         then ACF::ChangeAction::Import
      when "Dynamic"        then ACF::ChangeAction::Dynamic
      when "SyncWithActual" then ACF::ChangeAction::SyncWithActual
      else
        raise Exception.new("unknown enum value for 'ChangeAction' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::ChangeAction?
      case key
      when "Add"            then ACF::ChangeAction::Add
      when "Modify"         then ACF::ChangeAction::Modify
      when "Remove"         then ACF::ChangeAction::Remove
      when "Import"         then ACF::ChangeAction::Import
      when "Dynamic"        then ACF::ChangeAction::Dynamic
      when "SyncWithActual" then ACF::ChangeAction::SyncWithActual
      else
        nil
      end
    end
  end
end
