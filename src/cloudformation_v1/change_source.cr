private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum ChangeSource
    ResourceReference
    ParameterReference
    ResourceAttribute
    DirectModification
    Automatic
    NoModification

    def self.to_json(e : ChangeSource, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ChangeSource
      value = pull.read_string
      case value
      when "ResourceReference"  then ACF::ChangeSource::ResourceReference
      when "ParameterReference" then ACF::ChangeSource::ParameterReference
      when "ResourceAttribute"  then ACF::ChangeSource::ResourceAttribute
      when "DirectModification" then ACF::ChangeSource::DirectModification
      when "Automatic"          then ACF::ChangeSource::Automatic
      when "NoModification"     then ACF::ChangeSource::NoModification
      else
        raise Exception.new("unknown enum value for 'ChangeSource' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::ChangeSource?
      case key
      when "ResourceReference"  then ACF::ChangeSource::ResourceReference
      when "ParameterReference" then ACF::ChangeSource::ParameterReference
      when "ResourceAttribute"  then ACF::ChangeSource::ResourceAttribute
      when "DirectModification" then ACF::ChangeSource::DirectModification
      when "Automatic"          then ACF::ChangeSource::Automatic
      when "NoModification"     then ACF::ChangeSource::NoModification
      else
        nil
      end
    end
  end
end
