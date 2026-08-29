private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum PolicyAction
    Delete
    Retain
    Snapshot
    ReplaceAndDelete
    ReplaceAndRetain
    ReplaceAndSnapshot

    def self.to_json(e : PolicyAction, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::PolicyAction
      value = pull.read_string
      case value
      when "Delete"             then ACF::PolicyAction::Delete
      when "Retain"             then ACF::PolicyAction::Retain
      when "Snapshot"           then ACF::PolicyAction::Snapshot
      when "ReplaceAndDelete"   then ACF::PolicyAction::ReplaceAndDelete
      when "ReplaceAndRetain"   then ACF::PolicyAction::ReplaceAndRetain
      when "ReplaceAndSnapshot" then ACF::PolicyAction::ReplaceAndSnapshot
      else
        raise Exception.new("unknown enum value for 'PolicyAction' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::PolicyAction?
      case key
      when "Delete"             then ACF::PolicyAction::Delete
      when "Retain"             then ACF::PolicyAction::Retain
      when "Snapshot"           then ACF::PolicyAction::Snapshot
      when "ReplaceAndDelete"   then ACF::PolicyAction::ReplaceAndDelete
      when "ReplaceAndRetain"   then ACF::PolicyAction::ReplaceAndRetain
      when "ReplaceAndSnapshot" then ACF::PolicyAction::ReplaceAndSnapshot
      else
        nil
      end
    end
  end
end
